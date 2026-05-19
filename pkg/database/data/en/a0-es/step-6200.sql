-- ============================================================
-- Seed: A0 English Path – STEP 6200 – Dialogue – toma parte en una charla informal con compañeros (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
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
        '{"character": "Ava","text": "Hi, nice to see you here.","es": "Hola, qué bien verte aquí.","de": "Hallo, schön, dich hier zu sehen."}'::jsonb,
        '{"character": "Leo","text": "Hi! How is your day going?","es": "¡Hola! ¿Cómo te va el día?","de": "Hallo! Wie läuft dein Tag?"}'::jsonb,
        '{"character": "Ava","text": "Pretty well. The class was short today.","es": "Bastante bien. La clase fue corta hoy.","de": "Ganz gut. Der Unterricht war heute kurz."}'::jsonb,
        '{"character": "Leo","text": "Yes, and the weather is much better now.","es": "Sí, y el tiempo es mucho mejor ahora.","de": "Ja, und das Wetter ist jetzt viel besser."}'::jsonb,
        '{"character": "Ava","text": "I might get a coffee before going home.","es": "Quizá me tome un café antes de irme a casa.","de": "Ich hole mir vielleicht noch einen Kaffee, bevor ich nach Hause gehe."}'::jsonb,
        '{"character": "Leo","text": "That sounds nice. Are you free this afternoon?","es": "Suena bien. ¿Estás libre esta tarde?","de": "Klingt gut. Hast du heute Nachmittag Zeit?"}'::jsonb,
        '{"character": "Ava","text": "Yes, I have no plans after lunch.","es": "Sí, no tengo planes después de comer.","de": "Ja, ich habe nach dem Mittagessen keine Pläne."}'::jsonb,
        '{"character": "Leo","text": "Great. Maybe we can study together later.","es": "Genial. Quizá podamos estudiar juntos más tarde.","de": "Super. Vielleicht können wir später zusammen lernen."}'::jsonb,
        '{"character": "Ava","text": "Sure. I can bring my notes.","es": "Claro. Puedo llevar mis apuntes.","de": "Klar. Ich kann meine Notizen mitbringen."}'::jsonb,
        '{"character": "Leo","text": "Perfect. See you after lunch.","es": "Perfecto. Nos vemos después de comer.","de": "Perfekt. Bis nach dem Mittagessen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Ava saluda a Leo.","de": "Ava begrüßt Leo.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La clase fue larga hoy.","de": "Der Unterricht war heute lang.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "El tiempo está peor ahora.","de": "Das Wetter ist jetzt schlechter.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "Ava quiere tomar un café antes de ir a casa.","de": "Ava möchte vor dem Heimweg noch einen Kaffee trinken.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Leo sugiere estudiar juntos más tarde.","de": "Leo schlägt vor, später zusammen zu lernen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Cómo ha sido la clase de hoy?","de": "Wie war der Unterricht heute?","s_es": {"type": "multiple_choice","options": ["Short","Very difficult","Cancelled"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Kurz","Sehr schwierig","Abgesagt"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué quiere hacer Ava antes de irse?","de": "Was möchte Ava vor dem Gehen machen?","s_es": {"type": "multiple_choice","options": ["Have a coffee","Buy a book","Take the bus"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Einen Kaffee trinken","Ein Buch kaufen","Den Bus nehmen"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuándo no tiene planes Ava?","de": "Wann hat Ava keine Pläne?","s_es": {"type": "multiple_choice","options": ["After lunch","Before breakfast","At midnight"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Nach dem Mittagessen","Vor dem Frühstück","Um Mitternacht"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué puede llevar Ava para estudiar?","de": "Was kann Ava zum Lernen mitbringen?","s_es": {"type": "multiple_choice","options": ["Her notes","A jacket","A ticket"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Ihre Notizen","Eine Jacke","Eine Fahrkarte"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué planes tienen al final?","de": "Welche Pläne haben sie am Ende?","s_es": {"type": "multiple_choice","options": ["Study later","Go shopping","Take a nap"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Später lernen","Einkaufen gehen","Ein Nickerchen machen"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 6200 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 6200 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 6200, 'en', 'dialogue', 'Convivencia', '[{"name": "Ava","gender": "female","avatarURL": "https://example.com/avatars/student-1.png"},{"name": "Leo","gender": "male","avatarURL": "https://example.com/avatars/student-2.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'toma parte en una charla informal con compañeros', 'Practica un diálogo breve y natural para saludar, comentar la clase y hablar de planes sencillos.'),
        (v_dialogue_id, 'de', 'halte Smalltalk mit Mitschülern', 'Übe einen kurzen, natürlichen Dialog, um zu grüßen, über den Unterricht zu sprechen und einfache Pläne zu machen.');

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
