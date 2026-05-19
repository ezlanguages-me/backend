-- ============================================================
-- Seed: A0 English Path – STEP 4060 – Reading – take and pass on simple messages of a routine kind (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El mensaje es para la señora García.", "p_de": "Die Nachricht ist für Frau García.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La llamada fue a las 3 de la tarde.", "p_de": "Der Anruf war um 15 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El señor López quiere que le devuelvan la llamada.", "p_de": "Herr López möchte, dass man ihn zurückruft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La referencia del pedido es el número PO-4421.", "p_de": "Die Bestellreferenz ist Nummer PO-4421.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El asunto del mensaje es una queja sobre calidad.", "p_de": "Das Thema der Nachricht ist eine Qualitätsbeschwerde.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El número de contacto es el 020 7946 0001.", "p_de": "Die Kontaktnummer ist 020 7946 0001.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El señor López dejó su número de fax.", "p_de": "Herr López hat seine Faxnummer hinterlassen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El mensaje fue tomado por Ana.", "p_de": "Die Nachricht wurde von Ana aufgenommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Para quién es el mensaje?", "p_de": "Für wen ist die Nachricht?", "s_es": {"type": "multiple_choice", "options": ["Ms García", "Mr López", "Ana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Frau García", "Herr López", "Ana"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo llamó el señor López?", "p_de": "Wann hat Herr López angerufen?", "s_es": {"type": "multiple_choice", "options": ["At 10 AM", "At 3 PM", "At 5 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 10 Uhr", "Um 15 Uhr", "Um 17 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide el señor López?", "p_de": "Was bittet Herr López?", "s_es": {"type": "multiple_choice", "options": ["A call back", "A meeting tomorrow", "A price list"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Rückruf", "Ein Treffen morgen", "Eine Preisliste"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la referencia del pedido?", "p_de": "Was ist die Bestellreferenz?", "s_es": {"type": "multiple_choice", "options": ["PO-4421", "PO-2244", "PO-1144"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["PO-4421", "PO-2244", "PO-1144"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el asunto del mensaje?", "p_de": "Was ist das Thema der Nachricht?", "s_es": {"type": "multiple_choice", "options": ["A delivery delay", "A quality complaint", "A new contract"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Lieferverzögerung", "Eine Qualitätsbeschwerde", "Ein neuer Vertrag"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el número de contacto?", "p_de": "Was ist die Kontaktnummer?", "s_es": {"type": "multiple_choice", "options": ["020 7946 0001", "020 1234 5678", "020 9876 5432"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["020 7946 0001", "020 1234 5678", "020 9876 5432"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién tomó el mensaje?", "p_de": "Wer hat die Nachricht aufgenommen?", "s_es": {"type": "multiple_choice", "options": ["Ana", "Ms García", "Mr López"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ana", "Frau García", "Herr López"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata este documento?", "p_de": "Worum geht es in diesem Dokument?", "s_es": {"type": "multiple_choice", "options": ["A telephone message note", "A formal complaint letter", "A meeting agenda"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Telefonnotiz", "Ein formelles Beschwerdebrief", "Eine Tagesordnung"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4060 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4060 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4060, 'en', 'reading', 'professional', $content$TELEPHONE MESSAGE

To: Ms García
From: Mr López – Delta Supplies
Date: Tuesday
Time: 10 AM
Taken by: Ana

Mr López called regarding order PO-4421. He mentioned there is a delay with the delivery. He would like Ms García to call him back as soon as possible.

Contact number: 020 7946 0001$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una nota de mensaje telefónico', 'Lee una nota de mensaje con remitente, asunto, referencia y número de contacto.'),
            (v_reading_id, 'de', 'Lies eine Telefonnotiz', 'Lies eine Nachrichtennotiz mit Absender, Thema, Referenz und Kontaktnummer.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
