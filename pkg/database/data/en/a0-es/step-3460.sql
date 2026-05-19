-- ============================================================
-- Seed: A0 English Path – STEP 3460 – Reading – understand weather forecasts
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        $json${"p": "El lunes por la mañana hace sol.", "p_de": "Am Montagmorgen ist es sonnig.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El martes la temperatura es de 17 grados.", "p_de": "Am Dienstag beträgt die Temperatur 17 Grad.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El miércoles llueve solo por la mañana muy temprano.", "p_de": "Am Mittwoch regnet es nur sehr früh am Morgen.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "El jueves está nublado todo el día.", "p_de": "Am Donnerstag ist es den ganzen Tag bewölkt.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "El viernes por la noche hay tormenta cerca de la costa.", "p_de": "Am Freitagabend gibt es an der Küste einen Sturm.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "Las zonas del interior siguen cálidas el viernes.", "p_de": "Im Inland bleibt es am Freitag warm.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "El martes llueve bastante.", "p_de": "Am Dienstag regnet es stark.", "s": {"type": "true_false", "answer": false}}$json$::jsonb,
        $json${"p": "El lunes por la tarde aparecen nubes ligeras.", "p_de": "Am Montagnachmittag kommen leichte Wolken.", "s": {"type": "true_false", "answer": true}}$json$::jsonb,
        $json${"p": "¿Qué día llueve desde el mediodía hasta la tarde?", "p_de": "An welchem Tag regnet es vom Mittag bis zum Abend?", "s": {"type": "multiple_choice", "options": ["Wednesday", "Monday", "Friday"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cuál es el día más fresco de la previsión?", "p_de": "Welcher Tag ist der kühlste in der Vorhersage?", "s": {"type": "multiple_choice", "options": ["Wednesday", "Monday", "Friday"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué día hace viento y más fresco?", "p_de": "An welchem Tag ist es windig und kühler?", "s": {"type": "multiple_choice", "options": ["Tuesday", "Thursday", "Monday"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Dónde habrá tormenta el viernes por la noche?", "p_de": "Wo gibt es am Freitagabend einen Sturm?", "s": {"type": "multiple_choice", "options": ["Near the coast", "In the valley school", "Only inside the station"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo termina el tiempo el jueves?", "p_de": "Wie endet das Wetter am Donnerstag?", "s": {"type": "multiple_choice", "options": ["Bright and dry", "Snowy and icy", "Very stormy"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Qué temperatura tiene el lunes?", "p_de": "Welche Temperatur hat der Montag?", "s": {"type": "multiple_choice", "options": ["22°C", "17°C", "15°C"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Llueve el martes?", "p_de": "Regnet es am Dienstag?", "s": {"type": "multiple_choice", "options": ["No", "Yes, all day", "Only at night with snow"], "answer": 0}}$json$::jsonb,
        $json${"p": "¿Cómo están las zonas del interior el viernes?", "p_de": "Wie ist es im Inland am Freitag?", "s": {"type": "multiple_choice", "options": ["Warm at 21°C", "Frozen at 0°C", "Wet and stormy all day"], "answer": 0}}$json$::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3460 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3460 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3460, 'en', 'reading', 'nature', $reading$Town Weather Forecast

Monday: sunny in the morning, 22°C. Light clouds in the afternoon.
Tuesday: windy and cooler, 17°C. No rain.
Wednesday: rain from midday to evening, 15°C.
Thursday: cloudy early, then bright and dry, 19°C.
Friday: storm near the coast at night. Inland areas stay warm at 21°C.$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Comprender previsiones del tiempo', 'Lee una previsión sencilla con días, temperaturas y cambios del tiempo.');

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Wettervorhersagen verstehen', 'Lies eine einfache Vorhersage mit Tagen, Temperaturen und Wetteränderungen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
