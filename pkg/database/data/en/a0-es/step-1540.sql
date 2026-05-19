-- ============================================================
-- Seed: A0 English Path – STEP 1540 – Dialogue – deal effectively with routine bank/post office transactions
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
        '{"character": "Customer", "text": "Hello. I need two stamps and I want to send this small parcel.", "es": "Hola. Necesito dos sellos y quiero enviar este paquete pequeño.", "de": "Hallo. Ich brauche zwei Briefmarken und möchte dieses kleine Paket schicken."}'::jsonb,
    '{"character": "Clerk", "text": "Of course. Please put the parcel on the scale.", "es": "Claro. Ponga el paquete en la báscula, por favor.", "de": "Natürlich. Bitte legen Sie das Paket auf die Waage."}'::jsonb,
    '{"character": "Customer", "text": "How much is it?", "es": "¿Cuánto es?", "de": "Wie viel kostet es?"}'::jsonb,
    '{"character": "Clerk", "text": "The parcel is six euros and the two stamps are one euro.", "es": "El paquete cuesta seis euros y los dos sellos, un euro.", "de": "Das Paket kostet sechs Euro und die zwei Briefmarken einen Euro."}'::jsonb,
    '{"character": "Customer", "text": "Can I pay by card?", "es": "¿Puedo pagar con tarjeta?", "de": "Kann ich mit Karte bezahlen?"}'::jsonb,
    '{"character": "Clerk", "text": "Yes, you can.", "es": "Sí, puede.", "de": "Ja, das können Sie."}'::jsonb,
    '{"character": "Customer", "text": "Do I get a receipt?", "es": "¿Recibo un recibo?", "de": "Bekomme ich einen Beleg?"}'::jsonb,
    '{"character": "Clerk", "text": "Yes. Here is your receipt and the tracking number.", "es": "Sí. Aquí tiene su recibo y el número de seguimiento.", "de": "Ja. Hier sind Ihr Beleg und die Sendungsnummer."}'::jsonb,
    '{"character": "Customer", "text": "Great. Thank you very much.", "es": "Perfecto. Muchas gracias.", "de": "Super. Vielen Dank."}'::jsonb,
    '{"character": "Clerk", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "La clienta quiere dos sellos y enviar un paquete pequeño.", "de": "Die Kundin möchte zwei Briefmarken und ein kleines Paket schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El empleado pide poner el paquete en la báscula.", "de": "Der Mitarbeiter bittet darum, das Paket auf die Waage zu legen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El paquete cuesta tres euros.", "de": "Das Paket kostet drei Euro.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "La clienta puede pagar con tarjeta.", "de": "Die Kundin kann mit Karte bezahlen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El empleado entrega recibo y número de seguimiento.", "de": "Der Mitarbeiter gibt Beleg und Sendungsnummer.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto cuestan los dos sellos?", "de": "Wie viel kosten die zwei Briefmarken?", "s_es": {"type": "multiple_choice", "options": ["One euro", "Six euros", "Ten euros"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Euro", "Sechs Euro", "Zehn Euro"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué hace primero la clienta con el paquete?", "de": "Was macht die Kundin zuerst mit dem Paket?", "s_es": {"type": "multiple_choice", "options": ["She puts it on the scale", "She opens it", "She leaves it outside"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie legt es auf die Waage", "Sie öffnet es", "Sie lässt es draußen"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo paga?", "de": "Wie bezahlt sie?", "s_es": {"type": "multiple_choice", "options": ["By card", "By bank transfer", "By phone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte", "Per Überweisung", "Per Telefon"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué recibe además del recibo?", "de": "Was bekommt sie außer dem Beleg?", "s_es": {"type": "multiple_choice", "options": ["A tracking number", "A debit card", "A bank statement"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Sendungsnummer", "Eine Debitkarte", "Einen Kontoauszug"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué tipo de situación es?", "de": "Was für eine Situation ist das?", "s_es": {"type": "multiple_choice", "options": ["A routine post office transaction", "A hotel reservation", "A classroom lesson"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Routinevorgang bei der Post", "Eine Hotelreservierung", "Eine Unterrichtsstunde"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1540 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1540 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1540, 'en', 'dialogue', 'financial', '[{"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Clerk", "gender": "male", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Hacer una operación rutinaria en correos', 'Lee un diálogo simple para hacer una operación corriente en la oficina de correos.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Einen Routinevorgang bei der Post erledigen', 'Lies einen einfachen Dialog für einen normalen Vorgang in der Postfiliale.');

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
