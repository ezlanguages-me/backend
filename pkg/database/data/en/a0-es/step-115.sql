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
        '{"term": "Teacher", "meaning": "Profesor / Profesora (Escuela)", "de": "Lehrer(in)", "pron": "/tí-cher/", "pron_de": "/TIE-tschö/"}'::jsonb,
        '{"term": "Lecturer", "meaning": "Profesor universitario / Conferenciante", "de": "Dozent(in)", "pron": "/lék-che-rer/", "pron_de": "/LEK-tschö-rö/"}'::jsonb,
        '{"term": "Doctor", "meaning": "Médico / Doctor(a)", "de": "Arzt / Ärztin", "pron": "/dák-tor/", "pron_de": "/DOK-tö/"}'::jsonb,
        '{"term": "Pilot", "meaning": "Piloto", "de": "Pilot(in)", "pron": "/pái-lot/", "pron_de": "/PAI-löt/"}'::jsonb,
        '{"term": "Actor", "meaning": "Actor", "de": "Schauspieler(in)", "pron": "/ák-tor/", "pron_de": "/ÄK-tö/"}'::jsonb,
        '{"term": "Shopkeeper", "meaning": "Tendero / Dueño de tienda", "de": "Ladenbesitzer(in)", "pron": "/shóp-ki-per/", "pron_de": "/SCHOP-kie-pö/"}'::jsonb,
        '{"term": "Police officer", "meaning": "Oficial de policía", "de": "Polizeibeamte(r)", "pron": "/po-lís ó-fi-ser/", "pron_de": "/pö-LIES O-fi-sö/"}'::jsonb,
        '{"term": "Chemist", "meaning": "Farmacéutico / Químico", "de": "Chemiker(in)", "pron": "/ké-mist/", "pron_de": "/KE-mist/"}'::jsonb,
        '{"term": "Dentist", "meaning": "Dentista", "de": "Zahnarzt / Zahnärztin", "pron": "/dén-tist/", "pron_de": "/DEN-tist/"}'::jsonb,

        -- Educación y academia (Externo)
        '{"term": "Professor", "meaning": "Catedrático", "de": "Professor(in)", "pron": "/pro-fé-sor/", "pron_de": "/prö-FE-sö/"}'::jsonb,
        '{"term": "Student", "meaning": "Estudiante", "de": "Student(in)", "pron": "/stú-dent/", "pron_de": "/STUU-dönt/"}'::jsonb,
        '{"term": "Principal", "meaning": "Director / Directora de escuela", "de": "Schulleiter(in)", "pron": "/prín-si-pal/", "pron_de": "/PRIN-si-pöl/"}'::jsonb,
        '{"term": "Librarian", "meaning": "Bibliotecario / Bibliotecaria", "de": "Bibliothekar(in)", "pron": "/lai-bré-ri-an/", "pron_de": "/lai-BRÄ-rie-ön/"}'::jsonb,

        -- Medicina y Salud (Externo)
        '{"term": "Nurse", "meaning": "Enfermero / Enfermera", "de": "Krankenpfleger / Krankenschwester", "pron": "/ners/", "pron_de": "/NÖÖS/"}'::jsonb,
        '{"term": "Surgeon", "meaning": "Cirujano / Cirujana", "de": "Chirurg(in)", "pron": "/sér-djon/", "pron_de": "/SÖÖ-dschön/"}'::jsonb,
        '{"term": "Veterinarian", "meaning": "Veterinario / Veterinaria", "de": "Tierarzt / Tierärztin", "pron": "/ve-te-ri-né-ri-an/", "pron_de": "/we-tö-ri-NÄ-rie-ön/"}'::jsonb,
        '{"term": "Pharmacist", "meaning": "Farmacéutico (US)", "de": "Apotheker(in)", "pron": "/fár-ma-sist/", "pron_de": "/FAA-mö-sist/"}'::jsonb,
        '{"term": "Psychologist", "meaning": "Psicólogo / Psicóloga", "de": "Psychologe / Psychologin", "pron": "/sai-kó-lo-djist/", "pron_de": "/sai-KO-lö-dschist/"}'::jsonb,
        '{"term": "Therapist", "meaning": "Terapeuta", "de": "Therapeut(in)", "pron": "/zé-ra-pist/", "pron_de": "/SSE-rö-pist/"}'::jsonb,
        '{"term": "Paramedic", "meaning": "Paramédico", "de": "Sanitäter(in)", "pron": "/pa-ra-mé-dik/", "pron_de": "/pä-rö-ME-dik/"}'::jsonb,

        -- Servicios de Emergencia y Ley (Externo)
        '{"term": "Firefighter", "meaning": "Bombero / Bombera", "de": "Feuerwehrmann / Feuerwehrfrau", "pron": "/fáir-fai-ter/", "pron_de": "/FAIJÖ-fai-tö/"}'::jsonb,
        '{"term": "Detective", "meaning": "Detective", "de": "Detektiv(in)", "pron": "/di-ték-tiv/", "pron_de": "/di-TEK-tiv/"}'::jsonb,
        '{"term": "Lawyer", "meaning": "Abogado / Abogada", "de": "Rechtsanwalt / Rechtsanwältin", "pron": "/ló-ier/", "pron_de": "/LOO-jö/"}'::jsonb,
        '{"term": "Judge", "meaning": "Juez / Jueza", "de": "Richter(in)", "pron": "/djadj/", "pron_de": "/DSCHADSCH/"}'::jsonb,
        '{"term": "Security guard", "meaning": "Guardia de seguridad", "de": "Sicherheitsbeamte(r)", "pron": "/si-kiú-ri-ti gard/", "pron_de": "/si-KJUU-ri-ti gaard/"}'::jsonb,

        -- Ingeniería, Construcción y Mantenimiento (Externo)
        '{"term": "Engineer", "meaning": "Ingeniero / Ingeniera", "de": "Ingenieur(in)", "pron": "/en-dji-nír/", "pron_de": "/en-dsche-NIÖ/"}'::jsonb,
        '{"term": "Architect", "meaning": "Arquitecto / Arquitecta", "de": "Architekt(in)", "pron": "/ár-ki-tekt/", "pron_de": "/AA-ki-tekt/"}'::jsonb,
        '{"term": "Mechanic", "meaning": "Mecánico / Mecánica", "de": "Mechaniker(in)", "pron": "/me-ká-nik/", "pron_de": "/mö-KÄ-nik/"}'::jsonb,
        '{"term": "Plumber", "meaning": "Fontanero / Plomero", "de": "Klempner(in)", "pron": "/plá-mer/", "pron_de": "/PLA-mö/"}'::jsonb,
        '{"term": "Electrician", "meaning": "Electricista", "de": "Elektriker(in)", "pron": "/i-lek-trí-shan/", "pron_de": "/e-lek-TRI-schön/"}'::jsonb,
        '{"term": "Carpenter", "meaning": "Carpintero / Carpintera", "de": "Tischler(in)", "pron": "/kár-pen-ter/", "pron_de": "/KAA-pin-tö/"}'::jsonb,
        '{"term": "Welder", "meaning": "Soldador / Soldadora", "de": "Schweißer(in)", "pron": "/uél-der/", "pron_de": "/WEL-dö/"}'::jsonb,
        '{"term": "Bricklayer", "meaning": "Albañil", "de": "Maurer(in)", "pron": "/brík-lei-er/", "pron_de": "/BRIK-lej-ö/"}'::jsonb,
        '{"term": "Painter", "meaning": "Pintor / Pintora", "de": "Maler(in)", "pron": "/péin-ter/", "pron_de": "/PEJN-tö/"}'::jsonb,

        -- Hostelería, Restauración y Comercio (Externo)
        '{"term": "Chef", "meaning": "Chef / Cocinero principal", "de": "Koch / Köchin", "pron": "/shef/", "pron_de": "/SCHEF/"}'::jsonb,
        '{"term": "Cook", "meaning": "Cocinero / Cocinera", "de": "Koch / Köchin", "pron": "/kuk/", "pron_de": "/KUK/"}'::jsonb,
        '{"term": "Baker", "meaning": "Panadero / Pastelero", "de": "Bäcker(in)", "pron": "/béi-ker/", "pron_de": "/BEJ-kö/"}'::jsonb,
        '{"term": "Butcher", "meaning": "Carnicero / Carnicera", "de": "Metzger(in)", "pron": "/bú-cher/", "pron_de": "/BU-tschö/"}'::jsonb,
        '{"term": "Waiter", "meaning": "Camarero / Mesero", "de": "Kellner", "pron": "/uéi-ter/", "pron_de": "/WEJ-tö/"}'::jsonb,
        '{"term": "Waitress", "meaning": "Camarera / Mesera", "de": "Kellnerin", "pron": "/uéi-tres/", "pron_de": "/WEJ-tris/"}'::jsonb,
        '{"term": "Bartender", "meaning": "Barman / Cantinero", "de": "Barkeeper", "pron": "/bár-ten-der/", "pron_de": "/BAA-ten-dö/"}'::jsonb,
        '{"term": "Barista", "meaning": "Barista (prepara café)", "de": "Barista", "pron": "/ba-rís-ta/", "pron_de": "/bö-RIE-stö/"}'::jsonb,
        '{"term": "Cashier", "meaning": "Cajero / Cajera", "de": "Kassierer(in)", "pron": "/ka-shír/", "pron_de": "/kä-SCHIÖ/"}'::jsonb,
        '{"term": "Salesperson", "meaning": "Vendedor / Vendedora", "de": "Verkäufer(in)", "pron": "/séils-per-son/", "pron_de": "/SEJLS-pö-sön/"}'::jsonb,

        -- Oficina, Negocios y Finanzas (Externo)
        '{"term": "Businessperson", "meaning": "Empresario / Empresaria", "de": "Geschäftsmann / Geschäftsfrau", "pron": "/bís-nes-per-son/", "pron_de": "/BIS-nis-pö-sön/"}'::jsonb,
        '{"term": "Entrepreneur", "meaning": "Emprendedor / Emprendedora", "de": "Unternehmer(in)", "pron": "/an-tre-pre-nér/", "pron_de": "/on-trö-prö-NÖÖ/"}'::jsonb,
        '{"term": "Manager", "meaning": "Gerente / Director(a)", "de": "Manager(in)", "pron": "/má-na-djer/", "pron_de": "/MÄ-ni-dschö/"}'::jsonb,
        '{"term": "Accountant", "meaning": "Contable / Contador(a)", "de": "Buchhalter(in)", "pron": "/a-káun-tant/", "pron_de": "/ö-KAUN-tönt/"}'::jsonb,
        '{"term": "Economist", "meaning": "Economista", "de": "Ökonom(in)", "pron": "/i-kó-no-mist/", "pron_de": "/i-KO-nö-mist/"}'::jsonb,
        '{"term": "Secretary", "meaning": "Secretario / Secretaria", "de": "Sekretär(in)", "pron": "/sé-kre-te-ri/", "pron_de": "/SE-krö-te-ri/"}'::jsonb,
        '{"term": "Receptionist", "meaning": "Recepcionista", "de": "Rezeptionist(in)", "pron": "/ri-sép-sho-nist/", "pron_de": "/ri-SEP-schö-nist/"}'::jsonb,
        '{"term": "Assistant", "meaning": "Asistente", "de": "Assistent(in)", "pron": "/a-sís-tant/", "pron_de": "/ö-SIS-tönt/"}'::jsonb,
        '{"term": "Consultant", "meaning": "Consultor / Consultora", "de": "Berater(in)", "pron": "/kon-sál-tant/", "pron_de": "/kön-SAL-tönt/"}'::jsonb,

        -- Tecnología e Informática (Externo)
        '{"term": "Programmer", "meaning": "Programador / Programadora", "de": "Programmierer(in)", "pron": "/próu-gra-mer/", "pron_de": "/PROU-grä-mö/"}'::jsonb,
        '{"term": "Software developer", "meaning": "Desarrollador de software", "de": "Softwareentwickler(in)", "pron": "/sóft-uer di-vé-lo-per/", "pron_de": "/SOFT-wäö di-WE-lö-pö/"}'::jsonb,
        '{"term": "Web designer", "meaning": "Diseñador web", "de": "Webdesigner(in)", "pron": "/uéb di-sái-ner/", "pron_de": "/WEB di-SAI-nö/"}'::jsonb,
        '{"term": "IT specialist", "meaning": "Especialista en informática", "de": "IT-Spezialist(in)", "pron": "/ái-ti spé-sha-list/", "pron_de": "/ai-TIE SPE-schö-list/"}'::jsonb,
        '{"term": "Data analyst", "meaning": "Analista de datos", "de": "Datenanalyst(in)", "pron": "/déi-ta á-na-list/", "pron_de": "/DEJ-tö Ä-nö-list/"}'::jsonb,

        -- Arte, Medios y Entretenimiento (Externo)
        '{"term": "Artist", "meaning": "Artista", "de": "Künstler(in)", "pron": "/ár-tist/", "pron_de": "/AA-tist/"}'::jsonb,
        '{"term": "Actress", "meaning": "Actriz", "de": "Schauspielerin", "pron": "/ák-tres/", "pron_de": "/ÄK-tris/"}'::jsonb,
        '{"term": "Musician", "meaning": "Músico", "de": "Musiker(in)", "pron": "/miu-sí-shan/", "pron_de": "/mjuu-SI-schön/"}'::jsonb,
        '{"term": "Singer", "meaning": "Cantante", "de": "Sänger(in)", "pron": "/sín-guer/", "pron_de": "/SIN-gö/"}'::jsonb,
        '{"term": "Writer", "meaning": "Escritor / Escritora", "de": "Schriftsteller(in)", "pron": "/rái-ter/", "pron_de": "/RAI-tö/"}'::jsonb,
        '{"term": "Author", "meaning": "Autor / Autora", "de": "Autor(in)", "pron": "/ó-zor/", "pron_de": "/OO-ssö/"}'::jsonb,
        '{"term": "Journalist", "meaning": "Periodista", "de": "Journalist(in)", "pron": "/djér-na-list/", "pron_de": "/DSCHÖ-nö-list/"}'::jsonb,
        '{"term": "Reporter", "meaning": "Reportero / Reportera", "de": "Reporter(in)", "pron": "/ri-pór-ter/", "pron_de": "/ri-POO-tö/"}'::jsonb,
        '{"term": "Photographer", "meaning": "Fotógrafo / Fotógrafa", "de": "Fotograf(in)", "pron": "/fo-tó-gra-fer/", "pron_de": "/fö-TOG-rö-fö/"}'::jsonb,
        '{"term": "Graphic designer", "meaning": "Diseñador gráfico", "de": "Grafikdesigner(in)", "pron": "/grá-fik di-sái-ner/", "pron_de": "/GRÄ-fik di-SAI-nö/"}'::jsonb,

        -- Transporte e Industria (Externo)
        '{"term": "Driver", "meaning": "Conductor / Chofer", "de": "Fahrer(in)", "pron": "/drái-ver/", "pron_de": "/DRAI-wö/"}'::jsonb,
        '{"term": "Truck driver", "meaning": "Camionero / Camionera", "de": "LKW-Fahrer(in)", "pron": "/trak drái-ver/", "pron_de": "/TRAK DRAI-wö/"}'::jsonb,
        '{"term": "Bus driver", "meaning": "Conductor de autobús", "de": "Busfahrer(in)", "pron": "/bas drái-ver/", "pron_de": "/BAS DRAI-wö/"}'::jsonb,
        '{"term": "Taxi driver", "meaning": "Taxista", "de": "Taxifahrer(in)", "pron": "/ták-si drái-ver/", "pron_de": "/TÄK-si DRAI-wö/"}'::jsonb,
        '{"term": "Train conductor", "meaning": "Revisor / Maquinista de tren", "de": "Zugführer(in)", "pron": "/tréin kon-dák-tor/", "pron_de": "/TREJN kön-DAK-tö/"}'::jsonb,
        '{"term": "Flight attendant", "meaning": "Asistente de vuelo / Azafato(a)", "de": "Flugbegleiter(in)", "pron": "/fláit a-tén-dant/", "pron_de": "/FLAIT ö-TEN-dönt/"}'::jsonb,

        -- Agricultura, Ciencias y Naturaleza (Externo)
        '{"term": "Farmer", "meaning": "Agricultor / Granjero", "de": "Bauer / Bäuerin", "pron": "/fár-mer/", "pron_de": "/FAA-mö/"}'::jsonb,
        '{"term": "Fisherman", "meaning": "Pescador", "de": "Fischer", "pron": "/fí-sher-man/", "pron_de": "/FI-schö-mön/"}'::jsonb,
        '{"term": "Scientist", "meaning": "Científico / Científica", "de": "Wissenschaftler(in)", "pron": "/sái-en-tist/", "pron_de": "/SAI-ön-tist/"}'::jsonb,
        '{"term": "Biologist", "meaning": "Biólogo / Bióloga", "de": "Biologe / Biologin", "pron": "/bai-ó-lo-djist/", "pron_de": "/bai-O-lö-dschist/"}'::jsonb,
        '{"term": "Physicist", "meaning": "Físico / Física", "de": "Physiker(in)", "pron": "/fí-si-kist/", "pron_de": "/FI-si-sist/"}'::jsonb,
        '{"term": "Astronaut", "meaning": "Astronauta", "de": "Astronaut(in)", "pron": "/ás-tro-not/", "pron_de": "/ÄS-trö-not/"}'::jsonb,

        -- Cuidado Personal, Servicios y Deportes (Externo)
        '{"term": "Hairdresser", "meaning": "Peluquero / Peluquera", "de": "Friseur / Friseurin", "pron": "/hér-dre-ser/", "pron_de": "/HÄÖ-dre-sö/"}'::jsonb,
        '{"term": "Barber", "meaning": "Barbero", "de": "Barbier", "pron": "/bár-ber/", "pron_de": "/BAA-bö/"}'::jsonb,
        '{"term": "Makeup artist", "meaning": "Maquillador / Maquilladora", "de": "Visagist(in)", "pron": "/méik-ap ár-tist/", "pron_de": "/MEJK-ap AA-tist/"}'::jsonb,
        '{"term": "Tailor", "meaning": "Sastre", "de": "Schneider(in)", "pron": "/téi-lor/", "pron_de": "/TEJ-lö/"}'::jsonb,
        '{"term": "Cleaner", "meaning": "Limpiador / Personal de limpieza", "de": "Reinigungskraft", "pron": "/klí-ner/", "pron_de": "/KLIE-nö/"}'::jsonb,
        '{"term": "Janitor", "meaning": "Conserje / Bedel", "de": "Hausmeister(in)", "pron": "/djá-ni-tor/", "pron_de": "/DSCHÄ-ni-tö/"}'::jsonb,
        '{"term": "Nanny", "meaning": "Niñera", "de": "Kindermädchen", "pron": "/ná-ni/", "pron_de": "/NÄ-ni/"}'::jsonb,
        '{"term": "Real estate agent", "meaning": "Agente inmobiliario", "de": "Immobilienmakler(in)", "pron": "/rí-al es-téit éi-djent/", "pron_de": "/RIEL is-TEJT EJ-dschönt/"}'::jsonb,
        '{"term": "Travel agent", "meaning": "Agente de viajes", "de": "Reiseagent(in)", "pron": "/trá-vel éi-djent/", "pron_de": "/TRÄ-wöl EJ-dschönt/"}'::jsonb,
        '{"term": "Tour guide", "meaning": "Guía turístico", "de": "Reiseführer(in)", "pron": "/tur gáid/", "pron_de": "/TUÖ GAID/"}'::jsonb,
        '{"term": "Athlete", "meaning": "Atleta / Deportista", "de": "Sportler(in)", "pron": "/áz-lit/", "pron_de": "/ÄS-liet/"}'::jsonb,
        '{"term": "Coach", "meaning": "Entrenador / Entrenadora", "de": "Trainer(in)", "pron": "/kouch/", "pron_de": "/KOUTSCH/"}'::jsonb,
        '{"term": "Referee", "meaning": "Árbitro", "de": "Schiedsrichter(in)", "pron": "/re-fe-rí/", "pron_de": "/re-fö-RIE/"}'::jsonb,
        '{"term": "Politician", "meaning": "Político / Política", "de": "Politiker(in)", "pron": "/po-li-tí-shan/", "pron_de": "/po-li-TI-schön/"}'::jsonb,

        -- Roles adicionales
        '{"term": "Researcher", "meaning": "Investigador(a)", "de": "Forscher(in)", "pron": "/ri-sér-cher/", "pron_de": "/ri-SÖÖTSCH-ö/"}'::jsonb,
        '{"term": "Soldier", "meaning": "Soldado", "de": "Soldat(in)", "pron": "/sóul-djer/", "pron_de": "/SOUL-dschö/"}'::jsonb,
        '{"term": "Translator", "meaning": "Traductor(a)", "de": "Übersetzer(in)", "pron": "/trans-léi-tor/", "pron_de": "/träns-LEJ-tö/"}'::jsonb,
        '{"term": "Interpreter", "meaning": "Intérprete", "de": "Dolmetscher(in)", "pron": "/in-tér-pri-ter/", "pron_de": "/in-TÖÖ-pri-tö/"}'::jsonb,
        '{"term": "Social worker", "meaning": "Trabajador(a) social", "de": "Sozialarbeiter(in)", "pron": "/sóu-shal uór-ker/", "pron_de": "/SOU-schöl WÖÖ-kö/"}'::jsonb,
        '{"term": "CEO (Chief Executive Officer)", "meaning": "Director(a) ejecutivo(a) / CEO", "de": "Geschäftsführer(in) / CEO", "pron": "/si-i-óu/", "pron_de": "/sie-ie-OU/"}'::jsonb
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
    'Profesiones y Oficios', 
    ''
);

INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (v_deck_id, 'de', 'Berufe und Tätigkeiten', '');

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
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');

    -- Vincular la palabra al mazo
    INSERT INTO deck_words (deck_uuid, word_uuid)
    VALUES (v_deck_id, v_word_id);

END LOOP;
END;
$seed$;
