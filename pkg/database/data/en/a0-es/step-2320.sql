-- ============================================================
-- Seed: A0 English Path – STEP 2320 – Reading – maintain an interaction related to the nature and quality of the food (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El pan se hornea cada hora.", "p_de": "Das Brot wird jede Stunde gebacken.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pescado a la parrilla está seco por dentro.", "p_de": "Der gegrillte Fisch ist innen trocken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las verduras son de temporada.", "p_de": "Das Gemüse ist saisonal.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las verduras son muy aceitosas.", "p_de": "Das Gemüse ist sehr ölig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El arroz es un poco seco.", "p_de": "Der Reis ist etwas trocken.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La crítica dice que toda la comida es mala.", "p_de": "Die Kritik sagt, dass das ganze Essen schlecht ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La opinión general es positiva.", "p_de": "Die Gesamtmeinung ist positiv.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto es una columna sobre la calidad de la comida.", "p_de": "Der Text ist eine Kolumne über die Qualität des Essens.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Con qué frecuencia se hornea el pan?", "p_de": "Wie oft wird das Brot gebacken?", "s": {"type": "multiple_choice", "options": ["Every hour", "Every week", "Only at night"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está el pescado por fuera?", "p_de": "Wie ist der Fisch außen?", "s": {"type": "multiple_choice", "options": ["Crispy", "Raw", "Sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo son las verduras?", "p_de": "Wie ist das Gemüse?", "s": {"type": "multiple_choice", "options": ["Seasonal and not oily", "Frozen and oily", "Very spicy"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el punto débil del menú?", "p_de": "Was ist der schwache Punkt der Speisekarte?", "s": {"type": "multiple_choice", "options": ["The rice", "The bread", "The fish"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está el arroz?", "p_de": "Wie ist der Reis?", "s": {"type": "multiple_choice", "options": ["A little dry", "Very wet", "Too cold"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué palabra resume la crítica?", "p_de": "Welches Wort fasst die Kritik zusammen?", "s": {"type": "multiple_choice", "options": ["Balanced", "Terrible", "Empty"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de pescado hay?", "p_de": "Welche Art Fisch gibt es?", "s": {"type": "multiple_choice", "options": ["Grilled fish", "Boiled fish soup", "Fish sandwich"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A food review column", "A shopping list", "A job advert"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2320 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2320 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2320, 'en', 'reading', 'Restauración', $reading$
FOOD COLUMN
At Harbor Kitchen, the bread is baked every hour and tastes fresh.
The grilled fish is soft inside and crispy outside.

The vegetables are seasonal and not oily.
The only weak point is the rice, which is a little dry.

Overall, the food feels careful and balanced.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer una crítica sobre la calidad de la comida');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine Kritik über die Qualität des Essens lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
