-- ============================================================
-- Seed: A0 English Path – STEP 4620 – Reading – understand a short product description within own work area (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El respaldo de la silla es de malla transpirable.", "p_de": "Die Rückenlehne des Stuhls besteht aus atmungsaktivem Netzgewebe.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El peso máximo es de 100 kg.", "p_de": "Das Maximalgewicht beträgt 100 kg.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La altura del asiento se ajusta entre 40 y 55 cm.", "p_de": "Die Sitzhöhe ist zwischen 40 und 55 cm verstellbar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La silla viene totalmente montada.", "p_de": "Der Stuhl wird vollständig montiert geliefert.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El montaje tarda 15 minutos.", "p_de": "Der Aufbau dauert 15 Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La garantía del armazón es de 2 años.", "p_de": "Die Garantie auf den Rahmen beträgt 2 Jahre.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La silla cuesta 189 £ por unidad.", "p_de": "Der Stuhl kostet 189 £ pro Stück.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Hay un descuento del 10 % para 20 sillas o más.", "p_de": "Für 20 oder mehr Stühle gibt es 10 % Rabatt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Cuál es la capacidad máxima de peso?", "p_de": "Wie hoch ist die maximale Traglast?", "s_es": {"type": "multiple_choice", "options": ["120 kg", "100 kg", "150 kg"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["120 kg", "100 kg", "150 kg"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el rango de altura del asiento?", "p_de": "Wie groß ist der Bereich der Sitzhöhe?", "s_es": {"type": "multiple_choice", "options": ["40–55 cm", "35–50 cm", "45–60 cm"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["40–55 cm", "35–50 cm", "45–60 cm"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué color NO está disponible?", "p_de": "Welche Farbe ist NICHT verfügbar?", "s_es": {"type": "multiple_choice", "options": ["Rojo", "Negro", "Gris"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rot", "Schwarz", "Grau"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuánto tarda el montaje?", "p_de": "Wie lange dauert der Aufbau?", "s_es": {"type": "multiple_choice", "options": ["15 minutos", "30 minutos", "1 hora"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["15 Minuten", "30 Minuten", "1 Stunde"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la garantía del armazón?", "p_de": "Wie lang ist die Garantie auf den Rahmen?", "s_es": {"type": "multiple_choice", "options": ["5 años", "2 años", "3 años"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["5 Jahre", "2 Jahre", "3 Jahre"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la garantía del acolchado?", "p_de": "Wie lang ist die Garantie auf die Polsterung?", "s_es": {"type": "multiple_choice", "options": ["2 años", "5 años", "1 año"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2 Jahre", "5 Jahre", "1 Jahr"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el precio por unidad?", "p_de": "Wie hoch ist der Preis pro Stück?", "s_es": {"type": "multiple_choice", "options": ["189 £", "199 £", "179 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["189 £", "199 £", "179 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué descuento hay para 20 sillas o más?", "p_de": "Welcher Rabatt gilt für 20 oder mehr Stühle?", "s_es": {"type": "multiple_choice", "options": ["10 %", "5 %", "15 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 %", "5 %", "15 %"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4620
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4620
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4620, 'en', 'reading', 'professional', $content$Product Description – ErgoDesk Pro Chair

The ErgoDesk Pro Chair is designed for daily office use and long working sessions. It features a breathable mesh back and a padded seat for improved comfort during the day. Users can adjust the seat height between 40 and 55 cm, as well as the armrest height, armrest width and lumbar support position to match individual needs.

The maximum recommended weight is 120 kg. The chair is available in black, grey and navy, which makes it suitable for most office interiors. Assembly is required, but the process takes only around 15 minutes and all tools are included in the box.

The frame is covered by a 5-year warranty, while the padding has a 2-year warranty. The standard price is £189 per unit, and orders of 20 or more qualify for a 10% volume discount.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una descripción de producto de mobiliario', 'Lee una descripción breve de una silla ergonómica con medidas, garantía y descuento.'),
            (v_reading_id, 'de', 'Lies eine Produktbeschreibung für Möbel', 'Lies eine kurze Produktbeschreibung eines ergonomischen Stuhls mit Maßen, Garantie und Rabatt.');

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
