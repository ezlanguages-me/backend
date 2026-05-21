-- ============================================================
        -- Seed: A0 English Path – STEP 540 – Reading – understand, and ask questions about, house rules/conventions, such as the time of meals (Convivencia)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_reading_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"p": "El desayuno es a las 7:30.", "p_de": "Das Frühstück ist um 7:30 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "La cena es a las 8:30.", "p_de": "Das Abendessen ist um 20:30 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "Alex puede usar la cocina toda la noche.", "p_de": "Alex kann die Küche die ganze Nacht benutzen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "El día de la colada es el miércoles.", "p_de": "Der Waschtag ist am Mittwoch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "Las horas de silencio empiezan a las 10 de la noche.", "p_de": "Die Ruhezeit beginnt um 22 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "La puerta principal se queda abierta por la noche.", "p_de": "Die Haustür bleibt nachts offen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "Los amigos pueden dormir en casa sin pedir permiso.", "p_de": "Freunde können ohne Erlaubnis übernachten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "Alex debe limpiar la cocina después de usarla.", "p_de": "Alex soll die Küche nach der Benutzung sauber machen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "¿A qué hora es la comida del mediodía?", "p_de": "Um wie viel Uhr ist das Mittagessen?", "s": {"type": "multiple_choice", "options": ["A las 11", "A la 1", "A las 4"], "answer": 1}}'::jsonb,
                '{"p": "¿Qué debe hacer Alex si llega tarde a cenar?", "p_de": "Was soll Alex tun, wenn er zu spät zum Abendessen kommt?", "s": {"type": "multiple_choice", "options": ["Mandar un mensaje antes de las 6:30", "Esperar en la puerta", "Ir directamente a su habitación"], "answer": 0}}'::jsonb,
                '{"p": "¿Qué puede preparar Alex en la cocina antes de las 9?", "p_de": "Was kann Alex vor 21 Uhr in der Küche zubereiten?", "s": {"type": "multiple_choice", "options": ["Una fiesta grande", "Una barbacoa", "Té o un snack pequeño"], "answer": 2}}'::jsonb,
                '{"p": "¿Qué llave debe llevar Alex cuando sale?", "p_de": "Welchen Schlüssel soll Alex mitnehmen, wenn er ausgeht?", "s": {"type": "multiple_choice", "options": ["La llave roja", "La llave azul", "La llave del garaje"], "answer": 1}}'::jsonb,
                '{"p": "¿Qué día es la colada?", "p_de": "An welchem Tag ist Waschtag?", "s": {"type": "multiple_choice", "options": ["El miércoles", "El lunes", "El sábado"], "answer": 0}}'::jsonb,
                '{"p": "¿Qué no es posible en la casa?", "p_de": "Was ist im Haus nicht möglich?", "s": {"type": "multiple_choice", "options": ["Una visita corta de un amigo", "Preguntar a Sarah primero", "Que un amigo se quede a dormir"], "answer": 2}}'::jsonb,
                '{"p": "¿Cuándo empiezan las horas de silencio?", "p_de": "Wann beginnt die Ruhezeit?", "s": {"type": "multiple_choice", "options": ["A las 9", "A las 10", "A medianoche"], "answer": 1}}'::jsonb,
                '{"p": "¿Qué debe hacer Alex después de cocinar?", "p_de": "Was soll Alex nach dem Kochen tun?", "s": {"type": "multiple_choice", "options": ["Lavar el plato y limpiar la mesa", "Apagar la nevera", "Cerrar todas las ventanas"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM reading WHERE step_order = 540 AND path_uuid = v_path_id
            );
            DELETE FROM reading WHERE step_order = 540 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (
                v_path_id,
                540,
                'en',
                'reading',
                'social',
                $reading$
Hello Alex,

We are very happy that you are staying with us this month. To help you feel comfortable from the first day, here are our most important house rules and daily routines. On school days breakfast is at 7:30 in the kitchen. Lunch is usually at 1 PM. During the week you often eat lunch at school, but at the weekend we eat together at home. Dinner is at 7 PM, and we try to eat as a family. If you are going to be late for dinner, please send Sarah a message before 6:30.

You can use the kitchen until 9 PM if you want to make tea or a small snack. After you use it, please wash your plate, cup, and pan, and wipe the table. Laundry day is Wednesday, but if you need something earlier, just ask.

Quiet hours start at 10 PM because the children go to bed early. Please keep music and phone calls low after that time. We lock the front door at 10 PM too, so always take the blue key when you go out. Friends can visit for a short time, but please ask Sarah first. Overnight guests are not possible.

Thank you,
Sarah
                $reading$
            )RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'es', 'Normas y horarios de la casa');

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'de', 'Hausregeln und Tageszeiten im Haus');

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
