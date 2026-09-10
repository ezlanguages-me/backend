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
                -- TRUE / FALSE (10 exercises)
                '{"p": "La recepción está abierta los 7 días de la semana.", "p_de": "Die Rezeption ist an 7 Tagen die Woche geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "El check-in empieza a las 11:00 a.m.", "p_de": "Der Check-in beginnt um 11:00 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "Una habitación familiar para cuatro personas cuesta 110 libras por noche.", "p_de": "Ein Familienzimmer für vier Personen kostet 110 Pfund pro Nacht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "El desayuno está incluido en el precio de la habitación.", "p_de": "Das Frühstück ist im Zimmerpreis inbegriffen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "El restaurante sirve cena hasta las 9:30 p.m.", "p_de": "Das Restaurant serviert das Abendessen bis 21:30 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "El Wi-Fi es gratis solo en las habitaciones, no en las zonas comunes.", "p_de": "Das WLAN ist nur in den Zimmern kostenlos, nicht in den öffentlichen Bereichen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "El aparcamiento está detrás del hotel.", "p_de": "Der Parkplatz befindet sich hinter dem Hotel.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "El gimnasio está en la tercera planta.", "p_de": "Das Fitnessstudio befindet sich im dritten Stock.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "El hotel tiene piscina.", "p_de": "Das Hotel hat ein Schwimmbad.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "Se permiten mascotas en el hotel.", "p_de": "Haustiere sind im Hotel erlaubt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                -- MULTIPLE CHOICE (10 exercises) – answers distributed across positions 0, 1 and 2
                '{"p": "¿Cuánto cuesta una habitación individual por noche?", "p_de": "Wie viel kostet ein Einzelzimmer pro Nacht?", "s": {"type": "multiple_choice", "options": ["55 libras", "80 libras", "110 libras"], "answer": 0}}'::jsonb,
                '{"p": "¿Dónde se sirve el desayuno?", "p_de": "Wo wird das Frühstück serviert?", "s": {"type": "multiple_choice", "options": ["En el comedor", "En el restaurante", "En recepción"], "answer": 0}}'::jsonb,
                '{"p": "¿Cuánto cuesta el aparcamiento por día?", "p_de": "Was kostet der Parkplatz pro Tag?", "s": {"type": "multiple_choice", "options": ["5 libras", "10 libras", "2 libras"], "answer": 0}}'::jsonb,
                '{"p": "¿A qué hora termina el desayuno?", "p_de": "Um wie viel Uhr endet das Frühstück?", "s": {"type": "multiple_choice", "options": ["A las 9:00 a.m.", "A las 10:00 a.m.", "A las 11:00 a.m."], "answer": 1}}'::jsonb,
                '{"p": "¿En qué planta está el gimnasio?", "p_de": "In welchem Stockwerk befindet sich das Fitnessstudio?", "s": {"type": "multiple_choice", "options": ["En la primera", "En la segunda", "En la tercera"], "answer": 2}}'::jsonb,
                '{"p": "¿Hasta qué hora está abierto el gimnasio?", "p_de": "Bis wie viel Uhr ist das Fitnessstudio geöffnet?", "s": {"type": "multiple_choice", "options": ["Hasta las 9:00 p.m.", "Hasta las 10:00 p.m.", "Hasta las 8:00 p.m."], "answer": 1}}'::jsonb,
                '{"p": "¿Qué reciben los huéspedes al llegar al hotel?", "p_de": "Was erhalten die Gäste bei ihrer Ankunft im Hotel?", "s": {"type": "multiple_choice", "options": ["Una llave tradicional", "Un código de acceso", "Una tarjeta llave"], "answer": 2}}'::jsonb,
                '{"p": "¿A qué hora empieza el almuerzo en el restaurante?", "p_de": "Um wie viel Uhr beginnt das Mittagessen im Restaurant?", "s": {"type": "multiple_choice", "options": ["A las 11:00 a.m.", "A las 12:00", "A las 2:30 p.m."], "answer": 1}}'::jsonb,
                '{"p": "¿Qué instalación NO tiene el hotel?", "p_de": "Welche Einrichtung hat das Hotel NICHT?", "s": {"type": "multiple_choice", "options": ["Restaurante", "Piscina", "Gimnasio"], "answer": 1}}'::jsonb,
                '{"p": "¿A qué hora comienza el check-in?", "p_de": "Um wie viel Uhr beginnt der Check-in?", "s": {"type": "multiple_choice", "options": ["A las 11:00 a.m.", "A las 12:00 p.m.", "A las 2:00 p.m."], "answer": 2}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM reading WHERE step_order = 340 AND path_uuid = v_path_id
            );
            DELETE FROM reading WHERE step_order = 340 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (
    v_path_id,
    340,
    'en',
    'reading',
    'accommodation',
    'Blue Star Hotel – Guest Information

Reception is open 24 hours a day, seven days a week. Check-in starts at 2:00 p.m. and check-out is before 11:00 a.m. For an early check-in or late check-out, please ask at reception.

Room prices: a single room is £55 per night, a double room is £80 per night, and a family room for four people is £110 per night. Breakfast is not included in the room price.

Breakfast is served in the dining room on the ground floor from 7:00 a.m. to 10:00 a.m. The hotel restaurant is open for lunch from 12:00 to 2:30 p.m. and for dinner from 6:30 to 9:30 p.m.

Free Wi-Fi is available in all rooms and public areas. There is a small car park behind the hotel. Parking costs £5 per day.

The hotel has a gym on the third floor. The gym is open from 6:00 a.m. to 10:00 p.m. There is no swimming pool.

Guests receive a key card at reception. Rooms on the first and second floors are accessible by elevator. The hotel is non-smoking. Pets are not allowed. For extra towels, pillows, or any other requests, please contact reception.'
)RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'es', 'Información del hotel Blue Star');

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'de', 'Informationen zum Blue Star Hotel');

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
