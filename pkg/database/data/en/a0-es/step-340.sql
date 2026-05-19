-- ============================================================
-- Seed: A0 English Path – STEP 340 – Reading – ask simple questions of a factual nature and understand the answers (Alojamiento)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_reading_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"p": "La recepción está abierta todo el día.", "p_de": "Die Rezeption ist den ganzen Tag geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El check-in es antes de las 11:00.", "p_de": "Der Check-in ist vor 11:00 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una habitación individual cuesta 55 libras por noche.", "p_de": "Ein Einzelzimmer kostet 55 Pfund pro Nacht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El desayuno termina a las 11:00.", "p_de": "Das Frühstück endet um 11:00 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El Wi‑Fi es gratis en todas las habitaciones.", "p_de": "Das WLAN ist in allen Zimmern kostenlos.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El aparcamiento está delante del hotel.", "p_de": "Der Parkplatz ist vor dem Hotel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El aparcamiento cuesta 5 libras al día.", "p_de": "Der Parkplatz kostet 5 Pfund pro Tag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay ascensor en el hotel.", "p_de": "Es gibt keinen Aufzug im Hotel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los huéspedes reciben una llave en el bar.", "p_de": "Die Gäste bekommen einen Schlüssel an der Bar.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Puedes pedir toallas extra en recepción.", "p_de": "Man kann an der Rezeption zusätzliche Handtücher verlangen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A qué hora empieza el check-in?", "p_de": "Um wie viel Uhr beginnt der Check-in?", "s": {"type": "multiple_choice", "options": ["A las 2:00 p.m.", "A las 11:00 a.m.", "A las 7:00 a.m."], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta una habitación doble?", "p_de": "Wie viel kostet ein Doppelzimmer?", "s": {"type": "multiple_choice", "options": ["80 libras por noche", "55 libras por noche", "5 libras por día"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se sirve el desayuno?", "p_de": "Wo wird das Frühstück serviert?", "s": {"type": "multiple_choice", "options": ["En el comedor", "En recepción", "En el aparcamiento"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora termina el desayuno?", "p_de": "Um wie viel Uhr endet das Frühstück?", "s": {"type": "multiple_choice", "options": ["A las 10:00 a.m.", "A las 9:00 a.m.", "A las 11:00 a.m."], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicio es gratis?", "p_de": "Welcher Service ist kostenlos?", "s": {"type": "multiple_choice", "options": ["El Wi‑Fi", "El aparcamiento", "Las toallas extra"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el aparcamiento?", "p_de": "Wo ist der Parkplatz?", "s": {"type": "multiple_choice", "options": ["Detrás del hotel", "Delante del hotel", "Debajo del hotel"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué usan los huéspedes para abrir la habitación?", "p_de": "Womit öffnen die Gäste das Zimmer?", "s": {"type": "multiple_choice", "options": ["Una tarjeta llave", "Una llave grande", "Un código en el teléfono"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pisos tienen acceso por ascensor?", "p_de": "Welche Stockwerke sind mit dem Aufzug erreichbar?", "s": {"type": "multiple_choice", "options": ["El primero y el segundo", "Solo el segundo", "Solo el primero"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde consigues información o toallas extra?", "p_de": "Wo bekommt man Informationen oder zusätzliche Handtücher?", "s": {"type": "multiple_choice", "options": ["En la recepción", "En el comedor", "En el ascensor"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de habitación cuesta 55 libras?", "p_de": "Welcher Zimmertyp kostet 55 Pfund?", "s": {"type": "multiple_choice", "options": ["La habitación individual", "La habitación doble", "La suite"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM reading WHERE step_order = 340 AND path_uuid = v_path_id
            );
            DELETE FROM reading WHERE step_order = 340 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (v_path_id, 340, 'en', 'reading', 'accommodation', 'Blue Star Hotel

Reception is open 24 hours a day. Check-in is from 2:00 p.m. and check-out is before 11:00 a.m. A single room is £55 per night, and a double room is £80 per night.

Breakfast is in the dining room from 7:00 to 10:00 a.m. Free Wi-Fi is available in all rooms. There is a small car park behind the hotel. Parking costs £5 per day.

Rooms on the first and second floors are accessible by elevator. Guests get a key card at reception. If you need extra towels or information, please ask at the reception desk.')
            RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'es', 'Información del hotel Blue Star');

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'de', 'Informationen zum Blue-Star-Hotel');

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
