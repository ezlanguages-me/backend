-- ============================================================
-- Seed: A0 English Path – STEP 260 – Reading – understand simple information, for example, from a prospective pen friend (Comunicación Telefónica y Correspondencia Personal)
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
        -- TRUE / FALSE (10 exercises)
        '{"p":"Jamie vive en Londres.", "p_de":"Jamie lebt in London.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Jamie tiene 14 años.", "p_de":"Jamie ist 14 Jahre alt.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Jamie tiene dos hermanos.", "p_de":"Jamie hat zwei Geschwister.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La madre de Jamie es profesora.", "p_de":"Jamies Mutter ist Lehrerin.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La asignatura favorita de Jamie son las Matemáticas.", "p_de":"Jamies Lieblingsfach ist Mathematik.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Jamie tiene un gato llamado Whiskers.", "p_de":"Jamie hat eine Katze namens Whiskers.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Whiskers tiene 3 años.", "p_de":"Whiskers ist 3 Jahre alt.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Jamie juega al fútbol con sus amigos los fines de semana.", "p_de":"Jamie spielt am Wochenende Fußball mit seinen Freunden.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El padre de Jamie trabaja en una escuela.", "p_de":"Jamies Vater arbeitet in einer Schule.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El colegio de Jamie se llama Hill Street School.", "p_de":"Jamies Schule heißt Hill Street School.", "s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (10 exercises)
        '{"p":"¿Dónde vive Jamie?", "p_de":"Wo lebt Jamie?", "s":{"type":"multiple_choice","options":["París","Londres","Madrid"],"answer":1}}'::jsonb,
        '{"p":"¿Cuántos años tiene Jamie?", "p_de":"Wie alt ist Jamie?", "s":{"type":"multiple_choice","options":["12","13","14"],"answer":1}}'::jsonb,
        '{"p":"¿Cuántas personas hay en la familia de Jamie?", "p_de":"Wie viele Personen gibt es in Jamies Familie?", "s":{"type":"multiple_choice","options":["2","3","4"],"answer":1}}'::jsonb,
        '{"p":"¿Cuál es la asignatura favorita de Jamie?", "p_de":"Was ist Jamies Lieblingsfach?", "s":{"type":"multiple_choice","options":["Música","Matemáticas","Arte"],"answer":2}}'::jsonb,
        '{"p":"¿Cómo se llama la mascota de Jamie?", "p_de":"Wie heißt Jamies Haustier?", "s":{"type":"multiple_choice","options":["Buster","Whiskers","Millie"],"answer":1}}'::jsonb,
        '{"p":"¿Qué tipo de animal es la mascota de Jamie?", "p_de":"Was für ein Tier ist Jamies Haustier?", "s":{"type":"multiple_choice","options":["Un perro","Un conejo","Un gato"],"answer":2}}'::jsonb,
        '{"p":"¿Qué hace el padre de Jamie?", "p_de":"Was macht Jamies Vater?", "s":{"type":"multiple_choice","options":["Es profesor","Trabaja en una tienda","Es médico"],"answer":1}}'::jsonb,
        '{"p":"¿Qué busca Jamie?", "p_de":"Was sucht Jamie?", "s":{"type":"multiple_choice","options":["Un amigo por correspondencia de España","Un amigo por correspondencia de Francia","Una nueva escuela"],"answer":0}}'::jsonb,
        '{"p":"¿Qué le gusta hacer a Jamie en su tiempo libre?", "p_de":"Was macht Jamie gerne in seiner Freizeit?", "s":{"type":"multiple_choice","options":["Leer libros y escuchar música","Jugar videojuegos y nadar","Dibujar y pintar"],"answer":0}}'::jsonb,
        '{"p":"¿Qué le pide Jamie al lector al final de la carta?", "p_de":"Was bittet Jamie den Leser am Ende des Briefes?", "s":{"type":"multiple_choice","options":["Que le envíe dinero","Que le escriba y le hable de su familia y hobbies","Que le visite en Londres"],"answer":1}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path_uuid del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Reading en el Step 260
INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
VALUES (v_path_id, 260, 'en', 'reading', 'social', 'Dear Friend,\n\nMy name is Jamie and I am 13 years old. I live in London, England. London is a big and exciting city. I am looking for a pen friend from Spain.\n\nMy family is small. There are three people: my mum, my dad, and me. I have no brothers or sisters. My mum is a teacher and my dad works in a shop.\n\nI go to Hill Street School. It is near my house. My favourite subject is Art. I also like Music. I do not like Maths very much!\n\nIn my free time, I like reading books and listening to music. I also play football with my friends at the weekend.\n\nI have a cat called Whiskers. She is three years old and very friendly.\n\nPlease write back and tell me about you! I want to know about your family and your hobbies.\n\nBest wishes,\nJamie')
RETURNING uuid INTO v_reading_id;

-- 3. Insertar Traducción y Contenido del Reading (español)
INSERT INTO reading_translation (reading_uuid, language, title)
VALUES (
    v_reading_id,
    'es',
    'Carta de un amigo'
);

-- 3b. Insertar Traducción Alemana del Reading
INSERT INTO reading_translation (reading_uuid, language, title)
VALUES (
    v_reading_id,
    'de',
    'Brief von einem Freund'
);

-- 4. Bucle para insertar los ejercicios vinculados al Reading
FOREACH ex IN ARRAY v_exercises
LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_reading_id, NULL)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');

END LOOP;
END;
$seed$;
