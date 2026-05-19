-- ============================================================
-- Seed: A0 English Path – STEP 1760 – Deck – El Entorno Inmediato III (Ropa y Accesorios) (Vocabulario)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "shirt", "meaning": "camisa", "de": "Hemd", "ex": "This shirt is blue.", "pron": "/SHERT/", "pron_de": "/HEMT/"}'::jsonb,
        '{"term": "trousers", "meaning": "pantalones", "de": "Hose", "ex": "These trousers are black.", "pron": "/TROU-zers/", "pron_de": "/HO-ze/"}'::jsonb,
        '{"term": "pants", "meaning": "pantalones", "de": "Hose", "ex": "My pants are too big.", "pron": "/PANTS/", "pron_de": "/HO-ze/"}'::jsonb,
        '{"term": "dress", "meaning": "vestido", "de": "Kleid", "ex": "She likes the red dress.", "pron": "/DRES/", "pron_de": "/KLAID/"}'::jsonb,
        '{"term": "skirt", "meaning": "falda", "de": "Rock", "ex": "The skirt is very long.", "pron": "/SKERT/", "pron_de": "/ROK/"}'::jsonb,
        '{"term": "jacket", "meaning": "chaqueta", "de": "Jacke", "ex": "I need a warm jacket.", "pron": "/JAK-it/", "pron_de": "/YA-ke/"}'::jsonb,
        '{"term": "coat", "meaning": "abrigo", "de": "Mantel", "ex": "His coat is on the chair.", "pron": "/KOUT/", "pron_de": "/MAN-tel/"}'::jsonb,
        '{"term": "shoes", "meaning": "zapatos", "de": "Schuhe", "ex": "My shoes are new.", "pron": "/SHOOZ/", "pron_de": "/SHU-e/"}'::jsonb,
        '{"term": "boots", "meaning": "botas", "de": "Stiefel", "ex": "These boots are good for rain.", "pron": "/BOOTS/", "pron_de": "/SHTI-fel/"}'::jsonb,
        '{"term": "socks", "meaning": "calcetines", "de": "Socken", "ex": "I need clean socks.", "pron": "/SOKS/", "pron_de": "/ZO-ken/"}'::jsonb,
        '{"term": "underwear", "meaning": "ropa interior", "de": "Unterwäsche", "ex": "The underwear is in the drawer.", "pron": "/UN-der-wair/", "pron_de": "/UN-ter-ve-she/"}'::jsonb,
        '{"term": "hat", "meaning": "sombrero / gorro", "de": "Hut", "ex": "That hat looks nice.", "pron": "/HAT/", "pron_de": "/HUHT/"}'::jsonb,
        '{"term": "scarf", "meaning": "bufanda", "de": "Schal", "ex": "This scarf is very soft.", "pron": "/SKARF/", "pron_de": "/SHAL/"}'::jsonb,
        '{"term": "gloves", "meaning": "guantes", "de": "Handschuhe", "ex": "I wear gloves in winter.", "pron": "/GLUVZ/", "pron_de": "/HANT-shu-e/"}'::jsonb,
        '{"term": "belt", "meaning": "cinturón", "de": "Gürtel", "ex": "The belt is brown.", "pron": "/BELT/", "pron_de": "/GUER-tel/"}'::jsonb,
        '{"term": "bag", "meaning": "bolsa / bolso", "de": "Tasche", "ex": "My bag is under the table.", "pron": "/BAG/", "pron_de": "/TA-she/"}'::jsonb,
        '{"term": "handbag", "meaning": "bolso de mano", "de": "Handtasche", "ex": "Her handbag is small.", "pron": "/HAND-bag/", "pron_de": "/HANT-ta-she/"}'::jsonb,
        '{"term": "wallet", "meaning": "cartera", "de": "Geldbörse", "ex": "My wallet is in my jacket.", "pron": "/WOL-it/", "pron_de": "/GELT-boer-ze/"}'::jsonb,
        '{"term": "watch", "meaning": "reloj", "de": "Uhr", "ex": "This watch is expensive.", "pron": "/WOCH/", "pron_de": "/UUR/"}'::jsonb,
        '{"term": "glasses", "meaning": "gafas", "de": "Brille", "ex": "I cannot read without my glasses.", "pron": "/GLAS-iz/", "pron_de": "/BRI-le/"}'::jsonb,
        '{"term": "ring", "meaning": "anillo", "de": "Ring", "ex": "The ring is silver.", "pron": "/RING/", "pron_de": "/RING/"}'::jsonb,
        '{"term": "necklace", "meaning": "collar", "de": "Halskette", "ex": "The necklace is very pretty.", "pron": "/NEK-les/", "pron_de": "/HALS-ke-te/"}'::jsonb,
        '{"term": "earrings", "meaning": "pendientes", "de": "Ohrringe", "ex": "She is wearing gold earrings.", "pron": "/EER-ringz/", "pron_de": "/OOR-rin-ge/"}'::jsonb,
        '{"term": "size", "meaning": "talla", "de": "Größe", "ex": "What size do you need?", "pron": "/SAIZ/", "pron_de": "/GROE-se/"}'::jsonb,
        '{"term": "colour", "meaning": "color", "de": "Farbe", "ex": "Blue is my favourite colour.", "pron": "/KUL-er/", "pron_de": "/FAR-be/"}'::jsonb,
        '{"term": "fabric", "meaning": "tejido", "de": "Stoff", "ex": "This fabric feels soft.", "pron": "/FAB-rik/", "pron_de": "/SHTOF/"}'::jsonb,
        '{"term": "cotton", "meaning": "algodón", "de": "Baumwolle", "ex": "The shirt is made of cotton.", "pron": "/KOT-un/", "pron_de": "/BAUM-vo-le/"}'::jsonb,
        '{"term": "leather", "meaning": "cuero", "de": "Leder", "ex": "These leather boots are strong.", "pron": "/LETH-er/", "pron_de": "/LE-der/"}'::jsonb,
        '{"term": "try on", "meaning": "probarse", "de": "anprobieren", "ex": "Can I try on this jacket?", "pron": "/TRAI ON/", "pron_de": "/AN-pro-BI-ren/"}'::jsonb,
        '{"term": "fits", "meaning": "queda bien", "de": "passt", "ex": "The dress fits well.", "pron": "/FITS/", "pron_de": "/PAST/"}'::jsonb,
        '{"term": "too big", "meaning": "demasiado grande", "de": "zu groß", "ex": "These shoes are too big.", "pron": "/TUU BIG/", "pron_de": "/tsu GROOS/"}'::jsonb,
        '{"term": "too small", "meaning": "demasiado pequeño", "de": "zu klein", "ex": "The hat is too small.", "pron": "/TUU SMOL/", "pron_de": "/tsu KLAIN/"}'::jsonb,
        '{"term": "fashion", "meaning": "moda", "de": "Mode", "ex": "She studies fashion in college.", "pron": "/FA-shun/", "pron_de": "/MO-de/"}'::jsonb,
        '{"term": "style", "meaning": "estilo", "de": "Stil", "ex": "I like your style.", "pron": "/STAIL/", "pron_de": "/SHTIL/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1760 AND path_uuid = v_path_id;
    INSERT INTO deck (path_uuid, step_order, source_language, type) VALUES (v_path_id, 1760, 'en', 'deck') RETURNING uuid INTO v_deck_id;
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'es', 'El Entorno Inmediato III (Ropa y Accesorios)', 'Vocabulario esencial de ropa, accesorios, tallas, materiales y estilo.');
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'de', 'Die nähere Umgebung III (Kleidung und Accessoires)', 'Grundwortschatz zu Kleidung, Accessoires, Größen, Materialien und Stil.');

    FOREACH card IN ARRAY v_cards LOOP
        INSERT INTO word (term, is_root, source_language, example) VALUES (card->>'term', TRUE, 'en', card->>'ex') RETURNING uuid INTO v_word_id;
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');
        INSERT INTO deck_words (deck_uuid, word_uuid) VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
