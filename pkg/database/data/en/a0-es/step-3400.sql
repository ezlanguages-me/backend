-- ============================================================
-- Seed: A0 English Path – STEP 3400 – Reading – understand geography/climate info
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "Riverland está en el norte del país.", "p_de": "Riverland liegt im Norden des Landes.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Las montañas altas están en el oeste.", "p_de": "Die hohen Berge liegen im Westen.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Un río largo cruza el centro de norte a sur.", "p_de": "Ein langer Fluss durchquert die Mitte von Norden nach Süden.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "La mayoría de los pueblos están cerca del río.", "p_de": "Die meisten Orte liegen in der Nähe des Flusses.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El oeste es montañoso y muy húmedo.", "p_de": "Der Westen ist bergig und sehr feucht.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "En verano hace calor y hay poco lluvia.", "p_de": "Im Sommer ist es warm und es gibt wenig Regen.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "En invierno suele nevar en el valle.", "p_de": "Im Winter schneit es gewöhnlich im Tal.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "En el valle normalmente llueve en invierno en lugar de nevar.", "p_de": "Im Tal regnet es im Winter normalerweise statt zu schneien.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Dónde está Riverland?", "p_de": "Wo liegt Riverland?", "s": {"type": "multiple_choice", "options": ["In the north of the country", "In the south of the country", "On a small island"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde están las montañas altas?", "p_de": "Wo sind die hohen Berge?", "s": {"type": "multiple_choice", "options": ["In the east", "In the west", "In the middle of the sea"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué cruza el centro de la región?", "p_de": "Was durchquert die Mitte der Region?", "s": {"type": "multiple_choice", "options": ["A long river", "A railway tunnel", "A desert road"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde están la mayoría de los pueblos?", "p_de": "Wo liegen die meisten Orte?", "s": {"type": "multiple_choice", "options": ["In the wide valley near the river", "On the highest mountain", "In the dry desert"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo es el oeste?", "p_de": "Wie ist der Westen?", "s": {"type": "multiple_choice", "options": ["Flat and dry", "Cold and snowy all year", "Wet and tropical"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo es el verano?", "p_de": "Wie ist der Sommer?", "s": {"type": "multiple_choice", "options": ["Warm and sunny with little rain", "Very cold and dark", "Stormy every day"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde nieva a menudo en invierno?", "p_de": "Wo schneit es im Winter oft?", "s": {"type": "multiple_choice", "options": ["In the mountains", "In the valley every day", "At the coast only"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué suele ocurrir en el valle en invierno?", "p_de": "Was passiert im Tal im Winter meistens?", "s": {"type": "multiple_choice", "options": ["It usually rains", "It is always dry", "It is always covered in ice"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3400 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3400 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3400, 'en', 'reading', 'nature', $reading$Riverland Region Guide

Riverland is in the north of the country. High mountains are in the east, and a long river crosses the centre from north to south.

Most towns are in the wide valley near the river. The west is flat and dry, with farms and open fields.

Summer is warm and sunny, with little rain. Winter is colder, and snow often falls in the mountains, but the valley usually has rain instead of snow.$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Comprender información de geografía y clima', 'Lee una guía sencilla sobre relieve, ríos, valles y clima en una región.');

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Geografie- und Klimainformationen verstehen', 'Lies einen einfachen Text über Landschaft, Flüsse, Täler und Klima in einer Region.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
