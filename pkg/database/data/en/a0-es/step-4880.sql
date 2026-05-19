-- ============================================================
-- Seed: A0 English Path – STEP 4880 – Reading – understand a phone script/protocol (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El protocolo dice que debes empezar con el nombre de la empresa y el tuyo.", "p_de": "Das Protokoll sagt, dass du mit dem Firmennamen und deinem Namen beginnen sollst.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Después del saludo, debes preguntar cómo puedes ayudar.", "p_de": "Nach der Begrüßung sollst du fragen, wie du helfen kannst.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si la persona correcta no está, debes colgar sin explicar nada.", "p_de": "Wenn die richtige Person nicht da ist, sollst du ohne Erklärung auflegen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Debes apuntar nombre, empresa, número y motivo de la llamada.", "p_de": "Du sollst Name, Firma, Nummer und Anrufgrund notieren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta repetir los detalles al final.", "p_de": "Man muss die Details am Ende nicht wiederholen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que mencionar cualquier plazo importante.", "p_de": "Man soll jede wichtige Frist erwähnen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debes decir qué pasará después de la llamada.", "p_de": "Du sollst sagen, was nach dem Anruf passiert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La llamada debe terminar de forma descortés y rápida.", "p_de": "Das Gespräch soll unhöflich und schnell enden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cómo debe empezar la llamada?", "p_de": "Wie soll das Gespräch beginnen?", "s": {"type": "multiple_choice", "options": ["With the company name and your name", "With a long apology", "With the invoice number only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta sigue al saludo?", "p_de": "Welche Frage folgt auf die Begrüßung?", "s": {"type": "multiple_choice", "options": ["How can I help you today?", "Where do you live?", "What is your password?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofreces si la persona correcta no está?", "p_de": "Was bietest du an, wenn die richtige Person nicht da ist?", "s": {"type": "multiple_choice", "options": ["To take a message", "To close the office", "To send a taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes anotar?", "p_de": "Was sollst du notieren?", "s": {"type": "multiple_choice", "options": ["Name, company, phone number, and reason", "Only the room number", "Only the caller''s first name"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes repetir antes de terminar?", "p_de": "Was sollst du vor dem Ende wiederholen?", "s": {"type": "multiple_choice", "options": ["The important details and any deadline", "The company history", "The weather forecast"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes explicar al final?", "p_de": "Was sollst du am Ende erklären?", "s": {"type": "multiple_choice", "options": ["What will happen next", "How to change the building lock", "Where the cafe is"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces después de repetir los detalles?", "p_de": "Was machst du nach dem Wiederholen der Details?", "s": {"type": "multiple_choice", "options": ["Thank the caller and close politely", "Ask for a second payment", "Start a new topic"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de texto se trata?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A phone protocol for staff", "A hotel menu", "A university timetable"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4880 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 4880 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 4880, 'en', 'reading', 'professional', 'Support desk phone protocol. Start every call with the company name and your own name. Then ask, ''How can I help you today?''

If the right person is not available, say that clearly and offer to take a message. Write down the caller''s name, company, phone number, and reason for calling.

Before the call ends, repeat the important details, including any deadline. Tell the caller what will happen next, thank them for calling, and close the conversation politely.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Protocolo para responder llamadas', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Telefonleitfaden für Anrufe', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
