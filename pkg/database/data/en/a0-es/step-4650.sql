-- ============================================================
-- Seed: A0 English Path – STEP 4650 – Reading – understand most factual product literature within own work area (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El producto es la ProPrint 400.", "p_de": "Das Produkt ist der ProPrint 400.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El primer paso es conectar el cable de alimentación.", "p_de": "Der erste Schritt ist, das Stromkabel anzuschließen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Hay que esperar a que la luz de listo se ponga verde.", "p_de": "Man soll warten, bis die Betriebsleuchte grün wird.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La bandeja de papel admite hasta 250 hojas.", "p_de": "Das Papierfach fasst bis zu 250 Blatt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El controlador viene en un CD dentro de la caja.", "p_de": "Der Treiber liegt auf einer CD in der Verpackung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Se puede conectar por USB o WiFi.", "p_de": "Man kann per USB oder WLAN verbinden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El último paso es imprimir una página de prueba.", "p_de": "Der letzte Schritt ist das Drucken einer Testseite.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Si la página de prueba falla, hay que llamar al soporte inmediatamente.", "p_de": "Wenn die Testseite fehlschlägt, soll man sofort den Support anrufen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Cuál es el primer paso?", "p_de": "Was ist der erste Schritt?", "s_es": {"type": "multiple_choice", "options": ["Retirar todo el embalaje", "Conectar el cable de alimentación", "Pulsar el botón de encendido"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alle Verpackungen entfernen", "Das Stromkabel anschließen", "Den Einschaltknopf drücken"], "answer": 0}}'::jsonb,
            '{"p": "¿De qué color debe estar la luz de listo?", "p_de": "Welche Farbe soll die Betriebsleuchte haben?", "s_es": {"type": "multiple_choice", "options": ["Verde", "Rojo", "Azul"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Grün", "Rot", "Blau"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántas hojas de A4 caben en la bandeja?", "p_de": "Wie viele A4-Blätter passen in das Fach?", "s_es": {"type": "multiple_choice", "options": ["250", "100", "500"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["250", "100", "500"], "answer": 0}}'::jsonb,
            '{"p": "¿Dónde está el controlador de la impresora?", "p_de": "Wo befindet sich der Druckertreiber?", "s_es": {"type": "multiple_choice", "options": ["En la memoria USB de la caja", "En un CD", "Solo en línea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem USB-Stick in der Verpackung", "Auf einer CD", "Nur online"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué métodos de conexión hay?", "p_de": "Welche Verbindungsmöglichkeiten gibt es?", "s_es": {"type": "multiple_choice", "options": ["USB o WiFi", "Solo Bluetooth", "Solo Ethernet"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["USB oder WLAN", "Nur Bluetooth", "Nur Ethernet"], "answer": 0}}'::jsonb,
            '{"p": "¿Cómo se confirma la instalación?", "p_de": "Wie bestätigt man die Installation?", "s_es": {"type": "multiple_choice", "options": ["Imprimiendo una página de prueba", "Llamando al proveedor", "Comprobando la pantalla"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Durch das Drucken einer Testseite", "Durch einen Anruf beim Lieferanten", "Durch Blick auf den Bildschirm"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe hacerse si falla la página de prueba?", "p_de": "Was sollte man tun, wenn die Testseite nicht gedruckt wird?", "s_es": {"type": "multiple_choice", "options": ["Comprobar conexiones y reiniciar", "Llamar al soporte", "Devolver la impresora"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Verbindungen prüfen und neu starten", "Den Support anrufen", "Den Drucker zurückgeben"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué paso va antes de cargar el papel?", "p_de": "Welcher Schritt kommt vor dem Einlegen des Papiers?", "s_es": {"type": "multiple_choice", "options": ["Pulsar el botón de encendido", "Instalar el controlador", "Conectarse al WiFi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Einschaltknopf drücken", "Den Treiber installieren", "Mit dem WLAN verbinden"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4650
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4650
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4650, 'en', 'reading', 'professional', $content$Quick-Start Guide – ProPrint 400

To set up the ProPrint 400, first remove all packaging materials and place the printer on a flat, stable surface. Next, connect the power cable to the printer and then to a wall socket. Press the power button and wait until the ready light turns green before continuing.

Open the paper tray and load up to 250 sheets of A4 paper. The printer driver is supplied on the USB drive included in the box. Install the driver before connecting the machine to your computer. You can choose either a USB connection or WiFi, depending on your workspace.

To confirm that installation is complete, print a test page from the printer menu. If the page does not print, check all cable connections and restart the printer before requesting support.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee la guía de inicio rápido de una impresora', 'Lee instrucciones de inicio rápido para instalar y probar una impresora.'),
            (v_reading_id, 'de', 'Lies den Schnellstartleitfaden eines Druckers', 'Lies eine Schnellstartanleitung zur Installation und Prüfung eines Druckers.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
