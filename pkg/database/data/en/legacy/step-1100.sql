-- ============================================================
-- Seed: A0 English Path – STEP 1100 – Deck – Preposiciones de Lugar y Movimiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "in", "meaning": "en / dentro de", "de": "in", "ex": "The keys are in the drawer.", "pron": "/in/", "pron_de": "/in/"}'::jsonb,
        '{"term": "on", "meaning": "en / sobre", "de": "auf / an", "ex": "The book is on the table.", "pron": "/on/", "pron_de": "/auf/"}'::jsonb,
        '{"term": "at", "meaning": "en (lugar concreto)", "de": "an / bei", "ex": "She is at the office right now.", "pron": "/at/", "pron_de": "/an/"}'::jsonb,
        '{"term": "under", "meaning": "debajo de", "de": "unter", "ex": "The cat is under the bed.", "pron": "/án-der/", "pron_de": "/UN-tö/"}'::jsonb,
        '{"term": "beneath", "meaning": "justo debajo de (formal)", "de": "unterhalb / darunter", "ex": "He found the note beneath the mat.", "pron": "/bi-níiz/", "pron_de": "/UN-tö-halp/"}'::jsonb,
        '{"term": "underneath", "meaning": "por debajo de / justo debajo", "de": "darunter / unten drunter", "ex": "There is a box underneath the stairs.", "pron": "/an-der-níiz/", "pron_de": "/da-RUN-tö/"}'::jsonb,
        '{"term": "above", "meaning": "encima de / por encima de", "de": "über", "ex": "The plane flew above the clouds.", "pron": "/a-báv/", "pron_de": "/üü-bö/"}'::jsonb,
        '{"term": "over", "meaning": "sobre / por encima de", "de": "über", "ex": "Hang the picture over the sofa.", "pron": "/óu-ver/", "pron_de": "/üü-bö/"}'::jsonb,
        '{"term": "below", "meaning": "debajo de / por debajo de", "de": "unterhalb", "ex": "The temperature is below zero.", "pron": "/bi-lóu/", "pron_de": "/UN-tö-halp/"}'::jsonb,
        '{"term": "between", "meaning": "entre (dos)", "de": "zwischen", "ex": "The bank is between the bakery and the pharmacy.", "pron": "/bi-tuín/", "pron_de": "/TSVI-shen/"}'::jsonb,
        '{"term": "among", "meaning": "entre (varios)", "de": "unter / zwischen", "ex": "She stood among the crowd.", "pron": "/a-máng/", "pron_de": "/UN-tö/"}'::jsonb,
        '{"term": "amid", "meaning": "en medio de / rodeado de", "de": "inmitten", "ex": "She sat amid a pile of books.", "pron": "/a-míd/", "pron_de": "/IN-mi-ten/"}'::jsonb,
        '{"term": "in between", "meaning": "en medio / entre los dos", "de": "dazwischen", "ex": "There is a small garden in between the houses.", "pron": "/in bi-tuín/", "pron_de": "/da-TSVI-shen/"}'::jsonb,
        '{"term": "behind", "meaning": "detrás de", "de": "hinter", "ex": "The garden is behind the house.", "pron": "/bi-háind/", "pron_de": "/HIN-tö/"}'::jsonb,
        '{"term": "in front of", "meaning": "delante de / enfrente de", "de": "vor", "ex": "There is a fountain in front of the museum.", "pron": "/in frant ov/", "pron_de": "/for/"}'::jsonb,
        '{"term": "next to", "meaning": "al lado de / junto a", "de": "neben", "ex": "The supermarket is next to the school.", "pron": "/nekt tu/", "pron_de": "/NEE-ben/"}'::jsonb,
        '{"term": "beside", "meaning": "junto a / al lado de", "de": "neben", "ex": "She sat beside her friend.", "pron": "/bi-sáid/", "pron_de": "/NEE-ben/"}'::jsonb,
        '{"term": "alongside", "meaning": "junto a / al lado de (en paralelo)", "de": "neben / entlang", "ex": "Walk alongside me so we can talk.", "pron": "/a-long-sáid/", "pron_de": "/NEE-ben/"}'::jsonb,
        '{"term": "adjacent to", "meaning": "adyacente a / contiguo a", "de": "angrenzend an", "ex": "The car park is adjacent to the hospital.", "pron": "/a-dyéi-sent tu/", "pron_de": "/AN-gren-tsent an/"}'::jsonb,
        '{"term": "near", "meaning": "cerca de", "de": "nahe / in der Nähe von", "ex": "The hotel is near the beach.", "pron": "/nir/", "pron_de": "/NAA-e/"}'::jsonb,
        '{"term": "far from", "meaning": "lejos de", "de": "weit von", "ex": "The station is far from here.", "pron": "/far from/", "pron_de": "/vait fon/"}'::jsonb,
        '{"term": "opposite", "meaning": "enfrente de / frente a", "de": "gegenüber", "ex": "The pharmacy is opposite the post office.", "pron": "/ó-po-sit/", "pron_de": "/GEE-gen-üü-bö/"}'::jsonb,
        '{"term": "across from", "meaning": "al otro lado de / frente a", "de": "gegenüber von", "ex": "The café is across from the park.", "pron": "/a-kros from/", "pron_de": "/GEE-gen-üü-bö fon/"}'::jsonb,
        '{"term": "facing", "meaning": "frente a / mirando hacia", "de": "gegenüberliegend", "ex": "There is a bench facing the river.", "pron": "/féi-sing/", "pron_de": "/GEE-gen-üü-bö-lii-gend/"}'::jsonb,
        '{"term": "inside", "meaning": "dentro de", "de": "drinnen / innerhalb", "ex": "Come inside, it is cold outside.", "pron": "/in-sáid/", "pron_de": "/DRI-nen/"}'::jsonb,
        '{"term": "outside", "meaning": "fuera de", "de": "draußen / außerhalb", "ex": "Wait outside the door, please.", "pron": "/áut-said/", "pron_de": "/DRAU-sen/"}'::jsonb,
        '{"term": "within", "meaning": "dentro de / en el radio de", "de": "innerhalb", "ex": "Everything is within walking distance.", "pron": "/wi-dín/", "pron_de": "/I-nö-halp/"}'::jsonb,
        '{"term": "throughout", "meaning": "por todo / a lo largo de", "de": "durch / überall in", "ex": "There are shops throughout the city.", "pron": "/zru-áut/", "pron_de": "/DURCJ/"}'::jsonb,
        '{"term": "against", "meaning": "contra / pegado a", "de": "gegen / an", "ex": "Lean the ladder against the wall.", "pron": "/a-guénst/", "pron_de": "/GEE-gen/"}'::jsonb,
        '{"term": "by", "meaning": "junto a / cerca de / al lado de", "de": "bei / neben", "ex": "Sit by the window.", "pron": "/bai/", "pron_de": "/bai/"}'::jsonb,
        '{"term": "along", "meaning": "a lo largo de", "de": "entlang", "ex": "Walk along the river for ten minutes.", "pron": "/a-lóng/", "pron_de": "/ent-LANG/"}'::jsonb,
        '{"term": "past", "meaning": "pasando / más allá de", "de": "an … vorbei", "ex": "Walk past the school and turn left.", "pron": "/past/", "pron_de": "/an for-BAI/"}'::jsonb,
        '{"term": "beyond", "meaning": "más allá de", "de": "jenseits / hinter", "ex": "Beyond the mountains lies the sea.", "pron": "/bi-yónd/", "pron_de": "/YEN-zaits/"}'::jsonb,
        '{"term": "through", "meaning": "a través de / por", "de": "durch", "ex": "Go through the tunnel.", "pron": "/zru/", "pron_de": "/DURCJ/"}'::jsonb,
        '{"term": "across", "meaning": "al otro lado de / cruzando", "de": "über / quer durch", "ex": "There is a bridge across the river.", "pron": "/a-krós/", "pron_de": "/üü-bö/"}'::jsonb,
        '{"term": "around", "meaning": "alrededor de", "de": "um … herum", "ex": "They walked around the lake.", "pron": "/a-ráund/", "pron_de": "/um hö-RUM/"}'::jsonb,
        '{"term": "into", "meaning": "hacia dentro de / en", "de": "in … hinein", "ex": "She walked into the room.", "pron": "/ín-tu/", "pron_de": "/in hi-NAIN/"}'::jsonb,
        '{"term": "onto", "meaning": "sobre / encima de (movimiento)", "de": "auf … drauf", "ex": "He climbed onto the roof.", "pron": "/ón-tu/", "pron_de": "/auf drauf/"}'::jsonb,
        '{"term": "out of", "meaning": "fuera de / saliendo de", "de": "aus … heraus", "ex": "She ran out of the house.", "pron": "/áut ov/", "pron_de": "/aus hö-RAUS/"}'::jsonb,
        '{"term": "off", "meaning": "de / separado de", "de": "von … weg", "ex": "Step off the bus carefully.", "pron": "/of/", "pron_de": "/fon veg/"}'::jsonb,
        '{"term": "toward / towards", "meaning": "hacia", "de": "in Richtung / auf … zu", "ex": "Walk towards the exit.", "pron": "/tu-uórd/", "pron_de": "/in RISH-tung/"}'::jsonb,
        '{"term": "away from", "meaning": "lejos de / alejándose de", "de": "weg von", "ex": "Move away from the fire.", "pron": "/a-uéi from/", "pron_de": "/veg fon/"}'::jsonb,
        '{"term": "from", "meaning": "desde / de (origen)", "de": "von / aus", "ex": "She comes from Madrid.", "pron": "/from/", "pron_de": "/fon/"}'::jsonb,
        '{"term": "to", "meaning": "a / hacia (destino)", "de": "nach / zu", "ex": "We are going to the station.", "pron": "/tu/", "pron_de": "/nac/"}'::jsonb,
        '{"term": "via", "meaning": "por / pasando por / vía", "de": "über / via", "ex": "Travel to Paris via Lyon.", "pron": "/váia/", "pron_de": "/üü-bö/"}'::jsonb,
        '{"term": "left", "meaning": "izquierda", "de": "links", "ex": "Turn left at the traffic lights.", "pron": "/left/", "pron_de": "/links/"}'::jsonb,
        '{"term": "right", "meaning": "derecha", "de": "rechts", "ex": "The bank is on the right.", "pron": "/rait/", "pron_de": "/reJts/"}'::jsonb,
        '{"term": "straight ahead", "meaning": "todo recto / recto", "de": "geradeaus", "ex": "Go straight ahead for two blocks.", "pron": "/streit a-héd/", "pron_de": "/gö-RAA-de-aus/"}'::jsonb,
        '{"term": "on the left", "meaning": "a la izquierda", "de": "auf der linken Seite", "ex": "The pharmacy is on the left.", "pron": "/on de left/", "pron_de": "/auf dö LIN-ken ZAI-te/"}'::jsonb,
        '{"term": "on the right", "meaning": "a la derecha", "de": "auf der rechten Seite", "ex": "The school is on the right.", "pron": "/on de rait/", "pron_de": "/auf dö REJ-ten ZAI-te/"}'::jsonb,
        '{"term": "north", "meaning": "norte", "de": "Norden / nördlich", "ex": "Drive north for about ten miles.", "pron": "/norz/", "pron_de": "/NOR-den/"}'::jsonb,
        '{"term": "south", "meaning": "sur", "de": "Süden / südlich", "ex": "The village is south of the city.", "pron": "/sauz/", "pron_de": "/ZÜÜ-den/"}'::jsonb,
        '{"term": "east", "meaning": "este", "de": "Osten / östlich", "ex": "The sun rises in the east.", "pron": "/ist/", "pron_de": "/OS-ten/"}'::jsonb,
        '{"term": "west", "meaning": "oeste", "de": "Westen / westlich", "ex": "They drove west towards the coast.", "pron": "/uest/", "pron_de": "/VES-ten/"}'::jsonb,
        '{"term": "northeast", "meaning": "noreste", "de": "Nordosten", "ex": "The wind is coming from the northeast.", "pron": "/norz-íst/", "pron_de": "/NORT-os-ten/"}'::jsonb,
        '{"term": "northwest", "meaning": "noroeste", "de": "Nordwesten", "ex": "The mountains are to the northwest.", "pron": "/norz-uést/", "pron_de": "/NORT-ves-ten/"}'::jsonb,
        '{"term": "southeast", "meaning": "sureste", "de": "Südosten", "ex": "Take the southeast route on the map.", "pron": "/sauz-íst/", "pron_de": "/ZÜÜT-os-ten/"}'::jsonb,
        '{"term": "southwest", "meaning": "suroeste", "de": "Südwesten", "ex": "The town lies to the southwest.", "pron": "/sauz-uést/", "pron_de": "/ZÜÜT-ves-ten/"}'::jsonb,
        '{"term": "up", "meaning": "arriba / hacia arriba", "de": "oben / nach oben", "ex": "Go up the stairs to the second floor.", "pron": "/ap/", "pron_de": "/OO-ben/"}'::jsonb,
        '{"term": "down", "meaning": "abajo / hacia abajo", "de": "unten / nach unten", "ex": "Come down when dinner is ready.", "pron": "/daun/", "pron_de": "/UN-ten/"}'::jsonb,
        '{"term": "upstairs", "meaning": "en el piso de arriba", "de": "oben / im Obergeschoss", "ex": "The bedrooms are upstairs.", "pron": "/ap-stérs/", "pron_de": "/OO-ben/"}'::jsonb,
        '{"term": "downstairs", "meaning": "en el piso de abajo", "de": "unten / im Erdgeschoss", "ex": "The kitchen is downstairs.", "pron": "/daun-stérs/", "pron_de": "/UN-ten/"}'::jsonb,
        '{"term": "ground floor", "meaning": "planta baja", "de": "Erdgeschoss", "ex": "The shop is on the ground floor.", "pron": "/graund flor/", "pron_de": "/ERT-gö-shos/"}'::jsonb,
        '{"term": "first floor", "meaning": "primer piso (encima de la planta baja)", "de": "erstes Obergeschoss", "ex": "My flat is on the first floor.", "pron": "/ferst flor/", "pron_de": "/ERS-tes OO-bö-gö-shos/"}'::jsonb,
        '{"term": "top floor", "meaning": "último piso / planta más alta", "de": "oberstes Stockwerk", "ex": "The restaurant is on the top floor.", "pron": "/top flor/", "pron_de": "/OO-bös-tes SHTOK-verk/"}'::jsonb,
        '{"term": "basement", "meaning": "sótano", "de": "Keller / Untergeschoss", "ex": "The wine is stored in the basement.", "pron": "/béis-ment/", "pron_de": "/KE-lö/"}'::jsonb,
        '{"term": "underground", "meaning": "subterráneo / bajo tierra", "de": "unterirdisch", "ex": "The car park is underground.", "pron": "/an-der-gráund/", "pron_de": "/UN-tö-ir-dish/"}'::jsonb,
        '{"term": "indoors", "meaning": "dentro / en el interior", "de": "drinnen / im Inneren", "ex": "Stay indoors during the storm.", "pron": "/in-dórs/", "pron_de": "/DRI-nen/"}'::jsonb,
        '{"term": "outdoors", "meaning": "al aire libre / en el exterior", "de": "draußen / im Freien", "ex": "She loves eating outdoors.", "pron": "/áut-dors/", "pron_de": "/DRAU-sen/"}'::jsonb,
        '{"term": "turn left", "meaning": "girar a la izquierda", "de": "links abbiegen", "ex": "Turn left at the roundabout.", "pron": "/tern left/", "pron_de": "/links AB-bii-gen/"}'::jsonb,
        '{"term": "turn right", "meaning": "girar a la derecha", "de": "rechts abbiegen", "ex": "Turn right after the bridge.", "pron": "/tern rait/", "pron_de": "/reJts AB-bii-gen/"}'::jsonb,
        '{"term": "go straight on", "meaning": "seguir recto / continuar recto", "de": "geradeaus fahren / gehen", "ex": "Go straight on until you reach the square.", "pron": "/gou streit on/", "pron_de": "/gö-RAA-de-aus/"}'::jsonb,
        '{"term": "go back", "meaning": "volver / ir hacia atrás", "de": "zurückgehen", "ex": "Go back to the main road.", "pron": "/gou bak/", "pron_de": "/tsu-RÜK-gee-en/"}'::jsonb,
        '{"term": "cross", "meaning": "cruzar", "de": "überqueren", "ex": "Cross the road at the pedestrian crossing.", "pron": "/kros/", "pron_de": "/üü-bö-KVER-en/"}'::jsonb,
        '{"term": "go past", "meaning": "pasar por delante de / pasar de largo", "de": "vorbeigehen", "ex": "Go past the cinema and turn left.", "pron": "/gou past/", "pron_de": "/for-BAI-gee-en/"}'::jsonb,
        '{"term": "on the corner", "meaning": "en la esquina", "de": "an der Ecke", "ex": "The café is on the corner of the street.", "pron": "/on de kór-ner/", "pron_de": "/an dö E-ke/"}'::jsonb,
        '{"term": "round the corner", "meaning": "a la vuelta de la esquina", "de": "um die Ecke", "ex": "The shop is just round the corner.", "pron": "/raund de kór-ner/", "pron_de": "/um dee E-ke/"}'::jsonb,
        '{"term": "at the end of", "meaning": "al final de", "de": "am Ende von", "ex": "Turn left at the end of the road.", "pron": "/at de end ov/", "pron_de": "/am EN-de fon/"}'::jsonb,
        '{"term": "at the junction", "meaning": "en el cruce / en la intersección", "de": "an der Kreuzung", "ex": "At the junction, take the right lane.", "pron": "/at de dyánk-shen/", "pron_de": "/an dö KROITS-ung/"}'::jsonb,
        '{"term": "at the traffic lights", "meaning": "en el semáforo", "de": "an der Ampel", "ex": "Stop at the traffic lights.", "pron": "/at de tráfik laits/", "pron_de": "/an dö AM-pel/"}'::jsonb,
        '{"term": "head towards", "meaning": "dirigirse hacia", "de": "sich in Richtung … bewegen", "ex": "Head towards the city centre.", "pron": "/héd tu-uórd/", "pron_de": "/RISH-tung ... gee-en/"}'::jsonb,
        '{"term": "walk along", "meaning": "caminar a lo largo de", "de": "entlanggehen", "ex": "Walk along the canal for two kilometres.", "pron": "/uok a-lóng/", "pron_de": "/ent-LANG-gee-en/"}'::jsonb,
        '{"term": "approach", "meaning": "acercarse a / llegar a", "de": "sich nähern", "ex": "As you approach the station, slow down.", "pron": "/a-próutsh/", "pron_de": "/sich NÄÄ-ern/"}'::jsonb,
        '{"term": "pass by", "meaning": "pasar por / pasar de largo", "de": "vorbeikommen", "ex": "We pass by the market every morning.", "pron": "/pas bai/", "pron_de": "/for-BAI-ko-men/"}'::jsonb,
        '{"term": "enter", "meaning": "entrar (en)", "de": "eintreten / betreten", "ex": "Enter the building through the main door.", "pron": "/én-ter/", "pron_de": "/AIN-tree-ten/"}'::jsonb,
        '{"term": "exit", "meaning": "salir (de) / salida", "de": "verlassen / Ausgang", "ex": "Exit the motorway at junction 7.", "pron": "/ék-sit/", "pron_de": "/fö-LA-sen/"}'::jsonb,
        '{"term": "here", "meaning": "aquí / acá", "de": "hier", "ex": "Come here, please.", "pron": "/hir/", "pron_de": "/hir/"}'::jsonb,
        '{"term": "there", "meaning": "allí / allá", "de": "dort / da", "ex": "Put the bag over there.", "pron": "/der/", "pron_de": "/dort/"}'::jsonb,
        '{"term": "everywhere", "meaning": "en todas partes", "de": "überall", "ex": "There are tourists everywhere.", "pron": "/év-ri-uer/", "pron_de": "/üü-bö-AL/"}'::jsonb,
        '{"term": "nowhere", "meaning": "en ningún lugar", "de": "nirgends / nirgendwo", "ex": "I have nowhere to sit.", "pron": "/nóu-uer/", "pron_de": "/NIR-gents/"}'::jsonb,
        '{"term": "somewhere", "meaning": "en algún lugar", "de": "irgendwo", "ex": "I left my keys somewhere in the house.", "pron": "/sám-uer/", "pron_de": "/IR-gent-vo/"}'::jsonb,
        '{"term": "nearby", "meaning": "cerca / cercano", "de": "in der Nähe", "ex": "Is there a pharmacy nearby?", "pron": "/nir-bái/", "pron_de": "/in dö NÄÄ-e/"}'::jsonb,
        '{"term": "close", "meaning": "cerca / próximo", "de": "nahe / in der Nähe", "ex": "The station is very close.", "pron": "/klous/", "pron_de": "/NAA-e/"}'::jsonb,
        '{"term": "distant", "meaning": "lejano / distante", "de": "weit entfernt", "ex": "The city looks distant from here.", "pron": "/dís-tent/", "pron_de": "/vait ent-FERNT/"}'::jsonb,
        '{"term": "in the distance", "meaning": "a lo lejos", "de": "in der Ferne", "ex": "We could see the mountains in the distance.", "pron": "/in de dís-tens/", "pron_de": "/in dö FER-ne/"}'::jsonb,
        '{"term": "further on", "meaning": "más adelante", "de": "weiter vorne / weiter weg", "ex": "The hotel is further on down the road.", "pron": "/fér-der on/", "pron_de": "/VAI-tö FOR-ne/"}'::jsonb,
        '{"term": "at the top", "meaning": "en la parte superior / arriba del todo", "de": "oben / an der Spitze", "ex": "Put the heaviest items at the top.", "pron": "/at de top/", "pron_de": "/OO-ben/"}'::jsonb,
        '{"term": "at the bottom", "meaning": "en la parte inferior / abajo del todo", "de": "unten / am Boden", "ex": "The answer is at the bottom of the page.", "pron": "/at de bó-tom/", "pron_de": "/UN-ten/"}'::jsonb,
        '{"term": "at the top of", "meaning": "en lo alto de / en la cima de", "de": "oben an / oben auf", "ex": "She waved from the top of the hill.", "pron": "/at de top ov/", "pron_de": "/OO-ben an/"}'::jsonb,
        '{"term": "at the foot of", "meaning": "al pie de", "de": "am Fuß von", "ex": "The village is at the foot of the mountain.", "pron": "/at de fut ov/", "pron_de": "/am FUUS fon/"}'::jsonb,
        '{"term": "in the middle", "meaning": "en el medio / en el centro", "de": "in der Mitte", "ex": "Place the vase in the middle of the table.", "pron": "/in de mí-del/", "pron_de": "/in dö MI-te/"}'::jsonb,
        '{"term": "in the centre", "meaning": "en el centro", "de": "in der Mitte / im Zentrum", "ex": "The town hall is in the centre of the city.", "pron": "/in de sén-ter/", "pron_de": "/im TSEN-trum/"}'::jsonb,
        '{"term": "in the corner", "meaning": "en la esquina / en el rincón", "de": "in der Ecke", "ex": "There is a lamp in the corner.", "pron": "/in de kór-ner/", "pron_de": "/in dö E-ke/"}'::jsonb,
        '{"term": "at the front", "meaning": "en la parte delantera", "de": "vorne / an der Vorderseite", "ex": "Sit at the front of the bus.", "pron": "/at de frant/", "pron_de": "/FOR-ne/"}'::jsonb,
        '{"term": "at the back", "meaning": "en la parte trasera", "de": "hinten / an der Rückseite", "ex": "The exit is at the back of the theatre.", "pron": "/at de bak/", "pron_de": "/HIN-ten/"}'::jsonb,
        '{"term": "on top of", "meaning": "encima de (contacto)", "de": "oben auf", "ex": "There is a hat on top of the box.", "pron": "/on top ov/", "pron_de": "/OO-ben auf/"}'::jsonb,
        '{"term": "side by side", "meaning": "uno al lado del otro / juntos", "de": "nebeneinander", "ex": "They walked side by side.", "pron": "/said bai said/", "pron_de": "/NEE-ben-ai-nan-dö/"}'::jsonb,
        '{"term": "face to face", "meaning": "cara a cara", "de": "von Angesicht zu Angesicht", "ex": "They finally spoke face to face.", "pron": "/feis tu feis/", "pron_de": "/fon AN-gö-zijt tsu AN-gö-zijt/"}'::jsonb,
        '{"term": "in a row", "meaning": "en fila / consecutivamente", "de": "in einer Reihe", "ex": "They stood in a row for the photo.", "pron": "/in a rou/", "pron_de": "/in AI-nö RAI-e/"}'::jsonb,
        '{"term": "within reach", "meaning": "al alcance", "de": "in Reichweite", "ex": "Keep your phone within reach.", "pron": "/wi-dín rich/", "pron_de": "/in RAIJ-vai-te/"}'::jsonb,
        '{"term": "out of reach", "meaning": "fuera del alcance", "de": "außer Reichweite", "ex": "The shelf is out of reach for children.", "pron": "/áut ov rich/", "pron_de": "/AU-sö RAIJ-vai-te/"}'::jsonb,
        '{"term": "upside down", "meaning": "al revés / boca abajo", "de": "umgekehrt / auf dem Kopf", "ex": "You are holding the map upside down.", "pron": "/áp-said daun/", "pron_de": "/UM-gö-keert/"}'::jsonb,
        '{"term": "inside out", "meaning": "del revés (ropa)", "de": "links herum / verkehrt herum", "ex": "Your jumper is inside out.", "pron": "/in-sáid áut/", "pron_de": "/links hö-RUM/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 1100 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1100, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Preposiciones de Lugar y Movimiento');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Orts- und Bewegungspräpositionen');

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
