-- ============================================================
-- Seed: A0 English Path – STEP 7920 – Listening – follow presentation preparation advice (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El coach dice que hay que revisar la sala y la pantalla.", "de": "Der Coach sagt, man soll den Raum und den Bildschirm prüfen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La persona llega tarde.", "de": "Die Person kommt zu spät.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que probar el portátil y el sonido.", "de": "Man soll den Laptop und den Ton testen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El nombre va en la primera diapositiva.", "de": "Der Name kommt auf die erste Folie.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La apertura debe ser larga y difícil.", "de": "Der Einstieg soll lang und schwierig sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que llevar doce folletos y dos ejemplos fáciles.", "de": "Man soll zwölf Handzettel und zwei leichte Beispiele mitbringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La persona deja tiempo para preguntas.", "de": "Die Person lässt Zeit für Fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coach dice que hay que olvidar el agua.", "de": "Der Coach sagt, man soll das Wasser vergessen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué hay que revisar antes de empezar?", "de": "Was soll man vor dem Start prüfen?", "s_es": {"type": "multiple_choice", "options": ["The room and the screen", "The bus and the ticket", "The menu and the coffee"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Raum und den Bildschirm", "Den Bus und das Ticket", "Das Menü und den Kaffee"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hay que probar ahora?", "de": "Was soll man jetzt testen?", "s_es": {"type": "multiple_choice", "options": ["The laptop and the sound", "The door and the clock", "The wall and the chair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Laptop und den Ton", "Die Tür und die Uhr", "Die Wand und den Stuhl"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde va el nombre?", "de": "Wohin kommt der Name?", "s_es": {"type": "multiple_choice", "options": ["On the first slide", "On the window", "On the last page"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf die erste Folie", "An das Fenster", "Auf die letzte Seite"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo debe ser la apertura?", "de": "Wie soll der Einstieg sein?", "s_es": {"type": "multiple_choice", "options": ["Short and clear", "Long and dark", "Fast and angry"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kurz und klar", "Lang und dunkel", "Schnell und wütend"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos folletos hay que llevar?", "de": "Wie viele Handzettel soll man mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Twelve", "Two", "Twenty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwölf", "Zwei", "Zwanzig"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos ejemplos fáciles hay que preparar?", "de": "Wie viele leichte Beispiele soll man vorbereiten?", "s_es": {"type": "multiple_choice", "options": ["Two", "Five", "Nine"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Fünf", "Neun"], "answer": 0}}'::jsonb,
        '{"es": "¿Para qué deja tiempo la persona?", "de": "Wofür lässt die Person Zeit?", "s_es": {"type": "multiple_choice", "options": ["For questions", "For dancing", "For shopping"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für Fragen", "Für Tanz", "Für Einkaufen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo se siente la persona al final?", "de": "Wie fühlt sich die Person am Ende?", "s_es": {"type": "multiple_choice", "options": ["Ready", "Lost", "Cold"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bereit", "Verloren", "Kalt"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7920 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7920 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7920, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Presentation coach and new speaker before a short talk
## "Preparing the Presentation"

## THE SCENE: In an empty room before a team presentation
A coach gives simple advice to a new speaker.
They talk about the room, the equipment, and the first lines of the talk.

### DIRECTOR''S NOTES
Style:
* Practical coaching with short clear instructions.
* Repeated preparation words help A0 learners follow the plan.

Pace: Slow and supportive.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear simple advice for checking a room, preparing slides, and feeling ready before a presentation.

#### TRANSCRIPT
[helpful] Coach: Before you start, check the room and the screen.
[ready] Speaker: I am here early, so I can do that.
[practical] Coach: Good. Test the laptop and the sound now.
[careful] Speaker: I will also put my name on the first slide.
[advising] Coach: Keep your opening short and clear.
[agreeing] Speaker: Yes, one greeting and one main idea.
[planning] Coach: Bring twelve handouts and two easy examples.
[noting] Speaker: And I will leave time for questions.
[final check] Coach: Very good. Do not forget water.
[calm] Speaker: Thank you. Now I feel ready.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Sigue consejos para preparar una presentación', 'Escucha consejos básicos antes de una presentación sobre la sala, el material y la apertura.'),
        (v_listening_id, 'de', 'Verfolge Ratschläge zur Vorbereitung einer Präsentation', 'Höre einfache Ratschläge vor einer Präsentation über Raum, Material und Einstieg.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
