-- ============================================================
-- Seed: A0 English Path – STEP 1460 – Dialogue – ask questions related to post office services
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Customer", "text": "Hello. How long does a letter to Valencia take?", "es": "Hola. ¿Cuánto tarda una carta a Valencia?", "de": "Hallo. Wie lange braucht ein Brief nach Valencia?"}'::jsonb,
    '{"character": "Clerk", "text": "Standard mail takes two to three days.", "es": "El correo normal tarda de dos a tres días.", "de": "Standardpost dauert zwei bis drei Tage."}'::jsonb,
    '{"character": "Customer", "text": "And express mail?", "es": "¿Y el correo exprés?", "de": "Und Expresspost?"}'::jsonb,
    '{"character": "Clerk", "text": "Express mail arrives tomorrow before noon.", "es": "El correo exprés llega mañana antes del mediodía.", "de": "Expresspost kommt morgen vor Mittag an."}'::jsonb,
    '{"character": "Customer", "text": "Do I get a tracking number with express mail?", "es": "¿Recibo número de seguimiento con el correo exprés?", "de": "Bekomme ich bei Expresspost eine Sendungsnummer?"}'::jsonb,
    '{"character": "Clerk", "text": "Yes, you do.", "es": "Sí.", "de": "Ja."}'::jsonb,
    '{"character": "Customer", "text": "Does standard mail need a signature?", "es": "¿El correo normal necesita firma?", "de": "Braucht Standardpost eine Unterschrift?"}'::jsonb,
    '{"character": "Clerk", "text": "No, but registered mail does.", "es": "No, pero el correo certificado sí.", "de": "Nein, aber Einschreiben schon."}'::jsonb,
    '{"character": "Customer", "text": "Thank you. I think I need express mail.", "es": "Gracias. Creo que necesito correo exprés.", "de": "Danke. Ich glaube, ich brauche Expresspost."}'::jsonb,
    '{"character": "Clerk", "text": "No problem. Please write the address here.", "es": "No hay problema. Escriba la dirección aquí, por favor.", "de": "Kein Problem. Bitte schreiben Sie hier die Adresse."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "La carta va a Valencia.", "de": "Der Brief geht nach Valencia.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El correo normal tarda de dos a tres días.", "de": "Standardpost dauert zwei bis drei Tage.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El correo exprés llega dentro de una semana.", "de": "Expresspost kommt in einer Woche an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "El correo exprés incluye número de seguimiento.", "de": "Expresspost enthält eine Sendungsnummer.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El correo normal necesita firma.", "de": "Standardpost braucht eine Unterschrift.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Cuándo llega el correo exprés?", "de": "Wann kommt die Expresspost an?", "s_es": {"type": "multiple_choice", "options": ["Tomorrow before noon", "In two weeks", "Tonight at midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morgen vor Mittag", "In zwei Wochen", "Heute um Mitternacht"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué servicio necesita firma?", "de": "Welcher Service braucht eine Unterschrift?", "s_es": {"type": "multiple_choice", "options": ["Registered mail", "Standard mail", "A postcard"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einschreiben", "Standardpost", "Eine Postkarte"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué elige probablemente el cliente?", "de": "Was wählt der Kunde wahrscheinlich?", "s_es": {"type": "multiple_choice", "options": ["Express mail", "A savings account", "A bus ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Expresspost", "Ein Sparkonto", "Ein Busticket"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debe escribir el cliente?", "de": "Was muss der Kunde schreiben?", "s_es": {"type": "multiple_choice", "options": ["The address", "The PIN code for the ATM", "The hotel password"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Adresse", "Die PIN für den Automaten", "Das Hotelpasswort"], "answer": 0}}'::jsonb,
    '{"es": "¿De qué trata la conversación?", "de": "Worum geht es im Gespräch?", "s_es": {"type": "multiple_choice", "options": ["Delivery times for mail services", "A bank loan", "A school exam"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lieferzeiten von Postdiensten", "Einen Bankkredit", "Eine Schulprüfung"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1460 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1460 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1460, 'en', 'dialogue', 'postal', '[{"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Clerk", "gender": "male", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Preguntar por tiempos de entrega', 'Lee un diálogo simple para preguntar cuánto tarda un envío postal.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Nach Lieferzeiten fragen', 'Lies einen einfachen Dialog, um nach der Lieferzeit einer Sendung zu fragen.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "__ES__"}]}]'::jsonb);
        UPDATE dialogue_lines_translation
        SET meaning = jsonb_set(meaning, '{0,translations,0,translation}', to_jsonb(line->>'es'))
        WHERE dialogue_line_uuid = v_line_uuid AND language = 'es';

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "__DE__"}]}]'::jsonb);
        UPDATE dialogue_lines_translation
        SET meaning = jsonb_set(meaning, '{0,translations,0,translation}', to_jsonb(line->>'de'))
        WHERE dialogue_line_uuid = v_line_uuid AND language = 'de';

        v_order := v_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'es', ex->'s_es');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
