-- ============================================================
        -- Seed: A0 English Path – STEP 580 – Reading – express opinions in a limited way (Convivencia - Host Families)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_reading_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"p": "A Alex le encanta la comida.", "p_de": "Alex liebt das Essen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "A Alex le gusta levantarse a las 6:30.", "p_de": "Alex steht gern um 6:30 Uhr auf.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "Alex piensa que la ciudad es increíble.", "p_de": "Alex findet die Stadt toll.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "Hace mucho calor todos los días.", "p_de": "Es ist jeden Tag sehr heiß.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "El autobús al colegio es fácil y rápido.", "p_de": "Der Bus zur Schule ist einfach und schnell.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "La habitación de Alex es muy ruidosa.", "p_de": "Alexs Zimmer ist sehr laut.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "Sarah es amable y ayuda mucho.", "p_de": "Sarah ist freundlich und sehr hilfsbereit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
                '{"p": "Las excursiones del fin de semana son aburridas.", "p_de": "Die Ausflüge am Wochenende sind langweilig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
                '{"p": "¿Qué le encanta a Alex?", "p_de": "Was liebt Alex?", "s": {"type": "multiple_choice", "options": ["El despertador", "La comida", "La piscina"], "answer": 1}}'::jsonb,
                '{"p": "¿Qué no le gusta a Alex?", "p_de": "Was mag Alex nicht?", "s": {"type": "multiple_choice", "options": ["Levantarse a las 6:30", "Hablar con Sarah", "Ir en autobús"], "answer": 0}}'::jsonb,
                '{"p": "¿Cómo describe Alex la ciudad?", "p_de": "Wie beschreibt Alex die Stadt?", "s": {"type": "multiple_choice", "options": ["Pequeña y triste", "Muy peligrosa", "Increíble"], "answer": 2}}'::jsonb,
                '{"p": "¿Cómo describe Alex su habitación?", "p_de": "Wie beschreibt Alex sein Zimmer?", "s": {"type": "multiple_choice", "options": ["Grande y oscura", "Pequeña pero cómoda", "Vacía y fría"], "answer": 1}}'::jsonb,
                '{"p": "¿Cómo es el tiempo para Alex?", "p_de": "Wie ist das Wetter für Alex?", "s": {"type": "multiple_choice", "options": ["Un poco frío", "Muy caluroso", "Muy seco"], "answer": 0}}'::jsonb,
                '{"p": "¿Qué hace Alex los fines de semana?", "p_de": "Was macht Alex am Wochenende?", "s": {"type": "multiple_choice", "options": ["Se queda solo en casa", "Estudia todo el día", "Hace excursiones cortas"], "answer": 2}}'::jsonb,
                '{"p": "¿Cómo es Sarah?", "p_de": "Wie ist Sarah?", "s": {"type": "multiple_choice", "options": ["Seria y callada", "Amable y servicial", "Impaciente y antipática"], "answer": 1}}'::jsonb,
                '{"p": "¿Cómo es el autobús al colegio?", "p_de": "Wie ist der Bus zur Schule?", "s": {"type": "multiple_choice", "options": ["Fácil y rápido", "Siempre lleno", "Muy complicado"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM reading WHERE step_order = 580 AND path_uuid = v_path_id
            );
            DELETE FROM reading WHERE step_order = 580 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (
                v_path_id,
                580,
                'en',
                'reading',
                'social',
                $reading$
After two weeks with my host family, I can say a few simple things about life here. I really love the food. Sarah cooks fresh meals every day, and my favourite dinner is chicken with rice and vegetables. I also think the city is amazing. The river, the old centre, and the small cafés are very beautiful, especially in the evening.

There are also a few things that I do not like very much. I do not like getting up at 6:30 every morning for school, because I am still sleepy at that time. The weather is a bit cold for me too, especially in the morning. Still, the bus to school is easy and quick, so that part of the day is simple.

My room is small but comfortable and bright. I can study at the desk by the window, and it is quiet at night. Sarah is kind and very helpful, so I feel relaxed at home. At the weekend we take short trips to the park, the market, or the museum, and I really enjoy those visits.
                $reading$
            )RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'es', 'Lo que me gusta y no me gusta aquí');

            INSERT INTO reading_translation (reading_uuid, language, title)
            VALUES (v_reading_id, 'de', 'Was ich hier mag und was nicht');

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
