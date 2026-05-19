-- ============================================================
-- Seed: A0 English Path – STEP 115 – Deck – En Casa y Familia
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term":"mother","meaning":"madre","de":"Mutter","ex":"My mother is in the kitchen.","pron":"/má-der/","pron_de":"/MU-tö/"}'::jsonb,
        '{"term":"father","meaning":"padre","de":"Vater","ex":"My father is at home.","pron":"/fá-der/","pron_de":"/FAA-tö/"}'::jsonb,
        '{"term":"parents","meaning":"padres","de":"Eltern","ex":"My parents are in the living room.","pron":"/pér-ents/","pron_de":"/EL-tön/"}'::jsonb,
        '{"term":"brother","meaning":"hermano","de":"Bruder","ex":"My brother has a blue desk.","pron":"/brá-der/","pron_de":"/BRUU-dö/"}'::jsonb,
        '{"term":"sister","meaning":"hermana","de":"Schwester","ex":"My sister is in her bedroom.","pron":"/sís-ter/","pron_de":"/SCHWES-tö/"}'::jsonb,
        '{"term":"grandmother","meaning":"abuela","de":"Großmutter","ex":"My grandmother likes the garden.","pron":"/grán-má-der/","pron_de":"/GROOS-mu-tö/"}'::jsonb,
        '{"term":"grandfather","meaning":"abuelo","de":"Großvater","ex":"My grandfather sits by the window.","pron":"/grán-fá-der/","pron_de":"/GROOS-faa-tö/"}'::jsonb,
        '{"term":"aunt","meaning":"tía","de":"Tante","ex":"My aunt sleeps in the guest room.","pron":"/ant/","pron_de":"/TAN-tö/"}'::jsonb,
        '{"term":"uncle","meaning":"tío","de":"Onkel","ex":"My uncle cleans the car.","pron":"/án-kel/","pron_de":"/ON-köl/"}'::jsonb,
        '{"term":"cousin","meaning":"primo / prima","de":"Cousin / Cousine","ex":"My cousin visits on Sunday.","pron":"/ká-sen/","pron_de":"/ku-ZENG/"}'::jsonb,
        '{"term":"baby","meaning":"bebé","de":"Baby","ex":"The baby is asleep.","pron":"/béi-bi/","pron_de":"/BEJ-bi/"}'::jsonb,
        '{"term":"family","meaning":"familia","de":"Familie","ex":"My family eats dinner together.","pron":"/fá-mi-li/","pron_de":"/fa-MI-li-e/"}'::jsonb,
        '{"term":"living room","meaning":"salón / sala de estar","de":"Wohnzimmer","ex":"We watch TV in the living room.","pron":"/lí-vin rum/","pron_de":"/WOON-tsim-mö/"}'::jsonb,
        '{"term":"bedroom","meaning":"dormitorio","de":"Schlafzimmer","ex":"The bedroom is next to the bathroom.","pron":"/béd-rum/","pron_de":"/SCHLAAF-tsim-mö/"}'::jsonb,
        '{"term":"bathroom","meaning":"baño","de":"Badezimmer","ex":"The bathroom is small but clean.","pron":"/báz-rum/","pron_de":"/BAA-dö-tsim-mö/"}'::jsonb,
        '{"term":"kitchen","meaning":"cocina","de":"Küche","ex":"We cook in the kitchen every day.","pron":"/kí-chen/","pron_de":"/KÜ-chö/"}'::jsonb,
        '{"term":"dining room","meaning":"comedor","de":"Esszimmer","ex":"Dinner is in the dining room.","pron":"/dái-nin rum/","pron_de":"/ES-tsim-mö/"}'::jsonb,
        '{"term":"hall","meaning":"pasillo / entrada","de":"Flur","ex":"The shoes are in the hall.","pron":"/hol/","pron_de":"/FLUÖR/"}'::jsonb,
        '{"term":"garden","meaning":"jardín","de":"Garten","ex":"The children play in the garden.","pron":"/gár-den/","pron_de":"/GAR-tön/"}'::jsonb,
        '{"term":"balcony","meaning":"balcón","de":"Balkon","ex":"There is a chair on the balcony.","pron":"/bál-ko-ni/","pron_de":"/bal-KON/"}'::jsonb,
        '{"term":"table","meaning":"mesa","de":"Tisch","ex":"The book is on the table.","pron":"/téi-bel/","pron_de":"/TISCH/"}'::jsonb,
        '{"term":"chair","meaning":"silla","de":"Stuhl","ex":"Please sit on the chair.","pron":"/cher/","pron_de":"/SCHTUUL/"}'::jsonb,
        '{"term":"sofa","meaning":"sofá","de":"Sofa","ex":"The cat sleeps on the sofa.","pron":"/sóu-fa/","pron_de":"/SO-fa/"}'::jsonb,
        '{"term":"bed","meaning":"cama","de":"Bett","ex":"The bed is near the lamp.","pron":"/bed/","pron_de":"/BET/"}'::jsonb,
        '{"term":"wardrobe","meaning":"armario","de":"Kleiderschrank","ex":"My clothes are in the wardrobe.","pron":"/uór-droub/","pron_de":"/KLAI-dö-schrank/"}'::jsonb,
        '{"term":"desk","meaning":"escritorio","de":"Schreibtisch","ex":"I study at the desk.","pron":"/desk/","pron_de":"/SCHRAIB-tisch/"}'::jsonb,
        '{"term":"lamp","meaning":"lámpara","de":"Lampe","ex":"The lamp is on the desk.","pron":"/lamp/","pron_de":"/LAM-pö/"}'::jsonb,
        '{"term":"door","meaning":"puerta","de":"Tür","ex":"Please close the door.","pron":"/dor/","pron_de":"/TÜÜR/"}'::jsonb,
        '{"term":"window","meaning":"ventana","de":"Fenster","ex":"Open the window, please.","pron":"/uín-dou/","pron_de":"/FENS-tö/"}'::jsonb,
        '{"term":"key","meaning":"llave","de":"Schlüssel","ex":"The key is on the shelf.","pron":"/ki/","pron_de":"/SCHLÜ-söl/"}'::jsonb,
        '{"term":"cook","meaning":"cocinar","de":"kochen","ex":"I cook dinner at home.","pron":"/kuk/","pron_de":"/KO-chön/"}'::jsonb,
        '{"term":"clean","meaning":"limpiar","de":"putzen / sauber machen","ex":"We clean the kitchen after dinner.","pron":"/klin/","pron_de":"/PUT-sen/"}'::jsonb,
        '{"term":"wash","meaning":"lavar","de":"waschen","ex":"I wash the plates after lunch.","pron":"/uósh/","pron_de":"/WA-schön/"}'::jsonb,
        '{"term":"sleep","meaning":"dormir","de":"schlafen","ex":"The baby sleeps at eight.","pron":"/slip/","pron_de":"/SCHLAA-fen/"}'::jsonb,
        '{"term":"wake up","meaning":"despertarse","de":"aufwachen","ex":"I wake up at seven.","pron":"/uéik ap/","pron_de":"/AUF-va-chön/"}'::jsonb,
        '{"term":"sit down","meaning":"sentarse","de":"sich setzen","ex":"Please sit down in the living room.","pron":"/sit daun/","pron_de":"/zikh ZET-sen/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 115 AND path_uuid = v_path_id;
    INSERT INTO deck (path_uuid, step_order, source_language, type) VALUES (v_path_id, 115, 'en', 'deck') RETURNING uuid INTO v_deck_id;
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'es', 'En Casa y Familia', 'Vocabulario básico sobre la familia, las habitaciones de la casa, muebles y acciones cotidianas en casa.');
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'de', 'Zuhause und Familie', 'Grundwortschatz zu Familie, Räumen im Haus, Möbeln und einfachen Handlungen zu Hause.');
    FOREACH card IN ARRAY v_cards LOOP
        INSERT INTO word (term, is_root, source_language, example) VALUES (card->>'term', TRUE, 'en', card->>'ex') RETURNING uuid INTO v_word_id;
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');
        INSERT INTO deck_words (deck_uuid, word_uuid) VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;

