-- ============================================================
-- Seed: A0 English Path – STEP 3890 – Listening – listen to product specifications (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La PrintMax 200 imprime 30 páginas por minuto.", "p_de": "Der PrintMax 200 druckt 30 Seiten pro Minute.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La impresora solo imprime en blanco y negro.", "p_de": "Der Drucker druckt nur schwarz-weiß.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La bandeja tiene capacidad para 250 hojas.", "p_de": "Das Papierfach fasst 250 Blatt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La máquina pesa 12 kilos.", "p_de": "Die Maschine wiegt 12 Kilo.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede conectar por Wi-Fi o USB.", "p_de": "Man kann sie per WLAN oder USB verbinden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Funciona con 110 voltios.", "p_de": "Sie läuft mit 110 Volt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La garantía dura dos años.", "p_de": "Die Garantie dauert zwei Jahre.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay tóner en la caja.", "p_de": "Es ist kein Toner in der Schachtel.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuántas páginas por minuto imprime?", "p_de": "Wie viele Seiten pro Minute druckt sie?", "s_es": {"type": "multiple_choice", "options": ["Thirty", "Twelve", "Two hundred"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dreißig", "Zwölf", "Zweihundert"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué modos imprime?", "p_de": "In welchen Modi druckt sie?", "s_es": {"type": "multiple_choice", "options": ["Colour and black and white", "Only black and white", "Only colour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Farbe und schwarz-weiß", "Nur schwarz-weiß", "Nur Farbe"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas hojas caben en la bandeja?", "p_de": "Wie viele Blätter passen ins Fach?", "s_es": {"type": "multiple_choice", "options": ["250", "25", "500"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["250", "25", "500"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto pesa la máquina?", "p_de": "Wie viel wiegt die Maschine?", "s_es": {"type": "multiple_choice", "options": ["12 kilos", "20 kilos", "5 kilos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 Kilo", "20 Kilo", "5 Kilo"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se conecta?", "p_de": "Wie verbindet man sie?", "s_es": {"type": "multiple_choice", "options": ["By Wi-Fi or USB", "Only by cable TV", "Only by Bluetooth"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per WLAN oder USB", "Nur per TV-Kabel", "Nur per Bluetooth"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué voltaje funciona?", "p_de": "Mit welcher Spannung arbeitet sie?", "s_es": {"type": "multiple_choice", "options": ["220 volts", "110 volts", "12 volts"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["220 Volt", "110 Volt", "12 Volt"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la garantía?", "p_de": "Wie lange dauert die Garantie?", "s_es": {"type": "multiple_choice", "options": ["Two years", "One month", "Five years"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Jahre", "Einen Monat", "Fünf Jahre"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué viene en la caja?", "p_de": "Was ist in der Schachtel?", "s_es": {"type": "multiple_choice", "options": ["A starter toner", "Three chairs", "A phone charger"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Starter-Toner", "Drei Stühle", "Ein Handy-Ladegerät"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3890 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3890 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3890, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Nina, a sales representative explaining a printer
## "PrintMax 200"

## THE SCENE: A supplier explains the main features of one office printer
Nina repeats the basic specifications slowly for a buyer.

### DIRECTOR'S NOTES
Style:
* Product information with clear numbers and simple technical words.
* Short list structure for easy note-taking.

Pace: Slow and precise.

Accent: Neutral accent.

#### TRANSCRIPT
[clear] Sales rep: The PrintMax 200 prints thirty pages a minute.
[informative] Sales rep: It works in colour and black and white.
[practical] Sales rep: The paper tray holds 250 sheets.
[clear] Sales rep: The machine weighs 12 kilos.
[helpful] Sales rep: You can connect by Wi-Fi or USB.
[technical] Sales rep: It uses standard 220-volt power.
[reassuring] Sales rep: The warranty is for two years.
[final] Sales rep: A starter toner comes in the box.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha especificaciones de producto', 'Escucha una explicación breve sobre velocidad, capacidad, conexiones y garantía de una impresora.'),
            (v_listening_id, 'de', 'Höre Produktspezifikationen', 'Höre eine kurze Erklärung zu Geschwindigkeit, Kapazität, Anschlüssen und Garantie eines Druckers.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
