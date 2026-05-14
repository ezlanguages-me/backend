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
        '{"term": "Soccer", "meaning": "Fútbol", "pron": "/sá-ker/"}'::jsonb,
        '{"term": "Basketball", "meaning": "Baloncesto", "pron": "/bás-ket-bol/"}'::jsonb,
        '{"term": "Baseball", "meaning": "Béisbol", "pron": "/béis-bol/"}'::jsonb,
        '{"term": "Football", "meaning": "Fútbol americano", "pron": "/fút-bol/"}'::jsonb,
        '{"term": "Tennis", "meaning": "Tenis", "pron": "/té-nis/"}'::jsonb,
        '{"term": "Volleyball", "meaning": "Voleibol", "pron": "/vó-lei-bol/"}'::jsonb,
        '{"term": "Golf", "meaning": "Golf", "pron": "/golf/"}'::jsonb,
        '{"term": "Rugby", "meaning": "Rugby", "pron": "/rág-bi/"}'::jsonb,
        '{"term": "Cricket", "meaning": "Críquet", "pron": "/krí-ket/"}'::jsonb,
        '{"term": "Hockey", "meaning": "Hockey", "pron": "/hó-ki/"}'::jsonb,
        '{"term": "Table tennis", "meaning": "Tenis de mesa / Ping-pong", "pron": "/téi-bol té-nis/"}'::jsonb,
        '{"term": "Badminton", "meaning": "Bádminton", "pron": "/bád-min-ton/"}'::jsonb,
        '{"term": "Squash", "meaning": "Squash", "pron": "/skuósh/"}'::jsonb,
        '{"term": "Lacrosse", "meaning": "Lacrosse", "pron": "/la-krós/"}'::jsonb,
        '{"term": "Dodgeball", "meaning": "Balón prisionero", "pron": "/dódj-bol/"}'::jsonb,
        '{"term": "Water polo", "meaning": "Waterpolo", "pron": "/uó-ter póu-lou/"}'::jsonb,
        '{"term": "Bowling", "meaning": "Bolos", "pron": "/bóu-lin/"}'::jsonb,
        '{"term": "Billiards", "meaning": "Billar", "pron": "/bí-liards/"}'::jsonb,

        -- Deportes Acuáticos y de Invierno
        '{"term": "Swimming", "meaning": "Natación", "pron": "/suí-min/"}'::jsonb,
        '{"term": "Surfing", "meaning": "Surf", "pron": "/sér-fin/"}'::jsonb,
        '{"term": "Scuba diving", "meaning": "Buceo", "pron": "/skú-ba dái-vin/"}'::jsonb,
        '{"term": "Snorkeling", "meaning": "Esnórquel", "pron": "/snór-ke-lin/"}'::jsonb,
        '{"term": "Rowing", "meaning": "Remo", "pron": "/róu-in/"}'::jsonb,
        '{"term": "Canoeing", "meaning": "Piragüismo", "pron": "/ka-nú-in/"}'::jsonb,
        '{"term": "Sailing", "meaning": "Navegación / Vela", "pron": "/séi-lin/"}'::jsonb,
        '{"term": "Kayaking", "meaning": "Kayak", "pron": "/kái-a-kin/"}'::jsonb,
        '{"term": "Windsurfing", "meaning": "Windsurf", "pron": "/uínd-ser-fin/"}'::jsonb,
        '{"term": "Kitesurfing", "meaning": "Kitesurf", "pron": "/káit-ser-fin/"}'::jsonb,
        '{"term": "Skiing", "meaning": "Esquí", "pron": "/skí-in/"}'::jsonb,
        '{"term": "Snowboarding", "meaning": "Snowboard", "pron": "/snóu-bor-din/"}'::jsonb,
        '{"term": "Ice skating", "meaning": "Patinaje sobre hielo", "pron": "/áis skéi-tin/"}'::jsonb,
        '{"term": "Figure skating", "meaning": "Patinaje artístico", "pron": "/fí-guiur skéi-tin/"}'::jsonb,

        -- Atletismo, Combate y Fitness
        '{"term": "Running", "meaning": "Correr / Running", "pron": "/rá-nin/"}'::jsonb,
        '{"term": "Jogging", "meaning": "Trotar", "pron": "/djó-guin/"}'::jsonb,
        '{"term": "Sprinting", "meaning": "Carrera de velocidad", "pron": "/sprín-tin/"}'::jsonb,
        '{"term": "Cycling", "meaning": "Ciclismo", "pron": "/sái-klin/"}'::jsonb,
        '{"term": "Gymnastics", "meaning": "Gimnasia", "pron": "/djim-nás-tiks/"}'::jsonb,
        '{"term": "Athletics", "meaning": "Atletismo", "pron": "/az-lé-tiks/"}'::jsonb,
        '{"term": "Weightlifting", "meaning": "Levantamiento de pesas", "pron": "/uéit-lif-tin/"}'::jsonb,
        '{"term": "Bodybuilding", "meaning": "Culturismo", "pron": "/bó-di-bil-din/"}'::jsonb,
        '{"term": "Working out", "meaning": "Hacer ejercicio / Entrenar", "pron": "/uór-kin áut/"}'::jsonb,
        '{"term": "Yoga", "meaning": "Yoga", "pron": "/ióu-ga/"}'::jsonb,
        '{"term": "Pilates", "meaning": "Pilates", "pron": "/pi-lá-tis/"}'::jsonb,
        '{"term": "Aerobics", "meaning": "Aeróbic", "pron": "/e-róu-biks/"}'::jsonb,
        '{"term": "Boxing", "meaning": "Boxeo", "pron": "/bók-sin/"}'::jsonb,
        '{"term": "Martial arts", "meaning": "Artes marciales", "pron": "/már-shal arts/"}'::jsonb,
        '{"term": "Wrestling", "meaning": "Lucha libre", "pron": "/rés-lin/"}'::jsonb,
        '{"term": "Judo", "meaning": "Judo", "pron": "/djú-dou/"}'::jsonb,
        '{"term": "Karate", "meaning": "Kárate", "pron": "/ka-rá-ti/"}'::jsonb,
        '{"term": "Taekwondo", "meaning": "Taekwondo", "pron": "/tai-kuón-dou/"}'::jsonb,
        '{"term": "Fencing", "meaning": "Esgrima", "pron": "/fén-sin/"}'::jsonb,
        '{"term": "Archery", "meaning": "Tiro con arco", "pron": "/ár-che-ri/"}'::jsonb,

        -- Actividades al Aire Libre y Extremos
        '{"term": "Hiking", "meaning": "Senderismo", "pron": "/hái-kin/"}'::jsonb,
        '{"term": "Trekking", "meaning": "Excursionismo", "pron": "/tré-kin/"}'::jsonb,
        '{"term": "Backpacking", "meaning": "Viajar de mochilero", "pron": "/bák-pa-kin/"}'::jsonb,
        '{"term": "Camping", "meaning": "Acampar", "pron": "/kám-pin/"}'::jsonb,
        '{"term": "Rock climbing", "meaning": "Escalada en roca", "pron": "/rok klái-min/"}'::jsonb,
        '{"term": "Bouldering", "meaning": "Escalada en bloque", "pron": "/bóul-de-rin/"}'::jsonb,
        '{"term": "Mountaineering", "meaning": "Montañismo", "pron": "/máun-te-ní-rin/"}'::jsonb,
        '{"term": "Horseback riding", "meaning": "Equitación", "pron": "/hórs-bak rái-din/"}'::jsonb,
        '{"term": "Skateboarding", "meaning": "Andar en monopatín", "pron": "/skéit-bor-din/"}'::jsonb,
        '{"term": "Roller skating", "meaning": "Patinaje sobre ruedas", "pron": "/róu-ler skéi-tin/"}'::jsonb,
        '{"term": "BMX", "meaning": "BMX (Ciclismo extremo)", "pron": "/bi-em-éks/"}'::jsonb,
        '{"term": "Motocross", "meaning": "Motocross", "pron": "/móu-tou-kros/"}'::jsonb,
        '{"term": "Paintball", "meaning": "Paintball", "pron": "/péint-bol/"}'::jsonb,
        '{"term": "Laser tag", "meaning": "Laser tag", "pron": "/léi-zer tag/"}'::jsonb,
        '{"term": "Paragliding", "meaning": "Parapente", "pron": "/pá-ra-glai-din/"}'::jsonb,
        '{"term": "Skydiving", "meaning": "Paracaidismo", "pron": "/skái-dai-vin/"}'::jsonb,
        '{"term": "Bungee jumping", "meaning": "Puenting", "pron": "/bán-dji djám-pin/"}'::jsonb,

        -- Hobbies Creativos y Arte
        '{"term": "Reading", "meaning": "Leer", "pron": "/rí-din/"}'::jsonb,
        '{"term": "Writing", "meaning": "Escribir", "pron": "/rái-tin/"}'::jsonb,
        '{"term": "Painting", "meaning": "Pintar", "pron": "/péin-tin/"}'::jsonb,
        '{"term": "Drawing", "meaning": "Dibujar", "pron": "/dró-in/"}'::jsonb,
        '{"term": "Photography", "meaning": "Fotografía", "pron": "/fo-tó-gra-fi/"}'::jsonb,
        '{"term": "Cooking", "meaning": "Cocinar", "pron": "/kú-kin/"}'::jsonb,
        '{"term": "Baking", "meaning": "Hornear / Repostería", "pron": "/béi-kin/"}'::jsonb,
        '{"term": "Gardening", "meaning": "Jardinería", "pron": "/gár-de-nin/"}'::jsonb,
        '{"term": "Knitting", "meaning": "Tejer (a dos agujas)", "pron": "/ní-tin/"}'::jsonb,
        '{"term": "Sewing", "meaning": "Coser", "pron": "/sóu-in/"}'::jsonb,
        '{"term": "Pottery", "meaning": "Alfarería / Cerámica", "pron": "/pó-te-ri/"}'::jsonb,
        '{"term": "Sculpting", "meaning": "Esculpir", "pron": "/skálp-tin/"}'::jsonb,
        '{"term": "Woodworking", "meaning": "Trabajo en madera", "pron": "/uúd-uor-kin/"}'::jsonb,
        '{"term": "Carpentry", "meaning": "Carpintería", "pron": "/kár-pen-tri/"}'::jsonb,
        '{"term": "Origami", "meaning": "Papiroflexia", "pron": "/o-ri-gá-mi/"}'::jsonb,
        '{"term": "Calligraphy", "meaning": "Caligrafía", "pron": "/ka-lí-gra-fi/"}'::jsonb,
        '{"term": "Scrapbooking", "meaning": "Hacer álbumes de recortes", "pron": "/skráp-bu-kin/"}'::jsonb,
        '{"term": "Jewelry making", "meaning": "Hacer joyas", "pron": "/djú-el-ri méi-kin/"}'::jsonb,
        '{"term": "Embroidery", "meaning": "Bordado", "pron": "/em-brói-de-ri/"}'::jsonb,
        '{"term": "Crocheting", "meaning": "Hacer ganchillo", "pron": "/krou-shéi-in/"}'::jsonb,

        -- Música y Actuación
        '{"term": "Playing guitar", "meaning": "Tocar la guitarra", "pron": "/pléi-in gui-tár/"}'::jsonb,
        '{"term": "Playing piano", "meaning": "Tocar el piano", "pron": "/pléi-in pi-á-nou/"}'::jsonb,
        '{"term": "Playing drums", "meaning": "Tocar la batería", "pron": "/pléi-in drams/"}'::jsonb,
        '{"term": "Playing violin", "meaning": "Tocar el violín", "pron": "/pléi-in vai-o-lín/"}'::jsonb,
        '{"term": "Playing flute", "meaning": "Tocar la flauta", "pron": "/pléi-in flut/"}'::jsonb,
        '{"term": "Playing saxophone", "meaning": "Tocar el saxofón", "pron": "/pléi-in sák-so-foun/"}'::jsonb,
        '{"term": "Playing trumpet", "meaning": "Tocar la trompeta", "pron": "/pléi-in trám-pet/"}'::jsonb,
        '{"term": "Listening to music", "meaning": "Escuchar música", "pron": "/lí-se-nin tu miú-sik/"}'::jsonb,
        '{"term": "Singing", "meaning": "Cantar", "pron": "/sín-in/"}'::jsonb,
        '{"term": "Dancing", "meaning": "Bailar", "pron": "/dán-sin/"}'::jsonb,
        '{"term": "Acting", "meaning": "Actuar", "pron": "/ák-tin/"}'::jsonb,
        '{"term": "Magic tricks", "meaning": "Trucos de magia", "pron": "/má-djik triks/"}'::jsonb,
        '{"term": "Juggling", "meaning": "Hacer malabares", "pron": "/djá-glin/"}'::jsonb,

        -- Juegos, Coleccionismo y Mente
        '{"term": "Board games", "meaning": "Juegos de mesa", "pron": "/bord guéims/"}'::jsonb,
        '{"term": "Chess", "meaning": "Ajedrez", "pron": "/ches/"}'::jsonb,
        '{"term": "Playing cards", "meaning": "Jugar a las cartas", "pron": "/pléi-in kards/"}'::jsonb,
        '{"term": "Puzzles", "meaning": "Rompecabezas / Puzles", "pron": "/pá-zols/"}'::jsonb,
        '{"term": "Crossword puzzles", "meaning": "Crucigramas", "pron": "/krós-uord pá-zols/"}'::jsonb,
        '{"term": "Sudoku", "meaning": "Sudoku", "pron": "/su-dóu-ku/"}'::jsonb,
        '{"term": "Stamp collecting", "meaning": "Coleccionar sellos", "pron": "/stamp ko-lék-tin/"}'::jsonb,
        '{"term": "Coin collecting", "meaning": "Coleccionar monedas", "pron": "/kóin ko-lék-tin/"}'::jsonb,
        '{"term": "Antiquing", "meaning": "Buscar antigüedades", "pron": "/an-tí-kin/"}'::jsonb,
        '{"term": "Bird watching", "meaning": "Observación de aves", "pron": "/berd uá-chin/"}'::jsonb,
        '{"term": "Astronomy", "meaning": "Astronomía", "pron": "/as-tró-no-mi/"}'::jsonb,
        '{"term": "Fishing", "meaning": "Pescar", "pron": "/fí-shin/"}'::jsonb,
        '{"term": "Hunting", "meaning": "Cazar", "pron": "/hán-tin/"}'::jsonb,
        '{"term": "Foraging", "meaning": "Recolección (de setas/plantas)", "pron": "/fó-ra-djin/"}'::jsonb,

        -- Medios Digitales y Tecnología
        '{"term": "Watching TV", "meaning": "Ver la televisión", "pron": "/uá-chin ti-ví/"}'::jsonb,
        '{"term": "Watching movies", "meaning": "Ver películas", "pron": "/uá-chin mú-vis/"}'::jsonb,
        '{"term": "Playing video games", "meaning": "Jugar videojuegos", "pron": "/pléi-in ví-di-o guéims/"}'::jsonb,
        '{"term": "Blogging", "meaning": "Escribir un blog", "pron": "/bló-guin/"}'::jsonb,
        '{"term": "Vlogging", "meaning": "Hacer videoblogs", "pron": "/vló-guin/"}'::jsonb,
        '{"term": "Podcasting", "meaning": "Hacer podcasts", "pron": "/pód-kas-tin/"}'::jsonb,
        '{"term": "Programming", "meaning": "Programar / Codificar", "pron": "/próu-gra-min/"}'::jsonb,
        '{"term": "Web design", "meaning": "Diseño web", "pron": "/uéb di-sáin/"}'::jsonb,
        '{"term": "Graphic design", "meaning": "Diseño gráfico", "pron": "/grá-fik di-sáin/"}'::jsonb,
        '{"term": "Animation", "meaning": "Animación", "pron": "/a-ni-méi-shon/"}'::jsonb,
        '{"term": "Video editing", "meaning": "Edición de video", "pron": "/ví-di-o é-di-tin/"}'::jsonb,
        '{"term": "Browsing the internet", "meaning": "Navegar por internet", "pron": "/bráu-sin di ín-ter-net/"}'::jsonb,
        '{"term": "Scrolling social media", "meaning": "Mirar redes sociales", "pron": "/skróu-lin sóu-shal mí-dia/"}'::jsonb,

        -- Ocio, Vida Social y Relajación
        '{"term": "Going to the cinema", "meaning": "Ir al cine", "pron": "/góu-in tu de sí-ne-ma/"}'::jsonb,
        '{"term": "Going to a concert", "meaning": "Ir a un concierto", "pron": "/góu-in tu a kón-sert/"}'::jsonb,
        '{"term": "Going to the theater", "meaning": "Ir al teatro", "pron": "/góu-in tu de zí-a-ter/"}'::jsonb,
        '{"term": "Going to a museum", "meaning": "Ir a un museo", "pron": "/góu-in tu a miu-zí-um/"}'::jsonb,
        '{"term": "Shopping", "meaning": "Ir de compras", "pron": "/shó-pin/"}'::jsonb,
        '{"term": "Traveling", "meaning": "Viajar", "pron": "/trá-ve-lin/"}'::jsonb,
        '{"term": "Picnicking", "meaning": "Hacer un picnic", "pron": "/pík-ni-kin/"}'::jsonb,
        '{"term": "Barbecuing", "meaning": "Hacer una barbacoa", "pron": "/bár-bi-kiu-in/"}'::jsonb,
        '{"term": "Sunbathing", "meaning": "Tomar el sol", "pron": "/sán-bei-din/"}'::jsonb,
        '{"term": "Sightseeing", "meaning": "Hacer turismo", "pron": "/sáit-si-in/"}'::jsonb,
        '{"term": "Clubbing", "meaning": "Ir de discotecas", "pron": "/klá-bin/"}'::jsonb,
        '{"term": "Partying", "meaning": "Salir de fiesta", "pron": "/pár-ti-in/"}'::jsonb,
        '{"term": "Hanging out with friends", "meaning": "Pasar el rato con amigos", "pron": "/hán-guin áut uid frends/"}'::jsonb,
        '{"term": "Volunteering", "meaning": "Hacer voluntariado", "pron": "/vo-lun-tí-rin/"}'::jsonb,
        '{"term": "Meditating", "meaning": "Meditar", "pron": "/mé-di-tei-tin/"}'::jsonb,
        '{"term": "Stand-up comedy", "meaning": "Hacer monólogos cómicos", "pron": "/stánd-ap kó-me-di/"}'::jsonb,
        '{"term": "Drone flying", "meaning": "Volar drones", "pron": "/droun flái-in/"}'::jsonb,
        '{"term": "Metal detecting", "meaning": "Búsqueda con detector de metales", "pron": "/mé-tal di-ték-tin/"}'::jsonb,
        '{"term": "Geocaching", "meaning": "Búsqueda de tesoros (Geocaching)", "pron": "/djí-o-ka-shin/"}'::jsonb
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
    'Deportes, Hobbies y Tiempo Libre', 
    ''
);

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

    -- Ligar la palabra a este mazo específico usando 'deck_words'
    INSERT INTO deck_words (deck_uuid, word_uuid)
    VALUES (v_deck_id, v_word_id);

END LOOP;
END;
$seed$;
