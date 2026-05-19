-- ============================================================
-- Seed: A0 English Path – STEP 5360 – Listening – listen to peer feedback (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La introducción fue fuerte y el tema estaba claro desde el inicio.", "p_de": "Die Einleitung war stark und das Thema war von Anfang an klar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La diapositiva tres era fácil de leer rápidamente.", "p_de": "Folie drei war schnell leicht zu lesen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La recomendación es hablar un poco más despacio en la parte central.", "p_de": "Die Empfehlung lautet, im Mittelteil etwas langsamer zu sprechen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La respuesta sobre el presupuesto fue clara.", "p_de": "Die Antwort zum Budget war klar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conclusión necesita una frase final más fuerte.", "p_de": "Der Schluss braucht einen stärkeren letzten Satz.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La opinión general es completamente negativa.", "p_de": "Die Gesamtmeinung ist völlig negativ.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El feedback menciona datos útiles en la presentación.", "p_de": "Das Feedback erwähnt nützliche Daten in der Präsentation.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación es una devolución de un compañero.", "p_de": "Die Aufnahme ist Rückmeldung von einer Mitschülerin oder einem Mitschüler.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cómo fue la introducción según el compañero?", "p_de": "Wie war die Einleitung laut Mitstudent?", "s": {"type": "multiple_choice", "options": ["Strong and clear", "Too long and confusing", "Missing completely"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema tenía la diapositiva tres?", "p_de": "Welches Problem hatte Folie drei?", "s": {"type": "multiple_choice", "options": ["Too much text", "No title", "Wrong room number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe cambiar la persona al hablar?", "p_de": "Was soll die Person beim Sprechen ändern?", "s": {"type": "multiple_choice", "options": ["Speak a little more slowly", "Use a louder phone", "Stop asking questions"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué parte responde bien la persona?", "p_de": "Welchen Teil beantwortet die Person gut?", "s": {"type": "multiple_choice", "options": ["The budget question", "The train schedule", "The hotel booking"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué necesita la conclusión?", "p_de": "Was braucht der Schluss?", "s": {"type": "multiple_choice", "options": ["A stronger final sentence", "More statistics only", "A second chart about weather"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la opinión general?", "p_de": "Wie ist die Gesamtmeinung?", "s": {"type": "multiple_choice", "options": ["It was a good presentation", "It was a complete failure", "It was not a presentation"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué menciona el último comentario?", "p_de": "Was erwähnt der letzte Kommentar?", "s": {"type": "multiple_choice", "options": ["Useful data", "Printer problems", "Late fees"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["Peer feedback", "A research methodology lecture", "A work voicemail"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5360 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5360 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5360, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Student giving feedback
## THE SCENE: One student comments on another student's presentation
A student gives constructive feedback on a class presentation.

### DIRECTOR'S NOTES
Style:
* Friendly, balanced feedback with strengths and suggestions.
* Each point is short and easy to follow.

Pace: Calm and supportive.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding peer feedback about structure, speaking pace, and slides.

#### TRANSCRIPT
[friendly] Your introduction was strong and the topic was clear from the start.
[constructive] Slide three had too much text, so it was hard to read quickly.
[helpful] I think you should speak a little more slowly in the middle part.
[positive] Your answer about the budget was very clear.
[practical] Maybe add one stronger final sentence in the conclusion.
[supportive] Overall, it was a good presentation with useful data.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Escuchar feedback de un compañero', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Peer-Feedback anhören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
