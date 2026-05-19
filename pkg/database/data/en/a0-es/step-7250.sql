        -- ============================================================
        -- Seed: A0 English Path – STEP 7250 – Reading – understand email etiquette tips (Comunicación Telefónica y Correspondencia Personal)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_reading_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"es": "La línea de asunto debe ser clara.", "de": "Die Betreffzeile sollte klar sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Se recomienda empezar con un saludo.", "de": "Es wird empfohlen, mit einer Begrüßung zu beginnen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "La noticia principal debe aparecer al final del correo.", "de": "Die wichtigste Nachricht sollte am Ende der E-Mail stehen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Las preguntas del correo deben ser fáciles de responder.", "de": "Die Fragen in der E-Mail sollten leicht zu beantworten sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Escribir en mayúsculas puede parecer enfadado.", "de": "In Großbuchstaben zu schreiben kann wütend wirken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "No hace falta revisar los archivos adjuntos antes de enviar.", "de": "Man muss die Anhänge vor dem Senden nicht prüfen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
                '{"es": "Un cierre educado es una buena idea.", "de": "Ein höflicher Abschluss ist eine gute Idee.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "Un correo personal e importante debería contestarse en unos dos días.", "de": "Auf eine persönliche und wichtige E-Mail sollte man in etwa zwei Tagen antworten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
                '{"es": "¿Qué debe tener la línea de asunto?", "de": "Was sollte die Betreffzeile haben?", "s_es": {"type": "multiple_choice", "options": ["A clear topic", "A long story", "Only capital letters"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein klares Thema", "Eine lange Geschichte", "Nur Großbuchstaben"], "answer": 0}}'::jsonb,
                '{"es": "¿Cómo puede empezar un correo personal?", "de": "Wie kann eine persönliche E-Mail beginnen?", "s_es": {"type": "multiple_choice", "options": ["With a greeting like Hi Marta", "With no greeting", "With only the date"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einer Begrüßung wie Hi Marta", "Ohne Begrüßung", "Nur mit dem Datum"], "answer": 0}}'::jsonb,
                '{"es": "¿Dónde conviene poner la noticia principal?", "de": "Wo sollte die Hauptnachricht stehen?", "s_es": {"type": "multiple_choice", "options": ["In the first lines", "Only in the subject line", "After the closing"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In den ersten Zeilen", "Nur in der Betreffzeile", "Nach dem Abschluss"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuándo es útil usar párrafos?", "de": "Wann sind Absätze nützlich?", "s_es": {"type": "multiple_choice", "options": ["When the email is longer", "When the email is empty", "Only for work contracts"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn die E-Mail länger ist", "Wenn die E-Mail leer ist", "Nur bei Arbeitsverträgen"], "answer": 0}}'::jsonb,
                '{"es": "¿Por qué es mejor evitar las mayúsculas totales?", "de": "Warum sollte man vollständige Großschreibung vermeiden?", "s_es": {"type": "multiple_choice", "options": ["It can look angry", "It looks smaller", "It hides the subject"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es kann wütend wirken", "Es sieht kleiner aus", "Es versteckt den Betreff"], "answer": 0}}'::jsonb,
                '{"es": "¿Qué conviene revisar antes de enviar?", "de": "Was sollte man vor dem Senden prüfen?", "s_es": {"type": "multiple_choice", "options": ["Names, dates, and attachments", "Only the weather", "The train timetable"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Namen, Daten und Anhänge", "Nur das Wetter", "Den Zugfahrplan"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuál es un cierre apropiado?", "de": "Welcher Abschluss ist passend?", "s_es": {"type": "multiple_choice", "options": ["Best wishes", "Open the file", "No message"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Best wishes", "Datei öffnen", "Keine Nachricht"], "answer": 0}}'::jsonb,
                '{"es": "¿Cuándo se recomienda responder a un correo personal importante?", "de": "Wann sollte man auf eine wichtige persönliche E-Mail antworten?", "s_es": {"type": "multiple_choice", "options": ["Within two days", "After one month", "Only on weekends"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Innerhalb von zwei Tagen", "Nach einem Monat", "Nur am Wochenende"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
            DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7250 AND path_uuid = v_path_id);
            DELETE FROM reading WHERE step_order = 7250 AND path_uuid = v_path_id;

            INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
            VALUES (v_path_id, 7250, 'en', 'reading', 'communication', 'Email Tips for Friends and Family\n\nUse a clear subject line, like Weekend Visit or Photos from Sunday. Begin with a greeting, for example Hi Marta or Dear Uncle Luis.\n\nKeep your message short and friendly. Put your main news in the first lines. If you ask questions, make them easy to answer. Use paragraphs if the email is longer.\n\nDo not write in ALL CAPITAL LETTERS because it can look angry. Check names, dates, and attachments before you send the email. If you promise photos or a document, make sure the file is there.\n\nFinish with a polite closing such as Best wishes, Love, or See you soon. Try to reply within two days when the message is personal and important.')
            RETURNING uuid INTO v_reading_id;

            INSERT INTO reading_translation (reading_uuid, language, title, description)
            VALUES
                (v_reading_id, 'es', 'Lee consejos sobre la etiqueta del correo electrónico', 'Lee recomendaciones sencillas para escribir correos personales claros, amables y educados.'),
                (v_reading_id, 'de', 'Lies Tipps zur E-Mail-Etikette', 'Lies einfache Hinweise, wie man klare, freundliche und höfliche persönliche E-Mails schreibt.');

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
