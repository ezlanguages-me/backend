-- ============================================================
-- Seed: A0 English Path – STEP 1140 – Dialogue – go to a department store to buy what is required (Compras y Transacciones)
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
        '{"character": "Shop assistant", "text": "Hello. Can I help you?", "es": "Hola. ¿Puedo ayudarle?", "pron": "/hé-lou. kan ai help iu/", "de": "Hallo. Kann ich Ihnen helfen?", "pron_de": "/já-lo. kan ij Í-nen hél-fen/"}'::jsonb,
        '{"character": "Customer", "text": "Yes, please. I need a warm blue jacket.", "es": "Sí, por favor. Necesito una chaqueta azul y abrigada.", "pron": "/ies, pliis. ai niid a uorm bluu dyá-ket/", "de": "Ja, bitte. Ich brauche eine warme blaue Jacke.", "pron_de": "/ia, bí-te. ij BRAUJ-e EI-ne UÁR-me BLAU-e YÁ-ke/"}'::jsonb,
        '{"character": "Shop assistant", "text": "The jackets are on this floor, next to the scarves.", "es": "Las chaquetas están en esta planta, junto a las bufandas.", "pron": "/de dyá-kets ar on dis floor, nekst tu de skarvs/", "de": "Die Jacken sind auf dieser Etage, neben den Schals.", "pron_de": "/di YÁ-ken zint auf DÍ-zer E-ta-ge, NÉ-ben den SHALS/"}'::jsonb,
        '{"character": "Customer", "text": "Do you have size small?", "es": "¿Tiene talla pequeña?", "pron": "/duu iu hav sais smol/", "de": "Haben Sie Größe S?", "pron_de": "/HA-ben zi GRÖ-se es/"}'::jsonb,
        '{"character": "Shop assistant", "text": "Yes. Here is a small blue jacket.", "es": "Sí. Aquí tiene una chaqueta azul de talla pequeña.", "pron": "/ies. hir is a smol bluu dyá-ket/", "de": "Ja. Hier ist eine blaue Jacke in Größe S.", "pron_de": "/ia. HÍIR ist EI-ne BLAU-e YÁ-ke in GRÖ-se es/"}'::jsonb,
        '{"character": "Customer", "text": "Can I try it on?", "es": "¿Puedo probármela?", "pron": "/kan ai trai it on/", "de": "Kann ich sie anprobieren?", "pron_de": "/kan ij zi AN-pro-bíi-ren/"}'::jsonb,
        '{"character": "Shop assistant", "text": "Of course. The fitting room is behind that mirror.", "es": "Claro. El probador está detrás de ese espejo.", "pron": "/of kors. de fí-ting ruum is bi-háind dat mí-ror/", "de": "Natürlich. Die Umkleide ist hinter diesem Spiegel.", "pron_de": "/na-TÜÜ-rlij. di UM-klai-de ist HÍN-ter DÍ-zem SHPÍI-gel/"}'::jsonb,
        '{"character": "Customer", "text": "Great. How much is it?", "es": "Genial. ¿Cuánto cuesta?", "pron": "/greit. hau mach is it/", "de": "Super. Wie viel kostet sie?", "pron_de": "/ZU-per. vi-FÍL kos-tet zi/"}'::jsonb,
        '{"character": "Shop assistant", "text": "It is twenty-eight pounds today.", "es": "Hoy cuesta veintiocho libras.", "pron": "/it is TUEN-ti-eit paunds tu-DÉI/", "de": "Heute kostet sie achtundzwanzig Pfund.", "pron_de": "/HÁI-te kos-tet zi ACHT-unt-TSVÁNTS-ij PFUNT/"}'::jsonb,
        '{"character": "Customer", "text": "Perfect. I will take it and pay by card.", "es": "Perfecto. Me la llevo y pago con tarjeta.", "pron": "/pér-fekt. ai uil teik it and pei bai kard/", "de": "Perfekt. Ich nehme sie und zahle mit Karte.", "pron_de": "/PÉR-fekt. ij NÉ-me zi und ZÁ-le mit KÁR-te/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT uuid FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id));
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id);
    DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT uuid FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id));
    DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id);
    DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1140, 'en', 'dialogue', 'shopping', '[{"name": "Shop assistant", "gender": "female", "avatarURL": "https://example.com/avatars/shop-assistant.png"}, {"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES
        (v_dialogue_id, 'es', 'Chaqueta en unos grandes almacenes'),
        (v_dialogue_id, 'de', 'Jacke in einem Kaufhaus');

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
