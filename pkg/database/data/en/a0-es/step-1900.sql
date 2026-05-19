-- ============================================================
-- Seed: A0 English Path – STEP 1900 – Reading – understand operating instructions on appliances, e.g. an electric razor (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que cargar la afeitadora 8 horas antes del primer uso.", "p_de": "Man soll den Rasierer vor der ersten Benutzung 8 Stunden laden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que pulsar el botón dos veces para empezar.", "p_de": "Man muss zweimal auf den Knopf drücken, um zu starten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Solo se usa sobre piel seca.", "p_de": "Man benutzt ihn nur auf trockener Haut.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que limpiar el cabezal después de cada uso.", "p_de": "Man soll den Scherkopf nach jeder Benutzung reinigen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La unidad principal se puede lavar en agua.", "p_de": "Das Hauptgerät kann im Wasser gewaschen werden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que apagar la afeitadora después de usarla.", "p_de": "Man soll den Rasierer nach dem Gebrauch ausschalten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe guardarse en un lugar seco y seguro.", "p_de": "Er soll an einem sicheren, trockenen Ort aufbewahrt werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cabezal se cambia cada 12 semanas.", "p_de": "Der Scherkopf wird alle 12 Wochen gewechselt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto tiempo se carga antes del primer uso?", "p_de": "Wie lange lädt man vor dem ersten Gebrauch?", "s": {"type": "multiple_choice", "options": ["8 hours", "12 hours", "2 hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas veces pulsas el botón para empezar?", "p_de": "Wie oft drückt man zum Starten auf den Knopf?", "s": {"type": "multiple_choice", "options": ["Once", "Twice", "Three times"], "answer": 0}}'::jsonb,
        '{"p": "¿Sobre qué tipo de piel se usa?", "p_de": "Auf welcher Haut benutzt man ihn?", "s": {"type": "multiple_choice", "options": ["Dry skin only", "Wet skin only", "Any skin with soap"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué limpias el cabezal?", "p_de": "Womit reinigst du den Scherkopf?", "s": {"type": "multiple_choice", "options": ["With the small brush", "With hot water", "With shampoo"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué parte no se lava en agua?", "p_de": "Welches Teil wird nicht mit Wasser gewaschen?", "s": {"type": "multiple_choice", "options": ["The main unit", "The brush", "The manual"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces después de usar la afeitadora?", "p_de": "Was machst du nach der Benutzung?", "s": {"type": "multiple_choice", "options": ["Turn it off", "Charge it for 8 hours", "Put it in water"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde la guardas?", "p_de": "Wo bewahrst du sie auf?", "s": {"type": "multiple_choice", "options": ["In a safe, dry place", "In the shower", "Outside"], "answer": 0}}'::jsonb,
        '{"p": "¿Cada cuánto cambias el cabezal?", "p_de": "Wie oft wechselt man den Scherkopf?", "s": {"type": "multiple_choice", "options": ["Every 12 months", "Every 12 days", "Every 12 weeks"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1900 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1900 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1900, 'en', 'reading', 'Compras y Transacciones', $reading$
EASY SHAVE 200
Charge the razor for 8 hours before first use. Press the power button once to start.

Use on dry skin only. Clean the head after each use with the small brush. Do not wash the main unit in water.

Turn off after use and keep the razor in a safe, dry place. Replace the head every 12 months.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Instrucciones de una afeitadora eléctrica');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Anleitung für einen Elektrorasierer');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
