-- ============================================================
-- Seed: A0 English Path – STEP 245 – Deck – Comida, Bebida y Salud
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term":"bread","meaning":"pan","de":"Brot","ex":"I eat bread for breakfast.","pron":"/bred/","pron_de":"/BROT/"}'::jsonb,
        '{"term":"milk","meaning":"leche","de":"Milch","ex":"The milk is in the fridge.","pron":"/milk/","pron_de":"/MILCH/"}'::jsonb,
        '{"term":"water","meaning":"agua","de":"Wasser","ex":"Please drink more water.","pron":"/uó-ter/","pron_de":"/VA-sö/"}'::jsonb,
        '{"term":"tea","meaning":"té","de":"Tee","ex":"She drinks tea in the afternoon.","pron":"/ti/","pron_de":"/TEE/"}'::jsonb,
        '{"term":"coffee","meaning":"café","de":"Kaffee","ex":"He wants a hot coffee.","pron":"/kó-fi/","pron_de":"/ka-FEE/"}'::jsonb,
        '{"term":"juice","meaning":"zumo / jugo","de":"Saft","ex":"Orange juice is on the table.","pron":"/yus/","pron_de":"/ZAFT/"}'::jsonb,
        '{"term":"rice","meaning":"arroz","de":"Reis","ex":"We eat rice with chicken.","pron":"/rais/","pron_de":"/RAIS/"}'::jsonb,
        '{"term":"pasta","meaning":"pasta","de":"Nudeln / Pasta","ex":"The pasta is very good.","pron":"/pás-ta/","pron_de":"/NU-deln/"}'::jsonb,
        '{"term":"soup","meaning":"sopa","de":"Suppe","ex":"The soup is hot.","pron":"/sup/","pron_de":"/ZU-pö/"}'::jsonb,
        '{"term":"salad","meaning":"ensalada","de":"Salat","ex":"I have salad for lunch.","pron":"/sá-led/","pron_de":"/za-LAAT/"}'::jsonb,
        '{"term":"chicken","meaning":"pollo","de":"Hähnchen / Huhn","ex":"The chicken is in the oven.","pron":"/chí-ken/","pron_de":"/HEN-chön/"}'::jsonb,
        '{"term":"fish","meaning":"pescado","de":"Fisch","ex":"We cook fish on Friday.","pron":"/fish/","pron_de":"/FISCH/"}'::jsonb,
        '{"term":"egg","meaning":"huevo","de":"Ei","ex":"I eat one egg in the morning.","pron":"/eg/","pron_de":"/AI/"}'::jsonb,
        '{"term":"fruit","meaning":"fruta","de":"Obst","ex":"Fruit is healthy.","pron":"/frut/","pron_de":"/OOPST/"}'::jsonb,
        '{"term":"apple","meaning":"manzana","de":"Apfel","ex":"The apple is red.","pron":"/á-pel/","pron_de":"/AP-fel/"}'::jsonb,
        '{"term":"banana","meaning":"plátano / banana","de":"Banane","ex":"I take a banana to school.","pron":"/ba-ná-na/","pron_de":"/ba-NAA-nö/"}'::jsonb,
        '{"term":"orange","meaning":"naranja","de":"Orange","ex":"This orange is sweet.","pron":"/ó-rinch/","pron_de":"/o-RAN-dschö/"}'::jsonb,
        '{"term":"vegetables","meaning":"verduras / vegetales","de":"Gemüse","ex":"We buy vegetables at the market.","pron":"/vé-yte-bols/","pron_de":"/gö-MÜ-zö/"}'::jsonb,
        '{"term":"carrot","meaning":"zanahoria","de":"Karotte","ex":"The carrot is orange.","pron":"/ká-ret/","pron_de":"/ka-ROT-tö/"}'::jsonb,
        '{"term":"potato","meaning":"patata / papa","de":"Kartoffel","ex":"The potato is on the plate.","pron":"/po-téi-tou/","pron_de":"/kar-TO-fel/"}'::jsonb,
        '{"term":"tomato","meaning":"tomate","de":"Tomate","ex":"There is tomato in the salad.","pron":"/to-méi-tou/","pron_de":"/to-MAA-tö/"}'::jsonb,
        '{"term":"breakfast","meaning":"desayuno","de":"Frühstück","ex":"Breakfast is at seven thirty.","pron":"/brék-fast/","pron_de":"/FRÜÜ-shtük/"}'::jsonb,
        '{"term":"lunch","meaning":"comida / almuerzo","de":"Mittagessen","ex":"Lunch is at one o clock.","pron":"/lanch/","pron_de":"/MI-tag-es-sen/"}'::jsonb,
        '{"term":"dinner","meaning":"cena","de":"Abendessen","ex":"Dinner is ready.","pron":"/dí-ner/","pron_de":"/AA-bent-es-sen/"}'::jsonb,
        '{"term":"hungry","meaning":"hambriento","de":"hungrig","ex":"I am hungry after class.","pron":"/hán-gri/","pron_de":"/HUN-grik/"}'::jsonb,
        '{"term":"thirsty","meaning":"sediento","de":"durstig","ex":"She is thirsty after the walk.","pron":"/zér-sti/","pron_de":"/DURS-tik/"}'::jsonb,
        '{"term":"healthy","meaning":"saludable / sano","de":"gesund","ex":"Fruit and water are healthy.","pron":"/jél-zi/","pron_de":"/gö-ZUNT/"}'::jsonb,
        '{"term":"ill","meaning":"enfermo","de":"krank","ex":"I am ill today.","pron":"/il/","pron_de":"/KRANK/"}'::jsonb,
        '{"term":"cold","meaning":"resfriado","de":"Erkältung","ex":"He has a cold.","pron":"/kould/","pron_de":"/er-KEL-tung/"}'::jsonb,
        '{"term":"headache","meaning":"dolor de cabeza","de":"Kopfschmerzen","ex":"I have a headache.","pron":"/jéd-eik/","pron_de":"/KOPF-shmert-sen/"}'::jsonb,
        '{"term":"stomach ache","meaning":"dolor de estómago","de":"Bauchschmerzen","ex":"She has a stomach ache after lunch.","pron":"/stá-mek eik/","pron_de":"/BAUJ-shmert-sen/"}'::jsonb,
        '{"term":"doctor","meaning":"médico","de":"Arzt / Ärztin","ex":"The doctor is very kind.","pron":"/dák-ter/","pron_de":"/ARTST/"}'::jsonb,
        '{"term":"medicine","meaning":"medicina","de":"Medizin","ex":"Take your medicine after dinner.","pron":"/mé-di-sin/","pron_de":"/me-di-TSIN/"}'::jsonb,
        '{"term":"pharmacy","meaning":"farmacia","de":"Apotheke","ex":"The pharmacy is next to the bank.","pron":"/fár-ma-si/","pron_de":"/a-po-TEE-kö/"}'::jsonb,
        '{"term":"hospital","meaning":"hospital","de":"Krankenhaus","ex":"The hospital is near the station.","pron":"/jós-pi-tel/","pron_de":"/KRAN-kön-haus/"}'::jsonb,
        '{"term":"rest","meaning":"descansar","de":"ausruhen","ex":"Please rest at home today.","pron":"/rest/","pron_de":"/AUS-ruu-hen/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 245 AND path_uuid = v_path_id;
    INSERT INTO deck (path_uuid, step_order, source_language, type) VALUES (v_path_id, 245, 'en', 'deck') RETURNING uuid INTO v_deck_id;
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'es', 'Comida, Bebida y Salud', 'Vocabulario básico sobre alimentos, bebidas y palabras sencillas relacionadas con la salud.');
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'de', 'Essen, Getränke und Gesundheit', 'Grundwortschatz zu Lebensmitteln, Getränken und einfachen Gesundheitswörtern.');
    FOREACH card IN ARRAY v_cards LOOP
        INSERT INTO word (term, is_root, source_language, example) VALUES (card->>'term', TRUE, 'en', card->>'ex') RETURNING uuid INTO v_word_id;
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');
        INSERT INTO deck_words (deck_uuid, word_uuid) VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;

