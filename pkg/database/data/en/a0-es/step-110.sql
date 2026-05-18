-- ============================================================
-- Seed: A0 English Path – STEP 110 – Deck – El Individuo II (Familia y Relaciones)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_root_id UUID; 
    v_item JSONB;
    v_family_relations JSONB[] := ARRAY[
        -- ==========================================
        -- FAMILIA DIRECTA E INMEDIATA
        -- ==========================================
        '{"v":"parents","es":"padres (madre y padre)","de":"Eltern","pron":"/pé-rents/","pron_de":"/EL-tön/"}',
        '{"v":"mother / mom","es":"madre / mamá","de":"Mutter / Mama","pron":"/má-der / mam/","pron_de":"/MA-dö / MA-ma/"}',
        '{"v":"father / dad","es":"padre / papá","de":"Vater / Papa","pron":"/fá-der / dad/","pron_de":"/FA-dö / PA-pa/"}',
        '{"v":"siblings","es":"hermanos (en general, ambos sexos)","de":"Geschwister","pron":"/sí-blins/","pron_de":"/GE-schwis-tö/"}',
        '{"v":"brother","es":"hermano","de":"Bruder","pron":"/bró-der/","pron_de":"/BRU-dö/"}',
        '{"v":"sister","es":"hermana","de":"Schwester","pron":"/sís-ter/","pron_de":"/SCHWE-stö/"}',
        '{"v":"children / kids","es":"hijos / niños","de":"Kinder","pron":"/chíl-dren / kids/","pron_de":"/TSCHIL-drön / kids/"}',
        '{"v":"son","es":"hijo","de":"Sohn","pron":"/san/","pron_de":"/SAN/"}',
        '{"v":"daughter","es":"hija","de":"Tochter","pron":"/dó-ter/","pron_de":"/DOO-tö/"}',
        '{"v":"husband","es":"esposo / marido","de":"Ehemann / Mann","pron":"/hás-band/","pron_de":"/HAS-bönd/"}',
        '{"v":"wife","es":"esposa / mujer","de":"Ehefrau / Frau","pron":"/uáif/","pron_de":"/WAIF/"}',
        
        -- ==========================================
        -- FAMILIA EXTENDIDA
        -- ==========================================
        '{"v":"grandparents","es":"abuelos","de":"Großeltern","pron":"/gran-pé-rents/","pron_de":"/GRÄND-pä-rönts/"}',
        '{"v":"grandfather / grandpa","es":"abuelo / abuelito","de":"Großvater / Opa","pron":"/gran-fá-der / gran-pa/","pron_de":"/GRÄND-fa-dö / GRÄND-pa/"}',
        '{"v":"grandmother / grandma","es":"abuela / abuelita","de":"Großmutter / Oma","pron":"/gran-má-der / gran-ma/","pron_de":"/GRÄND-ma-dö / GRÄND-ma/"}',
        '{"v":"grandchildren","es":"nietos","de":"Enkelkinder","pron":"/gran-chíl-dren/","pron_de":"/GRÄND-tschil-drön/"}',
        '{"v":"grandson","es":"nieto","de":"Enkelsohn / Enkel","pron":"/gran-san/","pron_de":"/GRÄND-san/"}',
        '{"v":"granddaughter","es":"nieta","de":"Enkeltochter / Enkelin","pron":"/gran-dó-ter/","pron_de":"/GRÄND-doo-tö/"}',
        '{"v":"uncle","es":"tío","de":"Onkel","pron":"/án-kel/","pron_de":"/ANG-köl/"}',
        '{"v":"aunt","es":"tía","de":"Tante","pron":"/ant/","pron_de":"/AANT/"}',
        '{"v":"cousin","es":"primo / prima","de":"Cousin / Cousine","pron":"/ká-sin/","pron_de":"/KA-sön/"}',
        '{"v":"nephew","es":"sobrino","de":"Neffe","pron":"/né-fiu/","pron_de":"/NE-fjuu/"}',
        '{"v":"niece","es":"sobrina","de":"Nichte","pron":"/nis/","pron_de":"/NIES/"}',
        
        -- ==========================================
        -- FAMILIA POLÍTICA (IN-LAWS) Y COMPUESTA
        -- ==========================================
        '{"v":"father-in-law","es":"suegro","de":"Schwiegervater","pron":"/fá-der in lo/","pron_de":"/FA-dö in loo/"}',
        '{"v":"mother-in-law","es":"suegra","de":"Schwiegermutter","pron":"/má-der in lo/","pron_de":"/MA-dö in loo/"}',
        '{"v":"brother-in-law","es":"cuñado","de":"Schwager","pron":"/bró-der in lo/","pron_de":"/BRO-dö in loo/"}',
        '{"v":"sister-in-law","es":"cuñada","de":"Schwägerin","pron":"/sís-ter in lo/","pron_de":"/SIS-tö in loo/"}',
        '{"v":"son-in-law","es":"yerno","de":"Schwiegersohn","pron":"/san in lo/","pron_de":"/SAN in loo/"}',
        '{"v":"daughter-in-law","es":"nuera","de":"Schwiegertochter","pron":"/dó-ter in lo/","pron_de":"/DOO-tö in loo/"}',
        '{"v":"stepfather","es":"padrastro","de":"Stiefvater","pron":"/stép-fá-der/","pron_de":"/STEF-fa-dö/"}',
        '{"v":"stepmother","es":"madrastra","de":"Stiefmutter","pron":"/stép-má-der/","pron_de":"/STEF-ma-dö/"}',
        '{"v":"stepbrother","es":"hermanastro","de":"Stiefbruder","pron":"/stép-bró-der/","pron_de":"/STEF-bru-dö/"}',
        '{"v":"stepsister","es":"hermanastra","de":"Stiefschwester","pron":"/stép-sís-ter/","pron_de":"/STEF-schwe-stö/"}',
        
        -- ==========================================
        -- RELACIONES, CITAS Y ETAPAS
        -- ==========================================
        '{"v":"boyfriend","es":"novio","de":"Freund / Boyfriend","pron":"/bói-frend/","pron_de":"/BOI-frend/"}',
        '{"v":"girlfriend","es":"novia","de":"Freundin / Girlfriend","pron":"/guérl-frend/","pron_de":"/GÖÖ-lfrend/"}',
        '{"v":"partner","es":"pareja (sentido romántico)","de":"Partner(in)","pron":"/párt-ner/","pron_de":"/PAAT-nö/"}',
        '{"v":"fiancé / fiancée","es":"prometido / prometida","de":"Verlobter / Verlobte","pron":"/fi-an-séi/","pron_de":"/fi-an-SEJ/"}',
        '{"v":"ex-husband","es":"exmarido","de":"Ex-Mann","pron":"/eks-hás-band/","pron_de":"/eks-HAS-bönd/"}',
        '{"v":"ex-wife","es":"exmujer","de":"Ex-Frau","pron":"/eks-uáif/","pron_de":"/eks-WAIF/"}',
        '{"v":"to date","es":"salir con alguien (románticamente)","de":"sich verabreden / daten","pron":"/tu déit/","pron_de":"/tu DEIT/"}',
        '{"v":"to get engaged","es":"comprometerse","de":"sich verloben","pron":"/tu guet en-guéichd/","pron_de":"/tu guet en-GEJTSCHD/"}',
        '{"v":"to get married","es":"casarse","de":"heiraten","pron":"/tu guet má-rid/","pron_de":"/tu guet MÄ-rid/"}',
        '{"v":"to get divorced","es":"divorciarse","de":"sich scheiden lassen","pron":"/tu guet di-vórst/","pron_de":"/tu guet di-VÖÖRST/"}',
        '{"v":"to break up","es":"romper / terminar una relación","de":"Schluss machen / sich trennen","pron":"/tu bréik ap/","pron_de":"/tu BREIK ap/"}',
        '{"v":"wedding","es":"boda","de":"Hochzeit","pron":"/ué-din/","pron_de":"/WE-ding/"}',
        '{"v":"marriage","es":"matrimonio","de":"Ehe / Heirat","pron":"/má-rich/","pron_de":"/MÄ-ridsch/"}',
        
        -- ==========================================
        -- AMISTAD Y VIDA SOCIAL
        -- ==========================================
        '{"v":"friend","es":"amigo / amiga","de":"Freund(in)","pron":"/frend/","pron_de":"/FREND/"}',
        '{"v":"best friend","es":"mejor amigo / amiga","de":"bester Freund / beste Freundin","pron":"/best frend/","pron_de":"/BEST FREND/"}',
        '{"v":"acquaintance","es":"conocido / conocida","de":"Bekannte(r)","pron":"/a-kuéin-tans/","pron_de":"/a-KUEIN-tans/"}',
        '{"v":"roommate","es":"compañero/a de cuarto o piso","de":"Mitbewohner(in)","pron":"/rúm-meit/","pron_de":"/RUUM-mejt/"}',
        '{"v":"coworker","es":"compañero/a de trabajo","de":"Kollege / Kollegin","pron":"/kóu-uer-ker/","pron_de":"/KOU-wö-kö/"}',

        -- Etapas de vida
        '{"v":"baby","es":"bebé","de":"Baby","pron":"/béi-bi/","pron_de":"/BEJ-bie/"}',
        '{"v":"infant","es":"bebé / lactante","de":"Säugling / Baby","pron":"/ín-fant/","pron_de":"/IN-fönt/"}',
        '{"v":"toddler","es":"niño/niña pequeño(a) (1-3 años)","de":"Kleinkind (1-3 Jahre)","pron":"/tód-ler/","pron_de":"/TOD-lö/"}',
        '{"v":"teenager / teen","es":"adolescente","de":"Teenager","pron":"/tí-nei-djer / tin/","pron_de":"/TIE-nei-dschö / tien/"}',
        '{"v":"adult","es":"adulto / adulta","de":"Erwachsene(r)","pron":"/á-dalt/","pron_de":"/Ä-dalt/"}',
        '{"v":"elderly person","es":"persona mayor / anciano(a)","de":"ältere Person / Senior(in)","pron":"/él-der-li pér-son/","pron_de":"/EL-dö-lie PÖ-sön/"}',
        '{"v":"twin","es":"gemelo / gemela","de":"Zwilling","pron":"/tuin/","pron_de":"/TUIN/"}',

        -- Familia extendida y tutores
        '{"v":"godfather","es":"padrino","de":"Taufpate / Pate","pron":"/gód-fá-der/","pron_de":"/GOD-faa-dö/"}',
        '{"v":"godmother","es":"madrina","de":"Taufpatin / Patin","pron":"/gód-má-der/","pron_de":"/GOD-ma-dö/"}',
        '{"v":"godchild","es":"ahijado / ahijada","de":"Patenkind","pron":"/gód-chaild/","pron_de":"/GOD-tschaild/"}',
        '{"v":"guardian","es":"tutor(a) / guardián","de":"Vormund / Erziehungsberechtigte(r)","pron":"/gár-di-an/","pron_de":"/GAAR-di-ön/"}',
        '{"v":"foster parent","es":"padre/madre de acogida","de":"Pflegeelternteil","pron":"/fós-ter pér-ent/","pron_de":"/FOS-tö pä-rönt/"}',
        '{"v":"adopted child","es":"hijo/a adoptivo(a)","de":"Adoptivkind","pron":"/a-dáp-tid chaild/","pron_de":"/a-DOP-tid tschaild/"}',
        '{"v":"half-brother","es":"medio hermano","de":"Halbbruder","pron":"/haf-bró-der/","pron_de":"/HAAF-bro-dö/"}',
        '{"v":"half-sister","es":"media hermana","de":"Halbschwester","pron":"/haf-sís-ter/","pron_de":"/HAAF-sis-tö/"}',

        -- Relaciones sociales
        '{"v":"neighbor","es":"vecino / vecina","de":"Nachbar(in)","pron":"/néi-bor/","pron_de":"/NEJ-bö/"}',
        '{"v":"classmate","es":"compañero/a de clase","de":"Mitschüler(in) / Kommilitone","pron":"/klás-meit/","pron_de":"/KLAAS-mejt/"}'
    ];

BEGIN

-- 1. Obtener el path del idioma principal
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Deck en la base de datos (Step 110)
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 110, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 3. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (
    v_deck_id, 
    'es', 
    'Familia, Relaciones y Citas', 
    ''
);

INSERT INTO deck_translation (deck_uuid, language, title, description) 
VALUES (v_deck_id, 'de', 'Familie, Beziehungen und Verabredungen', '');

-- 4. Bucle para insertar todas las palabras del mazo
FOREACH v_item IN ARRAY v_family_relations
LOOP
    -- Insertar el término en la tabla word como palabra raíz
    INSERT INTO word (term, is_root, source_language) 
    VALUES (v_item->>'v', TRUE, 'en') 
    RETURNING uuid INTO v_root_id;

    -- Insertar la traducción al español y su pronunciación
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (
        v_root_id, 
        'es', 
        jsonb_build_object('translation', v_item->>'es'), 
        v_item->>'pron'
    );

    -- Insertar la traducción al alemán y su pronunciación
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de');

    -- Vincular la palabra creada al mazo actual
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;
END;
$seed$;
