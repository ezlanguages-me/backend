-- ============================================================
-- Seed: A0 English Path – STEP 3070 – Reading – understand signs and notices on the road
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Market Street es de un solo sentido hacia el puente.", "de": "Market Street ist eine Einbahnstraße zur Brücke.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Puedes entrar desde River Road a las ocho de la mañana.", "de": "Du kannst um acht Uhr morgens von der River Road einfahren.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La entrada del Blue Car Park está en Hill Street.", "de": "Die Einfahrt zum Blue Car Park ist in der Hill Street.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El límite de velocidad en el centro es de 30 mph.", "de": "Das Tempolimit im Zentrum beträgt 30 mph.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "King Lane es solo para autobuses.", "de": "King Lane ist nur für Busse.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La zona de carga se puede usar durante una hora.", "de": "Die Ladezone kann eine Stunde lang benutzt werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Debes usar las luces en el túnel.", "de": "Du musst im Tunnel das Licht benutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las señales marrones llevan al museo.", "de": "Die braunen Schilder führen zum Museum.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué calle es de un solo sentido?", "de": "Welche Straße ist eine Einbahnstraße?", "s_es": {"type": "multiple_choice", "options": ["Market Street", "Hill Street", "River Road"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Market Street", "Hill Street", "River Road"], "answer": 0}}'::jsonb,
        '{"es": "¿Entre qué horas no se puede entrar desde River Road?", "de": "Zwischen welchen Zeiten darf man nicht von der River Road einfahren?", "s_es": {"type": "multiple_choice", "options": ["Between 7 a.m. and 10 a.m.", "Between 10 a.m. and 7 p.m.", "All day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwischen 7 Uhr und 10 Uhr", "Zwischen 10 Uhr und 19 Uhr", "Den ganzen Tag"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está la entrada del aparcamiento azul?", "de": "Wo ist die Einfahrt zum blauen Parkplatz?", "s_es": {"type": "multiple_choice", "options": ["On Hill Street", "In King Lane", "At the bridge"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der Hill Street", "In der King Lane", "An der Brücke"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el límite de velocidad en el centro?", "de": "Wie hoch ist das Tempolimit im Zentrum?", "s_es": {"type": "multiple_choice", "options": ["20 mph", "40 mph", "60 mph"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 mph", "40 mph", "60 mph"], "answer": 0}}'::jsonb,
        '{"es": "¿Para quién es King Lane?", "de": "Für wen ist King Lane?", "s_es": {"type": "multiple_choice", "options": ["For buses only", "For bikes only", "For taxis only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nur für Busse", "Nur für Fahrräder", "Nur für Taxis"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tiempo puede usar una furgoneta la zona de carga?", "de": "Wie lange darf ein Lieferwagen die Ladezone benutzen?", "s_es": {"type": "multiple_choice", "options": ["15 minutes", "5 minutes", "2 hours"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["15 Minuten", "5 Minuten", "2 Stunden"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde debes usar las luces?", "de": "Wo musst du das Licht benutzen?", "s_es": {"type": "multiple_choice", "options": ["In the tunnel", "In the car park", "At the school gate"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Tunnel", "Auf dem Parkplatz", "Am Schultor"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué señales debes seguir para ir al museo?", "de": "Welchen Schildern sollst du zum Museum folgen?", "s_es": {"type": "multiple_choice", "options": ["The brown signs", "The blue signs", "The red signs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den braunen Schildern", "Den blauen Schildern", "Den roten Schildern"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3070 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3070 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3070, 'en', 'reading', 'transport', 'Riverside Town Driving Notice. Market Street is one way to the bridge. Do not enter from River Road between 7 a.m. and 10 a.m. The Blue Car Park entrance is on Hill Street.

The speed limit in the town centre is 20 mph. King Lane is for buses only. Delivery vans may use the loading area for 15 minutes.

Use your lights in the tunnel near the bridge. For the museum, follow the brown signs after the roundabout.

Please drive slowly near the school and watch for people on bikes.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee señales y avisos básicos de la carretera', 'Lee un aviso corto con calles de un solo sentido, límites y señales para conducir en una ciudad.'),
        (v_reading_id, 'de', 'Lies einfache Verkehrszeichen und Hinweise auf der Straße', 'Lies einen kurzen Hinweis mit Einbahnstraße, Tempolimit und Schildern für das Fahren in einer Stadt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
