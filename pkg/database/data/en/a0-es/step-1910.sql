-- ============================================================
-- Seed: A0 English Path – STEP 1910 – Deck – Supervivencia I (Comida, Bebida y La Cocina) (Vocabulario)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "fridge", "meaning": "nevera / frigorífico", "de": "Kühlschrank", "ex": "The milk is in the fridge.", "pron": "/FRIJ/", "pron_de": "/KUE-lshrank/"}'::jsonb,
        '{"term": "freezer", "meaning": "congelador", "de": "Gefrierschrank", "ex": "The ice cream is in the freezer.", "pron": "/FREE-zer/", "pron_de": "/ge-FRIER-shrank/"}'::jsonb,
        '{"term": "oven", "meaning": "horno", "de": "Ofen", "ex": "The bread is in the oven.", "pron": "/UV-en/", "pron_de": "/O-fen/"}'::jsonb,
        '{"term": "microwave", "meaning": "microondas", "de": "Mikrowelle", "ex": "Heat the soup in the microwave.", "pron": "/MAI-kro-weiv/", "pron_de": "/MI-kro-ve-le/"}'::jsonb,
        '{"term": "kettle", "meaning": "hervidor", "de": "Wasserkocher", "ex": "The kettle is on the counter.", "pron": "/KET-el/", "pron_de": "/VA-ser-ko-kher/"}'::jsonb,
        '{"term": "pan", "meaning": "sartén", "de": "Pfanne", "ex": "Put the eggs in the pan.", "pron": "/PAN/", "pron_de": "/PFAN-e/"}'::jsonb,
        '{"term": "pot", "meaning": "olla", "de": "Topf", "ex": "The soup is in the pot.", "pron": "/POT/", "pron_de": "/TOPF/"}'::jsonb,
        '{"term": "plate", "meaning": "plato", "de": "Teller", "ex": "Put the rice on the plate.", "pron": "/PLEIT/", "pron_de": "/TEL-er/"}'::jsonb,
        '{"term": "bowl", "meaning": "cuenco / bol", "de": "Schüssel", "ex": "The salad is in the bowl.", "pron": "/BOUL/", "pron_de": "/SHUE-sel/"}'::jsonb,
        '{"term": "cup", "meaning": "taza", "de": "Tasse", "ex": "This cup is for tea.", "pron": "/KAP/", "pron_de": "/TA-se/"}'::jsonb,
        '{"term": "glass", "meaning": "vaso", "de": "Glas", "ex": "Can I have a glass of water?", "pron": "/GLAS/", "pron_de": "/GLAS/"}'::jsonb,
        '{"term": "fork", "meaning": "tenedor", "de": "Gabel", "ex": "The fork is next to the plate.", "pron": "/FORK/", "pron_de": "/GA-bel/"}'::jsonb,
        '{"term": "knife", "meaning": "cuchillo", "de": "Messer", "ex": "Use the knife carefully.", "pron": "/NAIF/", "pron_de": "/MES-er/"}'::jsonb,
        '{"term": "spoon", "meaning": "cuchara", "de": "Löffel", "ex": "The spoon is in the drawer.", "pron": "/SPUUN/", "pron_de": "/LOE-fel/"}'::jsonb,
        '{"term": "chopsticks", "meaning": "palillos", "de": "Essstäbchen", "ex": "I eat rice with chopsticks.", "pron": "/CHOP-stiks/", "pron_de": "/ES-shteb-khen/"}'::jsonb,
        '{"term": "cutting board", "meaning": "tabla de cortar", "de": "Schneidebrett", "ex": "The onion is on the cutting board.", "pron": "/KAT-ing bord/", "pron_de": "/SHNAI-de-bret/"}'::jsonb,
        '{"term": "recipe", "meaning": "receta", "de": "Rezept", "ex": "This recipe is very easy.", "pron": "/RES-uh-pee/", "pron_de": "/re-TSEPT/"}'::jsonb,
        '{"term": "ingredient", "meaning": "ingrediente", "de": "Zutat", "ex": "Salt is an ingredient.", "pron": "/in-GREE-dee-ent/", "pron_de": "/TSU-taat/"}'::jsonb,
        '{"term": "cook", "meaning": "cocinar", "de": "kochen", "ex": "I cook dinner every day.", "pron": "/KUK/", "pron_de": "/KO-khen/"}'::jsonb,
        '{"term": "boil", "meaning": "hervir", "de": "kochen", "ex": "Boil the water first.", "pron": "/BOIL/", "pron_de": "/KO-khen/"}'::jsonb,
        '{"term": "fry", "meaning": "freír", "de": "braten", "ex": "Do not fry the fish too long.", "pron": "/FRAI/", "pron_de": "/BRA-ten/"}'::jsonb,
        '{"term": "bake", "meaning": "hornear", "de": "backen", "ex": "We bake bread on Sundays.", "pron": "/BEIK/", "pron_de": "/BA-ken/"}'::jsonb,
        '{"term": "mix", "meaning": "mezclar", "de": "mischen", "ex": "Mix the eggs and milk.", "pron": "/MIKS/", "pron_de": "/MI-shen/"}'::jsonb,
        '{"term": "pour", "meaning": "verter", "de": "gießen", "ex": "Pour the soup into the bowl.", "pron": "/POR/", "pron_de": "/GII-sen/"}'::jsonb,
        '{"term": "spicy", "meaning": "picante", "de": "scharf", "ex": "This sauce is spicy.", "pron": "/SPAI-see/", "pron_de": "/SHARF/"}'::jsonb,
        '{"term": "sweet", "meaning": "dulce", "de": "süß", "ex": "The cake is very sweet.", "pron": "/SWIIT/", "pron_de": "/ZUESS/"}'::jsonb,
        '{"term": "salty", "meaning": "salado", "de": "salzig", "ex": "The soup is too salty.", "pron": "/SOL-tee/", "pron_de": "/ZAL-tsig/"}'::jsonb,
        '{"term": "bitter", "meaning": "amargo", "de": "bitter", "ex": "The coffee tastes bitter.", "pron": "/BIT-er/", "pron_de": "/BIT-er/"}'::jsonb,
        '{"term": "sour", "meaning": "agrio", "de": "sauer", "ex": "The lemon is sour.", "pron": "/SAU-er/", "pron_de": "/ZAU-er/"}'::jsonb,
        '{"term": "portion", "meaning": "ración", "de": "Portion", "ex": "This portion is very big.", "pron": "/POR-shun/", "pron_de": "/por-TSION/"}'::jsonb,
        '{"term": "serve", "meaning": "servir", "de": "servieren", "ex": "Serve the food hot.", "pron": "/SERV/", "pron_de": "/zer-VI-ren/"}'::jsonb,
        '{"term": "leftovers", "meaning": "sobras", "de": "Reste", "ex": "Put the leftovers in the fridge.", "pron": "/LEFT-o-verz/", "pron_de": "/RES-te/"}'::jsonb,
        '{"term": "packaged food", "meaning": "comida envasada", "de": "verpacktes Essen", "ex": "Packaged food is on the top shelf.", "pron": "/PAK-idjd fuud/", "pron_de": "/fer-PAK-tes ES-sen/"}'::jsonb,
        '{"term": "tin", "meaning": "lata", "de": "Dose", "ex": "The beans are in a tin.", "pron": "/TIN/", "pron_de": "/DO-ze/"}'::jsonb,
        '{"term": "can", "meaning": "lata", "de": "Dose", "ex": "Open the can carefully.", "pron": "/KAN/", "pron_de": "/DO-ze/"}'::jsonb,
        '{"term": "jar", "meaning": "tarro", "de": "Glas / Glasbehälter", "ex": "The jam is in a jar.", "pron": "/JAR/", "pron_de": "/GLAS/"}'::jsonb,
        '{"term": "counter", "meaning": "encimera", "de": "Küchentheke", "ex": "Put the cup on the counter.", "pron": "/KAUN-ter/", "pron_de": "/KYU-khen-te-ke/"}'::jsonb,
        '{"term": "shelf", "meaning": "estante", "de": "Regal", "ex": "The plates are on the shelf.", "pron": "/SHELF/", "pron_de": "/re-GAAL/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1910 AND path_uuid = v_path_id;
    INSERT INTO deck (path_uuid, step_order, source_language, type) VALUES (v_path_id, 1910, 'en', 'deck') RETURNING uuid INTO v_deck_id;
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'es', 'Supervivencia I (Comida, Bebida y La Cocina)', 'Vocabulario básico de cocina, utensilios, sabores y comida de supervivencia.');
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'de', 'Überleben I (Essen, Trinken und die Küche)', 'Grundwortschatz zu Küche, Utensilien, Geschmäckern und einfachem Essen für den Alltag.');
    FOREACH card IN ARRAY v_cards LOOP
        INSERT INTO word (term, is_root, source_language, example) VALUES (card->>'term', TRUE, 'en', card->>'ex') RETURNING uuid INTO v_word_id;
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');
        INSERT INTO deck_words (deck_uuid, word_uuid) VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
