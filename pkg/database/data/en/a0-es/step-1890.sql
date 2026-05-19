-- ============================================================
-- Seed: A0 English Path – STEP 1890 – Reading – follow simple instructions given on packaging (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que agitar bien el zumo antes de usarlo.", "p_de": "Man soll den Saft vor dem Gebrauch gut schütteln.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Después de abrirlo, el zumo va en el congelador.", "p_de": "Nach dem Öffnen kommt der Saft in den Gefrierschrank.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que usar el zumo en 3 días después de abrirlo.", "p_de": "Man soll den Saft innerhalb von 3 Tagen nach dem Öffnen verbrauchen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bolsa de arroz se cuece 10 minutos en agua.", "p_de": "Der Reisbeutel wird 10 Minuten im Wasser gekocht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que abrir la bolsa de arroz antes de cocinarla.", "p_de": "Man soll den Reisbeutel vor dem Kochen öffnen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La crema facial debe guardarse en un lugar fresco y seco.", "p_de": "Die Gesichtscreme soll an einem kühlen, trockenen Ort gelagert werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La crema facial debe guardarse cerca de los niños.", "p_de": "Die Gesichtscreme soll in der Nähe von Kindern aufbewahrt werden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las instrucciones son para tres productos distintos.", "p_de": "Die Hinweise sind für drei verschiedene Produkte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué haces antes de usar el zumo?", "p_de": "Was machst du vor dem Benutzen des Safts?", "s": {"type": "multiple_choice", "options": ["Shake well", "Freeze it", "Open the rice bag"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde guardas el zumo después de abrirlo?", "p_de": "Wo bewahrst du den Saft nach dem Öffnen auf?", "s": {"type": "multiple_choice", "options": ["In the fridge", "In a hot place", "In the car"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debes usar el zumo?", "p_de": "Wann sollst du den Saft verbrauchen?", "s": {"type": "multiple_choice", "options": ["Within 3 days of opening", "Within 10 days", "Before dinner only"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto tiempo hierves la bolsa de arroz?", "p_de": "Wie lange kochst du den Reisbeutel?", "s": {"type": "multiple_choice", "options": ["10 minutes", "3 minutes", "20 minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no haces con la bolsa de arroz antes de cocinarla?", "p_de": "Was machst du mit dem Reisbeutel vor dem Kochen nicht?", "s": {"type": "multiple_choice", "options": ["Open the bag", "Boil it", "Put it in water"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde guardas la crema facial?", "p_de": "Wo lagerst du die Gesichtscreme?", "s": {"type": "multiple_choice", "options": ["In a cool, dry place", "In direct sun", "In the freezer"], "answer": 0}}'::jsonb,
        '{"p": "¿De quién debe estar lejos la crema facial?", "p_de": "Von wem soll die Gesichtscreme ferngehalten werden?", "s": {"type": "multiple_choice", "options": ["Children", "Adults", "Drivers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["Simple packaging instructions", "A restaurant menu", "A train ticket"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1890 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1890 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1890, 'en', 'reading', 'Compras y Transacciones', $reading$
ORANGE JUICE CONCENTRATE
Shake well before use. Keep in the fridge after opening. Use within 3 days of opening.

RICE BAG
Boil in water for 10 minutes. Do not open the bag before cooking.

FACE CREAM
Store in a cool, dry place. Keep away from children.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Instrucciones simples de envases');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Einfache Packungsanweisungen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
