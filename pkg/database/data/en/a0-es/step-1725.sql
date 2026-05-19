-- ============================================================
-- Seed: A0 English Path – STEP 1725 – Deck – Turismo, Monumentos y Atracciones (Vocabulario)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "tourist", "meaning": "turista", "de": "Tourist", "ex": "The tourist takes many photos in the square.", "pron": "/TOO-rist/", "pron_de": "/tou-RIST/"}'::jsonb,
        '{"term": "tourism", "meaning": "turismo", "de": "Tourismus", "ex": "Tourism is important for this city.", "pron": "/TOO-riz-um/", "pron_de": "/tou-RIS-mus/"}'::jsonb,
        '{"term": "monument", "meaning": "monumento", "de": "Denkmal", "ex": "The monument is in front of the station.", "pron": "/MON-yu-ment/", "pron_de": "/DENK-mal/"}'::jsonb,
        '{"term": "landmark", "meaning": "lugar emblemático", "de": "Wahrzeichen", "ex": "The bridge is a famous landmark.", "pron": "/LAND-mark/", "pron_de": "/VAAR-tsai-chen/"}'::jsonb,
        '{"term": "museum", "meaning": "museo", "de": "Museum", "ex": "We visit the museum on Saturday.", "pron": "/myu-ZEE-um/", "pron_de": "/mu-ZE-um/"}'::jsonb,
        '{"term": "gallery", "meaning": "galería", "de": "Galerie", "ex": "The gallery closes at six.", "pron": "/GAL-uh-ree/", "pron_de": "/ga-le-RI/"}'::jsonb,
        '{"term": "cathedral", "meaning": "catedral", "de": "Kathedrale", "ex": "The cathedral is next to the river.", "pron": "/kuh-THEE-drul/", "pron_de": "/ka-te-dRA-le/"}'::jsonb,
        '{"term": "castle", "meaning": "castillo", "de": "Schloss", "ex": "The old castle is on the hill.", "pron": "/KAS-ul/", "pron_de": "/SHLOS/"}'::jsonb,
        '{"term": "palace", "meaning": "palacio", "de": "Palast", "ex": "The palace has a large garden.", "pron": "/PAL-is/", "pron_de": "/pa-LAST/"}'::jsonb,
        '{"term": "park", "meaning": "parque", "de": "Park", "ex": "The park is behind the museum.", "pron": "/PARK/", "pron_de": "/PARK/"}'::jsonb,
        '{"term": "garden", "meaning": "jardín", "de": "Garten", "ex": "The garden is open in the morning.", "pron": "/GAR-den/", "pron_de": "/GAR-ten/"}'::jsonb,
        '{"term": "square", "meaning": "plaza", "de": "Platz", "ex": "There is a market in the square.", "pron": "/SKWAIR/", "pron_de": "/PLATZ/"}'::jsonb,
        '{"term": "fountain", "meaning": "fuente", "de": "Brunnen", "ex": "Meet me by the fountain.", "pron": "/FOUN-tin/", "pron_de": "/BRUN-nen/"}'::jsonb,
        '{"term": "bridge", "meaning": "puente", "de": "Brücke", "ex": "The bridge goes over the river.", "pron": "/BRIDJ/", "pron_de": "/BRY-ke/"}'::jsonb,
        '{"term": "tower", "meaning": "torre", "de": "Turm", "ex": "You can see the tower from the park.", "pron": "/TOU-er/", "pron_de": "/TURM/"}'::jsonb,
        '{"term": "statue", "meaning": "estatua", "de": "Statue", "ex": "The statue is in the middle of the square.", "pron": "/STAT-yoo/", "pron_de": "/sta-TU-e/"}'::jsonb,
        '{"term": "exhibition", "meaning": "exposición", "de": "Ausstellung", "ex": "The exhibition starts today.", "pron": "/ek-si-BI-shun/", "pron_de": "/AUS-shtel-lung/"}'::jsonb,
        '{"term": "entrance", "meaning": "entrada", "de": "Eingang", "ex": "The entrance is near the gift shop.", "pron": "/EN-truns/", "pron_de": "/AIN-gang/"}'::jsonb,
        '{"term": "ticket", "meaning": "entrada / billete", "de": "Ticket / Eintrittskarte", "ex": "My ticket is for the guided tour.", "pron": "/TIK-it/", "pron_de": "/TI-ket/"}'::jsonb,
        '{"term": "guided tour", "meaning": "visita guiada", "de": "Führung", "ex": "The guided tour starts at noon.", "pron": "/GAI-did TUR/", "pron_de": "/FYU-rung/"}'::jsonb,
        '{"term": "brochure", "meaning": "folleto", "de": "Prospekt", "ex": "Take a brochure at the desk.", "pron": "/bro-SHUR/", "pron_de": "/pro-SPEKT/"}'::jsonb,
        '{"term": "map", "meaning": "mapa", "de": "Karte", "ex": "The map shows all the monuments.", "pron": "/MAP/", "pron_de": "/KAR-te/"}'::jsonb,
        '{"term": "souvenir", "meaning": "recuerdo", "de": "Souvenir", "ex": "I buy a small souvenir for my family.", "pron": "/soo-vuh-NEER/", "pron_de": "/su-ve-NIR/"}'::jsonb,
        '{"term": "gift shop", "meaning": "tienda de regalos", "de": "Geschenkladen", "ex": "The gift shop sells postcards.", "pron": "/GIFT shop/", "pron_de": "/ge-SHENK-la-den/"}'::jsonb,
        '{"term": "opening hours", "meaning": "horario de apertura", "de": "Öffnungszeiten", "ex": "Please check the opening hours online.", "pron": "/OH-puh-ning OURZ/", "pron_de": "/OEF-nungs-tsai-ten/"}'::jsonb,
        '{"term": "admission fee", "meaning": "precio de entrada", "de": "Eintrittspreis", "ex": "The admission fee is ten euros.", "pron": "/ad-MI-shun FEE/", "pron_de": "/AIN-trits-prais/"}'::jsonb,
        '{"term": "photography allowed", "meaning": "fotografía permitida", "de": "Fotografieren erlaubt", "ex": "Photography allowed means you can take pictures here.", "pron": "/fo-TOG-ruh-fee uh-LOUD/", "pron_de": "/fo-to-gra-FI-ren er-LAUBT/"}'::jsonb,
        '{"term": "audio guide", "meaning": "audioguía", "de": "Audioguide", "ex": "The audio guide is available in three languages.", "pron": "/AW-dee-oh GAID/", "pron_de": "/AU-di-o-gaid/"}'::jsonb,
        '{"term": "viewpoint", "meaning": "mirador", "de": "Aussichtspunkt", "ex": "The viewpoint is at the top of the hill.", "pron": "/VYOO-point/", "pron_de": "/AUS-zikts-punkt/"}'::jsonb,
        '{"term": "historic site", "meaning": "sitio histórico", "de": "historische Stätte", "ex": "The historic site is over two hundred years old.", "pron": "/his-TOR-ik SAIT/", "pron_de": "/his-TO-ri-she SHTE-te/"}'::jsonb,
        '{"term": "visitor", "meaning": "visitante", "de": "Besucher", "ex": "Every visitor needs a ticket.", "pron": "/VIZ-i-ter/", "pron_de": "/be-ZU-kher/"}'::jsonb,
        '{"term": "queue", "meaning": "cola", "de": "Schlange", "ex": "There is a long queue at the entrance.", "pron": "/KYOO/", "pron_de": "/SHLAN-ge/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1725 AND path_uuid = v_path_id;
    INSERT INTO deck (path_uuid, step_order, source_language, type) VALUES (v_path_id, 1725, 'en', 'deck') RETURNING uuid INTO v_deck_id;
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'es', 'Turismo, Monumentos y Atracciones', 'Vocabulario clave para hablar de turismo, monumentos, entradas, visitas y atracciones culturales.');
    INSERT INTO deck_translation (deck_uuid, language, title, description) VALUES (v_deck_id, 'de', 'Tourismus, Monumente und Attraktionen', 'Wichtiger Wortschatz für Tourismus, Monumente, Eintritt, Führungen und kulturelle Sehenswürdigkeiten.');

    FOREACH card IN ARRAY v_cards LOOP
        INSERT INTO word (term, is_root, source_language, example) VALUES (card->>'term', TRUE, 'en', card->>'ex') RETURNING uuid INTO v_word_id;
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron');
        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation) VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');
        INSERT INTO deck_words (deck_uuid, word_uuid) VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
