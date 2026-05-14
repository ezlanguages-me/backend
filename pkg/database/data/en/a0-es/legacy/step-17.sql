-- ============================================================
-- Seed: A0 English Path – Grammar – Descripciones (There is/are)
-- Source language: Spanish
-- ============================================================
DO $$ 
DECLARE 
    v_path_id UUID; 
    v_grammar1_id UUID; 
    v_rule1_id UUID; 
    v_rule2_id UUID; 
    v_rule3_id UUID; 
    v_rule4_id UUID; 
    v_ex_id UUID; 
    v_rule_id UUID;
    ex JSONB;
    exercises JSONB[] := ARRAY[
        -- ==========================================
        -- REGLA 1: There is (Presente Singular/Incontable)
        -- ==========================================
        '{"r":1, "p":"___ ___ water.", "s":{"type":"typing","correct_answers":["There is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ a cat.", "s":{"type":"typing","correct_answers":["There is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ an apple.", "s":{"type":"typing","correct_answers":["There is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ time.", "s":{"type":"typing","correct_answers":["There is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ a car.", "s":{"type":"typing","correct_answers":["There is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ money.", "s":{"type":"typing","correct_answers":["There is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ a problem.", "s":{"type":"typing","correct_answers":["There is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ milk.", "s":{"type":"multiple_choice","options":["There is","There are","There were"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ ___ a boy.", "s":{"type":"multiple_choice","options":["There are","There is","There were"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ ___ rain.", "s":{"type":"multiple_choice","options":["There was","There are","There is"],"answer":2}}'::jsonb,
        '{"r":1, "p":"___ ___ an egg.", "s":{"type":"multiple_choice","options":["There is","There are","There were"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ ___ a book.", "s":{"type":"multiple_choice","options":["There were","There is","There are"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ ___ sugar.", "s":{"type":"multiple_choice","options":["There are","There were","There is"],"answer":2}}'::jsonb,
        '{"r":1, "p":"___ ___ a tree.", "s":{"type":"multiple_choice","options":["There is","There are","There were"],"answer":0}}'::jsonb,
        '{"r":1, "p":"''There is'' significa ''HAY'' para cosas en singular y sustantivos incontables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Usamos ''There is'' con sustantivos en plural.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''There is water'' es una frase correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''There is two cats'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''There is'' describe lo que había en el pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Se usa ''There is'' para referirse a una sola cosa.", "s":{"type":"true_false","answer":true}}'::jsonb,

        -- ==========================================
        -- REGLA 2: There are (Presente Plural)
        -- ==========================================
        '{"r":2, "p":"___ ___ two bedrooms.", "s":{"type":"typing","correct_answers":["There are"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ ___ many cars.", "s":{"type":"typing","correct_answers":["There are"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ ___ five dogs.", "s":{"type":"typing","correct_answers":["There are"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ ___ some books.", "s":{"type":"typing","correct_answers":["There are"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ ___ ten students.", "s":{"type":"typing","correct_answers":["There are"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ ___ three apples.", "s":{"type":"typing","correct_answers":["There are"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ ___ people here.", "s":{"type":"typing","correct_answers":["There are"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ ___ trees.", "s":{"type":"multiple_choice","options":["There are","There is","There was"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ ___ two options.", "s":{"type":"multiple_choice","options":["There is","There are","There was"],"answer":1}}'::jsonb,
        '{"r":2, "p":"___ ___ children.", "s":{"type":"multiple_choice","options":["There was","There is","There are"],"answer":2}}'::jsonb,
        '{"r":2, "p":"___ ___ four chairs.", "s":{"type":"multiple_choice","options":["There are","There is","There was"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ ___ many stars.", "s":{"type":"multiple_choice","options":["There is","There are","There was"],"answer":1}}'::jsonb,
        '{"r":2, "p":"___ ___ keys on the table.", "s":{"type":"multiple_choice","options":["There was","There is","There are"],"answer":2}}'::jsonb,
        '{"r":2, "p":"___ ___ flowers.", "s":{"type":"multiple_choice","options":["There are","There is","There was"],"answer":0}}'::jsonb,
        '{"r":2, "p":"''There are'' se usa con sustantivos en plural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''There are water'' es una frase correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''There are'' significa ''HAY'' en plural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''There are'' describe situaciones ocurridas en el pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''There are two bedrooms'' es correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Se usa ''There are'' para referirse a una sola cosa.", "s":{"type":"true_false","answer":false}}'::jsonb,

        -- ==========================================
        -- REGLA 3: There was (Pasado Singular/Incontable)
        -- ==========================================
        '{"r":3, "p":"___ ___ a garden.", "s":{"type":"typing","correct_answers":["There was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ ___ a party yesterday.", "s":{"type":"typing","correct_answers":["There was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ ___ a mistake.", "s":{"type":"typing","correct_answers":["There was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ ___ rain last night.", "s":{"type":"typing","correct_answers":["There was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ ___ a man here.", "s":{"type":"typing","correct_answers":["There was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ ___ noise.", "s":{"type":"typing","correct_answers":["There was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ ___ a bird.", "s":{"type":"typing","correct_answers":["There was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ ___ a problem.", "s":{"type":"multiple_choice","options":["There was","There were","There are"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ ___ a good movie.", "s":{"type":"multiple_choice","options":["There were","There was","There are"],"answer":1}}'::jsonb,
        '{"r":3, "p":"___ ___ time.", "s":{"type":"multiple_choice","options":["There are","There were","There was"],"answer":2}}'::jsonb,
        '{"r":3, "p":"___ ___ a loud sound.", "s":{"type":"multiple_choice","options":["There was","There were","There are"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ ___ a big tree.", "s":{"type":"multiple_choice","options":["There are","There was","There were"],"answer":1}}'::jsonb,
        '{"r":3, "p":"___ ___ cold water.", "s":{"type":"multiple_choice","options":["There were","There are","There was"],"answer":2}}'::jsonb,
        '{"r":3, "p":"___ ___ an old house.", "s":{"type":"multiple_choice","options":["There was","There were","There are"],"answer":0}}'::jsonb,
        '{"r":3, "p":"''There was'' es el pasado de ''There is''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Significa ''había'' o ''hubo'' para objetos plurales.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''There was a garden'' es una frase correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''There was two cars'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''There was'' se usa para sustantivos singulares en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''There was water'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,

        -- ==========================================
        -- REGLA 4: There were (Pasado Plural)
        -- ==========================================
        '{"r":4, "p":"___ ___ three birds.", "s":{"type":"typing","correct_answers":["There were"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ ___ many people.", "s":{"type":"typing","correct_answers":["There were"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ ___ two dogs.", "s":{"type":"typing","correct_answers":["There were"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ ___ five books.", "s":{"type":"typing","correct_answers":["There were"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ ___ some errors.", "s":{"type":"typing","correct_answers":["There were"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ ___ ten questions.", "s":{"type":"typing","correct_answers":["There were"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ ___ children.", "s":{"type":"typing","correct_answers":["There were"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ ___ two cats.", "s":{"type":"multiple_choice","options":["There were","There was","There is"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ ___ many cars.", "s":{"type":"multiple_choice","options":["There was","There were","There is"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ ___ four friends.", "s":{"type":"multiple_choice","options":["There was","There is","There were"],"answer":2}}'::jsonb,
        '{"r":4, "p":"___ ___ apples.", "s":{"type":"multiple_choice","options":["There were","There was","There is"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ ___ problems.", "s":{"type":"multiple_choice","options":["There is","There were","There was"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ ___ options.", "s":{"type":"multiple_choice","options":["There was","There is","There were"],"answer":2}}'::jsonb,
        '{"r":4, "p":"___ ___ animals.", "s":{"type":"multiple_choice","options":["There were","There was","There is"],"answer":0}}'::jsonb,
        '{"r":4, "p":"''There were'' es el pasado plural de ''There are''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Se usa ''There were'' para sustantivos incontables como el agua.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''There were three birds'' es una frase correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''There were'' significa ''HAY'' en plural.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Se utiliza para hablar de varias cosas o personas que existían en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''There were a car'' es una frase correcta.", "s":{"type":"true_false","answer":false}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 8, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Descripciones (There is / There are)', 
    'Aprende a describir la existencia de objetos o personas en presente (lo que hay) y en pasado (lo que había).', 
    to_jsonb('## Grammar Lesson: Descripciones (There is / There are)
Para describir lo que **hay** o lo que **había** en un lugar, el inglés utiliza expresiones específicas. A diferencia del español (que usa "hay" o "había" para todo), el inglés diferencia estrictamente entre el singular y el plural.

##### 1. Presente: There is (Singular e Incontables)
Se utiliza para decir lo que **HAY** cuando nos referimos a **una sola cosa** o a cosas **incontables** (como el agua, el tiempo, el dinero).
*   *There is water.* (Hay agua).
*   *There is a dog in the park.* (Hay un perro en el parque).

##### 2. Presente: There are (Plurales)
Se utiliza para decir lo que **HAY** cuando nos referimos a **varias cosas** (plural).
*   *There are two bedrooms.* (Hay dos habitaciones).
*   *There are many cars in the street.* (Hay muchos coches en la calle).

##### 3. Pasado: There was (Singular e Incontables)
Se utiliza para decir lo que **HABÍA** o **HUBO**. Es la forma en pasado de "There is" y se usa con sustantivos **singulares o incontables**.
*   *There was a garden.* (Había un jardín).
*   *There was a lot of noise.* (Hubo mucho ruido).

##### 4. Pasado: There were (Plurales)
Se utiliza para decir lo que **HABÍAN** o **HUBO** cuando nos referimos a múltiples objetos o personas en el pasado. Es el pasado de "There are".
*   *There were three birds.* (Había tres pájaros).
*   *There were many people at the party.* (Había mucha gente en la fiesta).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Presente Singular (There is)', 'Usa "There is" (Hay) para un solo objeto o para sustantivos incontables (líquidos, conceptos, etc.).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Presente Plural (There are)', 'Usa "There are" (Hay) cuando hables de dos o más cosas.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Pasado Singular (There was)', 'Usa "There was" (Había/Hubo) para hablar de un solo objeto o sustantivos incontables en el pasado.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Pasado Plural (There were)', 'Usa "There were" (Habían/Hubo) para hablar de varias cosas o personas en el pasado.');

-- 4. Bucle optimizado para insertar los 80 ejercicios
FOREACH ex IN ARRAY exercises
LOOP
    -- Determinar el ID de la regla correcta
    IF (ex->>'r')::int = 1 THEN v_rule_id := v_rule1_id;
    ELSIF (ex->>'r')::int = 2 THEN v_rule_id := v_rule2_id;
    ELSIF (ex->>'r')::int = 3 THEN v_rule_id := v_rule3_id;
    ELSE v_rule_id := v_rule4_id;
    END IF;

    -- Insertar el ejercicio base
    INSERT INTO exercise (grammar_id, grammar_rule_id) 
    VALUES (v_grammar1_id, v_rule_id) 
    RETURNING uuid INTO v_ex_id;

    -- Insertar la traducción del ejercicio
    INSERT INTO exercise_translation (exercise_id, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

END LOOP;

END $$;