-- ============================================================
-- Seed: A0 English Path – STEP 170 – Reading – understand straightforward explanations of, for example, the members of the host family and the layout of the house (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_reading_id UUID; 
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- ==========================================
        -- TRUE / FALSE (12 Ejercicios)
        -- ==========================================
        '{"p":"La familia anfitriona vive en Nueva York.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Sarah es la madre anfitriona (host mom).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Mark es el hermano de Sarah.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Leo es menor que Mia.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La familia tiene un gato llamado Buster.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La casa tiene tres pisos en total.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El cuarto de lavado (laundry room) está en el primer piso.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Alex tendrá su propio baño privado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Normalmente cenan a las 6:30 PM.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"En esta casa, es costumbre usar los zapatos en el interior.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La familia Miller tiene dos mascotas en total.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El baño de la primera planta no tiene ducha (half bathroom).", "s":{"type":"true_false","answer":true}}'::jsonb,

        -- ==========================================
        -- MULTIPLE CHOICE (12 Ejercicios)
        -- ==========================================
        '{"p":"¿En qué ciudad vive la familia anfitriona?", "s":{"type":"multiple_choice","options":["Seattle","Chicago","Los Angeles"],"answer":0}}'::jsonb,
        '{"p":"¿Qué edad tiene Mia?", "s":{"type":"multiple_choice","options":["10","14","16"],"answer":1}}'::jsonb,
        '{"p":"¿Qué tipo de mascota tiene la familia?", "s":{"type":"multiple_choice","options":["Un perro","Un gato","Un pájaro"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo se llama la mascota?", "s":{"type":"multiple_choice","options":["Leo","Mark","Buster"],"answer":2}}'::jsonb,
        '{"p":"¿Cuál de estas habitaciones NO está en el primer piso (first floor)?", "s":{"type":"multiple_choice","options":["La cocina","El dormitorio de Alex","El comedor"],"answer":1}}'::jsonb,
        '{"p":"¿Qué tipo de baño hay en el primer piso?", "s":{"type":"multiple_choice","options":["Un medio baño (half bathroom)","Un baño completo (full bathroom)","No hay baño"],"answer":0}}'::jsonb,
        '{"p":"¿Con quién compartirá el baño completo Alex?", "s":{"type":"multiple_choice","options":["Con Sarah y Mark","Con Leo y Mia","Con nadie"],"answer":1}}'::jsonb,
        '{"p":"¿Cuál es una de las reglas importantes de la casa?", "s":{"type":"multiple_choice","options":["Quitarse los zapatos al entrar","No hacer ruido después de las 10 PM","Lavar los platos de inmediato"],"answer":0}}'::jsonb,
        '{"p":"¿Por qué piden que te quites los zapatos al entrar?", "s":{"type":"multiple_choice","options":["Por tradición familiar","Para mantener los pisos limpios","Porque hacen mucho ruido"],"answer":1}}'::jsonb,
        '{"p":"¿Dónde está ubicado exactamente el dormitorio de Alex?", "s":{"type":"multiple_choice","options":["Junto al cuarto de lavado","En el primer piso","Junto a la habitación de Leo en el segundo piso"],"answer":2}}'::jsonb,
        '{"p":"¿Quién firma la carta?", "s":{"type":"multiple_choice","options":["Solo Sarah","La familia Miller","El hijo Leo"],"answer":1}}'::jsonb,
        '{"p":"Según la carta, ¿para qué sirve la ''laundry room''?", "s":{"type":"multiple_choice","options":["Para lavar la ropa","Para guardar herramientas","Para que duerma el perro"],"answer":0}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Reading en el Step 170
INSERT INTO reading (path_uuid, step_order, source_language, type, category) 
VALUES (v_path_id, 170, 'en', 'reading', 'social') 
RETURNING uuid INTO v_reading_id;

-- 3. Insertar Traducción y Contenido del Reading (Solo el texto base)
INSERT INTO reading_translation (reading_uuid, language, title, description, content) 
VALUES (
    v_reading_id, 
    'es', 
    'Nueva familia anfitriona',
    '', 
    'Dear Alex,\n\nWe are so excited to welcome you to our home in Seattle! Before you arrive, we want to tell you a little bit about our family and our house.\n\nI am Sarah, your host mom, and my husband is Mark. We have two kids: our son Leo is 10, and our daughter Mia is 14. We also have a very friendly dog named Buster.\n\nOur house has two floors. On the first floor, we have a large living room, a kitchen, a dining room, and a half bathroom. There is also a laundry room where you can wash your clothes.\n\nYour bedroom is on the second floor, right next to Leo''s room. You will share the full bathroom on the second floor with Leo and Mia.\n\nWe have a few simple house rules. We usually eat dinner together at 6:30 PM, so please try to be home by then. Also, we ask everyone to take off their shoes when they enter the house to keep the floors clean.\n\nWe can''t wait to meet you!\n\nBest,\nThe Miller Family'
);

-- 4. Bucle para insertar los 32 ejercicios vinculados al target_uuid (el Reading)
FOREACH ex IN ARRAY v_exercises
LOOP
    -- Insertar el ejercicio base vinculándolo directamente al Reading y dejando grammar_rule en NULL
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) 
    VALUES (v_reading_id, NULL) 
    RETURNING uuid INTO v_ex_id;

    -- Insertar la traducción del ejercicio
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

END LOOP;
END;
$seed$;
