-- ============================================================
-- Seed: A0 English Path – STEP 210 – Reading – take part in a conversation of a basic factual nature on a predictable topic, i.e. her/his home country, family, school, etc (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_reading_id UUID; 
    v_ex_id UUID; 
    ex JSONB; 
    
    -- Array con 12 ejercicios de comprensión lectora (True / False)
    v_exercises JSONB[] := ARRAY[
        '{"p":"Alex es un estudiante de intercambio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿De qué ciudad exacta es Alex?", "s":{"type":"multiple_choice","options":["Seattle", "Madrid", "Barcelona"],"answer":"Madrid"}}'::jsonb,
        '{"p":"El clima en Madrid es siempre frío todos los días del año.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuántas personas hay en la familia de Alex en España?", "s":{"type":"multiple_choice","options":["Tres", "Cuatro", "Cinco"],"answer":"Cuatro"}}'::jsonb,
        '{"p":"La madre de Alex trabaja como enfermera en un hospital.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Cuál es la profesión del padre de Alex?", "s":{"type":"multiple_choice","options":["Enfermero", "Profesor", "Ingeniero"],"answer":"Ingeniero"}}'::jsonb,
        '{"p":"La hermana menor de Alex tiene 15 años.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué deporte le encanta jugar a la hermana de Alex los fines de semana?", "s":{"type":"multiple_choice","options":["Fútbol", "Baloncesto", "Tenis"],"answer":"Fútbol"}}'::jsonb,
        '{"p":"Alex asiste a una escuela muy pequeña en España.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuáles son las asignaturas favoritas de Alex?", "s":{"type":"multiple_choice","options":["Matemáticas y Ciencias", "Historia e Inglés", "Arte y Música"],"answer":"Historia e Inglés"}}'::jsonb,
        '{"p":"Alex toca el piano en la banda de su escuela.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué tipo de libros le gusta leer a Alex en su tiempo libre?", "s":{"type":"multiple_choice","options":["Ciencia ficción", "Romance", "Terror"],"answer":"Ciencia ficción"}}'::jsonb,
        '{"p":"Alex vive actualmente con la familia Miller en Estados Unidos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿En qué ciudad vive la familia anfitriona (Host Family)?", "s":{"type":"multiple_choice","options":["Madrid", "Nueva York", "Seattle"],"answer":"Seattle"}}'::jsonb,
        '{"p":"Sarah y Mark son los padres anfitriones de Alex.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Cómo se llama el perro de la familia anfitriona?", "s":{"type":"multiple_choice","options":["Buster", "Max", "Rocky"],"answer":"Buster"}}'::jsonb,
        '{"p":"Alex no quiere responder ninguna pregunta sobre su país.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué instrumento musical toca Alex?", "s":{"type":"multiple_choice","options":["La guitarra", "El piano", "El violín"],"answer":"La guitarra"}}'::jsonb,
        '{"p":"Madrid está situada en el sur de Europa.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Qué actitud muestra Alex en su presentación?", "s":{"type":"multiple_choice","options":["Triste por estar lejos de casa", "Feliz y abierto a hacer amigos", "Enfadado por el clima de Seattle"],"answer":"Feliz y abierto a hacer amigos"}}'::jsonb
    ];
BEGIN

-- 1. Obtener el path_uuid del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Reading en el Step 210
INSERT INTO reading (path_uuid, step_order, source_language, type, category) 
VALUES (v_path_id, 210, 'en', 'reading', 'social') 
RETURNING uuid INTO v_reading_id;

-- 3. Insertar Traducción y Contenido del Reading
INSERT INTO reading_translation (reading_uuid, language, title, description, content) 
VALUES (
    v_reading_id, 
    'es', 
    'Mi país, mi familia y mi escuela', 
    '', 
    'Hi everyone!\n\nMy name is Alex and I am an exchange student. I want to tell you a little bit about myself, my family, and my home country.\n\nI am from Spain. It is a beautiful country in southern Europe. The weather there is usually sunny and warm. \n\nIn my family, there are four people: my parents, my younger sister, and me. My mom is a nurse and my dad is an engineer. My sister is 12 years old and she loves playing soccer.\n\nBack in Spain, I go to a large high school in Madrid. My favorite subjects are History and English. I also play the guitar in the school band.\n\nI am very happy to be here in the United States and I hope we can be good friends. If you have any questions about my country, just ask!'
);

-- 4. Bucle para insertar los 12 ejercicios vinculados al target_uuid (el Reading)
FOREACH ex IN ARRAY v_exercises 
LOOP 
    -- Insertar el ejercicio base vinculándolo directamente al Reading
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) 
    VALUES (v_reading_id, NULL) 
    RETURNING uuid INTO v_ex_id;
    
    -- Insertar la traducción y los detalles del ejercicio (la pregunta y la solución)
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
    
END LOOP; 
END;
$seed$;
