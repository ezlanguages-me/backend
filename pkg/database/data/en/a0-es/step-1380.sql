-- ============================================================
-- Seed: A0 English Path – STEP 1380 – Dialogue – ask to change money at a bank (Servicios Financieros y Postales)
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
        '{"character": "Customer", "text": "Hello. Can I change fifty pounds into euros?", "es": "Hola. ¿Puedo cambiar cincuenta libras a euros?", "de": "Hallo. Kann ich fünfzig Pfund in Euro wechseln?"}'::jsonb,
    '{"character": "Teller", "text": "Yes, of course.", "es": "Sí, claro.", "de": "Ja, natürlich."}'::jsonb,
    '{"character": "Customer", "text": "What is the rate today?", "es": "¿Cuál es la tasa hoy?", "de": "Wie ist der Kurs heute?"}'::jsonb,
    '{"character": "Teller", "text": "Today, one pound is one euro and seventeen cents.", "es": "Hoy, una libra es un euro con diecisiete céntimos.", "de": "Heute ist ein Pfund ein Euro und siebzehn Cent."}'::jsonb,
    '{"character": "Customer", "text": "Do you need my passport?", "es": "¿Necesita mi pasaporte?", "de": "Brauchen Sie meinen Reisepass?"}'::jsonb,
    '{"character": "Teller", "text": "Yes, please. I also need your signature here.", "es": "Sí, por favor. También necesito su firma aquí.", "de": "Ja, bitte. Ich brauche auch Ihre Unterschrift hier."}'::jsonb,
    '{"character": "Customer", "text": "Is there a fee?", "es": "¿Hay comisión?", "de": "Gibt es eine Gebühr?"}'::jsonb,
    '{"character": "Teller", "text": "Yes, two euros.", "es": "Sí, dos euros.", "de": "Ja, zwei Euro."}'::jsonb,
    '{"character": "Customer", "text": "That is fine. Can I have a receipt?", "es": "Está bien. ¿Me puede dar un recibo?", "de": "Das ist in Ordnung. Kann ich einen Beleg bekommen?"}'::jsonb,
    '{"character": "Teller", "text": "Yes. Here are your euros and your receipt.", "es": "Sí. Aquí tiene sus euros y su recibo.", "de": "Ja. Hier sind Ihre Euro und Ihr Beleg."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente quiere cambiar cincuenta libras a euros.", "de": "Der Kunde möchte fünfzig Pfund in Euro wechseln.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La cajera dice que una libra vale un euro con diecisiete céntimos.", "de": "Die Mitarbeiterin sagt, dass ein Pfund ein Euro und siebzehn Cent wert ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La cajera no necesita pasaporte.", "de": "Die Mitarbeiterin braucht keinen Reisepass.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "La comisión es de dos euros.", "de": "Die Gebühr beträgt zwei Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El cliente no pide recibo.", "de": "Der Kunde bittet nicht um einen Beleg.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Qué moneda tiene el cliente?", "de": "Welche Währung hat der Kunde?", "s_es": {"type": "multiple_choice", "options": ["Pounds", "Dollars", "Pesos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Pfund", "Dollar", "Pesos"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué pregunta primero?", "de": "Was fragt er zuerst?", "s_es": {"type": "multiple_choice", "options": ["The rate today", "The weather", "The train time"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach dem heutigen Kurs", "Nach dem Wetter", "Nach der Zugzeit"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué documento muestra?", "de": "Welches Dokument zeigt er?", "s_es": {"type": "multiple_choice", "options": ["His passport", "A bus card", "A parcel form"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seinen Reisepass", "Eine Buskarte", "Ein Paketformular"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué más necesita la cajera?", "de": "Was braucht die Mitarbeiterin außerdem?", "s_es": {"type": "multiple_choice", "options": ["A signature", "A photo", "A postcode"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Unterschrift", "Ein Foto", "Eine Postleitzahl"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué recibe al final?", "de": "Was bekommt er am Ende?", "s_es": {"type": "multiple_choice", "options": ["Euros and a receipt", "Only coins", "A bank card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Euro und einen Beleg", "Nur Münzen", "Eine Bankkarte"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1380 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1380 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1380, 'en', 'dialogue', 'financial', '[{"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Teller", "gender": "female", "avatarURL": "https://example.com/avatars/teller.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Pedir cambio de moneda en el banco', 'Lee un diálogo breve para cambiar dinero en la ventanilla del banco.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Nach Geldwechsel in der Bank fragen', 'Lies einen kurzen Dialog zum Geldwechsel am Bankschalter.');

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
