-- ============================================================
-- Seed: A0 English Path – STEP 2650 – Reading – Lee los consejos del médico
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El médico aconseja descansar en casa dos días.", "p_de": "Der Arzt rät, zwei Tage zu Hause zu ruhen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que beber agua caliente a menudo.", "p_de": "Man soll oft warmes Wasser trinken.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El antibiótico se toma antes del desayuno y antes de la cena.", "p_de": "Das Antibiotikum wird vor dem Frühstück und vor dem Abendessen genommen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "No debe ir al gimnasio esta semana.", "p_de": "Man soll diese Woche nicht ins Fitnessstudio gehen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe llamar a la clínica si respira peor.", "p_de": "Man soll die Klinik anrufen, wenn das Atmen schlechter wird.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe llamar si la fiebre pasa de 39 grados.", "p_de": "Man soll anrufen, wenn das Fieber über 39 Grad steigt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si la tos mejora, debe volver el lunes de todos modos.", "p_de": "Wenn der Husten besser wird, soll man trotzdem am Montag zurückkommen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El texto habla de hacer mucho deporte.", "p_de": "Der Text handelt davon, viel Sport zu machen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto tiempo debe descansar en casa?", "p_de": "Wie lange soll man zu Hause ruhen?", "s": {"type": "multiple_choice", "options": ["For two days", "For two weeks", "For one month"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["For two days", "For two weeks", "For one month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["For two days", "For two weeks", "For one month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe beber?", "p_de": "Was soll man trinken?", "s": {"type": "multiple_choice", "options": ["Warm water", "Only coffee", "Cold juice"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Warm water", "Only coffee", "Cold juice"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Warm water", "Only coffee", "Cold juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo toma el antibiótico?", "p_de": "Wann nimmt man das Antibiotikum?", "s": {"type": "multiple_choice", "options": ["After breakfast and after dinner", "Before breakfast only", "At midnight"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["After breakfast and after dinner", "Before breakfast only", "At midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["After breakfast and after dinner", "Before breakfast only", "At midnight"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debe hacer esta semana?", "p_de": "Was soll man diese Woche nicht tun?", "s": {"type": "multiple_choice", "options": ["Go to the gym", "Sleep", "Drink water"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Go to the gym", "Sleep", "Drink water"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Go to the gym", "Sleep", "Drink water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa si la respiración empeora?", "p_de": "Was passiert, wenn die Atmung schlechter wird?", "s": {"type": "multiple_choice", "options": ["Call the clinic", "Wait three weeks", "Take a bus"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Call the clinic", "Wait three weeks", "Take a bus"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Call the clinic", "Wait three weeks", "Take a bus"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número de fiebre aparece en el texto?", "p_de": "Welche Fieberzahl steht im Text?", "s": {"type": "multiple_choice", "options": ["39°C", "37°C", "41°C"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["39°C", "37°C", "41°C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["39°C", "37°C", "41°C"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo vuelve si la tos no mejora?", "p_de": "Wann kommt man zurück, wenn der Husten nicht besser wird?", "s": {"type": "multiple_choice", "options": ["On Monday", "On Friday night", "In one hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["On Monday", "On Friday night", "In one hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["On Monday", "On Friday night", "In one hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Welche Art Text ist das?", "s": {"type": "multiple_choice", "options": ["Doctor''s advice", "A cinema ticket", "A train map"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Doctor''s advice", "A cinema ticket", "A train map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Doctor''s advice", "A cinema ticket", "A train map"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2650 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2650 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2650, 'en', 'reading', 'health', 'Doctor''s Advice

Rest at home for two days. Drink warm water often. Take the antibiotic after breakfast and after dinner.

Do not go to the gym this week. Call the clinic if your breathing gets worse or if your fever goes over 39°C.

If the cough is not better, come back on Monday.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee los consejos del médico', 'Lee una nota breve con los consejos principales del médico después de una consulta.'),
        (v_reading_id, 'de', 'Lies die Ratschläge des Arztes', 'Lies eine kurze Notiz mit den wichtigsten Ratschlägen des Arztes nach einer Untersuchung.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
