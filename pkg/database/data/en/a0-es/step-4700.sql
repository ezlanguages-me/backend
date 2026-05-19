-- ============================================================
-- Seed: A0 English Path – STEP 4700 – Reading – understand instructions, for example in a manual, in the form of a continuous text, provided that (s)he is familiar with the type of product, equipment etc. being explained (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El manual es para la ProCopy 600.", "p_de": "Das Handbuch ist für den ProCopy 600.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los documentos se colocan boca arriba sobre el cristal.", "p_de": "Dokumente werden mit der Vorderseite nach oben auf das Glas gelegt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El documento debe alinearse con la esquina superior izquierda.", "p_de": "Das Dokument soll an der linken oberen Ecke ausgerichtet werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se pueden hacer hasta 100 copias a la vez.", "p_de": "Man kann bis zu 100 Kopien auf einmal machen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El botón de inicio es verde.", "p_de": "Die Starttaste ist grün.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Las copias se recogen de la bandeja de entrada.", "p_de": "Die Kopien werden aus dem Eingabefach entnommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Si hay un atasco, hay que tirar del papel con fuerza.", "p_de": "Bei einem Papierstau soll man das Papier mit Gewalt herausziehen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Para atascos repetidos, el teléfono de servicio es 0800-123-456.", "p_de": "Bei wiederholten Staus lautet die Servicenummer 0800-123-456.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿De qué trata este manual?", "p_de": "Worum geht es in diesem Handbuch?", "s_es": {"type": "multiple_choice", "options": ["De copiar documentos", "De instalar la impresora", "De cambiar la tinta"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um das Kopieren von Dokumenten", "Um die Installation des Druckers", "Um den Tintenwechsel"], "answer": 0}}'::jsonb,
            '{"p": "¿Cómo debe colocarse el documento?", "p_de": "Wie soll das Dokument platziert werden?", "s_es": {"type": "multiple_choice", "options": ["Boca abajo, en la esquina superior izquierda", "Boca arriba, en la esquina superior derecha", "En cualquier posición"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit der Vorderseite nach unten links oben", "Mit der Vorderseite nach oben rechts oben", "In beliebiger Position"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántas copias pueden hacerse a la vez?", "p_de": "Wie viele Kopien kann man auf einmal machen?", "s_es": {"type": "multiple_choice", "options": ["Hasta 99", "Hasta 50", "Hasta 100"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis zu 99", "Bis zu 50", "Bis zu 100"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué tamaños están disponibles?", "p_de": "Welche Formate sind verfügbar?", "s_es": {"type": "multiple_choice", "options": ["A4 o A3", "Solo A4", "A5 o A4"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A4 oder A3", "Nur A4", "A5 oder A4"], "answer": 0}}'::jsonb,
            '{"p": "¿Dónde se recogen las copias?", "p_de": "Wo werden die Kopien entnommen?", "s_es": {"type": "multiple_choice", "options": ["En la bandeja de salida", "En la bandeja de entrada", "Encima de la máquina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Aus dem Ausgabefach", "Aus dem Eingabefach", "Von oben auf dem Gerät"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe hacerse si se atasca el papel?", "p_de": "Was sollte man bei einem Papierstau tun?", "s_es": {"type": "multiple_choice", "options": ["Abrir el panel frontal y retirarlo con cuidado", "Llamar al servicio inmediatamente", "Tirar del papel rápidamente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Frontklappe öffnen und das Papier vorsichtig entfernen", "Sofort den Service anrufen", "Das Papier schnell herausziehen"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el número de servicio?", "p_de": "Wie lautet die Servicenummer?", "s_es": {"type": "multiple_choice", "options": ["0800-123-456", "0800-456-123", "0800-321-654"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["0800-123-456", "0800-456-123", "0800-321-654"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué paso va antes de pulsar Start?", "p_de": "Welcher Schritt kommt vor dem Drücken von Start?", "s_es": {"type": "multiple_choice", "options": ["Seleccionar el tamaño del papel", "Cerrar la tapa del documento", "Pulsar el botón Copy"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Papierformat wählen", "Die Dokumentenabdeckung schließen", "Die Taste Copy drücken"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4700
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4700
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4700, 'en', 'reading', 'professional', $content$OPERATING MANUAL – ProCopy 600

Section 3 explains how to copy documents on the ProCopy 600. First, place the original document face-down on the glass and align it with the top-left corner. Then close the document cover. On the control panel, press the Copy button to open the standard copying menu.

Use the plus and minus buttons to choose the number of copies between 1 and 99. Select either A4 or A3 paper size with the Size button. When the settings are correct, press the green Start button and collect the finished copies from the output tray.

If a paper jam occurs, open the front panel door and remove the jammed paper carefully. Do not pull it by force. If jams continue to happen, call the service number 0800-123-456 for assistance.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee la sección de un manual de fotocopiadora', 'Lee una sección de manual con pasos de uso y solución de atascos.'),
            (v_reading_id, 'de', 'Lies den Abschnitt eines Fotokopiererhandbuchs', 'Lies einen Handbuchabschnitt mit Bedienungsschritten und Stauhinweisen.');

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
