-- ============================================================
-- Seed: A0 English Path – STEP 2610 – Reading – Lee una receta básica y síntomas
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La receta es para Ana Ruiz.", "p_de": "Das Rezept ist für Ana Ruiz.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe tomar una tableta por la mañana y otra por la noche.", "p_de": "Sie soll morgens eine Tablette und abends eine Tablette nehmen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe tomar el antibiótico durante dos semanas.", "p_de": "Sie soll das Antibiotikum zwei Wochen lang nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Para el dolor puede tomar paracetamol cada ocho horas.", "p_de": "Gegen Schmerzen kann sie alle acht Stunden Paracetamol nehmen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puede conducir aunque las pastillas le den sueño.", "p_de": "Sie kann fahren, auch wenn die Tabletten sie müde machen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Debe volver a la clínica si sigue con fiebre después de dos días.", "p_de": "Sie soll in die Klinik zurückkommen, wenn sie nach zwei Tagen noch Fieber hat.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los síntomas de hoy incluyen sore throat, cough y headache.", "p_de": "Zu den heutigen Symptomen gehören sore throat, cough und headache.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La receta dice que debe correr una hora cada día.", "p_de": "Auf dem Rezept steht, dass sie jeden Tag eine Stunde laufen soll.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuántas tabletas de amoxicillin toma al día?", "p_de": "Wie viele Amoxicillin-Tabletten nimmt sie pro Tag?", "s": {"type": "multiple_choice", "options": ["Two", "One", "Three"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Two", "One", "Three"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Two", "One", "Three"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo toma las tabletas?", "p_de": "Wann nimmt sie die Tabletten?", "s": {"type": "multiple_choice", "options": ["In the morning and at night after food", "Only before breakfast", "At lunch and midnight"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["In the morning and at night after food", "Only before breakfast", "At lunch and midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In the morning and at night after food", "Only before breakfast", "At lunch and midnight"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede tomar para el dolor?", "p_de": "Was kann sie gegen Schmerzen nehmen?", "s": {"type": "multiple_choice", "options": ["Paracetamol", "Chocolate", "A taxi"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Paracetamol", "Chocolate", "A taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Paracetamol", "Chocolate", "A taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿Cada cuánto puede tomarlo?", "p_de": "Wie oft kann sie es nehmen?", "s": {"type": "multiple_choice", "options": ["Every eight hours", "Every hour", "Once a week"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Every eight hours", "Every hour", "Once a week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Every eight hours", "Every hour", "Once a week"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debe hacer si tiene sueño?", "p_de": "Was soll sie nicht tun, wenn sie schläfrig ist?", "s": {"type": "multiple_choice", "options": ["Drive", "Drink water", "Sleep"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Drive", "Drink water", "Sleep"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drive", "Drink water", "Sleep"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debe volver a la clínica?", "p_de": "Wann soll sie in die Klinik zurückkommen?", "s": {"type": "multiple_choice", "options": ["If she still has fever after two days", "Tomorrow morning at 6", "After one month"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["If she still has fever after two days", "Tomorrow morning at 6", "After one month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["If she still has fever after two days", "Tomorrow morning at 6", "After one month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué síntoma aparece en la receta?", "p_de": "Welches Symptom steht auf dem Rezept?", "s": {"type": "multiple_choice", "options": ["Headache", "Broken leg", "Ear infection"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Headache", "Broken leg", "Ear infection"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Headache", "Broken leg", "Ear infection"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos días dura el antibiótico?", "p_de": "Wie viele Tage dauert das Antibiotikum?", "s": {"type": "multiple_choice", "options": ["Five days", "One day", "Ten days"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Five days", "One day", "Ten days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Five days", "One day", "Ten days"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2610 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2610 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2610, 'en', 'reading', 'health', 'Prescription for Ana Ruiz

Take one amoxicillin tablet in the morning and one at night after food for five days.

For pain, take paracetamol every eight hours if needed. Do not drive if the tablets make you sleepy.

Return to the clinic if you still have fever after two days. Symptoms today: sore throat, cough, headache.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee una receta básica y síntomas', 'Lee una receta sencilla y reconoce síntomas básicos y recomendaciones escritas.'),
        (v_reading_id, 'de', 'Lies ein einfaches Rezept und Symptome', 'Lies ein einfaches Rezept und erkenne grundlegende Symptome und schriftliche Hinweise.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
