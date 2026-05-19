        -- ============================================================
        -- Seed: A0 English Path – STEP 7290 – Reading – read about writing styles (formal vs informal) (Comunicación Telefónica y Correspondencia Personal)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_reading_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"es": "Los mensajes formales se usan a menudo con un profesor o con alguien que no conoces bien.", "de": "Formelle Nachrichten benutzt man oft bei einer Lehrkraft oder bei jemandem, den man nicht gut kennt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Los mensajes informales son comunes entre amigos cercanos.", "de": "Informelle Nachrichten sind unter engen Freunden üblich.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Un mensaje formal suele empezar con Hi Sam.", "de": "Eine formelle Nachricht beginnt oft mit Hi Sam.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "La escritura formal usa formas completas como I am.", "de": "Formelles Schreiben benutzt volle Formen wie I am.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "La escritura informal puede usar formas cortas como I''m.", "de": "Informelles Schreiben kann kurze Formen wie I''m benutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "En la escritura formal se recomienda usar más jerga.", "de": "Im formellen Schreiben wird empfohlen, mehr Umgangssprache zu benutzen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Un mensaje informal también debe ser claro.", "de": "Auch eine informelle Nachricht sollte klar sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Antes de enviar un mensaje, es útil pensar en el lector.", "de": "Vor dem Senden einer Nachricht ist es hilfreich, an den Leser zu denken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "¿Con quién se usa a menudo un estilo formal?", "de": "Bei wem benutzt man oft einen formellen Stil?", "s_es": {"type": "multiple_choice", "options": ["With a teacher or someone you do not know well", "Only with your brother", "Only with children"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einer Lehrkraft oder jemandem, den man nicht gut kennt", "Nur mit dem Bruder", "Nur mit Kindern"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuál es un saludo formal?", "de": "Welche Anrede ist formell?", "s_es": {"type": "multiple_choice", "options": ["Dear Ms Green", "Hi Sam", "Hey you"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dear Ms Green", "Hi Sam", "Hey du"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué forma completa aparece como ejemplo?", "de": "Welche volle Form erscheint als Beispiel?", "s_es": {"type": "multiple_choice", "options": ["I am", "I''m", "Gonna"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["I am", "I''m", "Gonna"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuál es un saludo informal?", "de": "Welche Anrede ist informell?", "s_es": {"type": "multiple_choice", "options": ["Hi Sam", "Dear Ms Green", "To whom it may concern"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hi Sam", "Dear Ms Green", "To whom it may concern"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué conviene evitar en un mensaje formal?", "de": "Was sollte man in einer formellen Nachricht vermeiden?", "s_es": {"type": "multiple_choice", "options": ["Slang", "Clear sentences", "Polite expressions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Umgangssprache", "Klare Sätze", "Höfliche Ausdrücke"], "answer": 0}}'::jsonb,
                '{"es": "¿Cómo puede sonar un mensaje informal?", "de": "Wie kann eine informelle Nachricht klingen?", "s_es": {"type": "multiple_choice", "options": ["Warmer and more relaxed", "Cold and legal", "Silent and empty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wärmer und entspannter", "Kalt und juristisch", "Still und leer"], "answer": 0}}'::jsonb,
                '{"es": "¿En qué debes pensar antes de enviar?", "de": "Woran solltest du vor dem Senden denken?", "s_es": {"type": "multiple_choice", "options": ["The reader", "Only the keyboard", "Only the time"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An den Leser", "Nur an die Tastatur", "Nur an die Uhrzeit"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué pregunta ayuda a elegir el estilo correcto?", "de": "Welche Frage hilft, den richtigen Stil zu wählen?", "s_es": {"type": "multiple_choice", "options": ["How well do I know this person?", "What is the weather today?", "Where is my bag?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wie gut kenne ich diese Person?", "Wie ist heute das Wetter?", "Wo ist meine Tasche?"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
            DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7290 AND path_uuid = v_path_id);
            DELETE FROM reading WHERE step_order = 7290 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (v_path_id, 7290, 'en', 'reading', 'communication', 'Formal and informal writing have different styles. Formal messages are common when you write to a teacher, an older neighbour, or someone you do not know well. Informal messages are common when you write to friends, brothers, or close classmates.\n\nA formal message often begins with Dear Ms Green and uses full forms like I am or I would like. It is polite and careful. An informal message can begin with Hi Sam and may use short forms like I''''m or I''''d like.\n\nIn formal writing, it is better to avoid slang and very short answers. Clear sentences and polite expressions are important. In informal writing, the tone can be warmer and more relaxed, but the message should still be clear.\n\nBefore you send any message, think about the reader. Ask yourself: How well do I know this person? What tone is right for this situation? The answer helps you choose the best style.')
            RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title, description)
            VALUES
                (v_reading_id, 'es', 'Lee sobre estilos de escritura formal e informal', 'Lee una explicación sencilla sobre cómo cambia el tono según la persona y la situación.'),
                (v_reading_id, 'de', 'Lies über formelle und informelle Schreibstile', 'Lies eine einfache Erklärung dazu, wie sich der Ton je nach Person und Situation verändert.');

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
