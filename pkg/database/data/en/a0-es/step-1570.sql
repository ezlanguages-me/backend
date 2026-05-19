-- ============================================================
-- Seed: A0 English Path – STEP 1570 – Reading – with the help of bank personnel, complete a form e.g. for opening an account
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El formulario es para abrir una cuenta.", "p_de": "Das Formular ist für eine Kontoeröffnung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El formulario pide el nombre completo.", "p_de": "Das Formular fragt nach dem vollständigen Namen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay espacio para el código postal.", "p_de": "Es gibt kein Feld für die Postleitzahl.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Puedes elegir entre cuenta básica y de ahorro.", "p_de": "Man kann zwischen Basis- und Sparkonto wählen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El documento de identidad puede ser pasaporte o DNI.", "p_de": "Das Ausweisdokument kann Reisepass oder Personalausweis sein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta prueba de domicilio.", "p_de": "Man braucht keinen Adressnachweis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay una línea para la firma.", "p_de": "Es gibt eine Zeile für die Unterschrift.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que puedes pedir ayuda al personal.", "p_de": "Der Text sagt, dass man das Personal um Hilfe bitten kann.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué escribes en la primera línea?", "p_de": "Was schreibt man in die erste Zeile?", "s": {"type": "multiple_choice", "options": ["Full name", "Tracking number", "Loan office"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de cuenta puedes elegir?", "p_de": "Welche Kontoart kann man wählen?", "s": {"type": "multiple_choice", "options": ["Basic or Savings", "Parcel or Letter", "Bus or Train"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué documentos menciona el formulario?", "p_de": "Welche Dokumente erwähnt das Formular?", "s": {"type": "multiple_choice", "options": ["Passport or National ID card", "Cinema card only", "A stamp book"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes adjuntar además del documento?", "p_de": "Was muss man zusätzlich beilegen?", "s": {"type": "multiple_choice", "options": ["Proof of address", "A postcard", "A suitcase"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué escribes sobre el dinero inicial?", "p_de": "Was schreibt man zum ersten Geldbetrag?", "s": {"type": "multiple_choice", "options": ["First deposit", "Bus fare", "Foreign exchange rate"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo debes escribir?", "p_de": "Wie soll man schreiben?", "s": {"type": "multiple_choice", "options": ["In block letters", "In pencil only", "In very small numbers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si necesitas ayuda?", "p_de": "Was macht man, wenn man Hilfe braucht?", "s": {"type": "multiple_choice", "options": ["Ask staff", "Leave the bank", "Go to the ATM"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A bank form", "A holiday postcard", "A food order"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1570 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1570 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1570, 'en', 'reading', 'banking', 'ACCOUNT OPENING FORM

Full name: ____________________
Date of birth: ____________________
Home address: ____________________
Postcode: ____________________
Phone number: ____________________
Email address: ____________________
Account type: Basic / Savings
ID document: Passport / National ID card
Proof of address attached: Yes / No
First deposit: ____________________
Signature: ____________________

Please write in block letters. Bring the original ID document and one proof of address. Ask staff if you need help.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Formulario para abrir una cuenta', 'Lee un formulario bancario con campos e instrucciones de ayuda.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Formular zur Kontoeröffnung', 'Lies ein Bankformular mit Feldern und Hilfshinweisen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
