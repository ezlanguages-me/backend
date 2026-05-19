-- ============================================================
-- Seed: A0 English Path – STEP 2810 – Reading – Lee información sobre productos sin receta
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Las cold tablets ayudan con la nariz tapada.", "p_de": "Cold tablets helfen bei verstopfter Nase.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que tomar una cold tablet cada ocho horas.", "p_de": "Man nimmt eine cold tablet alle acht Stunden.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se pueden usar si tienes tensión alta.", "p_de": "Man kann sie bei hohem Blutdruck verwenden.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las allergy tablets son para estornudos y ojos que pican.", "p_de": "Allergy tablets sind für Niesen und juckende Augen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las allergy tablets son para niños menores de 12.", "p_de": "Allergy tablets sind für Kinder unter 12.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El pain gel es para músculos y dolor de espalda.", "p_de": "Pain gel ist für Muskeln und Rückenschmerzen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gel se usa sobre piel rota.", "p_de": "Das Gel wird auf verletzter Haut benutzt.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si estás embarazada, debes preguntar al farmacéutico.", "p_de": "Wenn du schwanger bist, sollst du den Apotheker fragen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Para qué sirven las cold tablets?", "p_de": "Wofür sind cold tablets?", "s": {"type": "multiple_choice", "options": ["A blocked nose", "A broken arm", "A rash on the foot"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A blocked nose", "A broken arm", "A rash on the foot"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A blocked nose", "A broken arm", "A rash on the foot"], "answer": 0}}'::jsonb,
        '{"p": "¿Cada cuánto se toman?", "p_de": "Wie oft werden sie genommen?", "s": {"type": "multiple_choice", "options": ["Every eight hours", "Once a week", "Every two minutes"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Every eight hours", "Once a week", "Every two minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Every eight hours", "Once a week", "Every two minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema ayudan las allergy tablets?", "p_de": "Bei welchem Problem helfen allergy tablets?", "s": {"type": "multiple_choice", "options": ["Sneezing and itchy eyes", "Back pain", "Toothache"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Sneezing and itchy eyes", "Back pain", "Toothache"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sneezing and itchy eyes", "Back pain", "Toothache"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas allergy tablets tomas al día?", "p_de": "Wie viele allergy tablets nimmt man pro Tag?", "s": {"type": "multiple_choice", "options": ["One tablet a day", "Three tablets an hour", "Two boxes a day"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["One tablet a day", "Three tablets an hour", "Two boxes a day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["One tablet a day", "Three tablets an hour", "Two boxes a day"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve el pain gel?", "p_de": "Wofür ist pain gel?", "s": {"type": "multiple_choice", "options": ["Muscles and back pain", "A blocked nose", "A sore throat"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Muscles and back pain", "A blocked nose", "A sore throat"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Muscles and back pain", "A blocked nose", "A sore throat"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas veces al día se usa el gel?", "p_de": "Wie oft am Tag benutzt man das Gel?", "s": {"type": "multiple_choice", "options": ["Three times a day", "One time a week", "Every eight hours"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Three times a day", "One time a week", "Every eight hours"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Three times a day", "One time a week", "Every eight hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde no se debe usar el gel?", "p_de": "Wo soll man das Gel nicht benutzen?", "s": {"type": "multiple_choice", "options": ["On broken skin", "On the back", "On the hand"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["On broken skin", "On the back", "On the hand"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["On broken skin", "On the back", "On the hand"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes hacer si estás embarazada?", "p_de": "Was sollst du tun, wenn du schwanger bist?", "s": {"type": "multiple_choice", "options": ["Ask the pharmacist", "Drink coffee", "Run home"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Ask the pharmacist", "Drink coffee", "Run home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ask the pharmacist", "Drink coffee", "Run home"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2810 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2810 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2810, 'en', 'reading', 'health', 'Pharmacy Shelf Guide

Cold tablets help with a blocked nose. Take one every eight hours. Do not use them if you have high blood pressure.

Allergy tablets help with sneezing and itchy eyes. Take one tablet a day. They are not for children under 12.

Pain gel is for muscles and back pain. Use it on the skin three times a day. Do not use it on broken skin. Ask the pharmacist if you are pregnant.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee información sobre productos sin receta', 'Lee una guía simple de farmacia sobre productos sin receta y sus usos básicos.'),
        (v_reading_id, 'de', 'Lies Informationen über rezeptfreie Produkte', 'Lies einen einfachen Apothekenhinweis über rezeptfreie Produkte und ihre grundlegende Verwendung.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
