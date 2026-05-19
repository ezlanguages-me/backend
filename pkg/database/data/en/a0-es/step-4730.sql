-- ============================================================
-- Seed: A0 English Path – STEP 4730 – Reading – understand instructions giving detailed warnings, advice, conditions etc. (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Solo los operadores formados pueden conducir la carretilla.", "p_de": "Nur geschulte Bediener dürfen den Gabelstapler fahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los operadores no necesitan ropa especial.", "p_de": "Die Bediener brauchen keine besondere Kleidung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La carretilla debe revisarse antes de cada uso.", "p_de": "Der Gabelstapler muss vor jedem Einsatz geprüft werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La carga máxima es de 2.000 kg.", "p_de": "Die maximale Traglast beträgt 2.000 kg.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se pueden llevar pasajeros en la carretilla.", "p_de": "Man darf Passagiere mit dem Gabelstapler befördern.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El límite de velocidad en zonas peatonales es de 8 km/h.", "p_de": "In Fußgängerbereichen gilt ein Tempolimit von 8 km/h.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Una carretilla averiada puede usarse si la carga es ligera.", "p_de": "Ein defekter Gabelstapler darf benutzt werden, wenn die Last leicht ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "No seguir las instrucciones puede causar despido.", "p_de": "Das Nichtbefolgen der Anweisungen kann zur Entlassung führen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Quién puede manejar la carretilla?", "p_de": "Wer darf den Gabelstapler bedienen?", "s_es": {"type": "multiple_choice", "options": ["Solo operadores autorizados y formados", "Cualquier trabajador del almacén", "Solo los gerentes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nur autorisierte und geschulte Bediener", "Beliebiges Lagerpersonal", "Nur Manager"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué ropa es obligatoria?", "p_de": "Welche Kleidung ist vorgeschrieben?", "s_es": {"type": "multiple_choice", "options": ["Chaleco reflectante y botas de seguridad", "Solo casco", "Ropa de trabajo normal"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Warnweste und Sicherheitsschuhe", "Nur ein Helm", "Normale Arbeitskleidung"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es la carga máxima?", "p_de": "Wie hoch ist die maximale Traglast?", "s_es": {"type": "multiple_choice", "options": ["2.000 kg", "1.000 kg", "3.000 kg"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2.000 kg", "1.000 kg", "3.000 kg"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué NO debe hacerse cerca de muelles abiertos sin señalista?", "p_de": "Was darf in der Nähe offener Laderampen ohne Einweiser NICHT passieren?", "s_es": {"type": "multiple_choice", "options": ["Usar la carretilla", "Aparcar la carretilla", "Revisar la carretilla"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Gabelstapler benutzen", "Den Gabelstapler parken", "Den Gabelstapler prüfen"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el límite de velocidad en zonas peatonales?", "p_de": "Wie hoch ist das Tempolimit in Fußgängerbereichen?", "s_es": {"type": "multiple_choice", "options": ["8 km/h", "15 km/h", "5 km/h"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8 km/h", "15 km/h", "5 km/h"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe hacerse con una carretilla averiada?", "p_de": "Was soll mit einem defekten Gabelstapler geschehen?", "s_es": {"type": "multiple_choice", "options": ["Aparcarla y avisar al supervisor", "Intentar repararla uno mismo", "Seguir usándola con cuidado"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Abstellen und dem Vorgesetzten melden", "Selbst reparieren", "Vorsichtig weiterbenutzen"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué se revisa antes de usarla?", "p_de": "Was wird vor der Benutzung überprüft?", "s_es": {"type": "multiple_choice", "options": ["Frenos, bocina, luces y neumáticos", "Solo los frenos", "Solo el motor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bremsen, Hupe, Lichter und Reifen", "Nur die Bremsen", "Nur der Motor"], "answer": 0}}'::jsonb,
            '{"p": "¿A quién se informa una avería?", "p_de": "Wem wird ein Defekt gemeldet?", "s_es": {"type": "multiple_choice", "options": ["Al supervisor del centro", "A RR. HH.", "A un compañero"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dem Standortleiter", "Der Personalabteilung", "Einem Kollegen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4730
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4730
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4730, 'en', 'reading', 'professional', $content$FORKLIFT SAFETY INSTRUCTIONS – WAREHOUSE STAFF

Only authorised and trained operators may drive the forklift. Before use, operators must wear a high-visibility vest and safety boots, and they must check the brakes, horn, lights and tyres. Loads must stay below the maximum capacity of 2,000 kg. Speed must be reduced on wet or uneven surfaces, and the vehicle must never exceed 8 km/h in pedestrian areas.

Forklifts must never carry passengers. Operators must also avoid using a forklift near open loading bays unless a banksman is present. If the forklift has any fault, it must not be used under any circumstances. The driver must park it in the designated bay and report the issue to the site supervisor immediately.

Failure to follow these instructions may result in serious injury or dismissal.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee las instrucciones de seguridad para carretillas elevadoras', 'Lee instrucciones detalladas con advertencias, límites y condiciones para conducir una carretilla.'),
            (v_reading_id, 'de', 'Lies die Gabelstaplersicherheitsanweisungen', 'Lies detaillierte Anweisungen mit Warnungen, Grenzen und Bedingungen für das Fahren eines Gabelstaplers.');

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
