-- ============================================================
-- Seed: A0 English Path – STEP 4300 – Reading – take dictation provided that the dictation is delivered clearly (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El texto dictado es un mensaje de correo electrónico de negocios.", "p_de": "Der diktierte Text ist eine geschäftliche E-Mail.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El correo se dirige a la señora Flores.", "p_de": "Die E-Mail richtet sich an Frau Flores.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El propósito del correo es confirmar una reunión.", "p_de": "Der Zweck der E-Mail ist die Bestätigung eines Meetings.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reunión está programada para el martes a las 2 PM.", "p_de": "Das Meeting ist für Dienstag um 14 Uhr geplant.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El lugar de la reunión es la sede central.", "p_de": "Der Ort des Meetings ist die Zentrale.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se pide al destinatario que confirme su asistencia.", "p_de": "Der Empfänger wird gebeten, seine Anwesenheit zu bestätigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El remitente se llama Thomas Wright.", "p_de": "Der Absender heißt Thomas Wright.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El correo menciona que se adjunta el orden del día.", "p_de": "Die E-Mail erwähnt, dass die Tagesordnung beigefügt ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A quién va dirigido el correo?", "p_de": "An wen ist die E-Mail gerichtet?", "s_es": {"type": "multiple_choice", "options": ["Mr Patel", "Ms Flores", "Ms Clark"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Herr Patel", "Frau Flores", "Frau Clark"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el propósito del correo?", "p_de": "Was ist der Zweck der E-Mail?", "s_es": {"type": "multiple_choice", "options": ["To confirm a meeting", "To cancel an order", "To request payment"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Meeting zu bestätigen", "Eine Bestellung zu stornieren", "Zahlung anzufordern"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es la reunión?", "p_de": "Wann ist das Meeting?", "s_es": {"type": "multiple_choice", "options": ["Tuesday at 2 PM", "Monday at 10 AM", "Wednesday at 3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dienstag um 14 Uhr", "Montag um 10 Uhr", "Mittwoch um 15 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es la reunión?", "p_de": "Wo ist das Meeting?", "s_es": {"type": "multiple_choice", "options": ["Room B on the third floor", "The headquarters", "At the client office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum B im dritten Stock", "Die Zentrale", "Im Büro des Kunden"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se pide al destinatario?", "p_de": "Was wird der Empfänger gebeten?", "s_es": {"type": "multiple_choice", "options": ["To confirm attendance", "To send a report", "To postpone the meeting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Anwesenheit zu bestätigen", "Einen Bericht zu schicken", "Das Meeting zu verschieben"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se llama el remitente?", "p_de": "Wie heißt der Absender?", "s_es": {"type": "multiple_choice", "options": ["Thomas Wright", "Mr Park", "James"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Thomas Wright", "Herr Park", "James"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué está adjunto al correo?", "p_de": "Was ist der E-Mail beigefügt?", "s_es": {"type": "multiple_choice", "options": ["The agenda", "An invoice", "A floor plan"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Tagesordnung", "Eine Rechnung", "Einen Grundriss"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de texto es este dictado?", "p_de": "Was für eine Art Text ist dieses Diktat?", "s_es": {"type": "multiple_choice", "options": ["A business email", "A technical report", "A product description"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Geschäfts-E-Mail", "Ein technischer Bericht", "Eine Produktbeschreibung"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4300 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4300 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4300, 'en', 'reading', 'professional', $content$DICTATED BUSINESS EMAIL

To: Mr Patel
From: Thomas Wright

Dear Mr Patel comma new line

I am writing to confirm our meeting on Tuesday at 2 PM full stop

The meeting will take place in Room B on the third floor full stop

Please find the agenda attached full stop

Could you please confirm your attendance by end of day Monday question mark

Kind regards comma new line Thomas Wright$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un texto de dictado de negocios', 'Lee un correo electrónico dictado con confirmación de reunión, lugar, hora y petición de confirmación.'),
            (v_reading_id, 'de', 'Lies einen diktierten Geschäftstext', 'Lies eine diktierte Geschäfts-E-Mail mit Meetingbestätigung, Ort, Zeit und Anwesenheitsanfrage.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
