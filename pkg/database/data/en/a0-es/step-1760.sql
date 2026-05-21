-- ============================================================
-- Seed: A0 English Path – STEP 1760 – Deck – Ropa y Accesorios
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "shirt", "meaning": "camisa", "de": "Hemd", "ex": "He wore a white shirt to the interview.", "pron": "/shert/", "pron_de": "/hemt/"}'::jsonb,
        '{"term": "blouse", "meaning": "blusa", "de": "Bluse", "ex": "She wore a floral blouse to the party.", "pron": "/blauz/", "pron_de": "/BLUU-ze/"}'::jsonb,
        '{"term": "T-shirt", "meaning": "camiseta", "de": "T-Shirt", "ex": "He always wears a plain white T-shirt.", "pron": "/tii-shert/", "pron_de": "/tii-shert/"}'::jsonb,
        '{"term": "polo shirt", "meaning": "polo", "de": "Poloshirt", "ex": "A polo shirt is smart but casual.", "pron": "/póu-lou shert/", "pron_de": "/POO-lo-shert/"}'::jsonb,
        '{"term": "tank top", "meaning": "camiseta de tirantes / top", "de": "Trägertop / Tanktop", "ex": "She wore a tank top at the beach.", "pron": "/tank top/", "pron_de": "/TRÄÄ-gö-top/"}'::jsonb,
        '{"term": "jumper / sweater", "meaning": "jersey / suéter", "de": "Pullover / Pulli", "ex": "Put on a warm jumper — it is cold outside.", "pron": "/dyám-per/", "pron_de": "/PU-lo-vö/"}'::jsonb,
        '{"term": "hoodie", "meaning": "sudadera con capucha", "de": "Kapuzenpullover / Hoodie", "ex": "He wore a grey hoodie to the gym.", "pron": "/jú-di/", "pron_de": "/ka-PUU-tsen-pu-lo-vö/"}'::jsonb,
        '{"term": "cardigan", "meaning": "cárdigan / rebeca", "de": "Strickjacke", "ex": "Wear a cardigan if you feel cold in the office.", "pron": "/kár-di-gen/", "pron_de": "/SHTRIK-ya-ke/"}'::jsonb,
        '{"term": "waistcoat", "meaning": "chaleco", "de": "Weste", "ex": "He wore a waistcoat with his suit.", "pron": "/uéis-kout/", "pron_de": "/VES-te/"}'::jsonb,
        '{"term": "jacket", "meaning": "chaqueta", "de": "Jacke", "ex": "Bring a light jacket for the evening.", "pron": "/dyá-ket/", "pron_de": "/YA-ke/"}'::jsonb,
        '{"term": "blazer", "meaning": "blazer / americana", "de": "Blazer", "ex": "Wear a blazer for a smart-casual look.", "pron": "/bléi-ser/", "pron_de": "/BLEE-zö/"}'::jsonb,
        '{"term": "suit", "meaning": "traje", "de": "Anzug", "ex": "He wore a dark suit to the meeting.", "pron": "/sut/", "pron_de": "/AN-tsuuk/"}'::jsonb,
        '{"term": "coat", "meaning": "abrigo", "de": "Mantel", "ex": "It is cold — take your coat.", "pron": "/kout/", "pron_de": "/MAN-tel/"}'::jsonb,
        '{"term": "raincoat", "meaning": "impermeable / chubasquero", "de": "Regenmantel", "ex": "Always carry a raincoat in autumn.", "pron": "/réin-kout/", "pron_de": "/REE-gen-man-tel/"}'::jsonb,
        '{"term": "anorak / parka", "meaning": "anorak / parka", "de": "Anorak / Parka", "ex": "He put on his anorak before going hiking.", "pron": "/á-no-rak/", "pron_de": "/A-no-rak/"}'::jsonb,
        '{"term": "trousers", "meaning": "pantalones", "de": "Hose", "ex": "He bought a new pair of black trousers.", "pron": "/tráu-zers/", "pron_de": "/HOO-ze/"}'::jsonb,
        '{"term": "jeans", "meaning": "vaqueros / tejanos", "de": "Jeans", "ex": "Jeans are not allowed at this restaurant.", "pron": "/dyins/", "pron_de": "/dyiins/"}'::jsonb,
        '{"term": "shorts", "meaning": "pantalones cortos", "de": "Shorts / kurze Hose", "ex": "She wore shorts at the beach.", "pron": "/shors/", "pron_de": "/shórts/"}'::jsonb,
        '{"term": "leggings", "meaning": "mallas / leggings", "de": "Leggings / Leggins", "ex": "Leggings are comfortable for exercise.", "pron": "/lé-gings/", "pron_de": "/LE-gings/"}'::jsonb,
        '{"term": "tracksuit", "meaning": "chándal", "de": "Trainingsanzug", "ex": "He wears a tracksuit to the gym.", "pron": "/trák-sut/", "pron_de": "/TREE-nings-an-tsuuk/"}'::jsonb,
        '{"term": "skirt", "meaning": "falda", "de": "Rock", "ex": "She wore a long skirt to the party.", "pron": "/skert/", "pron_de": "/rok/"}'::jsonb,
        '{"term": "dress", "meaning": "vestido", "de": "Kleid", "ex": "She put on a red dress for the event.", "pron": "/dres/", "pron_de": "/klait/"}'::jsonb,
        '{"term": "pyjamas", "meaning": "pijama", "de": "Schlafanzug / Pyjama", "ex": "She changed into her pyjamas after dinner.", "pron": "/pi-dyá-mas/", "pron_de": "/SHLAAF-an-tsuuk/"}'::jsonb,
        '{"term": "dressing gown", "meaning": "bata / albornoz", "de": "Morgenmantel / Bademantel", "ex": "He wore his dressing gown all morning.", "pron": "/dré-sing gaun/", "pron_de": "/MOR-gen-man-tel/"}'::jsonb,
        '{"term": "swimsuit", "meaning": "bañador / traje de baño", "de": "Badeanzug", "ex": "Pack a swimsuit for the hotel pool.", "pron": "/suím-sut/", "pron_de": "/BAA-de-an-tsuuk/"}'::jsonb,
        '{"term": "bikini", "meaning": "bikini", "de": "Bikini", "ex": "She bought a new bikini for the holiday.", "pron": "/bi-kí-ni/", "pron_de": "/bi-KII-ni/"}'::jsonb,
        '{"term": "uniform", "meaning": "uniforme", "de": "Uniform", "ex": "All students must wear the school uniform.", "pron": "/iú-ni-form/", "pron_de": "/u-ni-FORM/"}'::jsonb,
        '{"term": "apron", "meaning": "delantal", "de": "Schürze", "ex": "Put on an apron before cooking.", "pron": "/éi-pren/", "pron_de": "/SHÜR-tse/"}'::jsonb,
        '{"term": "underwear", "meaning": "ropa interior", "de": "Unterwäsche", "ex": "Pack enough underwear for the whole trip.", "pron": "/án-der-uer/", "pron_de": "/UN-tö-vä-she/"}'::jsonb,
        '{"term": "socks", "meaning": "calcetines", "de": "Socken", "ex": "Where are my clean socks?", "pron": "/soks/", "pron_de": "/ZO-ken/"}'::jsonb,
        '{"term": "tights", "meaning": "medias / pantis", "de": "Strumpfhose", "ex": "She wore black tights under the dress.", "pron": "/taits/", "pron_de": "/SHTRUUMPF-hoo-ze/"}'::jsonb,
        '{"term": "shoes", "meaning": "zapatos", "de": "Schuhe", "ex": "These shoes are very comfortable.", "pron": "/shus/", "pron_de": "/SHUU-e/"}'::jsonb,
        '{"term": "boots", "meaning": "botas", "de": "Stiefel", "ex": "Wear boots in the snow.", "pron": "/buts/", "pron_de": "/SHTII-fel/"}'::jsonb,
        '{"term": "ankle boots", "meaning": "botines", "de": "Stiefeletten", "ex": "She wore ankle boots with her jeans.", "pron": "/áng-kel buts/", "pron_de": "/shtii-fe-LE-ten/"}'::jsonb,
        '{"term": "trainers / sneakers", "meaning": "zapatillas de deporte", "de": "Turnschuhe / Sneaker", "ex": "He wore trainers to the gym.", "pron": "/tréi-ners/", "pron_de": "/TURN-shuu-e/"}'::jsonb,
        '{"term": "sandals", "meaning": "sandalias", "de": "Sandalen", "ex": "Wear sandals at the beach.", "pron": "/sán-dels/", "pron_de": "/zan-DAA-len/"}'::jsonb,
        '{"term": "flip-flops", "meaning": "chanclas", "de": "Flipflops / Badelatschen", "ex": "Flip-flops are perfect for the pool.", "pron": "/flip-flops/", "pron_de": "/FLIP-flops/"}'::jsonb,
        '{"term": "heels", "meaning": "tacones", "de": "Absatzschuhe / High Heels", "ex": "She wore heels to the wedding.", "pron": "/jiils/", "pron_de": "/AP-zats-shuu-e/"}'::jsonb,
        '{"term": "slippers", "meaning": "zapatillas de casa", "de": "Hausschuhe / Pantoffeln", "ex": "He put on his slippers after work.", "pron": "/slí-pers/", "pron_de": "/HAUS-shuu-e/"}'::jsonb,
        '{"term": "wellies", "meaning": "botas de agua / katiuskas", "de": "Gummistiefel", "ex": "You need wellies for the muddy festival.", "pron": "/uéliz/", "pron_de": "/GU-mi-shtii-fel/"}'::jsonb,
        '{"term": "hat", "meaning": "sombrero / gorro", "de": "Hut / Mütze", "ex": "Wear a hat to protect yourself from the sun.", "pron": "/jat/", "pron_de": "/huut/"}'::jsonb,
        '{"term": "cap", "meaning": "gorra (con visera)", "de": "Kappe / Basecap", "ex": "He wore a red cap at the match.", "pron": "/kap/", "pron_de": "/KA-pe/"}'::jsonb,
        '{"term": "beanie", "meaning": "gorro de lana", "de": "Wollmütze / Beanie", "ex": "Put on a beanie — it is freezing.", "pron": "/bí-ni/", "pron_de": "/VOL-müt-se/"}'::jsonb,
        '{"term": "scarf", "meaning": "bufanda", "de": "Schal", "ex": "Wrap your scarf tightly in the cold.", "pron": "/skarf/", "pron_de": "/shaal/"}'::jsonb,
        '{"term": "gloves", "meaning": "guantes", "de": "Handschuhe", "ex": "Do not forget your gloves in winter.", "pron": "/glavs/", "pron_de": "/HANT-shuu-e/"}'::jsonb,
        '{"term": "mittens", "meaning": "manoplas", "de": "Fäustlinge", "ex": "Children wear mittens in the snow.", "pron": "/mí-tens/", "pron_de": "/FOIS-ling-e/"}'::jsonb,
        '{"term": "belt", "meaning": "cinturón", "de": "Gürtel", "ex": "He tightened his belt a notch.", "pron": "/belt/", "pron_de": "/GÜR-tel/"}'::jsonb,
        '{"term": "tie", "meaning": "corbata", "de": "Krawatte", "ex": "He always wears a tie to work.", "pron": "/tai/", "pron_de": "/kra-VA-te/"}'::jsonb,
        '{"term": "bow tie", "meaning": "pajarita / corbatín", "de": "Fliege", "ex": "He wore a bow tie at the wedding.", "pron": "/bou tai/", "pron_de": "/FLIIE-ge/"}'::jsonb,
        '{"term": "sunglasses", "meaning": "gafas de sol", "de": "Sonnenbrille", "ex": "Wear sunglasses on sunny days.", "pron": "/sán-glá-ses/", "pron_de": "/ZO-nen-bri-le/"}'::jsonb,
        '{"term": "glasses", "meaning": "gafas", "de": "Brille", "ex": "I cannot read without my glasses.", "pron": "/glá-ses/", "pron_de": "/BRI-le/"}'::jsonb,
        '{"term": "watch", "meaning": "reloj (de pulsera)", "de": "Uhr / Armbanduhr", "ex": "My watch stopped working yesterday.", "pron": "/uoch/", "pron_de": "/ARM-bant-uur/"}'::jsonb,
        '{"term": "ring", "meaning": "anillo", "de": "Ring", "ex": "She wears a gold ring on her finger.", "pron": "/ring/", "pron_de": "/ring/"}'::jsonb,
        '{"term": "necklace", "meaning": "collar", "de": "Halskette", "ex": "She wore a pearl necklace at the dinner.", "pron": "/nék-les/", "pron_de": "/HALS-ke-te/"}'::jsonb,
        '{"term": "earrings", "meaning": "pendientes / aretes", "de": "Ohrringe", "ex": "She bought a pair of silver earrings.", "pron": "/ír-ings/", "pron_de": "/OOR-ring-e/"}'::jsonb,
        '{"term": "bracelet", "meaning": "pulsera", "de": "Armband", "ex": "She wore a gold bracelet on her wrist.", "pron": "/bréis-let/", "pron_de": "/ARM-bant/"}'::jsonb,
        '{"term": "brooch", "meaning": "broche", "de": "Brosche", "ex": "Her grandmother wore a flower brooch.", "pron": "/broutsh/", "pron_de": "/BROSHE/"}'::jsonb,
        '{"term": "bag", "meaning": "bolsa / bolso", "de": "Tasche", "ex": "She carried a large bag to the market.", "pron": "/bag/", "pron_de": "/TA-she/"}'::jsonb,
        '{"term": "handbag", "meaning": "bolso de mano", "de": "Handtasche", "ex": "She kept her phone in her handbag.", "pron": "/jánd-bag/", "pron_de": "/HANT-ta-she/"}'::jsonb,
        '{"term": "backpack", "meaning": "mochila", "de": "Rucksack", "ex": "He carried a backpack on the hiking trail.", "pron": "/bák-pak/", "pron_de": "/RUK-zak/"}'::jsonb,
        '{"term": "wallet", "meaning": "cartera", "de": "Geldbörse / Portemonnaie", "ex": "I left my wallet at home.", "pron": "/uó-let/", "pron_de": "/GELT-bör-ze/"}'::jsonb,
        '{"term": "umbrella", "meaning": "paraguas", "de": "Regenschirm", "ex": "Take an umbrella — it might rain.", "pron": "/am-bré-la/", "pron_de": "/REE-gen-shirm/"}'::jsonb,
        '{"term": "fabric", "meaning": "tejido / tela", "de": "Stoff / Gewebe", "ex": "This fabric is very soft and comfortable.", "pron": "/fáb-rik/", "pron_de": "/shtof/"}'::jsonb,
        '{"term": "cotton", "meaning": "algodón", "de": "Baumwolle", "ex": "This T-shirt is made of one hundred percent cotton.", "pron": "/kó-ten/", "pron_de": "/BAUM-vo-le/"}'::jsonb,
        '{"term": "wool", "meaning": "lana", "de": "Wolle", "ex": "This jumper is made of pure wool.", "pron": "/ul/", "pron_de": "/VO-le/"}'::jsonb,
        '{"term": "silk", "meaning": "seda", "de": "Seide", "ex": "The scarf is made of fine silk.", "pron": "/silk/", "pron_de": "/ZAI-de/"}'::jsonb,
        '{"term": "leather", "meaning": "cuero / piel", "de": "Leder", "ex": "These leather shoes last for years.", "pron": "/lé-der/", "pron_de": "/LEE-dö/"}'::jsonb,
        '{"term": "denim", "meaning": "tela vaquera / denim", "de": "Denim / Jeansstoff", "ex": "His jacket is made of denim.", "pron": "/dé-nim/", "pron_de": "/DE-nim/"}'::jsonb,
        '{"term": "linen", "meaning": "lino", "de": "Leinen", "ex": "Linen is ideal in hot weather.", "pron": "/lí-nen/", "pron_de": "/LAI-nen/"}'::jsonb,
        '{"term": "polyester", "meaning": "poliéster", "de": "Polyester", "ex": "Sportswear is often made of polyester.", "pron": "/po-li-és-ter/", "pron_de": "/po-li-ES-tö/"}'::jsonb,
        '{"term": "waterproof", "meaning": "impermeable / resistente al agua", "de": "wasserdicht", "ex": "These boots are completely waterproof.", "pron": "/uó-ter-pruf/", "pron_de": "/VA-sö-dijt/"}'::jsonb,
        '{"term": "sleeve", "meaning": "manga", "de": "Ärmel", "ex": "Roll up your sleeves before washing up.", "pron": "/sliv/", "pron_de": "/ÄR-mel/"}'::jsonb,
        '{"term": "collar", "meaning": "cuello (de camisa/jersey)", "de": "Kragen", "ex": "His shirt had a stiff collar.", "pron": "/kó-ler/", "pron_de": "/KRAA-gen/"}'::jsonb,
        '{"term": "button", "meaning": "botón", "de": "Knopf", "ex": "A button came off my jacket.", "pron": "/bá-ten/", "pron_de": "/knopf/"}'::jsonb,
        '{"term": "zip / zipper", "meaning": "cremallera", "de": "Reißverschluss", "ex": "The zip on my coat is broken.", "pron": "/zip/", "pron_de": "/RAIS-fö-shlus/"}'::jsonb,
        '{"term": "pocket", "meaning": "bolsillo", "de": "Tasche", "ex": "He put his keys in his jacket pocket.", "pron": "/pó-ket/", "pron_de": "/TA-she/"}'::jsonb,
        '{"term": "hood", "meaning": "capucha", "de": "Kapuze", "ex": "Pull up your hood when it rains.", "pron": "/jud/", "pron_de": "/ka-PUU-tse/"}'::jsonb,
        '{"term": "hem", "meaning": "dobladillo", "de": "Saum", "ex": "The hem of the dress came undone.", "pron": "/jem/", "pron_de": "/zaum/"}'::jsonb,
        '{"term": "size", "meaning": "talla / tamaño", "de": "Größe", "ex": "Do you have this in a size large?", "pron": "/sais/", "pron_de": "/GRÖÖ-se/"}'::jsonb,
        '{"term": "colour", "meaning": "color", "de": "Farbe", "ex": "What colour is the dress?", "pron": "/ká-ler/", "pron_de": "/FAR-be/"}'::jsonb,
        '{"term": "fits", "meaning": "queda bien / sienta bien", "de": "passt / sitzt gut", "ex": "The jacket fits perfectly.", "pron": "/fits/", "pron_de": "/past/"}'::jsonb,
        '{"term": "too big", "meaning": "demasiado grande", "de": "zu groß", "ex": "This coat is too big for me.", "pron": "/tu big/", "pron_de": "/tsuu groos/"}'::jsonb,
        '{"term": "too small", "meaning": "demasiado pequeño", "de": "zu klein", "ex": "These shoes are too small.", "pron": "/tu smol/", "pron_de": "/tsuu klain/"}'::jsonb,
        '{"term": "tight", "meaning": "apretado / ajustado", "de": "eng / zu eng", "ex": "These jeans are too tight.", "pron": "/tait/", "pron_de": "/eng/"}'::jsonb,
        '{"term": "loose", "meaning": "suelto / holgado", "de": "weit / locker", "ex": "He prefers loose-fitting clothes.", "pron": "/lus/", "pron_de": "/vait/"}'::jsonb,
        '{"term": "long", "meaning": "largo", "de": "lang", "ex": "She wore a long skirt to the ceremony.", "pron": "/long/", "pron_de": "/lang/"}'::jsonb,
        '{"term": "short", "meaning": "corto", "de": "kurz", "ex": "He prefers short sleeves in summer.", "pron": "/short/", "pron_de": "/kurts/"}'::jsonb,
        '{"term": "striped", "meaning": "a rayas", "de": "gestreift", "ex": "He wore a blue-and-white striped shirt.", "pron": "/straipt/", "pron_de": "/gö-SHTRAIFT/"}'::jsonb,
        '{"term": "checked", "meaning": "de cuadros", "de": "kariert", "ex": "She wore a checked jacket.", "pron": "/chekt/", "pron_de": "/ka-RIIRT/"}'::jsonb,
        '{"term": "plain", "meaning": "liso / sin estampado", "de": "einfarbig / schlicht", "ex": "I prefer plain colours over patterns.", "pron": "/plein/", "pron_de": "/AIN-far-big/"}'::jsonb,
        '{"term": "patterned", "meaning": "estampado / con dibujos", "de": "gemustert", "ex": "She chose a patterned blouse.", "pron": "/pá-ternd/", "pron_de": "/gö-MUS-tert/"}'::jsonb,
        '{"term": "smart", "meaning": "elegante / arreglado", "de": "schick / elegant", "ex": "You have to look smart for the interview.", "pron": "/smart/", "pron_de": "/shik/"}'::jsonb,
        '{"term": "casual", "meaning": "informal / casual", "de": "lässig / leger", "ex": "The dress code is smart casual.", "pron": "/ká-zhual/", "pron_de": "/LÄ-sig/"}'::jsonb,
        '{"term": "formal", "meaning": "formal / de etiqueta", "de": "formell / festlich", "ex": "Formal clothes are required at the dinner.", "pron": "/fór-mel/", "pron_de": "/for-MEL/"}'::jsonb,
        '{"term": "trendy", "meaning": "a la moda / de tendencia", "de": "modisch / trendy", "ex": "That shop sells trendy clothes at a good price.", "pron": "/trén-di/", "pron_de": "/MO-dish/"}'::jsonb,
        '{"term": "wear", "meaning": "llevar (puesto) / usar", "de": "tragen", "ex": "She always wears bright colours.", "pron": "/uer/", "pron_de": "/TRAA-gen/"}'::jsonb,
        '{"term": "put on", "meaning": "ponerse (ropa)", "de": "anziehen", "ex": "Put on your coat before you go out.", "pron": "/put on/", "pron_de": "/AN-tsii-en/"}'::jsonb,
        '{"term": "take off", "meaning": "quitarse (ropa)", "de": "ausziehen", "ex": "Take off your shoes at the door.", "pron": "/teik of/", "pron_de": "/AUS-tsii-en/"}'::jsonb,
        '{"term": "try on", "meaning": "probarse (ropa)", "de": "anprobieren", "ex": "Try on the jacket before buying it.", "pron": "/trai on/", "pron_de": "/AN-pro-bir-en/"}'::jsonb,
        '{"term": "get dressed", "meaning": "vestirse", "de": "sich anziehen", "ex": "Get dressed quickly — we are late.", "pron": "/get drest/", "pron_de": "/sich AN-tsii-en/"}'::jsonb,
        '{"term": "change", "meaning": "cambiarse (de ropa)", "de": "sich umziehen", "ex": "Change into something comfortable at home.", "pron": "/cheindy/", "pron_de": "/sich UM-tsii-en/"}'::jsonb,
        '{"term": "fashion", "meaning": "moda", "de": "Mode", "ex": "She works in the fashion industry.", "pron": "/fá-shen/", "pron_de": "/MOO-de/"}'::jsonb,
        '{"term": "style", "meaning": "estilo", "de": "Stil", "ex": "Her style is elegant and timeless.", "pron": "/stail/", "pron_de": "/shtiil/"}'::jsonb,
        '{"term": "brand", "meaning": "marca", "de": "Marke", "ex": "Which brand makes these trainers?", "pron": "/brand/", "pron_de": "/MAR-ke/"}'::jsonb,
        '{"term": "designer", "meaning": "de diseñador / de marca", "de": "Designer- / Marken-", "ex": "She loves designer bags.", "pron": "/di-sái-ner/", "pron_de": "/di-ZAI-nö/"}'::jsonb,
        '{"term": "second-hand", "meaning": "de segunda mano", "de": "secondhand / gebraucht", "ex": "He only buys second-hand clothes.", "pron": "/sé-kend-hand/", "pron_de": "/ZE-kont-hant/"}'::jsonb,
        '{"term": "vintage", "meaning": "vintage / de época", "de": "Vintage / retro", "ex": "She found a beautiful vintage dress.", "pron": "/vin-tidy/", "pron_de": "/VIN-tage/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM deck WHERE step_order = 1760 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1760, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'es', 'Ropa y Accesorios');

    INSERT INTO deck_translation (deck_uuid, language, title)
    VALUES (v_deck_id, 'de', 'Kleidung und Accessoires');

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
