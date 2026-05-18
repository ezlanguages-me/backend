-- ============================================================
-- Seed: A0 English Path – STEP 330 – Deck – El Entorno Inmediato I (El Hogar: habitaciones, objetos y mobiliario)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_word_id UUID;
    card JSONB;
    
    -- Array masivo con vocabulario exhaustivo, traducción y pronunciación figurada (US English)
    v_cards JSONB[] := ARRAY[
        -- Deportes de Pelota y Equipo
        '{"term": "Soccer", "meaning": "Fútbol", "de": "Fußball", "pron": "/sá-ker/", "pron_de": "/SOK-ö/"}'::jsonb,
        '{"term": "Basketball", "meaning": "Baloncesto", "de": "Basketball", "pron": "/bás-ket-bol/", "pron_de": "/BAS-ket-bol/"}'::jsonb,
        '{"term": "Baseball", "meaning": "Béisbol", "de": "Baseball", "pron": "/béis-bol/", "pron_de": "/BEJS-bol/"}'::jsonb,
        '{"term": "Football", "meaning": "Fútbol americano", "de": "American Football", "pron": "/fút-bol/", "pron_de": "/ö-MÄ-ri-kön FUT-bol/"}'::jsonb,
        '{"term": "Tennis", "meaning": "Tenis", "de": "Tennis", "pron": "/té-nis/", "pron_de": "/TE-nis/"}'::jsonb,
        '{"term": "Volleyball", "meaning": "Voleibol", "de": "Volleyball", "pron": "/vó-lei-bol/", "pron_de": "/WOL-i-bol/"}'::jsonb,
        '{"term": "Golf", "meaning": "Golf", "de": "Golf", "pron": "/golf/", "pron_de": "/GOLF/"}'::jsonb,
        '{"term": "Rugby", "meaning": "Rugby", "de": "Rugby", "pron": "/rág-bi/", "pron_de": "/RAG-bi/"}'::jsonb,
        '{"term": "Cricket", "meaning": "Críquet", "de": "Cricket", "pron": "/krí-ket/", "pron_de": "/KRI-ket/"}'::jsonb,
        '{"term": "Hockey", "meaning": "Hockey", "de": "Hockey", "pron": "/hó-ki/", "pron_de": "/HOK-i/"}'::jsonb,
        '{"term": "Table tennis", "meaning": "Tenis de mesa / Ping-pong", "de": "Tischtennis", "pron": "/téi-bol té-nis/", "pron_de": "/TEJ-böl TE-nis/"}'::jsonb,
        '{"term": "Badminton", "meaning": "Bádminton", "de": "Badminton", "pron": "/bád-min-ton/", "pron_de": "/BÄD-min-tön/"}'::jsonb,
        '{"term": "Squash", "meaning": "Squash", "de": "Squash", "pron": "/skuósh/", "pron_de": "/SKWAASCH/"}'::jsonb,
        '{"term": "Lacrosse", "meaning": "Lacrosse", "de": "Lacrosse", "pron": "/la-krós/", "pron_de": "/lö-KROS/"}'::jsonb,
        '{"term": "Dodgeball", "meaning": "Balón prisionero", "de": "Völkerball", "pron": "/dódj-bol/", "pron_de": "/DODSCH-bol/"}'::jsonb,
        '{"term": "Water polo", "meaning": "Waterpolo", "de": "Wasserball", "pron": "/uó-ter póu-lou/", "pron_de": "/WOO-tö POU-lou/"}'::jsonb,
        '{"term": "Bowling", "meaning": "Bolos", "de": "Bowling", "pron": "/bóu-lin/", "pron_de": "/BOU-ling/"}'::jsonb,
        '{"term": "Billiards", "meaning": "Billar", "de": "Billard", "pron": "/bí-liards/", "pron_de": "/BI-liödz/"}'::jsonb,

        -- Deportes Acuáticos y de Invierno
        '{"term": "Swimming", "meaning": "Natación", "de": "Schwimmen", "pron": "/suí-min/", "pron_de": "/SUIM-ming/"}'::jsonb,
        '{"term": "Surfing", "meaning": "Surf", "de": "Surfen", "pron": "/sér-fin/", "pron_de": "/SÖÖ-fing/"}'::jsonb,
        '{"term": "Scuba diving", "meaning": "Buceo", "de": "Tauchen", "pron": "/skú-ba dái-vin/", "pron_de": "/SKUU-bö DAI-wing/"}'::jsonb,
        '{"term": "Snorkeling", "meaning": "Esnórquel", "de": "Schnorcheln", "pron": "/snór-ke-lin/", "pron_de": "/SNOO-kö-ling/"}'::jsonb,
        '{"term": "Rowing", "meaning": "Remo", "de": "Rudern", "pron": "/róu-in/", "pron_de": "/ROU-ing/"}'::jsonb,
        '{"term": "Canoeing", "meaning": "Piragüismo", "de": "Kanufahren", "pron": "/ka-nú-in/", "pron_de": "/kö-NUU-ing/"}'::jsonb,
        '{"term": "Sailing", "meaning": "Navegación / Vela", "de": "Segeln", "pron": "/séi-lin/", "pron_de": "/SEJL-ing/"}'::jsonb,
        '{"term": "Kayaking", "meaning": "Kayak", "de": "Kajakfahren", "pron": "/kái-a-kin/", "pron_de": "/KAI-ö-king/"}'::jsonb,
        '{"term": "Windsurfing", "meaning": "Windsurf", "de": "Windsurfen", "pron": "/uínd-ser-fin/", "pron_de": "/WIND-söö-fing/"}'::jsonb,
        '{"term": "Kitesurfing", "meaning": "Kitesurf", "de": "Kitesurfen", "pron": "/káit-ser-fin/", "pron_de": "/KAIT-söö-fing/"}'::jsonb,
        '{"term": "Skiing", "meaning": "Esquí", "de": "Skifahren", "pron": "/skí-in/", "pron_de": "/SCHIE-ing/"}'::jsonb,
        '{"term": "Snowboarding", "meaning": "Snowboard", "de": "Snowboarden", "pron": "/snóu-bor-din/", "pron_de": "/SNOU-boo-ding/"}'::jsonb,
        '{"term": "Ice skating", "meaning": "Patinaje sobre hielo", "de": "Schlittschuhlaufen", "pron": "/áis skéi-tin/", "pron_de": "/AIS SKEIT-ing/"}'::jsonb,
        '{"term": "Figure skating", "meaning": "Patinaje artístico", "de": "Eiskunstlaufen", "pron": "/fí-guiur skéi-tin/", "pron_de": "/FI-gjö SKEIT-ing/"}'::jsonb,

        -- Atletismo, Combate y Fitness
        '{"term": "Running", "meaning": "Correr / Running", "de": "Laufen", "pron": "/rá-nin/", "pron_de": "/RAN-ning/"}'::jsonb,
        '{"term": "Jogging", "meaning": "Trotar", "de": "Joggen", "pron": "/djó-guin/", "pron_de": "/DSCHOG-ing/"}'::jsonb,
        '{"term": "Sprinting", "meaning": "Carrera de velocidad", "de": "Sprinten", "pron": "/sprín-tin/", "pron_de": "/SPRINT-ing/"}'::jsonb,
        '{"term": "Cycling", "meaning": "Ciclismo", "de": "Radfahren", "pron": "/sái-klin/", "pron_de": "/SAI-kling/"}'::jsonb,
        '{"term": "Gymnastics", "meaning": "Gimnasia", "de": "Turnen", "pron": "/djim-nás-tiks/", "pron_de": "/dschim-NÄS-tiks/"}'::jsonb,
        '{"term": "Athletics", "meaning": "Atletismo", "de": "Leichtathletik", "pron": "/az-lé-tiks/", "pron_de": "/äs-LE-tiks/"}'::jsonb,
        '{"term": "Weightlifting", "meaning": "Levantamiento de pesas", "de": "Gewichtheben", "pron": "/uéit-lif-tin/", "pron_de": "/WEJT-lif-ting/"}'::jsonb,
        '{"term": "Bodybuilding", "meaning": "Culturismo", "de": "Bodybuilding", "pron": "/bó-di-bil-din/", "pron_de": "/BO-di-bil-ding/"}'::jsonb,
        '{"term": "Working out", "meaning": "Hacer ejercicio / Entrenar", "de": "Trainieren", "pron": "/uór-kin áut/", "pron_de": "/WÖÖ-king AUT/"}'::jsonb,
        '{"term": "Yoga", "meaning": "Yoga", "de": "Yoga", "pron": "/ióu-ga/", "pron_de": "/JOU-gö/"}'::jsonb,
        '{"term": "Pilates", "meaning": "Pilates", "de": "Pilates", "pron": "/pi-lá-tis/", "pron_de": "/pi-LAA-tis/"}'::jsonb,
        '{"term": "Aerobics", "meaning": "Aeróbic", "de": "Aerobic", "pron": "/e-róu-biks/", "pron_de": "/e-ROU-biks/"}'::jsonb,
        '{"term": "Boxing", "meaning": "Boxeo", "de": "Boxen", "pron": "/bók-sin/", "pron_de": "/BOK-sing/"}'::jsonb,
        '{"term": "Martial arts", "meaning": "Artes marciales", "de": "Kampfsport", "pron": "/már-shal arts/", "pron_de": "/MAA-schöl AATS/"}'::jsonb,
        '{"term": "Wrestling", "meaning": "Lucha libre", "de": "Ringen", "pron": "/rés-lin/", "pron_de": "/RE-sling/"}'::jsonb,
        '{"term": "Judo", "meaning": "Judo", "de": "Judo", "pron": "/djú-dou/", "pron_de": "/DSCHUU-dou/"}'::jsonb,
        '{"term": "Karate", "meaning": "Kárate", "de": "Karate", "pron": "/ka-rá-ti/", "pron_de": "/kö-RAA-ti/"}'::jsonb,
        '{"term": "Taekwondo", "meaning": "Taekwondo", "de": "Taekwondo", "pron": "/tai-kuón-dou/", "pron_de": "/tai-KWON-dou/"}'::jsonb,
        '{"term": "Fencing", "meaning": "Esgrima", "de": "Fechten", "pron": "/fén-sin/", "pron_de": "/FEN-sing/"}'::jsonb,
        '{"term": "Archery", "meaning": "Tiro con arco", "de": "Bogenschießen", "pron": "/ár-che-ri/", "pron_de": "/AA-tschö-ri/"}'::jsonb,

        -- Actividades al Aire Libre y Extremos
        '{"term": "Hiking", "meaning": "Senderismo", "de": "Wandern", "pron": "/hái-kin/", "pron_de": "/HAI-king/"}'::jsonb,
        '{"term": "Trekking", "meaning": "Excursionismo", "de": "Trekking", "pron": "/tré-kin/", "pron_de": "/TRE-king/"}'::jsonb,
        '{"term": "Backpacking", "meaning": "Viajar de mochilero", "de": "Rucksackreisen", "pron": "/bák-pa-kin/", "pron_de": "/BÄK-pä-king/"}'::jsonb,
        '{"term": "Camping", "meaning": "Acampar", "de": "Camping", "pron": "/kám-pin/", "pron_de": "/KÄMP-ing/"}'::jsonb,
        '{"term": "Rock climbing", "meaning": "Escalada en roca", "de": "Klettern", "pron": "/rok klái-min/", "pron_de": "/ROK KLAI-ming/"}'::jsonb,
        '{"term": "Bouldering", "meaning": "Escalada en bloque", "de": "Bouldern", "pron": "/bóul-de-rin/", "pron_de": "/BOUL-dö-ring/"}'::jsonb,
        '{"term": "Mountaineering", "meaning": "Montañismo", "de": "Bergsteigen", "pron": "/máun-te-ní-rin/", "pron_de": "/MAUN-tö-NIE-ring/"}'::jsonb,
        '{"term": "Horseback riding", "meaning": "Equitación", "de": "Reiten", "pron": "/hórs-bak rái-din/", "pron_de": "/HOOS-bäk RAI-ding/"}'::jsonb,
        '{"term": "Skateboarding", "meaning": "Andar en monopatín", "de": "Skateboarden", "pron": "/skéit-bor-din/", "pron_de": "/SKEIT-boo-ding/"}'::jsonb,
        '{"term": "Roller skating", "meaning": "Patinaje sobre ruedas", "de": "Rollschuhlaufen", "pron": "/róu-ler skéi-tin/", "pron_de": "/ROU-lö SKEIT-ing/"}'::jsonb,
        '{"term": "BMX", "meaning": "BMX (Ciclismo extremo)", "de": "BMX", "pron": "/bi-em-éks/", "pron_de": "/bie-em-EKS/"}'::jsonb,
        '{"term": "Motocross", "meaning": "Motocross", "de": "Motocross", "pron": "/móu-tou-kros/", "pron_de": "/MOU-tou-kros/"}'::jsonb,
        '{"term": "Paintball", "meaning": "Paintball", "de": "Paintball", "pron": "/péint-bol/", "pron_de": "/PEJNT-bol/"}'::jsonb,
        '{"term": "Laser tag", "meaning": "Laser tag", "de": "Lasertag", "pron": "/léi-zer tag/", "pron_de": "/LEJ-zö täg/"}'::jsonb,
        '{"term": "Paragliding", "meaning": "Parapente", "de": "Gleitschirmfliegen", "pron": "/pá-ra-glai-din/", "pron_de": "/PÄ-rö-glai-ding/"}'::jsonb,
        '{"term": "Skydiving", "meaning": "Paracaidismo", "de": "Fallschirmspringen", "pron": "/skái-dai-vin/", "pron_de": "/SKAI-dai-wing/"}'::jsonb,
        '{"term": "Bungee jumping", "meaning": "Puenting", "de": "Bungee-Jumping", "pron": "/bán-dji djám-pin/", "pron_de": "/BAN-dschi DSCHAM-ping/"}'::jsonb,

        -- Hobbies Creativos y Arte
        '{"term": "Reading", "meaning": "Leer", "de": "Lesen", "pron": "/rí-din/", "pron_de": "/RIE-ding/"}'::jsonb,
        '{"term": "Writing", "meaning": "Escribir", "de": "Schreiben", "pron": "/rái-tin/", "pron_de": "/RAIT-ing/"}'::jsonb,
        '{"term": "Painting", "meaning": "Pintar", "de": "Malen", "pron": "/péin-tin/", "pron_de": "/PEJNT-ing/"}'::jsonb,
        '{"term": "Drawing", "meaning": "Dibujar", "de": "Zeichnen", "pron": "/dró-in/", "pron_de": "/DROO-ing/"}'::jsonb,
        '{"term": "Photography", "meaning": "Fotografía", "de": "Fotografie", "pron": "/fo-tó-gra-fi/", "pron_de": "/fö-TOG-rö-fie/"}'::jsonb,
        '{"term": "Cooking", "meaning": "Cocinar", "de": "Kochen", "pron": "/kú-kin/", "pron_de": "/KUK-king/"}'::jsonb,
        '{"term": "Baking", "meaning": "Hornear / Repostería", "de": "Backen", "pron": "/béi-kin/", "pron_de": "/BEJK-ing/"}'::jsonb,
        '{"term": "Gardening", "meaning": "Jardinería", "de": "Gärtnern", "pron": "/gár-de-nin/", "pron_de": "/GAA-dön-ing/"}'::jsonb,
        '{"term": "Knitting", "meaning": "Tejer (a dos agujas)", "de": "Stricken", "pron": "/ní-tin/", "pron_de": "/NI-ting/"}'::jsonb,
        '{"term": "Sewing", "meaning": "Coser", "de": "Nähen", "pron": "/sóu-in/", "pron_de": "/SOU-ing/"}'::jsonb,
        '{"term": "Pottery", "meaning": "Alfarería / Cerámica", "de": "Töpfern", "pron": "/pó-te-ri/", "pron_de": "/PO-tö-ri/"}'::jsonb,
        '{"term": "Sculpting", "meaning": "Esculpir", "de": "Bildhauerei", "pron": "/skálp-tin/", "pron_de": "/SKALP-ting/"}'::jsonb,
        '{"term": "Woodworking", "meaning": "Trabajo en madera", "de": "Holzbearbeitung", "pron": "/uúd-uor-kin/", "pron_de": "/WUD-wö-king/"}'::jsonb,
        '{"term": "Carpentry", "meaning": "Carpintería", "de": "Tischlerei", "pron": "/kár-pen-tri/", "pron_de": "/KAA-pön-tri/"}'::jsonb,
        '{"term": "Origami", "meaning": "Papiroflexia", "de": "Origami", "pron": "/o-ri-gá-mi/", "pron_de": "/o-ri-GAA-mi/"}'::jsonb,
        '{"term": "Calligraphy", "meaning": "Caligrafía", "de": "Kalligrafie", "pron": "/ka-lí-gra-fi/", "pron_de": "/kö-LIG-rö-fie/"}'::jsonb,
        '{"term": "Scrapbooking", "meaning": "Hacer álbumes de recortes", "de": "Scrapbooking", "pron": "/skráp-bu-kin/", "pron_de": "/SKRÄP-bu-king/"}'::jsonb,
        '{"term": "Jewelry making", "meaning": "Hacer joyas", "de": "Schmuck herstellen", "pron": "/djú-el-ri méi-kin/", "pron_de": "/DSCHUU-öl-ri MEJ-king/"}'::jsonb,
        '{"term": "Embroidery", "meaning": "Bordado", "de": "Sticken", "pron": "/em-brói-de-ri/", "pron_de": "/em-BROI-dö-ri/"}'::jsonb,
        '{"term": "Crocheting", "meaning": "Hacer ganchillo", "de": "Häkeln", "pron": "/krou-shéi-in/", "pron_de": "/krou-SCHEJ-ing/"}'::jsonb,

        -- Música y Actuación
        '{"term": "Playing guitar", "meaning": "Tocar la guitarra", "de": "Gitarre spielen", "pron": "/pléi-in gui-tár/", "pron_de": "/PLEJ-ing gi-TAA/"}'::jsonb,
        '{"term": "Playing piano", "meaning": "Tocar el piano", "de": "Klavier spielen", "pron": "/pléi-in pi-á-nou/", "pron_de": "/PLEJ-ing pi-Ä-nou/"}'::jsonb,
        '{"term": "Playing drums", "meaning": "Tocar la batería", "de": "Schlagzeug spielen", "pron": "/pléi-in drams/", "pron_de": "/PLEJ-ing DRAMS/"}'::jsonb,
        '{"term": "Playing violin", "meaning": "Tocar el violín", "de": "Geige spielen", "pron": "/pléi-in vai-o-lín/", "pron_de": "/PLEJ-ing wai-ö-LIN/"}'::jsonb,
        '{"term": "Playing flute", "meaning": "Tocar la flauta", "de": "Flöte spielen", "pron": "/pléi-in flut/", "pron_de": "/PLEJ-ing FLUUT/"}'::jsonb,
        '{"term": "Playing saxophone", "meaning": "Tocar el saxofón", "de": "Saxofon spielen", "pron": "/pléi-in sák-so-foun/", "pron_de": "/PLEJ-ing SÄK-sö-foun/"}'::jsonb,
        '{"term": "Playing trumpet", "meaning": "Tocar la trompeta", "de": "Trompete spielen", "pron": "/pléi-in trám-pet/", "pron_de": "/PLEJ-ing TRAM-pet/"}'::jsonb,
        '{"term": "Listening to music", "meaning": "Escuchar música", "de": "Musik hören", "pron": "/lí-se-nin tu miú-sik/", "pron_de": "/LI-sön-ing tö MJUU-sik/"}'::jsonb,
        '{"term": "Singing", "meaning": "Cantar", "de": "Singen", "pron": "/sín-in/", "pron_de": "/SING-ing/"}'::jsonb,
        '{"term": "Dancing", "meaning": "Bailar", "de": "Tanzen", "pron": "/dán-sin/", "pron_de": "/DAAN-sing/"}'::jsonb,
        '{"term": "Acting", "meaning": "Actuar", "de": "Schauspielern", "pron": "/ák-tin/", "pron_de": "/ÄK-ting/"}'::jsonb,
        '{"term": "Magic tricks", "meaning": "Trucos de magia", "de": "Zaubertricks", "pron": "/má-djik triks/", "pron_de": "/MÄ-dschik TRIKS/"}'::jsonb,
        '{"term": "Juggling", "meaning": "Hacer malabares", "de": "Jonglieren", "pron": "/djá-glin/", "pron_de": "/DSCHAG-ling/"}'::jsonb,

        -- Juegos, Coleccionismo y Mente
        '{"term": "Board games", "meaning": "Juegos de mesa", "de": "Brettspiele", "pron": "/bord guéims/", "pron_de": "/BOOD GEJMS/"}'::jsonb,
        '{"term": "Chess", "meaning": "Ajedrez", "de": "Schach", "pron": "/ches/", "pron_de": "/TSCHESS/"}'::jsonb,
        '{"term": "Playing cards", "meaning": "Jugar a las cartas", "de": "Kartenspielen", "pron": "/pléi-in kards/", "pron_de": "/PLEJ-ing KAADZ/"}'::jsonb,
        '{"term": "Puzzles", "meaning": "Rompecabezas / Puzles", "de": "Puzzle", "pron": "/pá-zols/", "pron_de": "/PA-zöls/"}'::jsonb,
        '{"term": "Crossword puzzles", "meaning": "Crucigramas", "de": "Kreuzworträtsel", "pron": "/krós-uord pá-zols/", "pron_de": "/KROS-wöd PA-zöls/"}'::jsonb,
        '{"term": "Sudoku", "meaning": "Sudoku", "de": "Sudoku", "pron": "/su-dóu-ku/", "pron_de": "/su-DOU-ku/"}'::jsonb,
        '{"term": "Stamp collecting", "meaning": "Coleccionar sellos", "de": "Briefmarken sammeln", "pron": "/stamp ko-lék-tin/", "pron_de": "/STÄMP kö-LEK-ting/"}'::jsonb,
        '{"term": "Coin collecting", "meaning": "Coleccionar monedas", "de": "Münzen sammeln", "pron": "/kóin ko-lék-tin/", "pron_de": "/KOIN kö-LEK-ting/"}'::jsonb,
        '{"term": "Antiquing", "meaning": "Buscar antigüedades", "de": "Antiquitäten sammeln", "pron": "/an-tí-kin/", "pron_de": "/än-TIE-king/"}'::jsonb,
        '{"term": "Bird watching", "meaning": "Observación de aves", "de": "Vogelbeobachtung", "pron": "/berd uá-chin/", "pron_de": "/BÖÖDZ WO-tsching/"}'::jsonb,
        '{"term": "Astronomy", "meaning": "Astronomía", "de": "Astronomie", "pron": "/as-tró-no-mi/", "pron_de": "/äs-TRON-ö-mi/"}'::jsonb,
        '{"term": "Fishing", "meaning": "Pescar", "de": "Angeln", "pron": "/fí-shin/", "pron_de": "/FISCH-ing/"}'::jsonb,
        '{"term": "Hunting", "meaning": "Cazar", "de": "Jagen", "pron": "/hán-tin/", "pron_de": "/HAN-ting/"}'::jsonb,
        '{"term": "Foraging", "meaning": "Recolección (de setas/plantas)", "de": "Sammeln", "pron": "/fó-ra-djin/", "pron_de": "/FO-rö-dsching/"}'::jsonb,

        -- Medios Digitales y Tecnología
        '{"term": "Watching TV", "meaning": "Ver la televisión", "de": "Fernsehen", "pron": "/uá-chin ti-ví/", "pron_de": "/WO-tsching TIE-WIE/"}'::jsonb,
        '{"term": "Watching movies", "meaning": "Ver películas", "de": "Filme schauen", "pron": "/uá-chin mú-vis/", "pron_de": "/WO-tsching MJUU-wis/"}'::jsonb,
        '{"term": "Playing video games", "meaning": "Jugar videojuegos", "de": "Videospiele spielen", "pron": "/pléi-in ví-di-o guéims/", "pron_de": "/PLEJ-ing WI-di-ou GEJMS/"}'::jsonb,
        '{"term": "Blogging", "meaning": "Escribir un blog", "de": "Bloggen", "pron": "/bló-guin/", "pron_de": "/BLOG-ing/"}'::jsonb,
        '{"term": "Vlogging", "meaning": "Hacer videoblogs", "de": "Vloggen", "pron": "/vló-guin/", "pron_de": "/WLOG-ing/"}'::jsonb,
        '{"term": "Podcasting", "meaning": "Hacer podcasts", "de": "Podcasten", "pron": "/pód-kas-tin/", "pron_de": "/POD-kaas-ting/"}'::jsonb,
        '{"term": "Programming", "meaning": "Programar / Codificar", "de": "Programmieren", "pron": "/próu-gra-min/", "pron_de": "/PROU-grä-ming/"}'::jsonb,
        '{"term": "Web design", "meaning": "Diseño web", "de": "Webdesign", "pron": "/uéb di-sáin/", "pron_de": "/WEB di-SAIN/"}'::jsonb,
        '{"term": "Graphic design", "meaning": "Diseño gráfico", "de": "Grafikdesign", "pron": "/grá-fik di-sáin/", "pron_de": "/GRÄ-fik di-SAIN/"}'::jsonb,
        '{"term": "Animation", "meaning": "Animación", "de": "Animation", "pron": "/a-ni-méi-shon/", "pron_de": "/ä-ni-MEJ-schön/"}'::jsonb,
        '{"term": "Video editing", "meaning": "Edición de video", "de": "Videobearbeitung", "pron": "/ví-di-o é-di-tin/", "pron_de": "/WI-di-ou E-di-ting/"}'::jsonb,
        '{"term": "Browsing the internet", "meaning": "Navegar por internet", "de": "Im Internet surfen", "pron": "/bráu-sin di ín-ter-net/", "pron_de": "/BRAU-sing dö IN-tö-net/"}'::jsonb,
        '{"term": "Scrolling social media", "meaning": "Mirar redes sociales", "de": "Social Media scrollen", "pron": "/skróu-lin sóu-shal mí-dia/", "pron_de": "/SKROU-ling SOU-schöl MIE-diö/"}'::jsonb,

        -- Ocio, Vida Social y Relajación
        '{"term": "Going to the cinema", "meaning": "Ir al cine", "de": "Ins Kino gehen", "pron": "/góu-in tu de sí-ne-ma/", "pron_de": "/GOU-ing tö dö SI-nö-mö/"}'::jsonb,
        '{"term": "Going to a concert", "meaning": "Ir a un concierto", "de": "Ins Konzert gehen", "pron": "/góu-in tu a kón-sert/", "pron_de": "/GOU-ing tö ö KON-söt/"}'::jsonb,
        '{"term": "Going to the theater", "meaning": "Ir al teatro", "de": "Ins Theater gehen", "pron": "/góu-in tu de zí-a-ter/", "pron_de": "/GOU-ing tö dö SIE-ö-tö/"}'::jsonb,
        '{"term": "Going to a museum", "meaning": "Ir a un museo", "de": "Ins Museum gehen", "pron": "/góu-in tu a miu-zí-um/", "pron_de": "/GOU-ing tö ö mjuu-SIE-öm/"}'::jsonb,
        '{"term": "Shopping", "meaning": "Ir de compras", "de": "Einkaufen", "pron": "/shó-pin/", "pron_de": "/SCHOP-ing/"}'::jsonb,
        '{"term": "Traveling", "meaning": "Viajar", "de": "Reisen", "pron": "/trá-ve-lin/", "pron_de": "/TRÄW-öl-ing/"}'::jsonb,
        '{"term": "Picnicking", "meaning": "Hacer un picnic", "de": "Picknick machen", "pron": "/pík-ni-kin/", "pron_de": "/PIK-ni-king/"}'::jsonb,
        '{"term": "Barbecuing", "meaning": "Hacer una barbacoa", "de": "Grillen", "pron": "/bár-bi-kiu-in/", "pron_de": "/BAA-bi-kjuu-ing/"}'::jsonb,
        '{"term": "Sunbathing", "meaning": "Tomar el sol", "de": "In der Sonne liegen", "pron": "/sán-bei-din/", "pron_de": "/SAN-bej-ding/"}'::jsonb,
        '{"term": "Sightseeing", "meaning": "Hacer turismo", "de": "Sightseeing", "pron": "/sáit-si-in/", "pron_de": "/SAIT-sie-ing/"}'::jsonb,
        '{"term": "Clubbing", "meaning": "Ir de discotecas", "de": "In Clubs gehen", "pron": "/klá-bin/", "pron_de": "/KLA-bing/"}'::jsonb,
        '{"term": "Partying", "meaning": "Salir de fiesta", "de": "Feiern", "pron": "/pár-ti-in/", "pron_de": "/PAA-ti-ing/"}'::jsonb,
        '{"term": "Hanging out with friends", "meaning": "Pasar el rato con amigos", "de": "Mit Freunden abhängen", "pron": "/hán-guin áut uid frends/", "pron_de": "/HÄNG-ing AUT wid FRENDS/"}'::jsonb,
        '{"term": "Volunteering", "meaning": "Hacer voluntariado", "de": "Ehrenamtliche Arbeit", "pron": "/vo-lun-tí-rin/", "pron_de": "/wol-ön-TIE-ring/"}'::jsonb,
        '{"term": "Meditating", "meaning": "Meditar", "de": "Meditieren", "pron": "/mé-di-tei-tin/", "pron_de": "/ME-di-tej-ting/"}'::jsonb,
        '{"term": "Stand-up comedy", "meaning": "Hacer monólogos cómicos", "de": "Stand-up Comedy", "pron": "/stánd-ap kó-me-di/", "pron_de": "/STÄND-ap KO-mö-di/"}'::jsonb,
        '{"term": "Drone flying", "meaning": "Volar drones", "de": "Drohnen fliegen", "pron": "/droun flái-in/", "pron_de": "/DROUN FLAI-ing/"}'::jsonb,
        '{"term": "Metal detecting", "meaning": "Búsqueda con detector de metales", "de": "Metalldetektion", "pron": "/mé-tal di-ték-tin/", "pron_de": "/ME-töl di-TEK-ting/"}'::jsonb,
        '{"term": "Geocaching", "meaning": "Búsqueda de tesoros (Geocaching)", "de": "Geocaching", "pron": "/djí-o-ka-shin/", "pron_de": "/DSCHIE-ou-käsch-ing/"}'::jsonb
    ];

BEGIN

-- 1. Obtener el path_uuid del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Eliminar el deck anterior del Step 245 si existe para evitar duplicados
DELETE FROM deck WHERE step_order = 245 AND path_uuid = v_path_id;

-- 3. Insertar el Deck principal (Step 245)
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 245, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 4. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'Deportes y Hobbies', 
    ''
);

INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (v_deck_id, 'de', 'Sport und Hobbys', '');

-- 5. Bucle para insertar las palabras y vincularlas al mazo
FOREACH card IN ARRAY v_cards
LOOP
    -- Insertar la palabra base en la tabla 'word'
    INSERT INTO word (term, is_root, source_language) 
    VALUES (card->>'term', TRUE, 'en') 
    RETURNING uuid INTO v_word_id;

    -- Insertar la traducción estructurada en JSONB y la pronunciación en 'word_translation'
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (
        v_word_id, 
        'es', 
        jsonb_build_object('translation', card->>'meaning'), 
        card->>'pron'
    );

    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');

    -- Ligar la palabra a este mazo específico usando 'deck_words'
    INSERT INTO deck_words (deck_uuid, word_uuid)
    VALUES (v_deck_id, v_word_id);

END LOOP;
END;
$seed$;
