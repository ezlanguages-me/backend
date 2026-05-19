-- ============================================================
-- Seed: A0 English Path - STEP 7830 - Dialogue - participate in Q&A session (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Attendee", "text": "I have a question about your study room signs.", "es": "Tengo una pregunta sobre tus señales para salas de estudio.", "de": "Ich habe eine Frage zu deinen Schildern für Lernräume."}'::jsonb,
        '{"character": "Speaker", "text": "Sure. I can answer factual questions.", "es": "Claro. Puedo responder preguntas factuales.", "de": "Gerne. Ich kann Sachfragen beantworten."}'::jsonb,
        '{"character": "Attendee", "text": "How many rooms were in the test?", "es": "¿Cuántas salas había en la prueba?", "de": "Wie viele Räume gab es im Test?"}'::jsonb,
        '{"character": "Speaker", "text": "Three rooms were in the test.", "es": "Había tres salas en la prueba.", "de": "Es waren drei Räume im Test."}'::jsonb,
        '{"character": "Attendee", "text": "What did the yellow sign mean?", "es": "¿Qué significaba la señal amarilla?", "de": "Was bedeutete das gelbe Schild?"}'::jsonb,
        '{"character": "Speaker", "text": "It meant the room was busy.", "es": "Significaba que la sala estaba ocupada.", "de": "Es bedeutete, dass der Raum besetzt war."}'::jsonb,
        '{"character": "Attendee", "text": "Did you use paper cards?", "es": "¿Usasteis tarjetas de papel?", "de": "Habt ihr Papierkarten benutzt?"}'::jsonb,
        '{"character": "Speaker", "text": "Yes. Simple paper cards.", "es": "Sí. Tarjetas sencillas de papel.", "de": "Ja. Einfache Papierkarten."}'::jsonb,
        '{"character": "Attendee", "text": "Thank you. That answers my question.", "es": "Gracias. Eso responde a mi pregunta.", "de": "Danke. Das beantwortet meine Frage."}'::jsonb,
        '{"character": "Speaker", "text": "Thank you for asking.", "es": "Gracias por preguntar.", "de": "Danke für die Frage."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "La persona del público tiene una pregunta sobre señales para salas de estudio.", "de": "Die Person aus dem Publikum hat eine Frage zu Schildern für Lernräume.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La ponente dice que no puede responder preguntas.", "de": "Die Sprecherin sagt, dass sie keine Fragen beantworten kann.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La prueba tuvo tres salas.", "de": "Der Test hatte drei Räume.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La señal amarilla significaba que la sala estaba ocupada.", "de": "Das gelbe Schild bedeutete, dass der Raum besetzt war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Usaron tarjetas sencillas de papel.", "de": "Sie benutzten einfache Papierkarten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tipo de preguntas puede responder la ponente?", "de": "Welche Art von Fragen kann die Sprecherin beantworten?", "s_es": {"type": "multiple_choice", "options": ["Preguntas factuales", "Preguntas secretas", "Bromas largas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sachfragen", "Geheime Fragen", "Lange Witze"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas salas había en la prueba?", "de": "Wie viele Räume gab es im Test?", "s_es": {"type": "multiple_choice", "options": ["Tres", "Siete", "Doce"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Sieben", "Zwölf"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significaba la señal amarilla?", "de": "Was bedeutete das gelbe Schild?", "s_es": {"type": "multiple_choice", "options": ["La sala estaba ocupada", "La sala estaba vacía", "La sala estaba cerrada para siempre"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Raum war besetzt", "Der Raum war leer", "Der Raum war für immer geschlossen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de tarjetas usaron?", "de": "Welche Art von Karten benutzten sie?", "s_es": {"type": "multiple_choice", "options": ["Tarjetas de papel", "Teléfonos de plástico", "Llaves de metal"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Papierkarten", "Plastiktelefone", "Metallschlüssel"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice la persona del público al final?", "de": "Was sagt die Person aus dem Publikum am Ende?", "s_es": {"type": "multiple_choice", "options": ["Eso responde a mi pregunta", "No entiendo nada", "Por favor, canta otra vez"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das beantwortet meine Frage", "Ich verstehe nichts", "Bitte sing noch einmal"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7830 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7830 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7830, 'en', 'dialogue', 'meetings', '[{"name": "Attendee", "gender": "neutral", "avatarURL": "https://example.com/avatars/attendee.png"}, {"name": "Speaker", "gender": "female", "avatarURL": "https://example.com/avatars/speaker.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Participar en una sesión de preguntas y respuestas', 'Lee un intercambio breve entre una persona del público y la ponente durante la ronda de preguntas.'),
        (v_dialogue_id, 'de', 'An einer Fragerunde teilnehmen', 'Lies einen kurzen Austausch zwischen einer Person aus dem Publikum und der Sprecherin während der Fragerunde.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
