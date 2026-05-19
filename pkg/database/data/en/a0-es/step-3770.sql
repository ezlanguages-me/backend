-- ============================================================
-- Seed: A0 English Path – STEP 3770 – Dialogue – discuss things to do in a city (Turismo y Entretenimiento)
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
        '{"character": "Marta", "text": "What do you want to do this afternoon?", "es": "¿Qué quieres hacer esta tarde?", "de": "Was möchtest du heute Nachmittag machen?"}'::jsonb,
    '{"character": "Leo", "text": "I would like to visit the history museum.", "es": "Me gustaría visitar el history museum.", "de": "Ich würde gern das history museum besuchen."}'::jsonb,
    '{"character": "Marta", "text": "That sounds good, but the boat tour at 3 PM is also nice.", "es": "Suena bien, pero la boat tour de las 3 PM también es buena.", "de": "Das klingt gut, aber die boat tour um 15 Uhr ist auch schön."}'::jsonb,
    '{"character": "Leo", "text": "True. How long is the boat tour?", "es": "Es verdad. ¿Cuánto dura la boat tour?", "de": "Stimmt. Wie lange dauert die Bootstour?"}'::jsonb,
    '{"character": "Marta", "text": "It takes one hour, and the weather is sunny today.", "es": "Dura una hora y hoy hace sol.", "de": "Sie dauert eine Stunde, und heute ist das Wetter sonnig."}'::jsonb,
    '{"character": "Leo", "text": "Then maybe we can do the boat tour first.", "es": "Entonces quizá podemos hacer primero la boat tour.", "de": "Dann können wir vielleicht zuerst die Bootstour machen."}'::jsonb,
    '{"character": "Marta", "text": "Great. After that, there is a free concert in Central Square at 6 PM.", "es": "Genial. Después hay un concierto gratis en Central Square a las 6 PM.", "de": "Super. Danach gibt es um 18 Uhr ein kostenloses Konzert am Central Square."}'::jsonb,
    '{"character": "Leo", "text": "Perfect. We can eat something before the concert.", "es": "Perfecto. Podemos comer algo antes del concierto.", "de": "Perfekt. Wir können vor dem Konzert etwas essen."}'::jsonb,
    '{"character": "Marta", "text": "So the plan is boat tour, dinner, and concert.", "es": "Entonces el plan es boat tour, cena y concierto.", "de": "Also ist der Plan Bootstour, Essen und Konzert."}'::jsonb,
    '{"character": "Leo", "text": "Yes, that sounds like a good city day.", "es": "Sí, suena como un buen día en la ciudad.", "de": "Ja, das klingt nach einem guten Stadttag."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Leo quiere visitar el history museum.", "p_de": "Leo möchte das history museum besuchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La boat tour es a las 5 PM.", "p_de": "Die Bootstour ist um 17 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La boat tour dura una hora.", "p_de": "Die Bootstour dauert eine Stunde.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "Hay un concierto gratis a las 6 PM.", "p_de": "Es gibt um 18 Uhr ein kostenloses Konzert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "Van directamente al concierto sin comer.", "p_de": "Sie gehen direkt ohne Essen zum Konzert.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Qué quería hacer primero Leo?", "p_de": "Was wollte Leo zuerst machen?", "s_es": {"type": "multiple_choice", "options": ["Visit the history museum", "Go shopping", "Take a taxi tour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das history museum besuchen", "Einkaufen gehen", "Eine Taxitour machen"], "answer": 0}}'::jsonb,
    '{"p": "¿A qué hora es la boat tour?", "p_de": "Um wie viel Uhr ist die Bootstour?", "s_es": {"type": "multiple_choice", "options": ["3 PM", "6 PM", "1 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["15 Uhr", "18 Uhr", "13 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Cómo está el tiempo?", "p_de": "Wie ist das Wetter?", "s_es": {"type": "multiple_choice", "options": ["Sunny", "Rainy", "Snowy"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sonnig", "Regnerisch", "Verschneit"], "answer": 0}}'::jsonb,
    '{"p": "¿Dónde es el concierto?", "p_de": "Wo ist das Konzert?", "s_es": {"type": "multiple_choice", "options": ["In Central Square", "At the museum", "At the station"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Central Square", "Im Museum", "Am Bahnhof"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuál es el plan final?", "p_de": "Was ist der endgültige Plan?", "s_es": {"type": "multiple_choice", "options": ["Boat tour, dinner, and concert", "Only the museum", "Boat tour and hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bootstour, Essen und Konzert", "Nur das Museum", "Bootstour und Hotel"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3770 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 3770 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3770, 'en', 'dialogue', 'tourism', '[{"name": "Marta", "gender": "female", "avatarURL": "https://example.com/avatars/marta.png"}, {"name": "Leo", "gender": "male", "avatarURL": "https://example.com/avatars/leo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre qué hacer en una ciudad', 'Practica una conversación simple para elegir entre museo, barco o concierto.'),
        (v_dialogue_id, 'de', 'Sprich darüber, was man in einer Stadt machen kann', 'Übe ein einfaches Gespräch, um zwischen Museum, Bootstour oder Konzert zu wählen.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
