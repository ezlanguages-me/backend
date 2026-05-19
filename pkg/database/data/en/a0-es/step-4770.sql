-- ============================================================
-- Seed: A0 English Path – STEP 4770 – Listening – take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Tom trabaja en Reed Consulting.", "p_de": "Tom arbeitet bei Reed Consulting.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Sandra llama de South Bridge Engineering.", "p_de": "Sandra ruft von South Bridge Engineering an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Carlos Rivera está disponible de inmediato.", "p_de": "Carlos Rivera ist sofort verfügbar.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La entrega pasa del lunes 13 al miércoles 15.", "p_de": "Die Lieferung wird von Montag, dem 13., auf Mittwoch, den 15., verschoben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El equipo de entrega llegará a las 9:00.", "p_de": "Das Lieferteam kommt um 9 Uhr an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Debe haber un supervisor presente en la entrega.", "p_de": "Bei der Lieferung muss ein Vorgesetzter anwesend sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Sandra quiere la confirmación por teléfono.", "p_de": "Sandra möchte die Bestätigung telefonisch.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Sandra estará disponible toda la tarde.", "p_de": "Sandra wird den ganzen Nachmittag verfügbar sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Dónde trabaja Tom?", "p_de": "Wo arbeitet Tom?", "s_es": {"type": "multiple_choice", "options": ["En Reed Consulting", "En South Bridge Engineering", "En North Clinic"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bei Reed Consulting", "Bei South Bridge Engineering", "Bei North Clinic"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo estará disponible Carlos?", "p_de": "Wann wird Carlos verfügbar sein?", "s_es": {"type": "multiple_choice", "options": ["Después del mediodía", "Después de las 14:00", "Mañana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach Mittag", "Nach 14 Uhr", "Morgen"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué se va a entregar?", "p_de": "Was wird geliefert?", "s_es": {"type": "multiple_choice", "options": ["Equipos para el proyecto Northgate", "Mobiliario de oficina", "Sistemas informáticos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ausrüstung für das Northgate-Projekt", "Büromöbel", "Computersysteme"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el nuevo día de entrega?", "p_de": "Was ist der neue Liefertag?", "s_es": {"type": "multiple_choice", "options": ["Miércoles 15", "Lunes 13", "Viernes 17"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mittwoch, der 15.", "Montag, der 13.", "Freitag, der 17."], "answer": 0}}'::jsonb,
            '{"p": "¿A qué hora llegará el equipo de entrega?", "p_de": "Um wie viel Uhr kommt das Lieferteam an?", "s_es": {"type": "multiple_choice", "options": ["A las 7:00", "A las 9:00", "A las 8:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 7 Uhr", "Um 9 Uhr", "Um 8 Uhr"], "answer": 0}}'::jsonb,
            '{"p": "¿Quién debe estar presente durante la entrega?", "p_de": "Wer muss bei der Lieferung anwesend sein?", "s_es": {"type": "multiple_choice", "options": ["Un supervisor", "Carlos Rivera", "Sandra"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Vorgesetzter", "Carlos Rivera", "Sandra"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el correo de Sandra?", "p_de": "Wie lautet Sandras E-Mail-Adresse?", "s_es": {"type": "multiple_choice", "options": ["sande.petrov@southbridge.co.uk", "spetrov@southbridge.co.uk", "s.petrov@south.co.uk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["sande.petrov@southbridge.co.uk", "spetrov@southbridge.co.uk", "s.petrov@south.co.uk"], "answer": 0}}'::jsonb,
            '{"p": "¿Por qué no se puede contactar con Sandra por la tarde?", "p_de": "Warum kann Sandra am Nachmittag nicht erreicht werden?", "s_es": {"type": "multiple_choice", "options": ["Porque estará en reuniones", "Porque viajará", "Porque tiene una cita médica"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil sie in Besprechungen sein wird", "Weil sie reisen wird", "Weil sie einen Arzttermin hat"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM listening
            WHERE step_order = 4770
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'listening'
        );
        DELETE FROM listening
        WHERE step_order = 4770
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'listening';

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4770, 'en', 'listening', 'professional', $transcript$
Tom: Good morning, Reed Consulting. How can I help you?
Sandra: Good morning. My name is Sandra Petrov from South Bridge Engineering. I need to speak to Carlos Rivera.
Tom: I'm afraid Mr. Rivera is in a meeting until noon. Can I take a message?
Sandra: Yes, please. Could you tell him that the delivery of equipment for the Northgate project is now scheduled for Wednesday the 15th instead of Monday the 13th.
Tom: So the delivery moves to Wednesday the 15th. Is there anything else?
Sandra: Yes. He also needs to arrange on-site access for the delivery team. They will arrive at 7am and need a supervisor present.
Tom: Delivery team at 7am on Wednesday the 15th, supervisor required. Got it.
Sandra: Also, could he confirm by email to sande.petrov@southbridge.co.uk? I'll be in meetings all afternoon.
Tom: Of course. I'll pass on the message as soon as he is out of the meeting.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha un recado de teléfono complejo', 'Escucha una llamada en la que se deja un recado detallado sobre una entrega y una confirmación.'),
            (v_listening_id, 'de', 'Höre eine komplexe Telefonnachricht', 'Höre einen Anruf, in dem eine detaillierte Nachricht zu einer Lieferung und Bestätigung hinterlassen wird.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_listening_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
