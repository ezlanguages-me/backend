-- ============================================================
-- Seed: A0 English Path – STEP 110 – Deck – El Individuo II (Familia y Relaciones)
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
        -- Profesiones mencionadas en las fuentes
        '{"term": "Teacher", "meaning": "Profesor / Profesora (Escuela)", "pron": "/tí-cher/"}'::jsonb,
        '{"term": "Lecturer", "meaning": "Profesor universitario / Conferenciante", "pron": "/lék-che-rer/"}'::jsonb,
        '{"term": "Doctor", "meaning": "Médico / Doctor(a)", "pron": "/dák-tor/"}'::jsonb,
        '{"term": "Pilot", "meaning": "Piloto", "pron": "/pái-lot/"}'::jsonb,
        '{"term": "Actor", "meaning": "Actor", "pron": "/ák-tor/"}'::jsonb,
        '{"term": "Shopkeeper", "meaning": "Tendero / Dueño de tienda", "pron": "/shóp-ki-per/"}'::jsonb,
        '{"term": "Police officer", "meaning": "Oficial de policía", "pron": "/po-lís ó-fi-ser/"}'::jsonb,
        '{"term": "Chemist", "meaning": "Farmacéutico / Químico", "pron": "/ké-mist/"}'::jsonb,
        '{"term": "Dentist", "meaning": "Dentista", "pron": "/dén-tist/"}'::jsonb,

        -- Educación y academia (Externo)
        '{"term": "Professor", "meaning": "Catedrático", "pron": "/pro-fé-sor/"}'::jsonb,
        '{"term": "Student", "meaning": "Estudiante", "pron": "/stú-dent/"}'::jsonb,
        '{"term": "Principal", "meaning": "Director / Directora de escuela", "pron": "/prín-si-pal/"}'::jsonb,
        '{"term": "Librarian", "meaning": "Bibliotecario / Bibliotecaria", "pron": "/lai-bré-ri-an/"}'::jsonb,

        -- Medicina y Salud (Externo)
        '{"term": "Nurse", "meaning": "Enfermero / Enfermera", "pron": "/ners/"}'::jsonb,
        '{"term": "Surgeon", "meaning": "Cirujano / Cirujana", "pron": "/sér-djon/"}'::jsonb,
        '{"term": "Veterinarian", "meaning": "Veterinario / Veterinaria", "pron": "/ve-te-ri-né-ri-an/"}'::jsonb,
        '{"term": "Pharmacist", "meaning": "Farmacéutico (US)", "pron": "/fár-ma-sist/"}'::jsonb,
        '{"term": "Psychologist", "meaning": "Psicólogo / Psicóloga", "pron": "/sai-kó-lo-djist/"}'::jsonb,
        '{"term": "Therapist", "meaning": "Terapeuta", "pron": "/zé-ra-pist/"}'::jsonb,
        '{"term": "Paramedic", "meaning": "Paramédico", "pron": "/pa-ra-mé-dik/"}'::jsonb,

        -- Servicios de Emergencia y Ley (Externo)
        '{"term": "Firefighter", "meaning": "Bombero / Bombera", "pron": "/fáir-fai-ter/"}'::jsonb,
        '{"term": "Detective", "meaning": "Detective", "pron": "/di-ték-tiv/"}'::jsonb,
        '{"term": "Lawyer", "meaning": "Abogado / Abogada", "pron": "/ló-ier/"}'::jsonb,
        '{"term": "Judge", "meaning": "Juez / Jueza", "pron": "/djadj/"}'::jsonb,
        '{"term": "Security guard", "meaning": "Guardia de seguridad", "pron": "/si-kiú-ri-ti gard/"}'::jsonb,

        -- Ingeniería, Construcción y Mantenimiento (Externo)
        '{"term": "Engineer", "meaning": "Ingeniero / Ingeniera", "pron": "/en-dji-nír/"}'::jsonb,
        '{"term": "Architect", "meaning": "Arquitecto / Arquitecta", "pron": "/ár-ki-tekt/"}'::jsonb,
        '{"term": "Mechanic", "meaning": "Mecánico / Mecánica", "pron": "/me-ká-nik/"}'::jsonb,
        '{"term": "Plumber", "meaning": "Fontanero / Plomero", "pron": "/plá-mer/"}'::jsonb,
        '{"term": "Electrician", "meaning": "Electricista", "pron": "/i-lek-trí-shan/"}'::jsonb,
        '{"term": "Carpenter", "meaning": "Carpintero / Carpintera", "pron": "/kár-pen-ter/"}'::jsonb,
        '{"term": "Welder", "meaning": "Soldador / Soldadora", "pron": "/uél-der/"}'::jsonb,
        '{"term": "Bricklayer", "meaning": "Albañil", "pron": "/brík-lei-er/"}'::jsonb,
        '{"term": "Painter", "meaning": "Pintor / Pintora", "pron": "/péin-ter/"}'::jsonb,

        -- Hostelería, Restauración y Comercio (Externo)
        '{"term": "Chef", "meaning": "Chef / Cocinero principal", "pron": "/shef/"}'::jsonb,
        '{"term": "Cook", "meaning": "Cocinero / Cocinera", "pron": "/kuk/"}'::jsonb,
        '{"term": "Baker", "meaning": "Panadero / Pastelero", "pron": "/béi-ker/"}'::jsonb,
        '{"term": "Butcher", "meaning": "Carnicero / Carnicera", "pron": "/bú-cher/"}'::jsonb,
        '{"term": "Waiter", "meaning": "Camarero / Mesero", "pron": "/uéi-ter/"}'::jsonb,
        '{"term": "Waitress", "meaning": "Camarera / Mesera", "pron": "/uéi-tres/"}'::jsonb,
        '{"term": "Bartender", "meaning": "Barman / Cantinero", "pron": "/bár-ten-der/"}'::jsonb,
        '{"term": "Barista", "meaning": "Barista (prepara café)", "pron": "/ba-rís-ta/"}'::jsonb,
        '{"term": "Cashier", "meaning": "Cajero / Cajera", "pron": "/ka-shír/"}'::jsonb,
        '{"term": "Salesperson", "meaning": "Vendedor / Vendedora", "pron": "/séils-per-son/"}'::jsonb,

        -- Oficina, Negocios y Finanzas (Externo)
        '{"term": "Businessperson", "meaning": "Empresario / Empresaria", "pron": "/bís-nes-per-son/"}'::jsonb,
        '{"term": "Entrepreneur", "meaning": "Emprendedor / Emprendedora", "pron": "/an-tre-pre-nér/"}'::jsonb,
        '{"term": "Manager", "meaning": "Gerente / Director(a)", "pron": "/má-na-djer/"}'::jsonb,
        '{"term": "Accountant", "meaning": "Contable / Contador(a)", "pron": "/a-káun-tant/"}'::jsonb,
        '{"term": "Economist", "meaning": "Economista", "pron": "/i-kó-no-mist/"}'::jsonb,
        '{"term": "Secretary", "meaning": "Secretario / Secretaria", "pron": "/sé-kre-te-ri/"}'::jsonb,
        '{"term": "Receptionist", "meaning": "Recepcionista", "pron": "/ri-sép-sho-nist/"}'::jsonb,
        '{"term": "Assistant", "meaning": "Asistente", "pron": "/a-sís-tant/"}'::jsonb,
        '{"term": "Consultant", "meaning": "Consultor / Consultora", "pron": "/kon-sál-tant/"}'::jsonb,

        -- Tecnología e Informática (Externo)
        '{"term": "Programmer", "meaning": "Programador / Programadora", "pron": "/próu-gra-mer/"}'::jsonb,
        '{"term": "Software developer", "meaning": "Desarrollador de software", "pron": "/sóft-uer di-vé-lo-per/"}'::jsonb,
        '{"term": "Web designer", "meaning": "Diseñador web", "pron": "/uéb di-sái-ner/"}'::jsonb,
        '{"term": "IT specialist", "meaning": "Especialista en informática", "pron": "/ái-ti spé-sha-list/"}'::jsonb,
        '{"term": "Data analyst", "meaning": "Analista de datos", "pron": "/déi-ta á-na-list/"}'::jsonb,

        -- Arte, Medios y Entretenimiento (Externo)
        '{"term": "Artist", "meaning": "Artista", "pron": "/ár-tist/"}'::jsonb,
        '{"term": "Actress", "meaning": "Actriz", "pron": "/ák-tres/"}'::jsonb,
        '{"term": "Musician", "meaning": "Músico", "pron": "/miu-sí-shan/"}'::jsonb,
        '{"term": "Singer", "meaning": "Cantante", "pron": "/sín-guer/"}'::jsonb,
        '{"term": "Writer", "meaning": "Escritor / Escritora", "pron": "/rái-ter/"}'::jsonb,
        '{"term": "Author", "meaning": "Autor / Autora", "pron": "/ó-zor/"}'::jsonb,
        '{"term": "Journalist", "meaning": "Periodista", "pron": "/djér-na-list/"}'::jsonb,
        '{"term": "Reporter", "meaning": "Reportero / Reportera", "pron": "/ri-pór-ter/"}'::jsonb,
        '{"term": "Photographer", "meaning": "Fotógrafo / Fotógrafa", "pron": "/fo-tó-gra-fer/"}'::jsonb,
        '{"term": "Graphic designer", "meaning": "Diseñador gráfico", "pron": "/grá-fik di-sái-ner/"}'::jsonb,

        -- Transporte e Industria (Externo)
        '{"term": "Driver", "meaning": "Conductor / Chofer", "pron": "/drái-ver/"}'::jsonb,
        '{"term": "Truck driver", "meaning": "Camionero / Camionera", "pron": "/trak drái-ver/"}'::jsonb,
        '{"term": "Bus driver", "meaning": "Conductor de autobús", "pron": "/bas drái-ver/"}'::jsonb,
        '{"term": "Taxi driver", "meaning": "Taxista", "pron": "/ták-si drái-ver/"}'::jsonb,
        '{"term": "Train conductor", "meaning": "Revisor / Maquinista de tren", "pron": "/tréin kon-dák-tor/"}'::jsonb,
        '{"term": "Flight attendant", "meaning": "Asistente de vuelo / Azafato(a)", "pron": "/fláit a-tén-dant/"}'::jsonb,

        -- Agricultura, Ciencias y Naturaleza (Externo)
        '{"term": "Farmer", "meaning": "Agricultor / Granjero", "pron": "/fár-mer/"}'::jsonb,
        '{"term": "Fisherman", "meaning": "Pescador", "pron": "/fí-sher-man/"}'::jsonb,
        '{"term": "Scientist", "meaning": "Científico / Científica", "pron": "/sái-en-tist/"}'::jsonb,
        '{"term": "Biologist", "meaning": "Biólogo / Bióloga", "pron": "/bai-ó-lo-djist/"}'::jsonb,
        '{"term": "Physicist", "meaning": "Físico / Física", "pron": "/fí-si-kist/"}'::jsonb,
        '{"term": "Astronaut", "meaning": "Astronauta", "pron": "/ás-tro-not/"}'::jsonb,

        -- Cuidado Personal, Servicios y Deportes (Externo)
        '{"term": "Hairdresser", "meaning": "Peluquero / Peluquera", "pron": "/hér-dre-ser/"}'::jsonb,
        '{"term": "Barber", "meaning": "Barbero", "pron": "/bár-ber/"}'::jsonb,
        '{"term": "Makeup artist", "meaning": "Maquillador / Maquilladora", "pron": "/méik-ap ár-tist/"}'::jsonb,
        '{"term": "Tailor", "meaning": "Sastre", "pron": "/téi-lor/"}'::jsonb,
        '{"term": "Cleaner", "meaning": "Limpiador / Personal de limpieza", "pron": "/klí-ner/"}'::jsonb,
        '{"term": "Janitor", "meaning": "Conserje / Bedel", "pron": "/djá-ni-tor/"}'::jsonb,
        '{"term": "Nanny", "meaning": "Niñera", "pron": "/ná-ni/"}'::jsonb,
        '{"term": "Real estate agent", "meaning": "Agente inmobiliario", "pron": "/rí-al es-téit éi-djent/"}'::jsonb,
        '{"term": "Travel agent", "meaning": "Agente de viajes", "pron": "/trá-vel éi-djent/"}'::jsonb,
        '{"term": "Tour guide", "meaning": "Guía turístico", "pron": "/tur gáid/"}'::jsonb,
        '{"term": "Athlete", "meaning": "Atleta / Deportista", "pron": "/áz-lit/"}'::jsonb,
        '{"term": "Coach", "meaning": "Entrenador / Entrenadora", "pron": "/kouch/"}'::jsonb,
        '{"term": "Referee", "meaning": "Árbitro", "pron": "/re-fe-rí/"}'::jsonb,
        '{"term": "Politician", "meaning": "Político / Política", "pron": "/po-li-tí-shan/"}'::jsonb
    ];

BEGIN

-- 1. Obtener el path_uuid del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Eliminar el deck de profesiones del Step 115 si existía previamente para evitar duplicados
DELETE FROM deck WHERE step_order = 115 AND path_uuid = v_path_id;

-- 3. Insertar el Deck principal (Step 115)
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 115, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 4. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'Profesiones y Oficios Extendido', 
    ''
);

-- 5. Bucle para insertar todas las Flashcards y sus traducciones
FOREACH card IN ARRAY v_cards
LOOP
    -- Insertar la palabra raíz
    INSERT INTO word (term, is_root, source_language)
    VALUES (card->>'term', TRUE, 'en')
    RETURNING uuid INTO v_word_id;

    -- Insertar la traducción, significado y pronunciación
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (
        v_word_id,
        'es',
        jsonb_build_object('translation', card->>'meaning'),
        card->>'pron'
    );

    -- Vincular la palabra al mazo
    INSERT INTO deck_words (deck_uuid, word_uuid)
    VALUES (v_deck_id, v_word_id);

END LOOP;
END;
$seed$;
