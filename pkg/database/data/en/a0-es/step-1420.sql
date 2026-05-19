-- ============================================================
-- Seed: A0 English Path – STEP 1420 – Dialogue – ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales)
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
        '{"character": "Customer", "text": "Good morning. I want to open a basic account.", "es": "Buenos días. Quiero abrir una cuenta básica.", "de": "Guten Morgen. Ich möchte ein Basiskonto eröffnen."}'::jsonb,
    '{"character": "Teller", "text": "Of course. Do you have your passport and proof of address?", "es": "Claro. ¿Tiene su pasaporte y una prueba de domicilio?", "de": "Natürlich. Haben Sie Ihren Reisepass und einen Adressnachweis?"}'::jsonb,
    '{"character": "Customer", "text": "Yes. I have my passport and this utility bill.", "es": "Sí. Tengo mi pasaporte y esta factura de servicios.", "de": "Ja. Ich habe meinen Reisepass und diese Rechnung."}'::jsonb,
    '{"character": "Teller", "text": "Perfect. Please complete this short form.", "es": "Perfecto. Complete este formulario corto, por favor.", "de": "Perfekt. Bitte füllen Sie dieses kurze Formular aus."}'::jsonb,
    '{"character": "Customer", "text": "Is there a monthly fee?", "es": "¿Hay cuota mensual?", "de": "Gibt es eine monatliche Gebühr?"}'::jsonb,
    '{"character": "Teller", "text": "No, there is no monthly fee for this account.", "es": "No, no hay cuota mensual para esta cuenta.", "de": "Nein, für dieses Konto gibt es keine monatliche Gebühr."}'::jsonb,
    '{"character": "Customer", "text": "How much is the first deposit?", "es": "¿De cuánto es el primer depósito?", "de": "Wie hoch ist die erste Einzahlung?"}'::jsonb,
    '{"character": "Teller", "text": "Fifty euros, please.", "es": "Cincuenta euros, por favor.", "de": "Fünfzig Euro, bitte."}'::jsonb,
    '{"character": "Customer", "text": "When do I get the debit card?", "es": "¿Cuándo recibo la tarjeta de débito?", "de": "Wann bekomme ich die Debitkarte?"}'::jsonb,
    '{"character": "Teller", "text": "It arrives on Friday. We will also email your first statement.", "es": "Llega el viernes. También le enviaremos por correo electrónico su primer extracto.", "de": "Sie kommt am Freitag. Wir schicken Ihnen auch den ersten Kontoauszug per E-Mail."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente quiere abrir una cuenta básica.", "de": "Der Kunde möchte ein Basiskonto eröffnen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Tiene pasaporte y una factura de servicios.", "de": "Er hat einen Reisepass und eine Rechnung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La cuenta tiene una cuota mensual alta.", "de": "Das Konto hat eine hohe monatliche Gebühr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "El primer depósito es de cincuenta euros.", "de": "Die erste Einzahlung beträgt fünfzig Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La tarjeta llega el martes.", "de": "Die Karte kommt am Dienstag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Qué documento de domicilio muestra el cliente?", "de": "Welchen Adressnachweis zeigt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["A utility bill", "A cinema poster", "A parcel ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Rechnung", "Ein Kinoplakat", "Ein Paketschein"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debe completar?", "de": "Was muss er ausfüllen?", "s_es": {"type": "multiple_choice", "options": ["A short form", "A customs form", "A train form"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kurzes Formular", "Ein Zollformular", "Ein Zugformular"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué pregunta hace sobre el coste?", "de": "Welche Frage stellt er zu den Kosten?", "s_es": {"type": "multiple_choice", "options": ["Is there a monthly fee?", "Is there a hotel fee?", "Is there a parking fee?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gibt es eine monatliche Gebühr?", "Gibt es eine Hotelgebühr?", "Gibt es eine Parkgebühr?"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuánto es el primer depósito?", "de": "Wie hoch ist die erste Einzahlung?", "s_es": {"type": "multiple_choice", "options": ["Fifty euros", "Ten euros", "One euro"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfzig Euro", "Zehn Euro", "Ein Euro"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo recibe el primer extracto?", "de": "Wie bekommt er den ersten Kontoauszug?", "s_es": {"type": "multiple_choice", "options": ["By email", "By taxi", "By text message only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per E-Mail", "Per Taxi", "Nur per SMS"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1420 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1420 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1420, 'en', 'dialogue', 'banking', '[{"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Teller", "gender": "female", "avatarURL": "https://example.com/avatars/teller.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Abrir una cuenta en la ventanilla', 'Lee un diálogo sencillo para abrir una cuenta bancaria con documentos básicos.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Ein Konto am Schalter eröffnen', 'Lies einen einfachen Dialog zur Eröffnung eines Bankkontos mit grundlegenden Unterlagen.');

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
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'es', ex->'s_es');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
