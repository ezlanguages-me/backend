-- ============================================================
-- Seed: A0 English Path – STEP 1220 – Dialogue – exchange simple information with other customers in a queue (Compras y Transacciones)
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
        '{"character": "Customer A", "text": "Excuse me, are you next?", "es": "Perdone, ¿es usted el siguiente?", "pron": "/eks-KIUUS mi, ar iu nekst/", "de": "Entschuldigung, sind Sie als Nächster dran?", "pron_de": "/ent-SHUL-di-gung, zint zi als NÄCHS-ter dran/"}'::jsonb,
        '{"character": "Customer B", "text": "Yes, I am next.", "es": "Sí, yo soy el siguiente.", "pron": "/ies, ai am nekst/", "de": "Ja, ich bin als Nächster dran.", "pron_de": "/ia, ij bin als NÄCHS-ter dran/"}'::jsonb,
        '{"character": "Customer A", "text": "No problem. I only have one loaf of bread.", "es": "No pasa nada. Solo llevo una barra de pan.", "pron": "/nou PRO-blem. ai OUN-li hav uan louf ov bred/", "de": "Kein Problem. Ich habe nur ein Brot.", "pron_de": "/kain PRO-blem. ij HA-be nur ain BROOT/"}'::jsonb,
        '{"character": "Customer B", "text": "If you want, you can go before me.", "es": "Si quiere, puede pasar antes que yo.", "pron": "/if iu uont, iu kan gou bi-FOR mi/", "de": "Wenn Sie möchten, können Sie vor mir gehen.", "pron_de": "/uen zi MÖJ-ten, kö-nen zi for mir GÉ-hen/"}'::jsonb,
        '{"character": "Customer A", "text": "That is very kind. Are you sure?", "es": "Es muy amable. ¿Está seguro?", "pron": "/dat is VE-ri kaind. ar iu shur/", "de": "Das ist sehr nett. Sind Sie sicher?", "pron_de": "/das ist SÉER nett. zint zi ZÍ-cher/"}'::jsonb,
        '{"character": "Customer B", "text": "Yes. I am waiting for a large order.", "es": "Sí. Estoy esperando un pedido grande.", "pron": "/ies. ai am UEI-ting for a lardsh OR-der/", "de": "Ja. Ich warte auf eine große Bestellung.", "pron_de": "/ia. ij VAR-te auf AI-ne GRÓ-se be-SHTEL-lung/"}'::jsonb,
        '{"character": "Customer A", "text": "Thank you very much.", "es": "Muchas gracias.", "pron": "/tank iu VE-ri mach/", "de": "Vielen Dank.", "pron_de": "/FÍ-len dank/"}'::jsonb,
        '{"character": "Customer B", "text": "You are welcome.", "es": "De nada.", "pron": "/iu ar UEL-kom/", "de": "Gern geschehen.", "pron_de": "/gern ge-SHÉ-hen/"}'::jsonb,
        '{"character": "Customer A", "text": "The queue is long this morning.", "es": "La cola es larga esta mañana.", "pron": "/de kiuu is long dis MOR-ning/", "de": "Die Schlange ist heute Morgen lang.", "pron_de": "/di SHLAN-ge ist HÓI-te MOR-gen lang/"}'::jsonb,
        '{"character": "Customer B", "text": "Yes, but the bread is always good here.", "es": "Sí, pero aquí el pan siempre está bueno.", "pron": "/ies, bat de bred is OL-ueis gud hir/", "de": "Ja, aber das Brot hier ist immer gut.", "pron_de": "/ia, A-ber das broot HÍIR ist IM-mer gut/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT uuid FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id));
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id);
    DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT uuid FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id));
    DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id);
    DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1220, 'en', 'dialogue', 'shopping', '[{"name": "Customer A", "gender": "female", "avatarURL": "https://example.com/avatars/customer-a.png"}, {"name": "Customer B", "gender": "male", "avatarURL": "https://example.com/avatars/customer-b.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES
        (v_dialogue_id, 'es', 'Otro cliente en una cola'),
        (v_dialogue_id, 'de', 'Gespräch in der Schlange');

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
