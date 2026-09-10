-- ============================================================
-- Seed: A0 English Path – STEP 1300 – Dialogue – understand where the shopkeeper explains the difference between two or more products (Compras y Transacciones)
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
        '{"character": "Sales assistant", "text": "Hello. Are you choosing between these two backpacks?", "es": "Hola. ¿Está eligiendo entre estas dos mochilas?", "pron": "/hé-lou. ar iu CHIIU-sing bi-TUIIN diiz tuu BÁK-paks/", "de": "Hallo. Wählen Sie zwischen diesen beiden Rucksäcken?", "pron_de": "/já-lo. UÄ-len zi TSVISH-en DÍ-zen TSVAI ROOK-zä-ken/"}'::jsonb,
        '{"character": "Customer", "text": "Yes, please. What is the difference?", "es": "Sí, por favor. ¿Cuál es la diferencia?", "pron": "/ies, pliis. uat is de DÍF-rens/", "de": "Ja, bitte. Was ist der Unterschied?", "pron_de": "/ia, BÍ-te. uas ist der UN-ter-shíit/"}'::jsonb,
        '{"character": "Sales assistant", "text": "This black backpack is smaller and lighter.", "es": "Esta mochila negra es más pequeña y más ligera.", "pron": "/dis blak BÁK-pak is SMO-ler and LAÍ-ter/", "de": "Dieser schwarze Rucksack ist kleiner und leichter.", "pron_de": "/DÍ-zer SHVARTS-e ROOK-zak ist KLÁI-ner und LAÍJ-ter/"}'::jsonb,
        '{"character": "Sales assistant", "text": "This grey backpack is bigger and has three pockets.", "es": "Esta mochila gris es más grande y tiene tres bolsillos.", "pron": "/dis grei BÁK-pak is BÍ-ger and has thrii PO-kets/", "de": "Dieser graue Rucksack ist größer und hat drei Taschen.", "pron_de": "/DÍ-zer GRAU-e ROOK-zak ist GRÖ-ser und hat drai TA-shen/"}'::jsonb,
        '{"character": "Customer", "text": "I carry books and sports clothes every day.", "es": "Llevo libros y ropa de deporte todos los días.", "pron": "/ai KÁ-ri buks and sports kloudz É-vri dei/", "de": "Ich trage jeden Tag Bücher und Sportsachen.", "pron_de": "/ij TRÁ-ge YÉ-den tag BÜ-cher und SPORT-za-chen/"}'::jsonb,
        '{"character": "Sales assistant", "text": "Then the grey backpack is better for you.", "es": "Entonces la mochila gris es mejor para usted.", "pron": "/den de grei BÁK-pak is BÉ-ter for iu/", "de": "Dann ist der graue Rucksack besser für Sie.", "pron_de": "/dan ist der GRAU-e ROOK-zak BÉ-ser für zi/"}'::jsonb,
        '{"character": "Customer", "text": "Is it much more expensive?", "es": "¿Es mucho más cara?", "pron": "/is it mach mor eks-PEN-siv/", "de": "Ist er viel teurer?", "pron_de": "/ist er fíil TÖI-rer/"}'::jsonb,
        '{"character": "Sales assistant", "text": "Not much. The black one is eighteen pounds, and the grey one is twenty-six.", "es": "No mucho. La negra cuesta dieciocho libras y la gris veintiséis.", "pron": "/not mach. de blak uan is EI-TÍIN paunds, and de grei uan is TUEN-ti-siks/", "de": "Nicht viel. Der schwarze kostet achtzehn Pfund und der graue sechsundzwanzig.", "pron_de": "/niJt fíil. der SHVARTS-e kos-tet ACHT-tséen pfunt und der GRAU-e SECHS-und-TSVÁNTS-ij/"}'::jsonb,
        '{"character": "Customer", "text": "I see. I think the grey backpack is the best option.", "es": "Ya veo. Creo que la mochila gris es la mejor opción.", "pron": "/ai sii. ai think de grei BÁK-pak is de best OP-shon/", "de": "Ich verstehe. Ich denke, der graue Rucksack ist die beste Option.", "pron_de": "/ij fer-SHTÉ-he. ij DEN-ke, der GRAU-e ROOK-zak ist di BES-te op-TSI-on/"}'::jsonb,
        '{"character": "Sales assistant", "text": "Good choice. It is stronger too.", "es": "Buena elección. Además es más resistente.", "pron": "/gud chois. it is STRON-ger tuu/", "de": "Gute Wahl. Er ist auch stabiler.", "pron_de": "/GUU-te vaal. er ist auch shta-BÍ-ler/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT uuid FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id));
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id);
    DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT uuid FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id));
    DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id);
    DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1300 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1300, 'en', 'dialogue', 'shopping', '[{"name": "Sales assistant", "gender": "female", "avatarURL": "https://example.com/avatars/sales-assistant.png"}, {"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title)
    VALUES
        (v_dialogue_id, 'es', 'Mochilas con el dependiente'),
        (v_dialogue_id, 'de', 'Rucksäcke mit dem Verkäufer');

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
