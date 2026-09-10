-- ============================================================
-- Seed: A0 English Path – STEP 1180 – Dialogue – ask for what is required in a shop and understand the reply (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_order SMALLINT := 1;
    line JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Pharmacist", "text": "Good morning. How can I help you?", "es": "Buenos días. ¿En qué puedo ayudarle?", "pron": "/gud MOR-ning. hau kan ai help iu/", "de": "Guten Morgen. Wie kann ich Ihnen helfen?", "pron_de": "/GUU-ten MOR-gen. vi kan ij Í-nen HÉL-fen/"}'::jsonb,
        '{"character": "Customer", "text": "I need sunscreen and a lip balm, please.", "es": "Necesito crema solar y un bálsamo labial, por favor.", "pron": "/ai niid SAN-skriin and a lip bolm, pliis/", "de": "Ich brauche Sonnencreme und einen Lippenbalsam, bitte.", "pron_de": "/ij BRAUJ-e ZO-nen-kré-me und EI-nen LÍ-pen-bal-zam, BÍ-te/"}'::jsonb,
        '{"character": "Pharmacist", "text": "Yes. The sunscreen is here, and the lip balm is next to it.", "es": "Sí. La crema solar está aquí y el bálsamo labial está al lado.", "pron": "/ies. de SAN-skriin is hir, and de lip bolm is nekst tu it/", "de": "Ja. Die Sonnencreme ist hier, und der Lippenbalsam liegt daneben.", "pron_de": "/ia. di ZO-nen-kré-me ist HÍIR, und der LÍ-pen-bal-zam liegt da-NÉ-ben/"}'::jsonb,
        '{"character": "Customer", "text": "Do you have a small sunscreen?", "es": "¿Tiene una crema solar pequeña?", "pron": "/duu iu hav a smol SAN-skriin/", "de": "Haben Sie eine kleine Sonnencreme?", "pron_de": "/HA-ben zi EI-ne KLAI-ne ZO-nen-kré-me/"}'::jsonb,
        '{"character": "Pharmacist", "text": "Yes, this small one is five pounds.", "es": "Sí, esta pequeña cuesta cinco libras.", "pron": "/ies, dis smol uan is faiv paunds/", "de": "Ja, diese kleine kostet fünf Pfund.", "pron_de": "/ia, DÍ-ze KLAI-ne kos-tet FÜNF PFUNT/"}'::jsonb,
        '{"character": "Customer", "text": "And how much is the lip balm?", "es": "¿Y cuánto cuesta el bálsamo labial?", "pron": "/and hau mach is de lip bolm/", "de": "Und wie viel kostet der Lippenbalsam?", "pron_de": "/unt vi-FÍL kos-tet der LÍ-pen-bal-zam/"}'::jsonb,
        '{"character": "Pharmacist", "text": "It is two pounds.", "es": "Cuesta dos libras.", "pron": "/it is tuu paunds/", "de": "Er kostet zwei Pfund.", "pron_de": "/er kos-tet TSVAI PFUNT/"}'::jsonb,
        '{"character": "Customer", "text": "Great. I want one small sunscreen and one lip balm.", "es": "Muy bien. Quiero una crema solar pequeña y un bálsamo labial.", "pron": "/greit. ai uont uan smol SAN-skriin and uan lip bolm/", "de": "Gut. Ich nehme eine kleine Sonnencreme und einen Lippenbalsam.", "pron_de": "/gut. ij NÉ-me EI-ne KLAI-ne ZO-nen-kré-me und EI-nen LÍ-pen-bal-zam/"}'::jsonb,
        '{"character": "Pharmacist", "text": "No problem. Do you want a bag?", "es": "No hay problema. ¿Quiere una bolsa?", "pron": "/nou PRO-blem. duu iu uont a bag/", "de": "Kein Problem. Möchten Sie eine Tasche?", "pron_de": "/kain pro-BLÉEM. MÖJ-ten zi EI-ne TÁ-she/"}'::jsonb,
        '{"character": "Customer", "text": "Yes, please. I pay by card.", "es": "Sí, por favor. Pago con tarjeta.", "pron": "/ies, pliis. ai pei bai kard/", "de": "Ja, bitte. Ich zahle mit Karte.", "pron_de": "/ia, BÍ-te. ij ZÁ-le mit KÁR-te/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT uuid FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id));
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id);
    DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT uuid FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id));
    DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id);
    DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1180 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1180, 'en', 'dialogue', 'shopping', '[{"name": "Pharmacist", "gender": "male", "avatarURL": "https://example.com/avatars/pharmacist.png"}, {"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES
        (v_dialogue_id, 'es', 'Pide productos en una farmacia'),
        (v_dialogue_id, 'de', 'Produkte in einer Apotheke');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_id, 'es', jsonb_build_object('translation', line->>'es', 'pronunciation', line->>'pron')),
            (v_line_id, 'de', jsonb_build_object('translation', line->>'de', 'pronunciation', line->>'pron_de'));

        v_order := v_order + 1;
    END LOOP;
END;
$seed$;
