-- ============================================================
-- Seed: A0 English Path – STEP 1725 – Deck – Turismo, Monumentos y Atracciones
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "tourist", "meaning": "turista", "de": "Tourist/in", "ex": "The city receives millions of tourists every year.", "pron": "/túr-ist/", "pron_de": "/tu-RIST/"}'::jsonb,
        '{"term": "tourism", "meaning": "turismo", "de": "Tourismus", "ex": "Tourism is the main industry here.", "pron": "/túr-is-em/", "pron_de": "/tu-RIS-mus/"}'::jsonb,
        '{"term": "visitor", "meaning": "visitante", "de": "Besucher/in", "ex": "Visitors must register at the entrance.", "pron": "/ví-si-tor/", "pron_de": "/bö-ZUU-jö/"}'::jsonb,
        '{"term": "traveller", "meaning": "viajero", "de": "Reisende/r", "ex": "She is an experienced traveller.", "pron": "/trá-ve-ler/", "pron_de": "/RAI-zen-de/"}'::jsonb,
        '{"term": "backpacker", "meaning": "mochilero", "de": "Rucksackreisende/r", "ex": "Backpackers often stay in hostels.", "pron": "/bák-pa-ker/", "pron_de": "/RUK-zak-rai-zen-de/"}'::jsonb,
        '{"term": "day trip", "meaning": "excursión de un día", "de": "Tagesausflug", "ex": "We did a day trip to the coast.", "pron": "/dei trip/", "pron_de": "/TAA-ges-aus-fluuk/"}'::jsonb,
        '{"term": "city break", "meaning": "escapada a una ciudad", "de": "Städtereise", "ex": "Paris is perfect for a city break.", "pron": "/sí-ti breik/", "pron_de": "/SHTÄD-te-rai-ze/"}'::jsonb,
        '{"term": "weekend break", "meaning": "escapada de fin de semana", "de": "Wochenendreise", "ex": "Book a weekend break for a short holiday.", "pron": "/uík-end breik/", "pron_de": "/VO-jen-ent-rai-ze/"}'::jsonb,
        '{"term": "road trip", "meaning": "viaje por carretera", "de": "Roadtrip / Autoreise", "ex": "They did a road trip across the country.", "pron": "/roud trip/", "pron_de": "/ROOD-trip/"}'::jsonb,
        '{"term": "sightseeing", "meaning": "hacer turismo / visitar monumentos", "de": "Sightseeing / Besichtigungen", "ex": "We spent the morning sightseeing.", "pron": "/sáit-si-ing/", "pron_de": "/SAIT-si-ing/"}'::jsonb,
        '{"term": "excursion", "meaning": "excursión", "de": "Ausflug / Exkursion", "ex": "Join the boat excursion at ten.", "pron": "/iks-kér-shen/", "pron_de": "/AUS-fluuk/"}'::jsonb,
        '{"term": "cruise", "meaning": "crucero", "de": "Kreuzfahrt", "ex": "They booked a Mediterranean cruise.", "pron": "/kruz/", "pron_de": "/KROITS-fart/"}'::jsonb,
        '{"term": "package tour", "meaning": "viaje organizado / todo incluido", "de": "Pauschalreise", "ex": "A package tour includes flights and hotel.", "pron": "/pá-kidy tur/", "pron_de": "/PAU-shaal-rai-ze/"}'::jsonb,
        '{"term": "group tour", "meaning": "viaje en grupo", "de": "Gruppenreise", "ex": "Join a group tour for a guided experience.", "pron": "/grup tur/", "pron_de": "/GRU-pen-rai-ze/"}'::jsonb,
        '{"term": "eco-tourism", "meaning": "ecoturismo", "de": "Ökotourismus", "ex": "Eco-tourism helps protect local wildlife.", "pron": "/íi-kou-túr-is-em/", "pron_de": "/ÖÖ-ko-tu-ris-mus/"}'::jsonb,
        '{"term": "monument", "meaning": "monumento", "de": "Denkmal / Monument", "ex": "The war monument is in the main square.", "pron": "/mó-niu-ment/", "pron_de": "/DENK-maal/"}'::jsonb,
        '{"term": "landmark", "meaning": "lugar emblemático / punto de referencia", "de": "Wahrzeichen", "ex": "Big Ben is a famous landmark.", "pron": "/lánd-mark/", "pron_de": "/WAAR-tsai-jen/"}'::jsonb,
        '{"term": "historic site", "meaning": "lugar histórico", "de": "historische Stätte", "ex": "Respect the rules at every historic site.", "pron": "/his-tó-rik sait/", "pron_de": "/his-TOO-ri-she SHTÄ-te/"}'::jsonb,
        '{"term": "museum", "meaning": "museo", "de": "Museum", "ex": "The museum opens at nine every day.", "pron": "/miu-sí-em/", "pron_de": "/mu-ZEE-um/"}'::jsonb,
        '{"term": "gallery", "meaning": "galería de arte", "de": "Galerie / Kunsthalle", "ex": "The gallery shows modern and classic art.", "pron": "/gá-le-ri/", "pron_de": "/ga-le-RII/"}'::jsonb,
        '{"term": "cathedral", "meaning": "catedral", "de": "Kathedrale / Dom", "ex": "The cathedral was built in the 12th century.", "pron": "/ka-zí-dral/", "pron_de": "/ka-te-DRAA-le/"}'::jsonb,
        '{"term": "castle", "meaning": "castillo", "de": "Burg / Schloss", "ex": "Visit the medieval castle on the hill.", "pron": "/ká-sel/", "pron_de": "/buRK/"}'::jsonb,
        '{"term": "palace", "meaning": "palacio", "de": "Palast / Schloss", "ex": "The royal palace is open to visitors.", "pron": "/pá-les/", "pron_de": "/pa-LAST/"}'::jsonb,
        '{"term": "ruins", "meaning": "ruinas", "de": "Ruinen", "ex": "The ruins are over two thousand years old.", "pron": "/rú-ins/", "pron_de": "/ru-II-nen/"}'::jsonb,
        '{"term": "temple", "meaning": "templo", "de": "Tempel", "ex": "The ancient temple is a major tourist attraction.", "pron": "/tém-pel/", "pron_de": "/TEM-pel/"}'::jsonb,
        '{"term": "mosque", "meaning": "mezquita", "de": "Moschee", "ex": "Remember to cover your head in the mosque.", "pron": "/mosk/", "pron_de": "/mo-SHEE/"}'::jsonb,
        '{"term": "church", "meaning": "iglesia", "de": "Kirche", "ex": "The old church dates back to the 16th century.", "pron": "/cherch/", "pron_de": "/KIR-je/"}'::jsonb,
        '{"term": "abbey", "meaning": "abadía", "de": "Abtei", "ex": "The abbey is surrounded by beautiful gardens.", "pron": "/á-bi/", "pron_de": "/AP-tai/"}'::jsonb,
        '{"term": "monastery", "meaning": "monasterio", "de": "Kloster", "ex": "Monks still live in the mountain monastery.", "pron": "/mó-nas-te-ri/", "pron_de": "/KLOS-tö/"}'::jsonb,
        '{"term": "memorial", "meaning": "memorial / conmemoración", "de": "Gedenkstätte / Mahnmal", "ex": "Pay your respects at the war memorial.", "pron": "/me-mó-ri-el/", "pron_de": "/gö-DENK-shtä-te/"}'::jsonb,
        '{"term": "tower", "meaning": "torre", "de": "Turm", "ex": "Climb the tower for a panoramic view.", "pron": "/táuer/", "pron_de": "/turm/"}'::jsonb,
        '{"term": "statue", "meaning": "estatua", "de": "Statue", "ex": "The statue of liberty is iconic.", "pron": "/stá-chu/", "pron_de": "/SHTAA-tue/"}'::jsonb,
        '{"term": "bridge", "meaning": "puente", "de": "Brücke", "ex": "Walk across the historic bridge at sunset.", "pron": "/bridyi/", "pron_de": "/BRÜK-e/"}'::jsonb,
        '{"term": "lighthouse", "meaning": "faro", "de": "Leuchtturm", "ex": "The lighthouse dates from the 19th century.", "pron": "/láit-haus/", "pron_de": "/LOIJT-turm/"}'::jsonb,
        '{"term": "aqueduct", "meaning": "acueducto", "de": "Aquädukt", "ex": "The Roman aqueduct is still standing.", "pron": "/á-kwe-dakt/", "pron_de": "/a-kvä-DUKT/"}'::jsonb,
        '{"term": "amphitheatre", "meaning": "anfiteatro", "de": "Amphitheater", "ex": "Gladiators once fought in the amphitheatre.", "pron": "/ám-fi-zia-ter/", "pron_de": "/am-fi-tee-AA-tö/"}'::jsonb,
        '{"term": "archaeological site", "meaning": "yacimiento arqueológico", "de": "archäologische Stätte", "ex": "Digging continues at the archaeological site.", "pron": "/ar-ki-o-ló-dyi-kel sait/", "pron_de": "/ar-kä-o-LOO-gi-she SHTÄ-te/"}'::jsonb,
        '{"term": "UNESCO World Heritage Site", "meaning": "Patrimonio de la Humanidad de la UNESCO", "de": "UNESCO-Welterbestätte", "ex": "The old town is a UNESCO World Heritage Site.", "pron": "/iu-nes-kou world hé-ri-tidy sait/", "pron_de": "/iu-NES-ko VELT-er-be-shtä-te/"}'::jsonb,
        '{"term": "opera house", "meaning": "teatro de ópera", "de": "Opernhaus", "ex": "The opera house puts on shows every weekend.", "pron": "/ó-pe-ra haus/", "pron_de": "/OO-pern-haus/"}'::jsonb,
        '{"term": "national park", "meaning": "parque nacional", "de": "Nationalpark", "ex": "Camping is not allowed in the national park.", "pron": "/ná-she-nel park/", "pron_de": "/na-tsi-o-NAAL-park/"}'::jsonb,
        '{"term": "park", "meaning": "parque", "de": "Park", "ex": "Relax in the park after sightseeing.", "pron": "/park/", "pron_de": "/park/"}'::jsonb,
        '{"term": "garden", "meaning": "jardín", "de": "Garten", "ex": "The palace garden is open in summer.", "pron": "/gár-den/", "pron_de": "/GAR-ten/"}'::jsonb,
        '{"term": "botanical garden", "meaning": "jardín botánico", "de": "Botanischer Garten", "ex": "The botanical garden has plants from every continent.", "pron": "/bo-tá-ni-kel gár-den/", "pron_de": "/bo-TAA-ni-shö GAR-ten/"}'::jsonb,
        '{"term": "zoo", "meaning": "zoológico", "de": "Zoo / Tierpark", "ex": "The zoo has over 300 species of animals.", "pron": "/zu/", "pron_de": "/tsoo/"}'::jsonb,
        '{"term": "aquarium", "meaning": "acuario", "de": "Aquarium", "ex": "The aquarium has sharks and tropical fish.", "pron": "/a-kuéi-ri-em/", "pron_de": "/a-KVAA-ri-um/"}'::jsonb,
        '{"term": "theme park", "meaning": "parque temático", "de": "Freizeitpark / Themenpark", "ex": "The theme park has roller coasters and shows.", "pron": "/zim park/", "pron_de": "/FRAI-tsait-park/"}'::jsonb,
        '{"term": "beach", "meaning": "playa", "de": "Strand", "ex": "Tourists flock to the beach in summer.", "pron": "/bich/", "pron_de": "/shtrant/"}'::jsonb,
        '{"term": "waterfall", "meaning": "cascada / catarata", "de": "Wasserfall", "ex": "The waterfall is a stunning natural attraction.", "pron": "/uó-ter-fol/", "pron_de": "/VA-sö-fal/"}'::jsonb,
        '{"term": "cave", "meaning": "cueva / gruta", "de": "Höhle", "ex": "Take a torch when exploring the cave.", "pron": "/keiv/", "pron_de": "/HÖÖ-le/"}'::jsonb,
        '{"term": "volcano", "meaning": "volcán", "de": "Vulkan", "ex": "The active volcano attracts many visitors.", "pron": "/vol-kéi-nou/", "pron_de": "/vul-KAAN/"}'::jsonb,
        '{"term": "cliff", "meaning": "acantilado / precipicio", "de": "Klippe / Steilküste", "ex": "The white cliffs are a famous attraction.", "pron": "/klif/", "pron_de": "/KLI-pe/"}'::jsonb,
        '{"term": "viewpoint", "meaning": "mirador", "de": "Aussichtspunkt", "ex": "The viewpoint offers a panoramic view of the valley.", "pron": "/viú-point/", "pron_de": "/AUS-zijts-punkt/"}'::jsonb,
        '{"term": "square", "meaning": "plaza", "de": "Platz", "ex": "Sit at the café in the main square.", "pron": "/skuer/", "pron_de": "/plats/"}'::jsonb,
        '{"term": "fountain", "meaning": "fuente", "de": "Brunnen / Springbrunnen", "ex": "Throw a coin in the fountain for good luck.", "pron": "/fáun-ten/", "pron_de": "/BRUN-en/"}'::jsonb,
        '{"term": "hotel", "meaning": "hotel", "de": "Hotel", "ex": "Book a hotel near the old town.", "pron": "/jou-tél/", "pron_de": "/ho-TEL/"}'::jsonb,
        '{"term": "hostel", "meaning": "albergue", "de": "Jugendherberge / Hostel", "ex": "Hostels are cheap and social.", "pron": "/jós-tel/", "pron_de": "/JU-gent-her-ber-ge/"}'::jsonb,
        '{"term": "bed and breakfast", "meaning": "pensión / alojamiento con desayuno", "de": "Bed and Breakfast / Pension", "ex": "Stay at a bed and breakfast for a cosy feel.", "pron": "/bed and bréik-fast/", "pron_de": "/BET-ant-BREK-fast/"}'::jsonb,
        '{"term": "campsite", "meaning": "camping / campamento", "de": "Campingplatz", "ex": "The campsite is near the lake.", "pron": "/kémp-sait/", "pron_de": "/KEM-ping-plats/"}'::jsonb,
        '{"term": "resort", "meaning": "resort / complejo turístico", "de": "Resort / Ferienanlage", "ex": "The resort has a pool and a spa.", "pron": "/ri-sort/", "pron_de": "/re-SORT/"}'::jsonb,
        '{"term": "check in", "meaning": "registrarse / hacer el check-in", "de": "einchecken / anmelden", "ex": "Check in after two in the afternoon.", "pron": "/chek in/", "pron_de": "/AIN-che-ken/"}'::jsonb,
        '{"term": "check out", "meaning": "hacer el check-out / dejar el hotel", "de": "auschecken / abreisen", "ex": "Check out before eleven in the morning.", "pron": "/chek áut/", "pron_de": "/AUS-che-ken/"}'::jsonb,
        '{"term": "booking / reservation", "meaning": "reserva", "de": "Buchung / Reservierung", "ex": "Make a booking online in advance.", "pron": "/bú-king/", "pron_de": "/BUU-jung/"}'::jsonb,
        '{"term": "passport", "meaning": "pasaporte", "de": "Reisepass", "ex": "Always keep your passport safe when travelling.", "pron": "/pás-port/", "pron_de": "/RAI-ze-pas/"}'::jsonb,
        '{"term": "visa", "meaning": "visado / visa", "de": "Visum", "ex": "Check if you need a visa before travelling.", "pron": "/víi-za/", "pron_de": "/VII-zum/"}'::jsonb,
        '{"term": "boarding pass", "meaning": "tarjeta de embarque", "de": "Boardingkarte / Boarding-Pass", "ex": "Show your boarding pass at the gate.", "pron": "/bór-ding pas/", "pron_de": "/BOR-ding-kar-te/"}'::jsonb,
        '{"term": "luggage", "meaning": "equipaje", "de": "Gepäck", "ex": "Leave your luggage at the hotel reception.", "pron": "/lá-gidy/", "pron_de": "/gö-PEK/"}'::jsonb,
        '{"term": "carry-on", "meaning": "equipaje de mano", "de": "Handgepäck", "ex": "Only one carry-on bag is allowed per person.", "pron": "/ká-ri on/", "pron_de": "/HANT-gö-pek/"}'::jsonb,
        '{"term": "travel insurance", "meaning": "seguro de viaje", "de": "Reiseversicherung", "ex": "Always take out travel insurance before a trip.", "pron": "/trá-vel in-shú-rans/", "pron_de": "/RAI-ze-fö-zi-je-rung/"}'::jsonb,
        '{"term": "hire car", "meaning": "coche de alquiler", "de": "Mietwagen", "ex": "Rent a hire car to explore the countryside.", "pron": "/jai-er kar/", "pron_de": "/MIIT-vaa-gen/"}'::jsonb,
        '{"term": "tour bus", "meaning": "autobús turístico", "de": "Touristenbus", "ex": "Hop on the tour bus for a city overview.", "pron": "/tur bas/", "pron_de": "/tu-RIS-ten-bus/"}'::jsonb,
        '{"term": "entrance", "meaning": "entrada / acceso", "de": "Eingang / Einlass", "ex": "The entrance is on the south side.", "pron": "/én-trans/", "pron_de": "/AIN-gang/"}'::jsonb,
        '{"term": "ticket", "meaning": "entrada / ticket", "de": "Eintrittskarte / Ticket", "ex": "Buy your tickets online to skip the queue.", "pron": "/tí-ket/", "pron_de": "/AIN-trits-kar-te/"}'::jsonb,
        '{"term": "admission fee", "meaning": "precio de entrada", "de": "Eintrittspreis", "ex": "There is no admission fee for children.", "pron": "/ad-mí-shen fii/", "pron_de": "/AIN-trits-prais/"}'::jsonb,
        '{"term": "free entry", "meaning": "entrada gratuita", "de": "freier Eintritt", "ex": "The museum offers free entry on Sundays.", "pron": "/frii én-tri/", "pron_de": "/FRAI-ö AIN-trit/"}'::jsonb,
        '{"term": "opening hours", "meaning": "horario de apertura", "de": "Öffnungszeiten", "ex": "Check the opening hours before you visit.", "pron": "/óu-pe-ning áuers/", "pron_de": "/ÖF-nungs-tsai-ten/"}'::jsonb,
        '{"term": "guided tour", "meaning": "visita guiada", "de": "Führung / geführte Tour", "ex": "Join the guided tour at noon.", "pron": "/gái-ded tur/", "pron_de": "/FÜÜ-rung/"}'::jsonb,
        '{"term": "audio guide", "meaning": "audioguía", "de": "Audioguide / Hörrundgang", "ex": "Borrow an audio guide at the entrance.", "pron": "/ó-dio gaid/", "pron_de": "/AU-di-o-gait/"}'::jsonb,
        '{"term": "tour guide", "meaning": "guía turístico", "de": "Reiseführer/in / Touristenführer/in", "ex": "Our tour guide spoke four languages.", "pron": "/tur gaid/", "pron_de": "/RAI-ze-füü-rö/"}'::jsonb,
        '{"term": "brochure", "meaning": "folleto / tríptico", "de": "Broschüre / Flyer", "ex": "Pick up a free brochure at reception.", "pron": "/brou-shúr/", "pron_de": "/bro-SHÜÜ-re/"}'::jsonb,
        '{"term": "map", "meaning": "mapa / plano", "de": "Karte / Stadtplan", "ex": "Get a free map at the tourist office.", "pron": "/map/", "pron_de": "/KAR-te/"}'::jsonb,
        '{"term": "souvenir", "meaning": "recuerdo / souvenir", "de": "Souvenir / Andenken", "ex": "Buy a souvenir to remember the trip.", "pron": "/su-ve-nír/", "pron_de": "/su-ve-NIR/"}'::jsonb,
        '{"term": "gift shop", "meaning": "tienda de recuerdos", "de": "Souvenirladen / Geschenkeladen", "ex": "The gift shop is next to the exit.", "pron": "/gift shop/", "pron_de": "/zu-ve-NIR-laa-den/"}'::jsonb,
        '{"term": "exhibition", "meaning": "exposición", "de": "Ausstellung", "ex": "The exhibition runs until the end of August.", "pron": "/ek-si-bí-shen/", "pron_de": "/AUS-shte-lung/"}'::jsonb,
        '{"term": "cloakroom", "meaning": "guardarropa / consigna", "de": "Garderobe", "ex": "Leave your coat at the cloakroom.", "pron": "/klóuk-rum/", "pron_de": "/gar-de-ROO-be/"}'::jsonb,
        '{"term": "queue", "meaning": "cola / fila de espera", "de": "Schlange / Warteschlange", "ex": "There is a long queue at the ticket office.", "pron": "/kiu/", "pron_de": "/SHLAN-ge/"}'::jsonb,
        '{"term": "itinerary", "meaning": "itinerario / programa de viaje", "de": "Reiseroute / Reiseplan", "ex": "Plan your itinerary before you leave.", "pron": "/ai-tí-ne-re-ri/", "pron_de": "/RAI-ze-ruu-te/"}'::jsonb,
        '{"term": "destination", "meaning": "destino", "de": "Reiseziel", "ex": "Rome was our final destination.", "pron": "/des-ti-néi-shen/", "pron_de": "/RAI-ze-tsiil/"}'::jsonb,
        '{"term": "travel agency", "meaning": "agencia de viajes", "de": "Reisebüro", "ex": "Book the holiday at a travel agency.", "pron": "/trá-vel éi-dyen-si/", "pron_de": "/RAI-ze-büü-ro/"}'::jsonb,
        '{"term": "heritage", "meaning": "patrimonio / herencia cultural", "de": "Kulturerbe / Erbe", "ex": "The city is proud of its cultural heritage.", "pron": "/hé-ri-tidy/", "pron_de": "/kul-TUR-er-be/"}'::jsonb,
        '{"term": "visit", "meaning": "visitar", "de": "besuchen", "ex": "Visit the castle on a sunny day.", "pron": "/ví-sit/", "pron_de": "/bö-ZUU-jen/"}'::jsonb,
        '{"term": "explore", "meaning": "explorar / descubrir", "de": "erkunden", "ex": "Explore the old town on foot.", "pron": "/iks-plór/", "pron_de": "/ö-KUN-den/"}'::jsonb,
        '{"term": "hike", "meaning": "hacer senderismo / caminar por la naturaleza", "de": "wandern", "ex": "Hike through the national park for great views.", "pron": "/jaik/", "pron_de": "/VAN-dern/"}'::jsonb,
        '{"term": "take photos", "meaning": "hacer fotos / fotografiar", "de": "Fotos machen", "ex": "Take photos at every beautiful spot.", "pron": "/teik fóu-tos/", "pron_de": "/FOO-tos MA-jen/"}'::jsonb,
        '{"term": "peak season", "meaning": "temporada alta", "de": "Hochsaison", "ex": "Prices are higher during peak season.", "pron": "/piik sí-son/", "pron_de": "/HOJ-ze-zon/"}'::jsonb,
        '{"term": "off season", "meaning": "temporada baja", "de": "Nebensaison / Vorsaison", "ex": "Visit in the off season to avoid crowds.", "pron": "/of sí-son/", "pron_de": "/NEE-ben-ze-zon/"}'::jsonb,
        '{"term": "tourist trap", "meaning": "trampa para turistas / lugar sobrevalorado", "de": "Touristenfalle", "ex": "Avoid that restaurant — it is a tourist trap.", "pron": "/túr-ist trap/", "pron_de": "/tu-RIS-ten-fa-le/"}'::jsonb,
        '{"term": "off the beaten track", "meaning": "fuera de lo turístico / poco conocido", "de": "abseits der ausgetretenen Pfade", "ex": "We found a hidden gem off the beaten track.", "pron": "/of de bí-ten trak/", "pron_de": "/AP-zaits dö AUS-ge-tree-te-nen PFAA-de/"}'::jsonb,
        '{"term": "must-see", "meaning": "imprescindible / que no se puede perder", "de": "Muss-man-gesehen-haben", "ex": "The Eiffel Tower is a must-see in Paris.", "pron": "/mast-sii/", "pron_de": "/MUS-man-gö-zee-en-haa-ben/"}'::jsonb,
        '{"term": "crowd", "meaning": "multitud / aglomeración de gente", "de": "Menschenmenge / Gedränge", "ex": "Arrive early to avoid the crowds.", "pron": "/kraud/", "pron_de": "/MEN-shen-menge/"}'::jsonb,
        '{"term": "photography allowed", "meaning": "fotografía permitida", "de": "Fotografieren erlaubt", "ex": "Photography is allowed outside but not inside.", "pron": "/fo-tó-gra-fi a-láud/", "pron_de": "/fo-to-gra-FII-ren ö-LAUPT/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 1725 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1725, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Turismo, Monumentos y Atracciones');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Tourismus, Sehenswürdigkeiten und Attraktionen');

    FOREACH card IN ARRAY v_cards
    LOOP
        SELECT get_or_create_word(card->>'term', 'en', card->>'ex') INTO v_word_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron')
    ON CONFLICT DO NOTHING;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de')
    ON CONFLICT DO NOTHING;

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_word_id)
    ON CONFLICT DO NOTHING;
    END LOOP;
END;
$seed$;
