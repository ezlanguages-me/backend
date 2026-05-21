-- ============================================================
-- Seed: A0 English Path – STEP 1110 – Deck – La Ciudad
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "street", "meaning": "calle", "de": "Straße", "ex": "The market is at the end of the street.", "pron": "/strit/", "pron_de": "/SHTRAA-se/"}'::jsonb,
        '{"term": "avenue", "meaning": "avenida", "de": "Allee / Avenida", "ex": "Walk down the avenue towards the park.", "pron": "/á-ve-niu/", "pron_de": "/a-LEE/"}'::jsonb,
        '{"term": "road", "meaning": "carretera / camino", "de": "Straße / Weg", "ex": "Take the road north to the next village.", "pron": "/roud/", "pron_de": "/SHTRAA-se/"}'::jsonb,
        '{"term": "lane", "meaning": "carril / calle estrecha", "de": "Spur / Gasse", "ex": "Keep to the left lane on the motorway.", "pron": "/lein/", "pron_de": "/SHPUR/"}'::jsonb,
        '{"term": "alley", "meaning": "callejón / callejuela", "de": "Gasse / Allee", "ex": "There is a shortcut through the alley.", "pron": "/á-li/", "pron_de": "/GA-se/"}'::jsonb,
        '{"term": "motorway / highway", "meaning": "autopista", "de": "Autobahn", "ex": "Take the motorway to save time.", "pron": "/móu-tor-uei/", "pron_de": "/AU-to-baan/"}'::jsonb,
        '{"term": "ring road", "meaning": "ronda / circunvalación", "de": "Ringstraße / Umgehungsstraße", "ex": "Use the ring road to avoid the city centre.", "pron": "/ring roud/", "pron_de": "/RING-shtraa-se/"}'::jsonb,
        '{"term": "one-way street", "meaning": "calle de sentido único", "de": "Einbahnstraße", "ex": "Be careful — it is a one-way street.", "pron": "/uan-uéi strit/", "pron_de": "/AIN-baan-shtraa-se/"}'::jsonb,
        '{"term": "dead end / cul-de-sac", "meaning": "callejón sin salida", "de": "Sackgasse", "ex": "This road is a dead end.", "pron": "/ded end/", "pron_de": "/ZAK-ga-se/"}'::jsonb,
        '{"term": "pavement / sidewalk", "meaning": "acera / vereda", "de": "Bürgersteig / Gehweg", "ex": "Always walk on the pavement.", "pron": "/péiv-ment/", "pron_de": "/BÜR-gö-shtaig/"}'::jsonb,
        '{"term": "footpath", "meaning": "senda / camino peatonal", "de": "Fußweg / Pfad", "ex": "Follow the footpath through the park.", "pron": "/fút-paz/", "pron_de": "/FUUS-veg/"}'::jsonb,
        '{"term": "bike lane / cycle path", "meaning": "carril bici", "de": "Fahrradweg", "ex": "Use the bike lane, not the road.", "pron": "/baik lein/", "pron_de": "/FAR-rat-veg/"}'::jsonb,
        '{"term": "overpass / flyover", "meaning": "paso elevado / viaducto", "de": "Überführung", "ex": "The overpass crosses the motorway.", "pron": "/óu-ver-pas/", "pron_de": "/ÜÜ-bö-füü-rung/"}'::jsonb,
        '{"term": "underpass", "meaning": "paso subterráneo / paso inferior", "de": "Unterführung", "ex": "Use the underpass to cross safely.", "pron": "/án-der-pas/", "pron_de": "/UN-tö-füü-rung/"}'::jsonb,
        '{"term": "bridge", "meaning": "puente", "de": "Brücke", "ex": "Cross the bridge to reach the island.", "pron": "/bridyi/", "pron_de": "/BRÜK-e/"}'::jsonb,
        '{"term": "tunnel", "meaning": "túnel", "de": "Tunnel", "ex": "The train goes through a long tunnel.", "pron": "/tá-nel/", "pron_de": "/TU-nel/"}'::jsonb,
        '{"term": "corner", "meaning": "esquina", "de": "Ecke", "ex": "Meet me at the corner of the street.", "pron": "/kór-ner/", "pron_de": "/E-ke/"}'::jsonb,
        '{"term": "block", "meaning": "manzana / bloque", "de": "Häuserblock", "ex": "Walk two blocks and turn right.", "pron": "/blok/", "pron_de": "/HOI-zö-blok/"}'::jsonb,
        '{"term": "junction / intersection", "meaning": "cruce / intersección", "de": "Kreuzung", "ex": "Turn left at the next junction.", "pron": "/dyánk-shen/", "pron_de": "/KROITS-ung/"}'::jsonb,
        '{"term": "roundabout", "meaning": "rotonda", "de": "Kreisverkehr", "ex": "Take the second exit at the roundabout.", "pron": "/ráund-a-baut/", "pron_de": "/KRAIS-for-ker/"}'::jsonb,
        '{"term": "traffic light", "meaning": "semáforo", "de": "Ampel", "ex": "Stop when the traffic light is red.", "pron": "/trá-fik lait/", "pron_de": "/AM-pel/"}'::jsonb,
        '{"term": "zebra crossing", "meaning": "paso de cebra / paso de peatones", "de": "Zebrastreifen", "ex": "Cross at the zebra crossing.", "pron": "/zi-bra kró-sing/", "pron_de": "/TSEE-bra-shtrai-fen/"}'::jsonb,
        '{"term": "pedestrian zone", "meaning": "zona peatonal", "de": "Fußgängerzone", "ex": "No cars are allowed in the pedestrian zone.", "pron": "/pe-dés-tri-en soun/", "pron_de": "/FUUS-gäng-ö-tsoo-ne/"}'::jsonb,
        '{"term": "speed bump", "meaning": "badén / reductor de velocidad", "de": "Bodenschwelle", "ex": "Slow down — there is a speed bump ahead.", "pron": "/spid bamp/", "pron_de": "/BOO-den-shve-le/"}'::jsonb,
        '{"term": "street sign", "meaning": "señal de tráfico / rótulo de calle", "de": "Straßenschild", "ex": "Read the street sign at the corner.", "pron": "/strit sain/", "pron_de": "/SHTRAA-sen-shilt/"}'::jsonb,
        '{"term": "lamp post", "meaning": "farola", "de": "Laternenpfahl", "ex": "The thief hid behind a lamp post.", "pron": "/lamp poust/", "pron_de": "/la-TER-nen-pfaal/"}'::jsonb,
        '{"term": "postbox / letterbox", "meaning": "buzón", "de": "Briefkasten", "ex": "Post the letter in the red postbox.", "pron": "/póust-boks/", "pron_de": "/BRIIF-kas-ten/"}'::jsonb,
        '{"term": "bus stop", "meaning": "parada de autobús", "de": "Bushaltestelle", "ex": "Wait at the bus stop on the corner.", "pron": "/bas stop/", "pron_de": "/BUS-hal-te-shte-le/"}'::jsonb,
        '{"term": "station", "meaning": "estación", "de": "Bahnhof / Station", "ex": "The train station is in the city centre.", "pron": "/stéi-shen/", "pron_de": "/BAAN-hof/"}'::jsonb,
        '{"term": "subway / underground", "meaning": "metro / subterráneo", "de": "U-Bahn", "ex": "Take the subway to avoid traffic.", "pron": "/sáb-uei/", "pron_de": "/UU-baan/"}'::jsonb,
        '{"term": "tram", "meaning": "tranvía", "de": "Straßenbahn", "ex": "The tram stops every five minutes.", "pron": "/tram/", "pron_de": "/SHTRAA-sen-baan/"}'::jsonb,
        '{"term": "bus", "meaning": "autobús", "de": "Bus", "ex": "Which bus goes to the city centre?", "pron": "/bas/", "pron_de": "/bus/"}'::jsonb,
        '{"term": "taxi", "meaning": "taxi", "de": "Taxi", "ex": "Call a taxi to get to the airport.", "pron": "/ták-si/", "pron_de": "/TAK-si/"}'::jsonb,
        '{"term": "taxi rank", "meaning": "parada de taxis", "de": "Taxistand", "ex": "There is a taxi rank outside the hotel.", "pron": "/ták-si rank/", "pron_de": "/TAK-si-shtant/"}'::jsonb,
        '{"term": "airport", "meaning": "aeropuerto", "de": "Flughafen", "ex": "The airport is 20 kilometres from the city.", "pron": "/ér-port/", "pron_de": "/FLUUG-haa-fen/"}'::jsonb,
        '{"term": "port / harbour", "meaning": "puerto", "de": "Hafen", "ex": "The ferry departs from the port.", "pron": "/port/", "pron_de": "/HAA-fen/"}'::jsonb,
        '{"term": "car park", "meaning": "aparcamiento / estacionamiento", "de": "Parkplatz / Parkhaus", "ex": "Leave your car in the car park.", "pron": "/kar park/", "pron_de": "/PARK-plats/"}'::jsonb,
        '{"term": "petrol station", "meaning": "gasolinera", "de": "Tankstelle", "ex": "Stop at the petrol station to fill up.", "pron": "/pé-trol stéi-shen/", "pron_de": "/TANK-shte-le/"}'::jsonb,
        '{"term": "traffic jam", "meaning": "atasco / embotellamiento", "de": "Stau", "ex": "There is a traffic jam on the ring road.", "pron": "/trá-fik dyam/", "pron_de": "/SHTAU/"}'::jsonb,
        '{"term": "rush hour", "meaning": "hora punta", "de": "Stoßzeit / Hauptverkehrszeit", "ex": "Avoid driving during rush hour.", "pron": "/rash áuer/", "pron_de": "/SHTOOS-tsait/"}'::jsonb,
        '{"term": "pedestrian", "meaning": "peatón", "de": "Fußgänger", "ex": "Pedestrians must use the crossing.", "pron": "/pe-dés-tri-en/", "pron_de": "/FUUS-gäng-ö/"}'::jsonb,
        '{"term": "neighbourhood", "meaning": "barrio / vecindario", "de": "Nachbarschaft / Viertel", "ex": "This is a quiet neighbourhood.", "pron": "/néi-ber-hud/", "pron_de": "/NACH-bar-shaft/"}'::jsonb,
        '{"term": "suburb", "meaning": "suburbio / afueras", "de": "Vorort", "ex": "They moved to the suburbs for more space.", "pron": "/sá-berb/", "pron_de": "/FOR-ort/"}'::jsonb,
        '{"term": "city centre", "meaning": "centro de la ciudad", "de": "Stadtzentrum / Innenstadt", "ex": "All the main shops are in the city centre.", "pron": "/sí-ti sén-ter/", "pron_de": "/SHTATT-tsen-trum/"}'::jsonb,
        '{"term": "old town", "meaning": "casco antiguo", "de": "Altstadt", "ex": "The old town has many historic buildings.", "pron": "/ould taun/", "pron_de": "/ALT-shtat/"}'::jsonb,
        '{"term": "outskirts", "meaning": "las afueras / los alrededores", "de": "Stadtrand / Außenbezirke", "ex": "The factory is on the outskirts of the city.", "pron": "/áut-skerts/", "pron_de": "/SHTAT-rant/"}'::jsonb,
        '{"term": "park", "meaning": "parque", "de": "Park", "ex": "Children play in the park after school.", "pron": "/park/", "pron_de": "/park/"}'::jsonb,
        '{"term": "square", "meaning": "plaza", "de": "Platz", "ex": "They met in the main square.", "pron": "/skuer/", "pron_de": "/plats/"}'::jsonb,
        '{"term": "museum", "meaning": "museo", "de": "Museum", "ex": "The museum is free on Sundays.", "pron": "/miu-sí-em/", "pron_de": "/mu-ZEE-um/"}'::jsonb,
        '{"term": "library", "meaning": "biblioteca", "de": "Bibliothek / Bücherei", "ex": "You can borrow books from the library.", "pron": "/lái-bre-ri/", "pron_de": "/bib-lio-TEEK/"}'::jsonb,
        '{"term": "market", "meaning": "mercado", "de": "Markt", "ex": "Buy fresh vegetables at the market.", "pron": "/már-ket/", "pron_de": "/markt/"}'::jsonb,
        '{"term": "pharmacy", "meaning": "farmacia", "de": "Apotheke", "ex": "Get the medicine at the pharmacy.", "pron": "/fár-ma-si/", "pron_de": "/a-po-TEE-ke/"}'::jsonb,
        '{"term": "hospital", "meaning": "hospital", "de": "Krankenhaus", "ex": "Call an ambulance and go to the hospital.", "pron": "/hós-pi-tal/", "pron_de": "/KRANK-en-haus/"}'::jsonb,
        '{"term": "doctor", "meaning": "médico / consultorio", "de": "Arzt / Arztpraxis", "ex": "Make an appointment at the doctor.", "pron": "/dók-tor/", "pron_de": "/artst/"}'::jsonb,
        '{"term": "dentist", "meaning": "dentista", "de": "Zahnarzt", "ex": "I have a dentist appointment at three.", "pron": "/dén-tist/", "pron_de": "/TSAAN-artst/"}'::jsonb,
        '{"term": "bank", "meaning": "banco", "de": "Bank", "ex": "I need to go to the bank to withdraw money.", "pron": "/bank/", "pron_de": "/bank/"}'::jsonb,
        '{"term": "post office", "meaning": "oficina de correos", "de": "Post / Postamt", "ex": "Send the parcel from the post office.", "pron": "/poust ó-fis/", "pron_de": "/post/"}'::jsonb,
        '{"term": "town hall", "meaning": "ayuntamiento", "de": "Rathaus", "ex": "Register your address at the town hall.", "pron": "/taun hol/", "pron_de": "/RAAT-haus/"}'::jsonb,
        '{"term": "police station", "meaning": "comisaría", "de": "Polizeirevier / Wache", "ex": "Report the theft at the police station.", "pron": "/po-lís stéi-shen/", "pron_de": "/po-li-TSAI-re-vir/"}'::jsonb,
        '{"term": "fire station", "meaning": "parque de bomberos", "de": "Feuerwache", "ex": "The fire station is near the bridge.", "pron": "/fair stéi-shen/", "pron_de": "/FOI-ö-va-je/"}'::jsonb,
        '{"term": "school", "meaning": "colegio / escuela", "de": "Schule", "ex": "The children walk to school every day.", "pron": "/skul/", "pron_de": "/SHUU-le/"}'::jsonb,
        '{"term": "supermarket", "meaning": "supermercado", "de": "Supermarkt", "ex": "Buy groceries at the supermarket.", "pron": "/sú-per-mar-ket/", "pron_de": "/ZUU-pö-markt/"}'::jsonb,
        '{"term": "bakery", "meaning": "panadería", "de": "Bäckerei", "ex": "Buy fresh bread at the bakery.", "pron": "/béi-ke-ri/", "pron_de": "/bä-ke-RAI/"}'::jsonb,
        '{"term": "hairdresser", "meaning": "peluquería", "de": "Friseur / Friseursalon", "ex": "My hairdresser is on the high street.", "pron": "/hér-dre-ser/", "pron_de": "/fri-ZÖR/"}'::jsonb,
        '{"term": "gym", "meaning": "gimnasio", "de": "Fitnessstudio", "ex": "She goes to the gym three times a week.", "pron": "/dyim/", "pron_de": "/FIT-nes-shtuu-dio/"}'::jsonb,
        '{"term": "sports centre", "meaning": "polideportivo / centro deportivo", "de": "Sportzentrum", "ex": "The sports centre has a pool and a gym.", "pron": "/sports sén-ter/", "pron_de": "/SHPORT-tsen-trum/"}'::jsonb,
        '{"term": "cinema", "meaning": "cine", "de": "Kino", "ex": "Let us go to the cinema tonight.", "pron": "/sí-ne-ma/", "pron_de": "/KII-no/"}'::jsonb,
        '{"term": "theatre", "meaning": "teatro", "de": "Theater", "ex": "The theatre puts on shows every weekend.", "pron": "/zí-a-ter/", "pron_de": "/tee-AA-tö/"}'::jsonb,
        '{"term": "hotel", "meaning": "hotel", "de": "Hotel", "ex": "We booked a hotel near the city centre.", "pron": "/hou-tél/", "pron_de": "/ho-TEL/"}'::jsonb,
        '{"term": "restaurant", "meaning": "restaurante", "de": "Restaurant", "ex": "There is a good Italian restaurant nearby.", "pron": "/rés-to-rant/", "pron_de": "/res-to-RANT/"}'::jsonb,
        '{"term": "café", "meaning": "café / cafetería", "de": "Café", "ex": "Let us meet at the café on the corner.", "pron": "/ká-fei/", "pron_de": "/ka-FEE/"}'::jsonb,
        '{"term": "bar", "meaning": "bar", "de": "Bar / Kneipe", "ex": "They went to the bar after work.", "pron": "/bar/", "pron_de": "/bar/"}'::jsonb,
        '{"term": "church", "meaning": "iglesia", "de": "Kirche", "ex": "The old church is in the main square.", "pron": "/cherch/", "pron_de": "/KIR-je/"}'::jsonb,
        '{"term": "cathedral", "meaning": "catedral", "de": "Kathedrale / Dom", "ex": "Visit the famous cathedral in the old town.", "pron": "/ka-zí-dral/", "pron_de": "/ka-te-DRAA-le/"}'::jsonb,
        '{"term": "mosque", "meaning": "mezquita", "de": "Moschee", "ex": "The mosque is near the central square.", "pron": "/mosk/", "pron_de": "/mo-SHEE/"}'::jsonb,
        '{"term": "cemetery", "meaning": "cementerio", "de": "Friedhof", "ex": "The cemetery is on the edge of the town.", "pron": "/sé-me-te-ri/", "pron_de": "/FRIIT-hof/"}'::jsonb,
        '{"term": "fountain", "meaning": "fuente", "de": "Brunnen / Springbrunnen", "ex": "There is a beautiful fountain in the square.", "pron": "/fáun-ten/", "pron_de": "/BRUN-en/"}'::jsonb,
        '{"term": "statue", "meaning": "estatua", "de": "Statue / Denkmal", "ex": "The statue of the king is in the square.", "pron": "/stá-chu/", "pron_de": "/SHTAA-tue/"}'::jsonb,
        '{"term": "monument", "meaning": "monumento", "de": "Denkmal / Monument", "ex": "The war monument is in the park.", "pron": "/mó-niu-ment/", "pron_de": "/DENK-maal/"}'::jsonb,
        '{"term": "skyscraper", "meaning": "rascacielos", "de": "Wolkenkratzer", "ex": "The skyscraper has sixty floors.", "pron": "/skái-skrei-per/", "pron_de": "/VOL-ken-krat-tsö/"}'::jsonb,
        '{"term": "building", "meaning": "edificio", "de": "Gebäude", "ex": "The new building is made of glass.", "pron": "/bíl-ding/", "pron_de": "/gö-BOI-de/"}'::jsonb,
        '{"term": "block of flats", "meaning": "bloque de pisos / bloque de apartamentos", "de": "Wohnblock / Mehrfamilienhaus", "ex": "She lives in a block of flats.", "pron": "/blok ov flats/", "pron_de": "/VOON-blok/"}'::jsonb,
        '{"term": "playground", "meaning": "parque infantil / zona de juegos", "de": "Spielplatz", "ex": "The children played in the playground.", "pron": "/pléi-graund/", "pron_de": "/SHPIIL-plats/"}'::jsonb,
        '{"term": "swimming pool", "meaning": "piscina", "de": "Schwimmbad", "ex": "The swimming pool is open in summer.", "pron": "/suí-ming pul/", "pron_de": "/SHVIM-baat/"}'::jsonb,
        '{"term": "stadium", "meaning": "estadio", "de": "Stadion", "ex": "The match is at the main stadium.", "pron": "/stéi-di-em/", "pron_de": "/SHTAA-dion/"}'::jsonb,
        '{"term": "shopping mall", "meaning": "centro comercial", "de": "Einkaufszentrum", "ex": "The shopping mall has over 100 shops.", "pron": "/shó-ping mol/", "pron_de": "/AIN-kaufs-tsen-trum/"}'::jsonb,
        '{"term": "river", "meaning": "río", "de": "Fluss", "ex": "The city is built along the river.", "pron": "/rí-ver/", "pron_de": "/flus/"}'::jsonb,
        '{"term": "canal", "meaning": "canal", "de": "Kanal", "ex": "There are boats on the canal.", "pron": "/ka-nál/", "pron_de": "/ka-NAAL/"}'::jsonb,
        '{"term": "lake", "meaning": "lago", "de": "See", "ex": "We walked around the lake in the park.", "pron": "/leik/", "pron_de": "/zee/"}'::jsonb,
        '{"term": "hill", "meaning": "colina", "de": "Hügel / Anhöhe", "ex": "From the hill you can see the whole city.", "pron": "/hil/", "pron_de": "/HÜÜ-gel/"}'::jsonb,
        '{"term": "map", "meaning": "mapa / plano", "de": "Karte / Stadtplan", "ex": "Use the map to find the museum.", "pron": "/map/", "pron_de": "/KAR-te/"}'::jsonb,
        '{"term": "address", "meaning": "dirección / domicilio", "de": "Adresse", "ex": "Write your address on the form.", "pron": "/a-drés/", "pron_de": "/a-DRE-se/"}'::jsonb,
        '{"term": "landmark", "meaning": "punto de referencia / hito", "de": "Wahrzeichen / Orientierungspunkt", "ex": "The tower is a famous landmark.", "pron": "/lánd-mark/", "pron_de": "/WAAR-tsai-jen/"}'::jsonb,
        '{"term": "route", "meaning": "ruta / recorrido", "de": "Route / Weg", "ex": "Plan your route before you leave.", "pron": "/rut/", "pron_de": "/RUU-te/"}'::jsonb,
        '{"term": "shortcut", "meaning": "atajo", "de": "Abkürzung", "ex": "Take the shortcut through the park.", "pron": "/shórt-kat/", "pron_de": "/AP-kür-tssung/"}'::jsonb,
        '{"term": "detour", "meaning": "desvío / rodeo", "de": "Umweg / Umleitung", "ex": "We took a detour because of the roadworks.", "pron": "/dí-tur/", "pron_de": "/UM-veg/"}'::jsonb,
        '{"term": "sign", "meaning": "señal / cartel", "de": "Schild / Hinweisschild", "ex": "Follow the signs to the city centre.", "pron": "/sain/", "pron_de": "/shilt/"}'::jsonb,
        '{"term": "distance", "meaning": "distancia", "de": "Entfernung / Abstand", "ex": "What is the distance to the station?", "pron": "/dís-tens/", "pron_de": "/ent-FER-nung/"}'::jsonb,
        '{"term": "GPS / sat nav", "meaning": "GPS / navegador", "de": "Navi / GPS", "ex": "Use the GPS to find the address.", "pron": "/dyii-pii-és/", "pron_de": "/NAA-vi/"}'::jsonb,
        '{"term": "roadworks", "meaning": "obras en la carretera / obras viales", "de": "Baustelle", "ex": "There are roadworks on the main road.", "pron": "/róud-uorks/", "pron_de": "/BAU-shte-le/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 1110 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1110, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'La Ciudad');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Die Stadt');

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
