-- ============================================================
-- Seed: A0 English Path – STEP 460 – Reading – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_reading_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"p": "La habitación está en un piso tranquilo cerca del centro.", "p_de": "Das Zimmer ist in einer ruhigen Wohnung nahe dem Stadtzentrum.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El precio es 200 libras por semana.", "p_de": "Der Preis beträgt 200 Pfund pro Woche.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El depósito es de 200 libras.", "p_de": "Die Kaution beträgt 200 Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El Wi‑Fi no está incluido.", "p_de": "Das WLAN ist nicht inklusive.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La cocina y el baño son compartidos.", "p_de": "Küche und Bad werden geteilt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El piso está en la planta baja.", "p_de": "Die Wohnung ist im Erdgeschoss.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El edificio tiene ascensor.", "p_de": "Das Gebäude hat einen Aufzug.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La parada de autobús está a dos minutos.", "p_de": "Die Bushaltestelle ist zwei Minuten entfernt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se permiten mascotas pequeñas.", "p_de": "Kleine Haustiere sind erlaubt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La estancia mínima es de tres meses.", "p_de": "Die Mindestmietdauer beträgt drei Monate.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto cuesta al mes?", "p_de": "Wie viel kostet es pro Monat?", "s": {"type": "multiple_choice", "options": ["560 libras", "140 libras", "200 libras"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué gastos están incluidos?", "p_de": "Welche Kosten sind inklusive?", "s": {"type": "multiple_choice", "options": ["Agua, electricidad y Wi‑Fi", "Solo agua", "Solo Wi‑Fi"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué espacios son compartidos?", "p_de": "Welche Räume werden geteilt?", "s": {"type": "multiple_choice", "options": ["La cocina y el baño", "El dormitorio y la cocina", "El dormitorio y el baño"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué planta está el piso?", "p_de": "In welchem Stock liegt die Wohnung?", "s": {"type": "multiple_choice", "options": ["En la tercera", "En la primera", "En la planta baja"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué transporte está cerca?", "p_de": "Welches Verkehrsmittel ist in der Nähe?", "s": {"type": "multiple_choice", "options": ["La parada de autobús", "La estación de tren", "El aeropuerto"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no está permitido?", "p_de": "Was ist nicht erlaubt?", "s": {"type": "multiple_choice", "options": ["Fumar", "Cocinar", "Usar Wi‑Fi"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué animales permite el anuncio?", "p_de": "Welche Tiere erlaubt die Anzeige?", "s": {"type": "multiple_choice", "options": ["Ninguno", "Solo gatos", "Solo perros pequeños"], "answer": 0}}'::jsonb,
        '{"p": "¿A partir de cuándo está disponible la habitación?", "p_de": "Ab wann ist das Zimmer verfügbar?", "s": {"type": "multiple_choice", "options": ["Desde el 1 de junio", "Desde el 1 de julio", "Desde mañana"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la estancia mínima?", "p_de": "Wie lang ist die Mindestmietdauer?", "s": {"type": "multiple_choice", "options": ["Tres meses", "Un mes", "Seis meses"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cantidad se paga como depósito?", "p_de": "Wie hoch ist die Kaution?", "s": {"type": "multiple_choice", "options": ["200 libras", "560 libras", "140 libras"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM reading WHERE step_order = 460 AND path_uuid = v_path_id
            );
            DELETE FROM reading WHERE step_order = 460 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (v_path_id, 460, 'en', 'reading', 'accommodation', 'Room for rent in a quiet flat near the city centre. The price is £140 per week or £560 per month. The deposit is £200. Water, electricity and Wi-Fi are included in the price.

The flat has one bedroom for the tenant, a shared kitchen and a shared bathroom. It is on the third floor, and the building has no elevator. The bus stop is two minutes away.

House rules are simple: no smoking, no pets and no loud music after 10 p.m. The minimum stay is three months. The room is available from 1 June.')
            RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'es', 'Anuncio de alquiler');

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'de', 'Zimmeranzeige');

            FOREACH ex IN ARRAY v_exercises LOOP
                INSERT INTO exercise (target_uuid, grammar_rule_uuid)
                VALUES (v_reading_id, NULL)
                RETURNING uuid INTO v_ex_id;

                INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
                VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

                INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
                VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
            END LOOP;
        END;
        $seed$;
