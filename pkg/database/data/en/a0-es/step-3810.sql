-- ============================================================
-- Seed: A0 English Path – STEP 3810 – Reading – read a work order form (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La orden de trabajo es la 5412.", "p_de": "Der Arbeitsauftrag ist 5412.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente es Green Tower Offices.", "p_de": "Der Kunde ist Green Tower Offices.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tarea es reparar ocho ventanas.", "p_de": "Die Aufgabe ist, acht Fenster zu reparieren.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El trabajo es el martes 14 de mayo.", "p_de": "Die Arbeit ist am Dienstag, dem 14. Mai.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La técnica se llama Alex Neri.", "p_de": "Der Techniker heißt Alex Neri.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El trabajo empieza a las 8 AM.", "p_de": "Die Arbeit beginnt um 8 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que llevar una escalera, guantes y una máscara de seguridad.", "p_de": "Man soll eine Leiter, Handschuhe und eine Schutzmaske mitbringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El informe se entrega a Marta Lopez en la oficina 3.", "p_de": "Der Bericht geht an Marta Lopez in Büro 3.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué número tiene la orden?", "p_de": "Welche Nummer hat der Auftrag?", "s_es": {"type": "multiple_choice", "options": ["5412", "5142", "4512"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["5412", "5142", "4512"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tarea aparece?", "p_de": "Welche Aufgabe steht im Auftrag?", "s_es": {"type": "multiple_choice", "options": ["Clean air filters", "Install new chairs", "Paint the hall"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Luftfilter reinigen", "Neue Stühle aufstellen", "Die Halle streichen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué habitaciones se mencionan?", "p_de": "Welche Räume werden genannt?", "s_es": {"type": "multiple_choice", "options": ["201 to 208", "101 to 108", "301 to 308"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["201 bis 208", "101 bis 108", "301 bis 308"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora empieza el trabajo?", "p_de": "Um wie viel Uhr beginnt die Arbeit?", "s_es": {"type": "multiple_choice", "options": ["9 AM", "8 AM", "4 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["9 Uhr", "8 Uhr", "16 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay que llevar?", "p_de": "Was soll man mitbringen?", "s_es": {"type": "multiple_choice", "options": ["A ladder, gloves, and one safety mask", "Only a laptop", "Two printers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Leiter, Handschuhe und eine Schutzmaske", "Nur einen Laptop", "Zwei Drucker"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién recibe el informe?", "p_de": "Wer bekommt den Bericht?", "s_es": {"type": "multiple_choice", "options": ["Supervisor Marta Lopez", "The client driver", "Alex Neri"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Supervisor Marta Lopez", "Der Fahrer des Kunden", "Alex Neri"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde trabaja Marta Lopez?", "p_de": "Wo arbeitet Marta Lopez?", "s_es": {"type": "multiple_choice", "options": ["Office 3", "Room 208", "Gate C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Büro 3", "Raum 208", "Tor C"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién firma el formulario al final?", "p_de": "Wer unterschreibt das Formular am Ende?", "s_es": {"type": "multiple_choice", "options": ["The client contact", "The technicians friend", "The bus driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Ansprechpartner des Kunden", "Der Freund des Technikers", "Der Busfahrer"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3810 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3810 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3810, 'en', 'reading', 'professional', $content$Work Order 5412. Client: Green Tower Offices. Task: clean air filters in rooms 201 to 208 on Tuesday, 14 May. Technician: Alex Neri. Start at 9 AM and finish by 4 PM.

Bring a ladder, gloves, and one safety mask. After the job, give the report to Supervisor Marta Lopez in office 3. The client contact signs the form before you leave.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una orden de trabajo', 'Lee una orden de trabajo con tarea, fecha, herramientas y persona responsable.'),
            (v_reading_id, 'de', 'Lies einen Arbeitsauftrag', 'Lies einen Arbeitsauftrag mit Aufgabe, Datum, Werkzeugen und verantwortlicher Person.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
