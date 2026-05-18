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
        '{"c": "Emma", "t": "Hi! Are you the new exchange student? I''m Emma.", "tr": "¡Hola! ¿Eres el nuevo estudiante de intercambio? Soy Emma.", "pron": "/hái! ár iu de niú eks-chéindj stú-dent? áim é-ma./", "de": "Hallo! Bist du der neue Austauschstudent? Ich bin Emma.", "pron_de": "HAI! ö juu dö NJUU iks-TSCHEJNDSCH STJUU-dönt? AIM E-mö."}'::jsonb,
        '{"c": "Alex", "t": "Hi Emma, yes! I''m Alex. I am from Spain.", "tr": "¡Hola Emma, sí! Soy Alex. Soy de España.", "pron": "/hái é-ma, ies! áim á-leks. ái am from spéin./", "de": "Hallo Emma, ja! Ich bin Alex. Ich komme aus Spanien.", "pron_de": "HAI E-mö, JES! AIM Ä-leks. ai äm from SPEJN."}'::jsonb,
        '{"c": "Emma", "t": "Nice to meet you, Alex. Where in Spain do you live?", "tr": "Encantada de conocerte, Alex. ¿En qué parte de España vives?", "pron": "/náis tu mit iu, á-leks. uér in spéin du iu liv?/", "de": "Schön, dich kennenzulernen, Alex. Wo in Spanien wohnst du?", "pron_de": "NAIS tu MIIT juu, Ä-leks. UÄ in SPEJN du juu LIV?"}'::jsonb,
        '{"c": "Alex", "t": "I live in Madrid. It is the capital city.", "tr": "Vivo en Madrid. Es la ciudad capital.", "pron": "/ái liv in ma-dríd. it is de ká-pi-tal sí-ti./", "de": "Ich wohne in Madrid. Es ist die Hauptstadt.", "pron_de": "ai LIV in mö-DRID. it is dö KÄ-pi-töl SI-ti."}'::jsonb,
        '{"c": "Emma", "t": "Oh, Madrid! Is the weather very hot there?", "tr": "¡Oh, Madrid! ¿Hace mucho calor allí?", "pron": "/ou, ma-dríd! is de ué-der vé-ri hot dér?/", "de": "Oh, Madrid! Ist das Wetter dort sehr heiß?", "pron_de": "OU, mö-DRID! is dö UE-dö VE-ri HOT DÄ?"}'::jsonb,
        '{"c": "Alex", "t": "Yes, the weather is usually sunny and warm. But it gets cold in the winter.", "tr": "Sí, el clima suele ser soleado y cálido. Pero hace frío en invierno.", "pron": "/ies, de ué-der is iú-shua-li sá-ni and uórm. bat it gets kould in de uín-ter./", "de": "Ja, das Wetter ist meistens sonnig und warm. Aber es wird im Winter kalt.", "pron_de": "JES, dö UE-dö is JUU-schö-li SA-ni änd UOOM. bat it gets KOULD in dö UIN-tö."}'::jsonb,
        '{"c": "Emma", "t": "Do you have a big family back home?", "tr": "¿Tienes una familia grande allá en casa?", "pron": "/du iu hav a big fá-mi-li bak houm?/", "de": "Hast du zu Hause eine große Familie?", "pron_de": "du juu häv ö BIG FÄ-mi-li bäk HOUM?"}'::jsonb,
        '{"c": "Alex", "t": "Not really. There are four of us: my parents, my younger sister, and me.", "tr": "La verdad es que no. Somos cuatro: mis padres, mi hermana menor y yo.", "pron": "/not rí-li. dér ar for of as: mái pé-rents, mái ián-guer sís-ter, and mi./", "de": "Nicht wirklich. Wir sind zu viert: meine Eltern, meine jüngere Schwester und ich.", "pron_de": "NOT RII-li. dä aa FOO öv as: mai PÄ-rönts, mai JANG-ö SI-stö, änd MII."}'::jsonb,
        '{"c": "Emma", "t": "What do your parents do?", "tr": "¿A qué se dedican tus padres?", "pron": "/uót du iur pé-rents du?/", "de": "Was machen deine Eltern beruflich?", "pron_de": "UOT du joo PÄ-rönts DUU?"}'::jsonb,
        '{"c": "Alex", "t": "My mom is a nurse at a large hospital, and my dad is an engineer.", "tr": "Mi madre es enfermera en un hospital grande y mi padre es ingeniero.", "pron": "/mái mom is a ners at a lardj hós-pi-tal, and mái dad is an en-dji-nír./", "de": "Meine Mutter ist Krankenschwester in einem großen Krankenhaus und mein Vater ist Ingenieur.", "pron_de": "mai MOM is ö NÖÖS ät ö LAADSCH HOS-pi-töl, änd mai DÄD is ön en-dschö-NIÖ."}'::jsonb,
        '{"c": "Emma", "t": "That''s interesting. My dad is a mechanic and my mom is a teacher. How old is your sister?", "tr": "Eso es interesante. Mi padre es mecánico y mi madre es profesora. ¿Cuántos años tiene tu hermana?", "pron": "/dats ín-tres-tin. mái dad is a me-ká-nik and mái mom is a tí-cher. háu ould is iur sís-ter?/", "de": "Das ist interessant. Mein Vater ist Mechaniker und meine Mutter ist Lehrerin. Wie alt ist deine Schwester?", "pron_de": "DÄTS IN-trös-ting. mai DÄD is ö mö-KÄ-nik änd mai MOM is ö TII-tschö. HAU OULD is joo SI-stö?"}'::jsonb,
        '{"c": "Alex", "t": "She is 12 years old. She loves sports.", "tr": "Tiene 12 años. Le encantan los deportes.", "pron": "/shi is tuelv íers ould. shi lavs sports./", "de": "Sie ist 12 Jahre alt. Sie liebt Sport.", "pron_de": "SCHII is TUELV jiöz OULD. schii LAVZ SPORTS."}'::jsonb,
        '{"c": "Emma", "t": "Really? What is her favorite sport?", "tr": "¿De verdad? ¿Cuál es su deporte favorito?", "pron": "/rí-li? uót is her féi-vo-rit sport?/", "de": "Wirklich? Was ist ihr Lieblingssport?", "pron_de": "RII-li? UOT is hö FEJ-vö-rit SPORT?"}'::jsonb,
        '{"c": "Alex", "t": "She plays soccer every weekend. She is very good at it.", "tr": "Juega al fútbol todos los fines de semana. Es muy buena en ello.", "pron": "/shi pléis sá-ker é-ve-ri uí-kend. shi is vé-ri gud at it./", "de": "Sie spielt jedes Wochenende Fußball. Sie ist sehr gut darin.", "pron_de": "schii PLEJZ SO-kö EV-ri UII-kend. schii is VE-ri GUD ät it."}'::jsonb,
        '{"c": "Emma", "t": "And what about you? Do you play sports?", "tr": "¿Y tú qué? ¿Practicas deportes?", "pron": "/and uót a-báut iu? du iu plei sports?/", "de": "Und was ist mit dir? Treibst du Sport?", "pron_de": "änd UOT ö-BAUT juu? du juu PLEJ SPORTS?"}'::jsonb,
        '{"c": "Alex", "t": "No, I don''t play sports. My hobby is music. I play the acoustic guitar.", "tr": "No, no practico deportes. Mi afición es la música. Toco la guitarra acústica.", "pron": "/nou, ái dont plei sports. mái hó-bi is miú-sik. ái plei de a-kús-tik gui-tár./", "de": "Nein, ich treibe keinen Sport. Mein Hobby ist Musik. Ich spiele die Akustikgitarre.", "pron_de": "NOU, ai DOUNT plej sports. mai HO-bi is MJUU-sik. ai PLEJ dö ö-KUUS-tik gi-TAA."}'::jsonb,
        '{"c": "Emma", "t": "That''s cool! Do you play in a band?", "tr": "¡Qué guay! ¿Tocas en una banda?", "pron": "/dats kul! du iu plei in a band?/", "de": "Das ist cool! Spielst du in einer Band?", "pron_de": "DÄTS KUUL! du juu PLEJ in ö BÄND?"}'::jsonb,
        '{"c": "Alex", "t": "Yes, I play in the school band back in Madrid.", "tr": "Sí, toco en la banda de la escuela allá en Madrid.", "pron": "/ies, ái plei in de skul band bak in ma-dríd./", "de": "Ja, ich spiele in der Schulband dort in Madrid.", "pron_de": "JES, ai PLEJ in dö SKUUL BÄND bäk in mö-DRID."}'::jsonb,
        '{"c": "Emma", "t": "What is your high school in Spain like? Is it different?", "tr": "¿Cómo es tu escuela secundaria en España? ¿Es diferente?", "pron": "/uót is iur hái skul in spéin láik? is it dí-fe-rent?/", "de": "Wie ist deine Oberschule in Spanien? Ist sie anders?", "pron_de": "UOT is joo HAI SKUUL in SPEJN laik? is it DI-fö-rönt?"}'::jsonb,
        '{"c": "Alex", "t": "Yes, it is huge. There are over a thousand students. And we don''t wear uniforms.", "tr": "Sí, es enorme. Hay más de mil estudiantes. Y no usamos uniformes.", "pron": "/ies, it is hiúdj. dér ar óu-ver a záu-sand stú-dents. and ui dont uér iú-ni-forms./", "de": "Ja, sie ist riesig. Es gibt über tausend Schüler. Und wir tragen keine Uniformen.", "pron_de": "JES, it is HJUUDSCH. dä aa OU-vö ö SSAU-sönd STJUU-dönts. änd uii DOUNT UÄ JUU-ni-foomz."}'::jsonb,
        '{"c": "Emma", "t": "No uniforms? Lucky you! What are your favorite subjects?", "tr": "¿Sin uniformes? ¡Qué suerte! ¿Cuáles son tus asignaturas favoritas?", "pron": "/nou iú-ni-forms? lá-ki iu! uót ar iur féi-vo-rit sáb-djekts?/", "de": "Keine Uniformen? Du hast Glück! Was sind deine Lieblingsfächer?", "pron_de": "NOU JUU-ni-foomz? LA-ki juu! UOT aa joo FEJ-vö-rit SAB-dschikts?"}'::jsonb,
        '{"c": "Alex", "t": "I really like History and English. Math is a bit difficult for me.", "tr": "Me gustan mucho la Historia y el Inglés. Las Matemáticas son un poco difíciles para mí.", "pron": "/ái rí-li láik hís-to-ri and ín-glish. maz is a bit dí-fi-kalt for mi./", "de": "Ich mag wirklich Geschichte und Englisch. Mathe ist ein bisschen schwierig für mich.", "pron_de": "ai RII-li laik HIS-tö-ri änd ING-lisch. MÄS is ö bit DI-fi-költ fo MII."}'::jsonb,
        '{"c": "Emma", "t": "I can help you with Math if you want. I love numbers.", "tr": "Puedo ayudarte con Matemáticas si quieres. Me encantan los números.", "pron": "/ái kan help iu uid maz if iu uónt. ái lav nám-bers./", "de": "Ich kann dir bei Mathe helfen, wenn du möchtest. Ich liebe Zahlen.", "pron_de": "ai kän HELP juu uid MÄS if juu UONT. ai LAV NAM-böz."}'::jsonb,
        '{"c": "Alex", "t": "That would be great, thank you!", "tr": "¡Eso sería genial, gracias!", "pron": "/dat uúd bi gréit, zank iu!/", "de": "Das wäre toll, danke!", "pron_de": "dät uud bi GREJT, SSÄNK juu!"}'::jsonb,
        '{"c": "Emma", "t": "No problem. Well, welcome to the school, Alex!", "tr": "No hay problema. Bueno, ¡bienvenido a la escuela, Alex!", "pron": "/nou pró-blem. uel, uél-kom tu de skul, bób!/", "de": "Kein Problem. Also, willkommen an der Schule, Alex!", "pron_de": "NOU PRO-blem. UEL, UEL-köm tu dö SKUUL, Ä-leks!"}'::jsonb,
        '{"c": "Alex", "t": "Thanks, Emma. I am very happy to be here.", "tr": "Gracias, Emma. Estoy muy feliz de estar aquí.", "pron": "/zanks, é-li-s. ái am vé-ri há-pi tu bi hír./", "de": "Danke, Emma. Ich bin sehr froh, hier zu sein.", "pron_de": "SSÄNKS, E-mö. ai äm VE-ri HÄ-pi tu bi HIÖ."}'::jsonb
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

INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
VALUES (v_dialogue_id, 'de', 'Eine neue Mitschülerin kennenlernen', '');

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

    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (
        v_line_id,
        'de',
        jsonb_build_object('translation', line->>'de', 'pronunciation', line->>'pron_de')
    );
    
    v_order := v_order + 1;
END LOOP;

END;
$seed$;
