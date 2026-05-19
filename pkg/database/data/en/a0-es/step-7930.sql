-- ============================================================
-- Seed: A0 English Path – STEP 7930 – Dialogue – rehearse answers to predictable questions (Reuniones y Presentaciones)
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
        '{"character": "Trainer", "text": "Let us practice the easy questions.", "es": "Vamos a practicar las preguntas fáciles.", "de": "Lass uns die einfachen Fragen üben."}'::jsonb,
        '{"character": "Speaker", "text": "Good. I am ready.", "es": "Bien. Estoy lista.", "de": "Gut. Ich bin bereit."}'::jsonb,
        '{"character": "Trainer", "text": "What is your topic?", "es": "¿Cuál es tu tema?", "de": "Was ist dein Thema?"}'::jsonb,
        '{"character": "Speaker", "text": "My topic is simple team updates.", "es": "Mi tema son las actualizaciones simples del equipo.", "de": "Mein Thema sind einfache Teamupdates."}'::jsonb,
        '{"character": "Trainer", "text": "How long is your talk?", "es": "¿Cuánto dura tu charla?", "de": "Wie lang ist dein Vortrag?"}'::jsonb,
        '{"character": "Speaker", "text": "It is five minutes.", "es": "Dura cinco minutos.", "de": "Er dauert fünf Minuten."}'::jsonb,
        '{"character": "Trainer", "text": "When can people ask questions?", "es": "¿Cuándo puede hacer preguntas la gente?", "de": "Wann können die Leute Fragen stellen?"}'::jsonb,
        '{"character": "Speaker", "text": "They can ask at the end.", "es": "Pueden preguntar al final.", "de": "Sie können am Ende fragen."}'::jsonb,
        '{"character": "Trainer", "text": "Where can they get your handout?", "es": "¿Dónde pueden conseguir tu folleto?", "de": "Wo können sie deinen Handzettel bekommen?"}'::jsonb,
        '{"character": "Speaker", "text": "At the table by the door.", "es": "En la mesa junto a la puerta.", "de": "Auf dem Tisch bei der Tür."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "La formadora quiere practicar preguntas fáciles.", "de": "Die Trainerin möchte einfache Fragen üben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tema es simple team updates.", "de": "Das Thema ist simple team updates.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla dura quince minutos.", "de": "Der Vortrag dauert fünfzehn Minuten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La gente puede preguntar al principio.", "de": "Die Leute können am Anfang fragen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El folleto está en una mesa junto a la puerta.", "de": "Der Handzettel liegt auf einem Tisch bei der Tür.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué quiere practicar la formadora?", "de": "Was möchte die Trainerin üben?", "s_es": {"type": "multiple_choice", "options": ["The easy questions", "A long song", "The room lights"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die einfachen Fragen", "Ein langes Lied", "Das Raumlicht"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el tema de la charla?", "de": "Was ist das Thema des Vortrags?", "s_es": {"type": "multiple_choice", "options": ["Simple team updates", "Train tickets", "Office lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einfache Teamupdates", "Zugtickets", "Büromittagessen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dura la charla?", "de": "Wie lang dauert der Vortrag?", "s_es": {"type": "multiple_choice", "options": ["Five minutes", "Ten minutes", "One hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Minuten", "Zehn Minuten", "Eine Stunde"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo puede preguntar la gente?", "de": "Wann können die Leute fragen?", "s_es": {"type": "multiple_choice", "options": ["At the end", "During lunch", "After midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Ende", "Beim Mittagessen", "Nach Mitternacht"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el folleto?", "de": "Wo ist der Handzettel?", "s_es": {"type": "multiple_choice", "options": ["At the table by the door", "Under the chair", "In the car"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Tisch bei der Tür", "Unter dem Stuhl", "Im Auto"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7930 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7930 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7930, 'en', 'dialogue', 'meetings', '[{"name": "Trainer", "gender": "female", "avatarURL": "https://example.com/avatars/trainer.png"}, {"name": "Speaker", "gender": "female", "avatarURL": "https://example.com/avatars/speaker.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Ensaya respuestas a preguntas previsibles', 'Lee un ensayo breve entre una formadora y una ponente antes de una presentación.'),
        (v_dialogue_id, 'de', 'Übe Antworten auf vorhersehbare Fragen', 'Lies eine kurze Probe zwischen einer Trainerin und einer Sprecherin vor einer Präsentation.');

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
