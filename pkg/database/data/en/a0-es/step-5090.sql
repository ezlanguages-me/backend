-- ============================================================
-- Seed: A0 English Path – STEP 5090 – Listening – listen to Q&A session at lecture (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La primera pregunta es sobre cuántas familias participaron.", "p_de": "Die erste Frage betrifft die Anzahl der Familien.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ponente entrevistó a veinticinco familias.", "p_de": "Die Referentin interviewte fünfundzwanzig Familien.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El barrio tiene mucho espacio verde.", "p_de": "Das Viertel hat viel Grünfläche.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El barrio tiene muchos edificios de apartamentos compartidos.", "p_de": "Das Viertel hat viele gemeinsame Wohngebäude.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una pregunta trata del agua para las plantas.", "p_de": "Eine Frage betrifft das Wasser für die Pflanzen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El agua es cara porque viene de camiones.", "p_de": "Das Wasser ist teuer, weil es mit Lastwagen kommt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El siguiente paso del estudio es comparar con otro huerto.", "p_de": "Der nächste Schritt der Studie ist ein Vergleich mit einem anderen Garten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación es una ronda de preguntas y respuestas.", "p_de": "Die Aufnahme ist eine Frage-und-Antwort-Runde.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuántas familias entrevistó la ponente?", "p_de": "Wie viele Familien interviewte die Referentin?", "s": {"type": "multiple_choice", "options": ["Twenty-five families", "Fifteen families", "Forty families"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué eligieron ese barrio?", "p_de": "Warum wählten sie dieses Viertel?", "s": {"type": "multiple_choice", "options": ["It had little green space and many shared apartment buildings", "It had many airports and hotels", "It had the cheapest phone service"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el público sobre las plantas?", "p_de": "Welche Frage stellt das Publikum zu den Pflanzen?", "s": {"type": "multiple_choice", "options": ["A question about water", "A question about exam scores", "A question about train tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo mantiene bajo el coste el jardín?", "p_de": "Wie hält der Garten die Kosten niedrig?", "s": {"type": "multiple_choice", "options": ["By using rain barrels", "By buying bottled water", "By closing in winter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará el estudio después?", "p_de": "Was macht die Studie als Nächstes?", "s": {"type": "multiple_choice", "options": ["Compare with another garden", "Move to another country", "Cancel all interviews"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de situación escuchas?", "p_de": "Welche Situation hörst du?", "s": {"type": "multiple_choice", "options": ["A Q&A session after a lecture", "A professional phone call", "A hotel check-in"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién responde a las preguntas?", "p_de": "Wer beantwortet die Fragen?", "s": {"type": "multiple_choice", "options": ["The presenter", "A receptionist", "A bus driver"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo son las respuestas?", "p_de": "Wie sind die Antworten?", "s": {"type": "multiple_choice", "options": ["Clear and factual", "Angry and confused", "Only one word long"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5090 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5090 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5090, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Presenter and audience members
## THE SCENE: A short Q&A after a lecture on urban gardens
Audience members ask about participants, water use, and local impact after a lecture.

### DIRECTOR'S NOTES
Style:
* Short question-answer pattern with clear factual replies.
* The presenter repeats key numbers and reasons.

Pace: Moderate and clear.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following an academic Q&A session and identifying specific details in answers.

#### TRANSCRIPT
[curious] Audience member: How many families joined the project in your study?
[clear] Presenter: We interviewed twenty-five families who used the garden regularly.
[interested] Audience member: Why did you focus on this neighborhood?
[informative] Presenter: Because it had little green space and many shared apartment buildings.
[practical] Audience member: And what about water for the plants?
[helpful] Presenter: The garden uses rain barrels, so the water cost stays low.
[concluding] Presenter: Our next step is to compare this garden with one in another part of the city.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Sesión de preguntas tras una charla', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Fragerunde nach einem Vortrag', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
