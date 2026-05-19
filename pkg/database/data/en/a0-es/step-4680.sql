-- ============================================================
-- Seed: A0 English Path – STEP 4680 – Reading – understand instructions, given some means of checking understanding, as long as they are simple, brief and illustrated in some way (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El procedimiento es para la planta 3.", "p_de": "Das Verfahren gilt für Etage 3.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El personal debe usar el ascensor durante la evacuación.", "p_de": "Während der Evakuierung soll das Personal den Aufzug benutzen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El personal debe ir a la salida de incendios más cercana.", "p_de": "Das Personal soll zum nächstgelegenen Notausgang gehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El punto de reunión es el punto A.", "p_de": "Der Sammelpunkt ist Punkt A.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "No se debe volver a entrar hasta que lo diga un responsable de incendios.", "p_de": "Man darf das Gebäude erst wieder betreten, wenn ein Brandschutzhelfer es erlaubt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El personal debe informar a RR. HH. cuando esté fuera.", "p_de": "Das Personal soll sich draußen bei der Personalabteilung melden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El responsable de incendios de la planta 3 es David Chen.", "p_de": "Der Brandschutzhelfer auf Etage 3 ist David Chen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El correo de contacto es safety@building.co.uk.", "p_de": "Die Kontakt-E-Mail lautet safety@building.co.uk.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "¿Qué debe hacer el personal primero cuando suena la alarma?", "p_de": "Was sollen die Mitarbeitenden als Erstes tun, wenn der Alarm ertönt?", "s_es": {"type": "multiple_choice", "options": ["Parar todo el trabajo inmediatamente", "Llamar a los bomberos", "Ir a la cocina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sofort die Arbeit einstellen", "Die Feuerwehr anrufen", "In die Küche gehen"], "answer": 0}}'::jsonb,
            '{"p": "¿Por qué debe evitarse el ascensor?", "p_de": "Warum soll der Aufzug vermieden werden?", "s_es": {"type": "multiple_choice", "options": ["Porque solo deben usarse las escaleras", "Porque es demasiado lento", "Porque está averiado"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil nur die Treppe benutzt werden darf", "Weil er zu langsam ist", "Weil er kaputt ist"], "answer": 0}}'::jsonb,
            '{"p": "¿Dónde está el punto de reunión B?", "p_de": "Wo befindet sich Sammelpunkt B?", "s_es": {"type": "multiple_choice", "options": ["En el aparcamiento", "En la entrada principal", "En la planta 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Parkplatz", "Am Haupteingang", "Auf Etage 1"], "answer": 0}}'::jsonb,
            '{"p": "¿Quién debe seguir este procedimiento?", "p_de": "Wer muss dieses Verfahren befolgen?", "s_es": {"type": "multiple_choice", "options": ["Todo el personal y los visitantes", "Solo los gerentes", "Solo los visitantes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alle Mitarbeitenden und Besucher", "Nur Manager", "Nur Besucher"], "answer": 0}}'::jsonb,
            '{"p": "¿Quién es el responsable de incendios de la planta 3?", "p_de": "Wer ist der Brandschutzhelfer auf Etage 3?", "s_es": {"type": "multiple_choice", "options": ["David Chen", "Laura Smith", "Ben Carter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["David Chen", "Laura Smith", "Ben Carter"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe comunicarse al jefe directo?", "p_de": "Was soll der direkten Führungskraft gemeldet werden?", "s_es": {"type": "multiple_choice", "options": ["La presencia para pasar lista", "Los daños observados", "La hora de salida"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Anwesenheit zur Kontrolle", "Beobachtete Schäden", "Die Uhrzeit des Verlassens"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe hacerse con las pertenencias?", "p_de": "Was soll mit persönlichen Gegenständen geschehen?", "s_es": {"type": "multiple_choice", "options": ["Llevarlas si es seguro hacerlo", "Dejarlas siempre en el escritorio", "Guardarlas en una taquilla"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie nur mitnehmen, wenn es sicher ist", "Sie immer am Schreibtisch lassen", "Sie in ein Schließfach legen"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el correo de seguridad?", "p_de": "Wie lautet die Sicherheits-E-Mail?", "s_es": {"type": "multiple_choice", "options": ["safety@building.co.uk", "hr@building.co.uk", "manager@building.co.uk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["safety@building.co.uk", "hr@building.co.uk", "manager@building.co.uk"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4680
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4680
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4680, 'en', 'reading', 'professional', $content$FIRE EVACUATION PROCEDURE – FLOOR 3

When the fire alarm sounds, all work must stop immediately. Staff and visitors on Floor 3 must not use the lift during evacuation. Use the stairs only and move calmly to the nearest fire exit, following the posted diagram if necessary. Personal belongings may be taken only if it is safe to do so and there is no delay.

Once outside the building, everyone on Floor 3 must assemble at Assembly Point B in the car park. Do not re-enter the building until a fire marshal gives clear permission. All employees must report to their line manager so that names can be checked against the attendance list.

This procedure applies to all staff and visitors. The fire marshal for Floor 3 is David Chen. Questions can be sent to safety@building.co.uk.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un procedimiento de evacuación de incendios', 'Lee instrucciones sencillas de evacuación contra incendios con acciones y responsables.'),
            (v_reading_id, 'de', 'Lies eine Brandschutzevakuierungsanweisung', 'Lies einfache Brandschutzanweisungen mit Schritten und Verantwortlichen.');

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
