-- ============================================================
-- Seed: A0 English Path – STEP 1180 – Dialogue – ask for what is required in a shop and understand the reply (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Pharmacist", "text": "Good morning. How can I help you?", "es": "Buenos días. ¿En qué puedo ayudarla?", "de": "Guten Morgen. Wie kann ich Ihnen helfen?"}'::jsonb,
        '{"character": "Customer", "text": "I need sunscreen and a lip balm, please.", "es": "Necesito crema solar y un bálsamo labial, por favor.", "de": "Ich brauche Sonnencreme und einen Lippenbalsam, bitte."}'::jsonb,
        '{"character": "Pharmacist", "text": "Yes. The sunscreen is here, and the lip balm is next to it.", "es": "Sí. La crema solar está aquí y el bálsamo labial está al lado.", "de": "Ja. Die Sonnencreme ist hier, und der Lippenbalsam liegt daneben."}'::jsonb,
        '{"character": "Customer", "text": "Do you have a small sunscreen?", "es": "¿Tiene una crema solar pequeña?", "de": "Haben Sie eine kleine Sonnencreme?"}'::jsonb,
        '{"character": "Pharmacist", "text": "Yes, this small one is five pounds.", "es": "Sí, esta pequeña cuesta cinco libras.", "de": "Ja, diese kleine kostet fünf Pfund."}'::jsonb,
        '{"character": "Customer", "text": "And how much is the lip balm?", "es": "¿Y cuánto cuesta el bálsamo labial?", "de": "Und wie viel kostet der Lippenbalsam?"}'::jsonb,
        '{"character": "Pharmacist", "text": "It is two pounds.", "es": "Cuesta dos libras.", "de": "Er kostet zwei Pfund."}'::jsonb,
        '{"character": "Customer", "text": "Great. I want one small sunscreen and one lip balm.", "es": "Muy bien. Quiero una crema solar pequeña y un bálsamo labial.", "de": "Gut. Ich nehme eine kleine Sonnencreme und einen Lippenbalsam."}'::jsonb,
        '{"character": "Pharmacist", "text": "No problem. Do you want a bag?", "es": "No hay problema. ¿Quiere una bolsa?", "de": "Kein Problem. Möchten Sie eine Tasche?"}'::jsonb,
        '{"character": "Customer", "text": "Yes, please. I pay by card.", "es": "Sí, por favor. Pago con tarjeta.", "de": "Ja, bitte. Ich zahle mit Karte."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "La clienta necesita crema solar y bálsamo labial.", "de": "Die Kundin braucht Sonnencreme und Lippenbalsam.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El bálsamo labial está lejos de la crema solar.", "de": "Der Lippenbalsam ist weit weg von der Sonnencreme.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La crema solar pequeña cuesta cinco libras.", "de": "Die kleine Sonnencreme kostet fünf Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El bálsamo labial cuesta tres libras.", "de": "Der Lippenbalsam kostet drei Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La clienta paga con tarjeta.", "de": "Die Kundin zahlt mit Karte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tamaño de crema solar quiere la clienta?", "de": "Welche Größe Sonnencreme möchte die Kundin?", "s_es": {"type": "multiple_choice", "options": ["Small", "Large", "Family size"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Klein", "Groß", "Familiengröße"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la crema solar pequeña?", "de": "Wie viel kostet die kleine Sonnencreme?", "s_es": {"type": "multiple_choice", "options": ["Five pounds", "Two pounds", "Six pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Pfund", "Zwei Pfund", "Sechs Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el bálsamo labial?", "de": "Wie viel kostet der Lippenbalsam?", "s_es": {"type": "multiple_choice", "options": ["Two pounds", "One pound", "Four pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Pfund", "Ein Pfund", "Vier Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ofrece el farmacéutico al final?", "de": "Was bietet der Apotheker am Ende an?", "s_es": {"type": "multiple_choice", "options": ["A bag", "A discount card", "A bottle of water"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Tasche", "Eine Rabattkarte", "Eine Flasche Wasser"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo paga la clienta?", "de": "Wie bezahlt die Kundin?", "s_es": {"type": "multiple_choice", "options": ["By card", "By cash", "By phone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte", "Mit Bargeld", "Mit dem Handy"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1180, 'en', 'dialogue', 'shopping', '[{"name": "Pharmacist", "gender": "male", "avatarURL": "https://example.com/avatars/pharmacist.png"}, {"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pide productos en una farmacia', 'Lee un diálogo simple en el que una clienta pide crema solar y bálsamo labial.'),
        (v_dialogue_id, 'de', 'Bitte um Produkte in einer Apotheke', 'Lies einen einfachen Dialog, in dem eine Kundin Sonnencreme und Lippenbalsam verlangt.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
