package application

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"math"
	"net/http"
	"regexp"
	"strings"
	"time"
)

const geminiEndpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent"

type AIFeedback struct {
	Feedback    string `json:"feedback"`
	Score       int    `json:"score"`
	RawResponse string `json:"rawResponse"`
}

type AIApplication struct {
	APIKey     string
	HTTPClient *http.Client
}

func NewAIApplication(apiKey string) *AIApplication {
	return &AIApplication{
		APIKey: apiKey,
		HTTPClient: &http.Client{
			Timeout: 30 * time.Second,
		},
	}
}

type geminiPart struct {
	Text string `json:"text"`
}

type geminiContent struct {
	Parts []geminiPart `json:"parts"`
}

type geminiRequest struct {
	SystemInstruction geminiContent   `json:"systemInstruction"`
	Contents          []geminiContent `json:"contents"`
	GenerationConfig  struct {
		ResponseMimeType string `json:"responseMimeType"`
	} `json:"generationConfig"`
}

type geminiResponse struct {
	Candidates []struct {
		Content geminiContent `json:"content"`
	} `json:"candidates"`
}

var jsonFenceRe = regexp.MustCompile("(?s)^```(?:json)?\\s*|\\s*```$")

func stripJSONFences(s string) string {
	s = strings.TrimSpace(s)
	s = jsonFenceRe.ReplaceAllString(s, "")
	return strings.TrimSpace(s)
}

func clampScore(n float64) int {
	rounded := int(math.Round(n))
	if rounded < 1 {
		return 1
	}
	if rounded > 3 {
		return 3
	}
	return rounded
}

// EvaluateRequest groups the inputs the AI service needs to evaluate a
// student's response. The system prompt is selected by `Kind`; the rest is
// inlined into the user message so the model has full context.
type EvaluateRequest struct {
	Kind           string   // "speaking" | "writing"
	Text           string   // what the student said/wrote (in the target language)
	NativeLanguage string   // language the student speaks (feedback will use this)
	TargetLanguage string   // language the student is learning
	Scenario       string   // situation description from the step prompt
	Tasks          []string // tasks the student must fulfil
}

// Evaluate proxies the call to Gemini and parses the JSON-as-text response.
func (a *AIApplication) Evaluate(req EvaluateRequest) (*AIFeedback, error) {
	if a.APIKey == "" {
		return nil, errors.New("missing GEMINI_API_KEY")
	}
	if req.Text == "" {
		return nil, errors.New("text is required")
	}
	if req.NativeLanguage == "" || req.TargetLanguage == "" {
		return nil, errors.New("nativeLanguage and targetLanguage are required")
	}

	systemInstruction, ok := systemPromptForKind(req.Kind)
	if !ok {
		return nil, fmt.Errorf("unsupported kind %q", req.Kind)
	}

	tasks := req.Tasks
	if len(tasks) == 0 {
		tasks = []string{"(no tasks specified — judge only general correctness)"}
	}
	var tasksList strings.Builder
	for i, t := range tasks {
		tasksList.WriteString(fmt.Sprintf("%d. %s\n", i+1, t))
	}

	scenario := req.Scenario
	if scenario == "" {
		scenario = "(no scenario provided)"
	}

	userPrompt := fmt.Sprintf(
		"Target language (the student must respond in this language): %s\n"+
			"Student's native language (write the feedback in THIS language): %s\n\n"+
			"Scenario:\n%s\n\n"+
			"Tasks the student must accomplish:\n%s\n"+
			"The student %s the following:\n\n\"%s\"\n\n"+
			"Evaluate strictly. Verify every task. Reply with the JSON described in the system instruction.",
		req.TargetLanguage,
		req.NativeLanguage,
		scenario,
		tasksList.String(),
		studentVerbForKind(req.Kind),
		req.Text,
	)

	reqBody := geminiRequest{
		SystemInstruction: geminiContent{Parts: []geminiPart{{Text: systemInstruction}}},
		Contents:          []geminiContent{{Parts: []geminiPart{{Text: userPrompt}}}},
	}
	reqBody.GenerationConfig.ResponseMimeType = "application/json"

	payload, err := json.Marshal(reqBody)
	if err != nil {
		return nil, fmt.Errorf("marshal gemini request: %w", err)
	}

	url := fmt.Sprintf("%s?key=%s", geminiEndpoint, a.APIKey)
	httpReq, err := http.NewRequest(http.MethodPost, url, bytes.NewReader(payload))
	if err != nil {
		return nil, fmt.Errorf("build gemini request: %w", err)
	}
	httpReq.Header.Set("Content-Type", "application/json")

	resp, err := a.HTTPClient.Do(httpReq)
	if err != nil {
		return nil, fmt.Errorf("call gemini: %w", err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, fmt.Errorf("read gemini response: %w", err)
	}

	if resp.StatusCode < 200 || resp.StatusCode >= 300 {
		return nil, fmt.Errorf("gemini error %d: %s", resp.StatusCode, string(body))
	}

	var parsed geminiResponse
	if err := json.Unmarshal(body, &parsed); err != nil {
		return nil, fmt.Errorf("decode gemini response: %w", err)
	}

	if len(parsed.Candidates) == 0 || len(parsed.Candidates[0].Content.Parts) == 0 {
		return nil, errors.New("gemini returned no candidates")
	}

	rawText := parsed.Candidates[0].Content.Parts[0].Text
	cleaned := stripJSONFences(rawText)

	var inner struct {
		Feedback string  `json:"feedback"`
		Score    float64 `json:"score"`
	}
	if err := json.Unmarshal([]byte(cleaned), &inner); err != nil {
		return nil, fmt.Errorf("decode gemini inner json: %w", err)
	}

	return &AIFeedback{
		Feedback:    inner.Feedback,
		Score:       clampScore(inner.Score),
		RawResponse: rawText,
	}, nil
}
