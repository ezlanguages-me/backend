-- ============================================================
-- Seed: A0 English Path – STEP 4760 – Reading – take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El mensaje es para el señor James Wright.", "p_de": "Die Nachricht ist für Herrn James Wright.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El mensaje es de Blue Horizon Consulting.", "p_de": "Die Nachricht stammt von Blue Horizon Consulting.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La reunión original era el jueves 9 de noviembre a las 14:00.", "p_de": "Der ursprüngliche Termin war am Donnerstag, dem 9. November, um 14 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La señora Kowalski quiere mover la reunión al viernes a las 14:00.", "p_de": "Frau Kowalski möchte das Treffen auf Freitag um 14 Uhr verlegen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El motivo del cambio es una visita urgente a un cliente.", "p_de": "Der Grund für die Änderung ist ein dringender Kundenbesuch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Necesita las cifras del tercer trimestre para el jueves por la mañana.", "p_de": "Sie braucht die Zahlen des dritten Quartals bis Donnerstagmorgen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La señora Kowalski enviará el orden del día revisado antes de que termine hoy.", "p_de": "Frau Kowalski sendet die überarbeitete Tagesordnung bis heute Abend.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El mensaje se tomó a las 10:15.", "p_de": "Die Nachricht wurde um 10:15 Uhr aufgenommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Para quién es el mensaje?", "p_de": "Für wen ist die Nachricht?", "s_es": {"type": "multiple_choice", "options": ["Para el señor James Wright", "Para la señora Anita Kowalski", "Para la recepcionista"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für Herrn James Wright", "Für Frau Anita Kowalski", "Für die Empfangskraft"], "answer": 0}}'::jsonb,
            '{"p": "¿A qué hora se tomó el mensaje?", "p_de": "Um wie viel Uhr wurde die Nachricht aufgenommen?", "s_es": {"type": "multiple_choice", "options": ["A las 9:45", "A las 10:15", "A las 9:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 9:45 Uhr", "Um 10:15 Uhr", "Um 9:00 Uhr"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué día era la reunión original?", "p_de": "An welchem Tag war der ursprüngliche Termin?", "s_es": {"type": "multiple_choice", "options": ["Jueves 9 de noviembre", "Viernes 10 de noviembre", "Miércoles 8 de noviembre"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Donnerstag, 9. November", "Freitag, 10. November", "Mittwoch, 8. November"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué hora quiere para la nueva reunión?", "p_de": "Welche Uhrzeit wünscht sie für das neue Treffen?", "s_es": {"type": "multiple_choice", "options": ["Las 10:00", "Las 14:00", "Las 11:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 Uhr", "14 Uhr", "11 Uhr"], "answer": 0}}'::jsonb,
            '{"p": "¿Por qué quiere cambiar la hora?", "p_de": "Warum möchte sie die Uhrzeit ändern?", "s_es": {"type": "multiple_choice", "options": ["Por una visita urgente a un cliente", "Por enfermedad", "Por retrasos en el viaje"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wegen eines dringenden Kundenbesuchs", "Wegen Krankheit", "Wegen Reiseverzögerungen"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuándo necesita las cifras del tercer trimestre?", "p_de": "Bis wann braucht sie die Zahlen für das dritte Quartal?", "s_es": {"type": "multiple_choice", "options": ["Antes del miércoles por la tarde", "Antes del jueves por la mañana", "Antes del viernes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis Mittwochabend", "Bis Donnerstagmorgen", "Bis Freitag"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué enviará hoy la señora Kowalski?", "p_de": "Was wird Frau Kowalski heute senden?", "s_es": {"type": "multiple_choice", "options": ["El orden del día revisado", "Las cifras del tercer trimestre", "Un contrato"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die überarbeitete Tagesordnung", "Die Zahlen für das dritte Quartal", "Einen Vertrag"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué debe hacer el señor Wright?", "p_de": "Was soll Herr Wright tun?", "s_es": {"type": "multiple_choice", "options": ["Llamarla para confirmar", "Enviar las cifras ahora mismo", "Cancelar la reunión"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie zur Bestätigung anrufen", "Die Zahlen sofort schicken", "Das Treffen absagen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4760
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4760
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4760, 'en', 'reading', 'professional', $content$Telephone Message Note

Message taken at 9:45 am on Monday 6 November.
For: Mr. James Wright, Finance Director.
From: Ms. Anita Kowalski, Blue Horizon Consulting.
Phone: 020-7843-9201.
Email: akowalski@bluehorizon.com.

Message:
Ms. Kowalski called about the financial review arranged for Thursday 9 November at 2pm. She needs to move the meeting to Friday 10 November at 10am because she has an urgent client visit on Thursday. She also asked for the Q3 financial figures to be sent to her by Wednesday evening at the latest. She said she will send the revised agenda by the end of today. Please call her back to confirm the new time.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un recado de teléfono complejo', 'Lee una nota telefónica detallada sobre cambios de reunión y documentos urgentes.'),
            (v_reading_id, 'de', 'Lies eine komplexe Telefonnotiz', 'Lies eine detaillierte Telefonnotiz über eine Terminänderung und dringende Unterlagen.');

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
