-- ============================================================
-- Seed: A0 English Path – STEP 190 – Dialogue – understand straightforward explanations of, for example, the members of the host family and the layout of the house (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_dialogue_id UUID; 
    v_line_id UUID;
    v_ex_id UUID;
    v_order SMALLINT := 1;
    ex JSONB;
    
    -- Array con las líneas del diálogo, traducciones y pronunciación figurada (US English)
    v_lines JSONB[] := ARRAY[
        '{"c": "Sarah", "t": "Hi Alex, welcome! Come on in. I''m Sarah, your host mom.", "es": "Hola Alex, ¡bienvenido! Pasa. Soy Sarah, tu madre anfitriona.", "pron": "/hái á-leks, uél-kom! kam on in. áim sé-ra, ior houst mam./"}'::jsonb,
        '{"c": "Alex", "t": "Thank you so much, Sarah. I''m very excited to be here in the United States.", "es": "Muchas gracias, Sarah. Estoy muy emocionado de estar aquí en Estados Unidos.", "pron": "/zank iu sóu mach, sé-ra. áim vé-ri ek-sái-tid tu bi hir in de iu-nái-tid stéits./"}'::jsonb,
        '{"c": "Sarah", "t": "Let me introduce you to the family. This is my husband, Mark. And these are our kids, Leo and Mia.", "es": "Déjame presentarte a la familia. Este es mi esposo, Mark. Y estos son nuestros hijos, Leo y Mia.", "pron": "/let mi in-tro-diús iu tu de fá-mi-li. dis is mai hás-band, mark. and dis ar áur kids, lí-ou and mí-a./"}'::jsonb,
        '{"c": "Alex", "t": "Nice to meet you all. Oh, and who is this friendly dog?", "es": "Encantado de conocerlos a todos. Oh, ¿y quién es este perro tan amigable?", "pron": "/náis tu mit iu ol. ou, and hu is dis frénd-li dog?/"}'::jsonb,
        '{"c": "Sarah", "t": "That''s Buster! He''s our golden retriever. Don''t worry, he is very sweet.", "es": "¡Ese es Buster! Es nuestro golden retriever. No te preocupes, es muy dulce.", "pron": "/dats bás-ter! his áur gól-den ri-trí-ver. dont uó-ri, hi is vé-ri suit./"}'::jsonb,
        '{"c": "Alex", "t": "I love dogs. Your home is beautiful. Is my room on the first floor?", "es": "Me encantan los perros. Su casa es hermosa. ¿Mi habitación está en el primer piso?", "pron": "/ái lov dogs. ior hóum is biú-ti-ful. is mai rum on de ferst flor?/"}'::jsonb,
        '{"c": "Sarah", "t": "No, your bedroom is on the second floor. Down here we have the living room, the kitchen, the dining room, and a half bathroom.", "es": "No, tu dormitorio está en el segundo piso. Aquí abajo tenemos la sala de estar, la cocina, el comedor y un medio baño.", "pron": "/nóu, ior béd-rum is on de sé-kond flor. dáun hir ui hav de lí-vin rum, de kí-chen, de dái-nin rum, and a haf báz-rum./"}'::jsonb,
        '{"c": "Alex", "t": "Great. And where can I wash my clothes?", "es": "Genial. ¿Y dónde puedo lavar mi ropa?", "pron": "/gréit. and uér kan ai uosh mai klóus?/"}'::jsonb,
        '{"c": "Sarah", "t": "The laundry room is right next to the kitchen. We have a washer and a dryer you can use.", "es": "El cuarto de lavado está justo al lado de la cocina. Tenemos una lavadora y una secadora que puedes usar.", "pron": "/de lón-dri rum is ráit nekst tu de kí-chen. ui hav a uó-sher and a drái-er iu kan ius./"}'::jsonb,
        '{"c": "Alex", "t": "Perfect. Can I see my bedroom now?", "es": "Perfecto. ¿Puedo ver mi dormitorio ahora?", "pron": "/pér-fekt. kan ai si mai béd-rum náu?/"}'::jsonb,
        '{"c": "Sarah", "t": "Of course! Let''s go upstairs. You have a big closet and a nice view of the backyard.", "es": "¡Por supuesto! Vamos arriba. Tienes un armario grande y una bonita vista del patio trasero.", "pron": "/of kors! lets góu ap-stérs. iu hav a big kló-set and a náis viú of de bák-iard./"}'::jsonb,
        '{"c": "Alex", "t": "And the bathroom?", "es": "¿Y el baño?", "pron": "/and de báz-rum?/"}'::jsonb,
        '{"c": "Sarah", "t": "You will share the full bathroom in the hallway with the kids. Make yourself at home!", "es": "Compartirás el baño completo del pasillo con los chicos. ¡Siéntete como en casa!", "pron": "/iu uil sher de ful báz-rum in de hól-uei uid de kids. méik iur-sélf at hóum!/"}'::jsonb
    ];

BEGIN

-- 1. Obtener el path_uuid del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Dialogue principal (Step 190)
INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters) 
VALUES (
    v_path_id, 
    190, 
    'en', 
    'dialogue', 
    'social', 
    '[
      {"name":"Sarah","gender":"female","avatarURL":"https://example.com/avatars/sarah.png"},
      {"name":"Alex",  "gender":"male",  "avatarURL":"https://example.com/avatars/alex.png"}
    ]'::jsonb
) 
RETURNING uuid INTO v_dialogue_id;

-- 3. Insertar Traducción y Metadata del Dialogue
INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) 
VALUES (
    v_dialogue_id, 
    'es', 
    'Tour por la casa de tu familia anfitriona', 
    ''
);

-- 4. Bucle para insertar las líneas del diálogo, traducción y PRONUNCIACIÓN dentro del JSONB
FOREACH ex IN ARRAY v_lines
LOOP
    -- Insertar la línea de diálogo
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_order, ex->>'c', ex->>'t')
    RETURNING uuid INTO v_line_id;

    -- Insertar la traducción y la pronunciación empaquetadas en la columna meaning JSONB
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (
        v_line_id, 
        'es', 
        jsonb_build_object(
            'translation', ex->>'es',
            'pronunciation', ex->>'pron'
        )
    );

    -- Incrementar el orden
    v_order := v_order + 1;
END LOOP;

END;
$seed$;
