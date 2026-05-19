-- ============================================================
-- Seed: A0 English Path – STEP 3420 – Reading – understand plant descriptions
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "El girasol es alto y amarillo.", "p_de": "Die Sonnenblume ist hoch und gelb.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El helecho prefiere pleno sol.", "p_de": "Der Farn mag volle Sonne.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "El cactus necesita poca agua.", "p_de": "Der Kaktus braucht wenig Wasser.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "La planta de menta tiene flores muy grandes.", "p_de": "Die Minzpflanze hat sehr große Blüten.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Los estudiantes usan la menta para hacer té.", "p_de": "Die Schüler benutzen die Minze für Tee.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El cactus está en el rincón más caluroso.", "p_de": "Der Kaktus steht in der heißesten Ecke.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El helecho crece cerca de la pared.", "p_de": "Der Farn wächst in der Nähe der Wand.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El girasol crece rápido en invierno.", "p_de": "Die Sonnenblume wächst im Winter schnell.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "¿Qué planta es alta y amarilla?", "p_de": "Welche Pflanze ist hoch und gelb?", "s": {"type": "multiple_choice", "options": ["The sunflower", "The fern", "The cactus"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué planta prefiere sombra y suelo húmedo?", "p_de": "Welche Pflanze mag Schatten und feuchten Boden?", "s": {"type": "multiple_choice", "options": ["The fern", "The sunflower", "The mint plant"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué planta necesita poca agua?", "p_de": "Welche Pflanze braucht wenig Wasser?", "s": {"type": "multiple_choice", "options": ["The cactus", "The fern", "The sunflower"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde está el cactus?", "p_de": "Wo steht der Kaktus?", "s": {"type": "multiple_choice", "options": ["In the hottest corner", "By the cold window", "In the lake"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué planta tiene hojas pequeñas y olor fresco?", "p_de": "Welche Pflanze hat kleine Blätter und einen frischen Geruch?", "s": {"type": "multiple_choice", "options": ["The mint plant", "The cactus", "The pine tree"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Para qué usan la menta los estudiantes?", "p_de": "Wofür benutzen die Schüler die Minze?", "s": {"type": "multiple_choice", "options": ["For tea", "For paint", "For snow"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cuándo crece rápido el girasol?", "p_de": "Wann wächst die Sonnenblume schnell?", "s": {"type": "multiple_choice", "options": ["In summer", "In winter", "At night only"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿De qué trata el texto?", "p_de": "Worum geht es im Text?", "s": {"type": "multiple_choice", "options": ["Descriptions of plants", "A train trip", "Kitchen rules"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3420 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3420 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3420, 'en', 'reading', 'nature', $reading$Plants in the School Garden

The sunflower is tall and yellow. It likes full sun and grows quickly in summer.

The fern is short and green. It likes shade and wet soil, so it grows near the wall.

The cactus is small but strong. It needs little water and stands in the hottest corner.

The mint plant has small leaves and a fresh smell. Students use it for tea in spring.$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Comprender descripciones de plantas', 'Lee descripciones simples de varias plantas y sus necesidades básicas.');

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Pflanzenbeschreibungen verstehen', 'Lies einfache Beschreibungen verschiedener Pflanzen und ihrer Grundbedürfnisse.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
