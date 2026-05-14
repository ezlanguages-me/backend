-- ============================================================
-- Seed: A0 English Path – STEP 230 – Dialogue – take part in a conversation of a basic factual nature on a predictable topic, i.e. her/his home country, family, school, etc (Convivencia (Host Families y Vida Social))
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
    line JSONB;
    ex JSONB; 
    
    -- Array con las líneas del diálogo, incluyendo la traducción y la pronunciación figurada
    v_lines JSONB[] := ARRAY[
        '{"c": "Emma", "t": "Hi! Are you the new exchange student? I''m Emma.", "tr": "¡Hola! ¿Eres el nuevo estudiante de intercambio? Soy Emma.", "pron": "/hái! ár iu de niú eks-chéindj stú-dent? áim é-ma./"}'::jsonb,
        '{"c": "Alex", "t": "Hi Emma, yes! I''m Alex. I am from Spain.", "tr": "¡Hola Emma, sí! Soy Alex. Soy de España.", "pron": "/hái é-ma, ies! áim á-leks. ái am from spéin./"}'::jsonb,
        '{"c": "Emma", "t": "Nice to meet you, Alex. Where in Spain do you live?", "tr": "Encantada de conocerte, Alex. ¿En qué parte de España vives?", "pron": "/náis tu mit iu, á-leks. uér in spéin du iu liv?/"}'::jsonb,
        '{"c": "Alex", "t": "I live in Madrid. It is the capital city.", "tr": "Vivo en Madrid. Es la ciudad capital.", "pron": "/ái liv in ma-dríd. it is de ká-pi-tal sí-ti./"}'::jsonb,
        '{"c": "Emma", "t": "Oh, Madrid! Is the weather very hot there?", "tr": "¡Oh, Madrid! ¿Hace mucho calor allí?", "pron": "/ou, ma-dríd! is de ué-der vé-ri hot dér?/"}'::jsonb,
        '{"c": "Alex", "t": "Yes, the weather is usually sunny and warm. But it gets cold in the winter.", "tr": "Sí, el clima suele ser soleado y cálido. Pero hace frío en invierno.", "pron": "/ies, de ué-der is iú-shua-li sá-ni and uórm. bat it gets kould in de uín-ter./"}'::jsonb,
        '{"c": "Emma", "t": "Do you have a big family back home?", "tr": "¿Tienes una familia grande allá en casa?", "pron": "/du iu hav a big fá-mi-li bak houm?/"}'::jsonb,
        '{"c": "Alex", "t": "Not really. There are four of us: my parents, my younger sister, and me.", "tr": "La verdad es que no. Somos cuatro: mis padres, mi hermana menor y yo.", "pron": "/not rí-li. dér ar for of as: mái pé-rents, mái ián-guer sís-ter, and mi./"}'::jsonb,
        '{"c": "Emma", "t": "What do your parents do?", "tr": "¿A qué se dedican tus padres?", "pron": "/uót du iur pé-rents du?/"}'::jsonb,
        '{"c": "Alex", "t": "My mom is a nurse at a large hospital, and my dad is an engineer.", "tr": "Mi madre es enfermera en un hospital grande y mi padre es ingeniero.", "pron": "/mái mom is a ners at a lardj hós-pi-tal, and mái dad is an en-dji-nír./"}'::jsonb,
        '{"c": "Emma", "t": "That''s interesting. My dad is a mechanic and my mom is a teacher. How old is your sister?", "tr": "Eso es interesante. Mi padre es mecánico y mi madre es profesora. ¿Cuántos años tiene tu hermana?", "pron": "/dats ín-tres-tin. mái dad is a me-ká-nik and mái mom is a tí-cher. háu ould is iur sís-ter?/"}'::jsonb,
        '{"c": "Alex", "t": "She is 12 years old. She loves sports.", "tr": "Tiene 12 años. Le encantan los deportes.", "pron": "/shi is tuelv íers ould. shi lavs sports./"}'::jsonb,
        '{"c": "Emma", "t": "Really? What is her favorite sport?", "tr": "¿De verdad? ¿Cuál es su deporte favorito?", "pron": "/rí-li? uót is her féi-vo-rit sport?/"}'::jsonb,
        '{"c": "Alex", "t": "She plays soccer every weekend. She is very good at it.", "tr": "Juega al fútbol todos los fines de semana. Es muy buena en ello.", "pron": "/shi pléis sá-ker é-ve-ri uí-kend. shi is vé-ri gud at it./"}'::jsonb,
        '{"c": "Emma", "t": "And what about you? Do you play sports?", "tr": "¿Y tú qué? ¿Practicas deportes?", "pron": "/and uót a-báut iu? du iu plei sports?/"}'::jsonb,
        '{"c": "Alex", "t": "No, I don''t play sports. My hobby is music. I play the acoustic guitar.", "tr": "No, no practico deportes. Mi afición es la música. Toco la guitarra acústica.", "pron": "/nou, ái dont plei sports. mái hó-bi is miú-sik. ái plei de a-kús-tik gui-tár./"}'::jsonb,
        '{"c": "Emma", "t": "That''s cool! Do you play in a band?", "tr": "¡Qué guay! ¿Tocas en una banda?", "pron": "/dats kul! du iu plei in a band?/"}'::jsonb,
        '{"c": "Alex", "t": "Yes, I play in the school band back in Madrid.", "tr": "Sí, toco en la banda de la escuela allá en Madrid.", "pron": "/ies, ái plei in de skul band bak in ma-dríd./"}'::jsonb,
        '{"c": "Emma", "t": "What is your high school in Spain like? Is it different?", "tr": "¿Cómo es tu escuela secundaria en España? ¿Es diferente?", "pron": "/uót is iur hái skul in spéin láik? is it dí-fe-rent?/"}'::jsonb,
        '{"c": "Alex", "t": "Yes, it is huge. There are over a thousand students. And we don''t wear uniforms.", "tr": "Sí, es enorme. Hay más de mil estudiantes. Y no usamos uniformes.", "pron": "/ies, it is hiúdj. dér ar óu-ver a záu-sand stú-dents. and ui dont uér iú-ni-forms./"}'::jsonb,
        '{"c": "Emma", "t": "No uniforms? Lucky you! What are your favorite subjects?", "tr": "¿Sin uniformes? ¡Qué suerte! ¿Cuáles son tus asignaturas favoritas?", "pron": "/nou iú-ni-forms? lá-ki iu! uót ar iur féi-vo-rit sáb-djekts?/"}'::jsonb,
        '{"c": "Alex", "t": "I really like History and English. Math is a bit difficult for me.", "tr": "Me gustan mucho la Historia y el Inglés. Las Matemáticas son un poco difíciles para mí.", "pron": "/ái rí-li láik hís-to-ri and ín-glish. maz is a bit dí-fi-kalt for mi./"}'::jsonb,
        '{"c": "Emma", "t": "I can help you with Math if you want. I love numbers.", "tr": "Puedo ayudarte con Matemáticas si quieres. Me encantan los números.", "pron": "/ái kan help iu uid maz if iu uónt. ái lav nám-bers./"}'::jsonb,
        '{"c": "Alex", "t": "That would be great, thank you!", "tr": "¡Eso sería genial, gracias!", "pron": "/dat uúd bi gréit, zank iu!/"}'::jsonb,
        '{"c": "Emma", "t": "No problem. Well, welcome to the school, Alex!", "tr": "No hay problema. Bueno, ¡bienvenido a la escuela, Alex!", "pron": "/nou pró-blem. uel, uél-kom tu de skul, bób!/"}'::jsonb,
        '{"c": "Alex", "t": "Thanks, Emma. I am very happy to be here.", "tr": "Gracias, Emma. Estoy muy feliz de estar aquí.", "pron": "/zanks, é-li-s. ái am vé-ri há-pi tu bi hír./"}'::jsonb
    ];

BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Eliminar versión anterior del Step 230 si existiese
DELETE FROM dialogue WHERE step_order = 230 AND path_uuid = v_path_id;

-- 3. Insertar el Dialogue principal (Step 230)
INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters) 
VALUES (
    v_path_id, 
    230, 
    'en', 
    'dialogue', 
    'social', 
    '[ 
        {"name":"Emma","gender":"female","avatarURL":"https://example.com/avatars/Emma.png"}, 
        {"name":"Alex", "gender":"male", "avatarURL":"https://example.com/avatars/Alex.png"} 
    ]'::jsonb
) RETURNING uuid INTO v_dialogue_id;

-- 4. Insertar Traducción y Metadata del Dialogue
INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) 
VALUES (
    v_dialogue_id, 
    'es', 
    'Conociendo a una nueva compañera', 
    ''
);

-- 5. Bucle para insertar las líneas del diálogo, su traducción y su pronunciación
FOREACH line IN ARRAY v_lines 
LOOP 
    -- Insertar la línea de diálogo
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) 
    VALUES (v_dialogue_id, v_order, line->>'c', line->>'t') 
    RETURNING uuid INTO v_line_id;
    
    -- Insertar la traducción estructurando el JSONB (Traducción + Pronunciación)
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (
        v_line_id, 
        'es', 
        jsonb_build_object('translation', line->>'tr', 'pronunciation', line->>'pron')
    );
    
    v_order := v_order + 1;
END LOOP;

END;
$seed$;
