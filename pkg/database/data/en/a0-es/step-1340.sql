-- ============================================================
-- Seed: A0 English Path – STEP 1340 – Dialogue – ask for simple post office services (Servicios Financieros y Postales)
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
        '{"character": "Customer", "text": "Good morning. I want to send this letter to Mexico.", "es": "Buenos días. Quiero enviar esta carta a México.", "de": "Guten Morgen. Ich möchte diesen Brief nach Mexiko schicken."}'::jsonb,
    '{"character": "Clerk", "text": "Good morning. Standard or priority?", "es": "Buenos días. ¿Normal o prioritario?", "de": "Guten Morgen. Standard oder Priority?"}'::jsonb,
    '{"character": "Customer", "text": "Standard, please.", "es": "Normal, por favor.", "de": "Standard, bitte."}'::jsonb,
    '{"character": "Clerk", "text": "You need two stamps for Mexico.", "es": "Necesita dos sellos para México.", "de": "Sie brauchen zwei Briefmarken für Mexiko."}'::jsonb,
    '{"character": "Customer", "text": "Can I buy an envelope too?", "es": "¿Puedo comprar también un sobre?", "de": "Kann ich auch einen Umschlag kaufen?"}'::jsonb,
    '{"character": "Clerk", "text": "Yes. The small envelope is fifty pence.", "es": "Sí. El sobre pequeño cuesta cincuenta peniques.", "de": "Ja. Der kleine Umschlag kostet fünfzig Pence."}'::jsonb,
    '{"character": "Customer", "text": "Can you check the address, please?", "es": "¿Puede comprobar la dirección, por favor?", "de": "Können Sie bitte die Adresse prüfen?"}'::jsonb,
    '{"character": "Clerk", "text": "Yes. Please add the postcode here.", "es": "Sí. Añada aquí el código postal, por favor.", "de": "Ja. Bitte tragen Sie hier die Postleitzahl ein."}'::jsonb,
    '{"character": "Customer", "text": "Thank you. Can I pay by card?", "es": "Gracias. ¿Puedo pagar con tarjeta?", "de": "Danke. Kann ich mit Karte bezahlen?"}'::jsonb,
    '{"character": "Clerk", "text": "Yes, of course.", "es": "Sí, claro.", "de": "Ja, natürlich."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "La clienta quiere enviar una carta a México.", "de": "Die Kundin möchte einen Brief nach Mexiko schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El empleado ofrece servicio estándar o prioritario.", "de": "Der Mitarbeiter bietet Standard oder Priority an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La clienta necesita tres sellos.", "de": "Die Kundin braucht drei Briefmarken.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "El sobre pequeño cuesta cincuenta peniques.", "de": "Der kleine Umschlag kostet fünfzig Pence.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La clienta paga en efectivo al final.", "de": "Die Kundin bezahlt am Ende bar.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Adónde va la carta?", "de": "Wohin geht der Brief?", "s_es": {"type": "multiple_choice", "options": ["A México", "A Chile", "A Canadá"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach Mexiko", "Nach Chile", "Nach Kanada"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué servicio elige la clienta?", "de": "Welchen Service wählt die Kundin?", "s_es": {"type": "multiple_choice", "options": ["Standard", "Priority", "Express before noon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Standard", "Priority", "Express vor Mittag"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debe añadir la clienta?", "de": "Was muss die Kundin ergänzen?", "s_es": {"type": "multiple_choice", "options": ["The postcode", "The hotel number", "The train platform"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Postleitzahl", "Die Hotelnummer", "Das Bahngleis"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué compra además de los sellos?", "de": "Was kauft sie außer den Briefmarken?", "s_es": {"type": "multiple_choice", "options": ["A small envelope", "A newspaper", "A coffee"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen kleinen Umschlag", "Eine Zeitung", "Einen Kaffee"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo quiere pagar la clienta?", "de": "Wie möchte die Kundin bezahlen?", "s_es": {"type": "multiple_choice", "options": ["By card", "By bank transfer", "By phone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte", "Per Überweisung", "Per Telefon"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1340 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1340 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1340, 'en', 'dialogue', 'postal', '[{"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Clerk", "gender": "male", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Enviar una carta por correos', 'Lee un diálogo corto en la ventanilla para enviar una carta internacional.');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Einen Brief aufgeben', 'Lies einen kurzen Dialog am Schalter zum Versenden eines internationalen Briefes.');

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
