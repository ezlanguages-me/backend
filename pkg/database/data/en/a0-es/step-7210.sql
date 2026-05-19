        -- ============================================================
        -- Seed: A0 English Path – STEP 7210 – Reading – read a formal personal letter (Comunicación Telefónica y Correspondencia Personal)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_reading_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"es": "Laura da las gracias por una carta recibida la semana pasada.", "de": "Laura bedankt sich für einen Brief, den sie letzte Woche erhalten hat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "El señor Ruiz tiene una casa nueva en Sevilla.", "de": "Herr Ruiz hat ein neues Haus in Sevilla.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "La familia de Laura va a Sevilla el 14 de junio.", "de": "Lauras Familie fährt am 14. Juni nach Sevilla.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Laura y su familia se alojarán dos noches en un hotel.", "de": "Laura und ihre Familie bleiben zwei Nächte in einem Hotel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Laura quiere encontrarse para tomar café el sábado por la tarde.", "de": "Laura möchte sich am Samstagnachmittag auf einen Kaffee treffen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Elena es la hermana del señor Ruiz.", "de": "Elena ist die Schwester von Herrn Ruiz.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Laura recuerda una cena agradable en marzo.", "de": "Laura erinnert sich an ein schönes Abendessen im März.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "La carta termina con la expresión Yours sincerely.", "de": "Der Brief endet mit dem Ausdruck Yours sincerely.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "¿Quién recibe la carta?", "de": "Wer erhält den Brief?", "s_es": {"type": "multiple_choice", "options": ["Mr. Ruiz", "The hotel manager", "Laura''s teacher"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Herr Ruiz", "Der Hotelmanager", "Lauras Lehrerin"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué noticia le gusta a Laura?", "de": "Welche Neuigkeit gefällt Laura?", "s_es": {"type": "multiple_choice", "options": ["His new home in Seville", "His new car", "His office job"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sein neues Haus in Sevilla", "Sein neues Auto", "Seine Büroarbeit"], "answer": 0}}'::jsonb,
                '{"es": "¿Dónde se alojará Laura?", "de": "Wo wird Laura übernachten?", "s_es": {"type": "multiple_choice", "options": ["At the Central Hotel near the station", "At the airport hotel", "At Elena''s office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Central Hotel nahe dem Bahnhof", "Im Flughafenhotel", "In Elenas Büro"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuánto tiempo se quedará la familia?", "de": "Wie lange bleibt die Familie?", "s_es": {"type": "multiple_choice", "options": ["Two nights", "One afternoon", "One week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Nächte", "Einen Nachmittag", "Eine Woche"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuándo quiere Laura tomar café?", "de": "Wann möchte Laura Kaffee trinken?", "s_es": {"type": "multiple_choice", "options": ["On Saturday afternoon", "On Monday morning", "On Friday night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Samstagnachmittag", "Am Montagmorgen", "Am Freitagabend"], "answer": 0}}'::jsonb,
                '{"es": "¿A quién manda recuerdos Laura?", "de": "Wem sendet Laura Grüße?", "s_es": {"type": "multiple_choice", "options": ["To his wife, Elena", "To his brother, Pablo", "To his daughter, Rosa"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An seine Frau Elena", "An seinen Bruder Pablo", "An seine Tochter Rosa"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué recuerda Laura de marzo?", "de": "Woran erinnert sich Laura aus dem März?", "s_es": {"type": "multiple_choice", "options": ["A lovely dinner", "A train trip", "A garden party"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein schönes Abendessen", "Eine Zugreise", "Eine Gartenfeier"], "answer": 0}}'::jsonb,
                '{"es": "¿Cómo termina la carta?", "de": "Wie endet der Brief?", "s_es": {"type": "multiple_choice", "options": ["Yours sincerely", "See you tomorrow", "Best of luck"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Yours sincerely", "Bis morgen", "Viel Glück"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
            DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7210 AND path_uuid = v_path_id);
            DELETE FROM reading WHERE step_order = 7210 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (v_path_id, 7210, 'en', 'reading', 'communication', 'Dear Mr. Ruiz,\n\nThank you for your kind letter last week. I was pleased to hear about your new home in Seville. Your note about the garden and the quiet street sounded wonderful.\n\nMy family will visit Seville on 14 May. We plan to stay for two nights at the Central Hotel near the station. If you are free on Saturday afternoon, I would be happy to meet you for coffee.\n\nPlease give my best wishes to your wife, Elena. I still remember the lovely dinner at your house in March. Thank you again for your warm invitation.\n\nYours sincerely,
Laura Martín')
            RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title, description)
            VALUES
                (v_reading_id, 'es', 'Lee una carta personal formal', 'Lee una carta personal educada y clara entre personas que se conocen bien pero mantienen un tono formal.'),
                (v_reading_id, 'de', 'Lies einen formellen persönlichen Brief', 'Lies einen höflichen und klaren persönlichen Brief zwischen Menschen, die sich kennen, aber einen formellen Ton verwenden.');

            FOREACH ex IN ARRAY v_exercises LOOP
                INSERT INTO exercise (target_uuid, grammar_rule_uuid)
                VALUES (v_reading_id, NULL)
                RETURNING uuid INTO v_ex_id;

                INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
                VALUES
                    (v_ex_id, 'es', ex->>'es', ex->'s_es'),
                    (v_ex_id, 'de', ex->>'de', ex->'s_de');
            END LOOP;
        END;
        $seed$;
