-- ============================================================
-- Seed: A0 English Path – STEP 1260 – Dialogue – understand a counter-service shop where items are requested and served by a shopkeeper (Compras y Transacciones)
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
        '{"character": "Shopkeeper", "text": "Good afternoon. What would you like?", "es": "Buenas tardes. ¿Qué desea?", "pron": "/gud af-ter-NUUN. uat ud iu laik/", "de": "Guten Tag. Was möchten Sie?", "pron_de": "/GUU-ten tag. uas MÖJ-ten zi/"}'::jsonb,
        '{"character": "Customer", "text": "I would like two hundred grams of cheese, please.", "es": "Quisiera doscientos gramos de queso, por favor.", "pron": "/ai ud laik tuu HAN-dred gramz ov chiiz, pliis/", "de": "Ich hätte gern zweihundert Gramm Käse, bitte.", "pron_de": "/ij HÄ-te gern TSVAI-hun-dert gramm KÄ-ze, BÍ-te/"}'::jsonb,
        '{"character": "Shopkeeper", "text": "Of course. Mild cheese or strong cheese?", "es": "Claro. ¿Queso suave o fuerte?", "pron": "/of kors. maild chiiz or strong chiiz/", "de": "Gern. Milder Käse oder kräftiger Käse?", "pron_de": "/gern. MÍL-der KÄ-ze O-der KRÄF-ti-ger KÄ-ze/"}'::jsonb,
        '{"character": "Customer", "text": "Mild cheese, please.", "es": "Queso suave, por favor.", "pron": "/maild chiiz, pliis/", "de": "Milden Käse, bitte.", "pron_de": "/MÍL-den KÄ-ze, BÍ-te/"}'::jsonb,
        '{"character": "Shopkeeper", "text": "Anything else?", "es": "¿Algo más?", "pron": "/É-ni-ting els/", "de": "Noch etwas?", "pron_de": "/noh ET-uas/"}'::jsonb,
        '{"character": "Customer", "text": "Yes, four slices of ham.", "es": "Sí, cuatro lonchas de jamón.", "pron": "/ies, for SLAI-ses ov ham/", "de": "Ja, vier Scheiben Schinken.", "pron_de": "/ia, fíir SHAI-ben SHIN-ken/"}'::jsonb,
        '{"character": "Shopkeeper", "text": "No problem. I put the cheese and ham in one bag.", "es": "No hay problema. Pongo el queso y el jamón en una sola bolsa.", "pron": "/nou PRO-blem. ai put de chiiz and ham in uan bag/", "de": "Kein Problem. Ich packe Käse und Schinken in eine Tasche.", "pron_de": "/kain PRO-blem. ij PA-ke KÄ-ze und SHIN-ken in AI-ne TA-she/"}'::jsonb,
        '{"character": "Customer", "text": "Thank you. How much is it?", "es": "Gracias. ¿Cuánto es?", "pron": "/tank iu. hau mach is it/", "de": "Danke. Wie viel kostet es?", "pron_de": "/DAN-ke. vi-FÍL kos-tet es/"}'::jsonb,
        '{"character": "Shopkeeper", "text": "It is six pounds fifty.", "es": "Son seis libras con cincuenta.", "pron": "/it is siks paunds FIF-ti/", "de": "Es kostet sechs Pfund fünfzig.", "pron_de": "/es kos-tet SECHS pfunt FÜNF-tsig/"}'::jsonb,
        '{"character": "Customer", "text": "Great. I pay here, right?", "es": "Muy bien. Pago aquí, ¿verdad?", "pron": "/greit. ai pei hir, rait/", "de": "Gut. Ich bezahle hier, oder?", "pron_de": "/gut. ij be-ZÁ-le HÍIR, O-der/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT uuid FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id));
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id);
    DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT uuid FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id));
    DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id);
    DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1260, 'en', 'dialogue', 'shopping', '[{"name": "Shopkeeper", "gender": "female", "avatarURL": "https://example.com/avatars/shopkeeper.png"}, {"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES
        (v_dialogue_id, 'es', 'Pide queso en un mostrador'),
        (v_dialogue_id, 'de', 'Käse an einer Feinkosttheke');

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
