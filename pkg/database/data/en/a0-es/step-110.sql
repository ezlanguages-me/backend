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
        '{"v":"parents","es":"padres (madre y padre)","pron":"/pé-rents/"}',
        '{"v":"mother / mom","es":"madre / mamá","pron":"/má-der / mam/"}',
        '{"v":"father / dad","es":"padre / papá","pron":"/fá-der / dad/"}',
        '{"v":"siblings","es":"hermanos (en general, ambos sexos)","pron":"/sí-blins/"}',
        '{"v":"brother","es":"hermano","pron":"/bró-der/"}',
        '{"v":"sister","es":"hermana","pron":"/sís-ter/"}',
        '{"v":"children / kids","es":"hijos / niños","pron":"/chíl-dren / kids/"}',
        '{"v":"son","es":"hijo","pron":"/san/"}',
        '{"v":"daughter","es":"hija","pron":"/dó-ter/"}',
        '{"v":"husband","es":"esposo / marido","pron":"/hás-band/"}',
        '{"v":"wife","es":"esposa / mujer","pron":"/uáif/"}',
        
        -- ==========================================
        -- FAMILIA EXTENDIDA
        -- ==========================================
        '{"v":"grandparents","es":"abuelos","pron":"/gran-pé-rents/"}',
        '{"v":"grandfather / grandpa","es":"abuelo / abuelito","pron":"/gran-fá-der / gran-pa/"}',
        '{"v":"grandmother / grandma","es":"abuela / abuelita","pron":"/gran-má-der / gran-ma/"}',
        '{"v":"grandchildren","es":"nietos","pron":"/gran-chíl-dren/"}',
        '{"v":"grandson","es":"nieto","pron":"/gran-san/"}',
        '{"v":"granddaughter","es":"nieta","pron":"/gran-dó-ter/"}',
        '{"v":"uncle","es":"tío","pron":"/án-kel/"}',
        '{"v":"aunt","es":"tía","pron":"/ant/"}',
        '{"v":"cousin","es":"primo / prima","pron":"/ká-sin/"}',
        '{"v":"nephew","es":"sobrino","pron":"/né-fiu/"}',
        '{"v":"niece","es":"sobrina","pron":"/nis/"}',
        
        -- ==========================================
        -- FAMILIA POLÍTICA (IN-LAWS) Y COMPUESTA
        -- ==========================================
        '{"v":"father-in-law","es":"suegro","pron":"/fá-der in lo/"}',
        '{"v":"mother-in-law","es":"suegra","pron":"/má-der in lo/"}',
        '{"v":"brother-in-law","es":"cuñado","pron":"/bró-der in lo/"}',
        '{"v":"sister-in-law","es":"cuñada","pron":"/sís-ter in lo/"}',
        '{"v":"son-in-law","es":"yerno","pron":"/san in lo/"}',
        '{"v":"daughter-in-law","es":"nuera","pron":"/dó-ter in lo/"}',
        '{"v":"stepfather","es":"padrastro","pron":"/stép-fá-der/"}',
        '{"v":"stepmother","es":"madrastra","pron":"/stép-má-der/"}',
        '{"v":"stepbrother","es":"hermanastro","pron":"/stép-bró-der/"}',
        '{"v":"stepsister","es":"hermanastra","pron":"/stép-sís-ter/"}',
        
        -- ==========================================
        -- RELACIONES, CITAS Y ETAPAS
        -- ==========================================
        '{"v":"boyfriend","es":"novio","pron":"/bói-frend/"}',
        '{"v":"girlfriend","es":"novia","pron":"/guérl-frend/"}',
        '{"v":"partner","es":"pareja (sentido romántico)","pron":"/párt-ner/"}',
        '{"v":"fiancé / fiancée","es":"prometido / prometida","pron":"/fi-an-séi/"}',
        '{"v":"ex-husband","es":"exmarido","pron":"/eks-hás-band/"}',
        '{"v":"ex-wife","es":"exmujer","pron":"/eks-uáif/"}',
        '{"v":"to date","es":"salir con alguien (románticamente)","pron":"/tu déit/"}',
        '{"v":"to get engaged","es":"comprometerse","pron":"/tu guet en-guéichd/"}',
        '{"v":"to get married","es":"casarse","pron":"/tu guet má-rid/"}',
        '{"v":"to get divorced","es":"divorciarse","pron":"/tu guet di-vórst/"}',
        '{"v":"to break up","es":"romper / terminar una relación","pron":"/tu bréik ap/"}',
        '{"v":"wedding","es":"boda","pron":"/ué-din/"}',
        '{"v":"marriage","es":"matrimonio","pron":"/má-rich/"}',
        
        -- ==========================================
        -- AMISTAD Y VIDA SOCIAL
        -- ==========================================
        '{"v":"friend","es":"amigo / amiga","pron":"/frend/"}',
        '{"v":"best friend","es":"mejor amigo / amiga","pron":"/best frend/"}',
        '{"v":"acquaintance","es":"conocido / conocida","pron":"/a-kuéin-tans/"}',
        '{"v":"roommate","es":"compañero/a de cuarto o piso","pron":"/rúm-meit/"}',
        '{"v":"coworker","es":"compañero/a de trabajo","pron":"/kóu-uer-ker/"}'
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

    -- Vincular la palabra creada al mazo actual
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id);

END LOOP;
END;
$seed$;
