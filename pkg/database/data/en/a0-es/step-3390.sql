-- ============================================================
-- Seed: A0 English Path – STEP 3390 – Reading – read about animals and habitats
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "Los patos y los peces viven en el lago.", "p_de": "Enten und Fische leben im See.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Las ranas viven en una colina seca.", "p_de": "Frösche leben auf einem trockenen Hügel.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "Los conejos y los zorros están en la pradera abierta.", "p_de": "Kaninchen und Füchse sind im offenen Grasland.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Las ardillas saltan entre los pinos del pequeño bosque.", "p_de": "Eichhörnchen springen zwischen den Kiefern im kleinen Wald.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Los búhos descansan allí por la noche.", "p_de": "Die Eulen ruhen dort nachts.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Los perros pueden correr sueltos en la zona de aves.", "p_de": "Hunde dürfen im Vogelbereich frei laufen.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "La mejor hora para ver animales es el mediodía.", "p_de": "Die beste Zeit, um Tiere zu sehen, ist mittags.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "La pradera abierta está en la puerta sur.", "p_de": "Das offene Grasland liegt am Südtor.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Dónde viven los patos y los peces?", "p_de": "Wo leben Enten und Fische?", "s": {"type": "multiple_choice", "options": ["In the lake", "On the hill", "Inside the visitor centre"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde se quedan las ranas?", "p_de": "Wo bleiben die Frösche?", "s": {"type": "multiple_choice", "options": ["In the wet reeds", "On the roof", "In the car park"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué animales usan la pradera abierta?", "p_de": "Welche Tiere nutzen das offene Grasland?", "s": {"type": "multiple_choice", "options": ["Rabbits and foxes", "Owls and fish", "Cats and horses"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué árboles hay en el pequeño bosque?", "p_de": "Welche Bäume gibt es im kleinen Wald?", "s": {"type": "multiple_choice", "options": ["Pine trees", "Palm trees", "Banana trees"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cuándo descansan los búhos?", "p_de": "Wann ruhen die Eulen?", "s": {"type": "multiple_choice", "options": ["At night", "At breakfast time", "Only at noon"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué deben hacer los dueños de perros cerca de las aves?", "p_de": "Was sollen Hundebesitzer im Vogelbereich tun?", "s": {"type": "multiple_choice", "options": ["Keep dogs on a lead", "Open the cage", "Feed the birds"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cuál es una buena hora para ver animales?", "p_de": "Wann ist eine gute Zeit, um Tiere zu sehen?", "s": {"type": "multiple_choice", "options": ["Early morning", "At midnight in winter", "Only after lunch"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿De qué trata el texto?", "p_de": "Worum geht es im Text?", "s": {"type": "multiple_choice", "options": ["Animals and habitats in a park", "School rules for exams", "A train journey to the city"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3390 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3390 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3390, 'en', 'reading', 'nature', $reading$Wildlife in Blue Lake Park

Blue Lake Park has different habitats. Ducks and fish live in the lake. Frogs stay in the wet reeds near the water.

Rabbits and foxes use the open grassland at the south gate. In the small forest, squirrels jump between the pine trees, and owls rest there at night.

Please keep dogs on a lead near the bird area. The best time to see animals is early morning or just before sunset.$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Leer sobre animales y hábitats', 'Lee un texto breve sobre animales, zonas del parque y hábitats naturales.');

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Über Tiere und Lebensräume lesen', 'Lies einen kurzen Text über Tiere, Parkbereiche und natürliche Lebensräume.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
