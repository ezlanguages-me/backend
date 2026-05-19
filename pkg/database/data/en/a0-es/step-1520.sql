-- ============================================================
-- Seed: A0 English Path – STEP 1520 – Reading – deal effectively with most routine transactions in a bank or post office (Servicios Financieros y Postales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El mostrador A es para ingresos y retiradas de efectivo.", "p_de": "Schalter A ist für Einzahlungen und Barauszahlungen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mostrador B es para transferencias y extractos en papel.", "p_de": "Schalter B ist für Überweisungen und Papierauszüge.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mostrador C es para préstamos bancarios.", "p_de": "Schalter C ist für Bankkredite.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que coger un número antes de esperar por servicios bancarios.", "p_de": "Man muss vor Bankdiensten eine Nummer ziehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las transferencias de más de 200 euros necesitan identificación.", "p_de": "Überweisungen über 200 Euro brauchen einen Ausweis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El formulario del paquete se completa después de ir al mostrador C.", "p_de": "Das Paketformular wird erst nach Schalter C ausgefüllt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que guardar el recibo después de cada operación.", "p_de": "Man soll nach jedem Vorgang den Beleg aufbewahren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay un cajero automático en el vestíbulo.", "p_de": "Im Eingangsbereich gibt es einen Geldautomaten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Para qué es el mostrador A?", "p_de": "Wofür ist Schalter A?", "s": {"type": "multiple_choice", "options": ["Cash deposits and cash withdrawals", "Parcel tracking only", "Coffee breaks"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué es el mostrador B?", "p_de": "Wofür ist Schalter B?", "s": {"type": "multiple_choice", "options": ["Transfers, balance checks, and paper statements", "Registered mail", "School exams"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué es el mostrador C?", "p_de": "Wofür ist Schalter C?", "s": {"type": "multiple_choice", "options": ["Stamps, letters, and parcels", "Savings accounts", "Hotel check-in"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces antes de esperar por un servicio bancario?", "p_de": "Was macht man vor dem Warten auf einen Bankservice?", "s": {"type": "multiple_choice", "options": ["Take a ticket", "Buy a postcard", "Call a taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo muestras el documento de identidad?", "p_de": "Wann zeigt man den Ausweis?", "s": {"type": "multiple_choice", "options": ["For transfers above 200 euros", "For buying one stamp", "For reading a sign"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo completas el formulario del paquete?", "p_de": "Wann füllt man das Paketformular aus?", "s": {"type": "multiple_choice", "options": ["Before going to Counter C", "After going home", "On the train"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el cajero automático?", "p_de": "Wo ist der Geldautomat?", "s": {"type": "multiple_choice", "options": ["In the lobby", "On the roof", "In a classroom"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve el mostrador de atención al cliente?", "p_de": "Wofür ist der Kundendienstschalter?", "s": {"type": "multiple_choice", "options": ["For address changes", "For parcel collection only", "For lunch orders"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1520 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1520 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1520, 'en', 'reading', 'financial', 'Central Services Notice

Bank Counter A is for cash deposits and cash withdrawals. Bank Counter B is for transfers, balance checks, and paper statements. Postal Counter C is for stamps, letters, and parcels.

Please take a ticket before you wait for bank service. Show your ID for transfers above 200 euros. Fill in the parcel form before you go to Postal Counter C.

Keep your receipt after every transaction. There is also an ATM in the lobby and a customer service desk for address changes.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Procedimientos habituales en banco y correos', 'Lee un aviso práctico con trámites rutinarios de banco y oficina de correos.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Übliche Abläufe in Bank und Post', 'Lies einen praktischen Hinweis mit routinemäßigen Vorgängen in Bank und Post.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
