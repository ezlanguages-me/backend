-- ============================================================
-- Seed: A0 English Path – STEP 220 – Listening – take part in a conversation of a basic factual nature on a predictable topic, i.e. her/his home country, family, school, etc (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_listening_id UUID; 
    v_ex_id UUID; 
    ex JSONB; 
    
    -- Array masivo con 32 ejercicios de comprensión auditiva (16 True/False y 16 Multiple Choice)
    v_exercises JSONB[] := ARRAY[
        '{"p":"Alex vive en Madrid.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Cómo describe Alex a Madrid?", "s":{"type":"multiple_choice","options":["Pequeña y tranquila", "Grande y muy ocupada", "Cerca de la playa"],"answer":"Grande y muy ocupada"}}'::jsonb,
        '{"p":"El clima en Madrid siempre es caluroso, incluso en invierno.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuántas personas forman la familia de Alex en España?", "s":{"type":"multiple_choice","options":["Tres", "Cuatro", "Cinco"],"answer":"Cuatro"}}'::jsonb,
        '{"p":"El padre de Alex es enfermero.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuál es la profesión de la madre de Alex?", "s":{"type":"multiple_choice","options":["Profesora", "Ingeniera", "Enfermera"],"answer":"Enfermera"}}'::jsonb,
        '{"p":"La madre de Mia es profesora.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Qué le gusta hacer al padre de Alex en su tiempo libre?", "s":{"type":"multiple_choice","options":["Leer novelas", "La jardinería (gardening)", "Cocinar"],"answer":"La jardinería (gardening)"}}'::jsonb,
        '{"p":"A la madre de Alex le encanta leer novelas de ciencia ficción.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuántos años tiene la hermana menor de Alex?", "s":{"type":"multiple_choice","options":["10 años", "12 años", "14 años"],"answer":"12 años"}}'::jsonb,
        '{"p":"La hermana de Alex juega al baloncesto los domingos.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué deporte juega la hermana de Alex todos los sábados?", "s":{"type":"multiple_choice","options":["Tenis", "Fútbol (soccer)", "Voleibol"],"answer":"Fútbol (soccer)"}}'::jsonb,
        '{"p":"La escuela secundaria de Alex en España es muy grande.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Cuántos estudiantes hay aproximadamente en la escuela de Alex?", "s":{"type":"multiple_choice","options":["Menos de 500", "Exactamente 1000", "Más de 1000"],"answer":"Más de 1000"}}'::jsonb,
        '{"p":"Los estudiantes en la escuela de Alex deben llevar uniforme.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿A qué hora empiezan las clases de Alex en España?", "s":{"type":"multiple_choice","options":["8:00 AM", "8:30 AM", "9:00 AM"],"answer":"8:30 AM"}}'::jsonb,
        '{"p":"Alex va a casa a almorzar después de la escuela.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿A qué hora terminan las clases de Alex?", "s":{"type":"multiple_choice","options":["1:30 PM", "2:30 PM", "3:30 PM"],"answer":"2:30 PM"}}'::jsonb,
        '{"p":"Las asignaturas favoritas de Alex son Ciencias y Matemáticas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuáles son las materias preferidas de Alex?", "s":{"type":"multiple_choice","options":["Historia e Inglés", "Geografía y Arte", "Matemáticas e Inglés"],"answer":"Historia e Inglés"}}'::jsonb,
        '{"p":"El profesor de Historia de Alex se llama Mr. Davis.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cómo describe Alex a su profesor de Inglés (Mr. Davis)?", "s":{"type":"multiple_choice","options":["Muy estricto", "Muy divertido (funny)", "Muy aburrido"],"answer":"Muy divertido (funny)"}}'::jsonb,
        '{"p":"Alex juega al fútbol en el equipo de su escuela.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué instrumento toca Alex en la banda de la escuela?", "s":{"type":"multiple_choice","options":["La guitarra eléctrica", "El piano", "La guitarra acústica"],"answer":"La guitarra acústica"}}'::jsonb,
        '{"p":"Alex lleva tocando su instrumento aproximadamente tres años.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Cuándo suele practicar Alex con su instrumento?", "s":{"type":"multiple_choice","options":["Por las mañanas", "Por las tardes", "Por las noches (evenings)"],"answer":"Por las noches (evenings)"}}'::jsonb,
        '{"p":"A Mia le parece aburrido que Alex toque un instrumento.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué le sugiere Mia a Alex al final de la conversación?", "s":{"type":"multiple_choice","options":["Que le enseñe fotos de Madrid", "Que toque algo para la familia", "Que juegue un partido con ella"],"answer":"Que toque algo para la familia"}}'::jsonb,
        '{"p":"Mia quiere que Alex toque música antes del almuerzo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿En qué momento específico sugiere Mia que Alex toque música?", "s":{"type":"multiple_choice","options":["Después de la cena", "Antes del desayuno", "Mañana por la tarde"],"answer":"Después de la cena"}}'::jsonb,
        '{"p":"Alex se niega a tocar música porque es muy tímido.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuál es la respuesta de Alex ante la propuesta de Mia?", "s":{"type":"multiple_choice","options":["Dice que está muy cansado", "Dice que le encantaría hacerlo (I''d love to)", "Dice que se ha olvidado la guitarra"],"answer":"Dice que le encantaría hacerlo (I''d love to)"}}'::jsonb
    ];
BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Eliminar versión anterior del Step 220 si existiese (evita duplicados al re-ejecutar)
DELETE FROM listening WHERE step_order = 220 AND path_uuid = v_path_id;

-- 3. Insertar el Listening en el Step 220
INSERT INTO listening (path_uuid, step_order, source_language, type, category) 
VALUES (v_path_id, 220, 'en', 'listening', 'social') 
RETURNING uuid INTO v_listening_id;

-- 4. Insertar Traducción y la Transcripción Ampliada (TTS)
INSERT INTO listening_translation (listening_uuid, language, title, description, transcript) 
VALUES (
    v_listening_id, 
    'es', 
    'Charla sobre tu país y tu familia', 
    '', 
    $transcript$
TTS the following conversation between Mia and Alex:

Mia: [curious] So Alex, what is your hometown in Spain like?
Alex: [friendly] I live in Madrid. It's the capital, so it's a very big and busy city. The weather is usually sunny, but it gets pretty cold in the winter.
Mia: [interested] Do you have a big family back home?
Alex: [relaxed] Not really. It's just my parents, my younger sister, and me. My mom is a nurse and my dad is an engineer.
Mia: [warmly] Oh, cool. My mom is a teacher. What do your parents do in their free time?
Alex: [pleasantly] My dad loves gardening, and my mom likes reading mystery novels.
Mia: [curious] And what about your sister? How old is she?
Alex: [cheerfully] She is 12. She is crazy about sports. She plays soccer for a local team every Saturday.
Mia: [excited] That sounds fun! What about your school? Is it different from here?
Alex: [matter-of-factly] Yes, my high school in Madrid is huge. There are over a thousand students. Also, we don't wear a uniform.
Mia: [surprised] Wow, no uniform! What time do your classes start?
Alex: [clearly] We start at 8:30 AM and finish around 2:30 PM. Then I go home for lunch.
Mia: [interested] What are your favorite subjects?
Alex: [brightly] My favorite subjects are History and English. Mr. Davis, my English teacher, is very funny.
Mia: [curious] Do you play any sports there?
Alex: [lightly] I don't play sports. I actually play the acoustic guitar in the school band.
Mia: [excited] That's awesome! How long have you played?
Alex: [calmly] For about three years. I usually practice in the evenings.
Mia: [encouragingly] Maybe you can play something for us later after dinner.
Alex: [happy] Sure! I'd love to.
$transcript$
);

-- 5. Bucle para insertar los 32 ejercicios vinculados directamente al target_uuid (el Listening)
FOREACH ex IN ARRAY v_exercises 
LOOP 
    -- Insertar el ejercicio base vinculándolo directamente al Listening
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) 
    VALUES (v_listening_id, NULL) 
    RETURNING uuid INTO v_ex_id;
    
    -- Insertar la traducción y la configuración específica del ejercicio
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
    
END LOOP; 
END;
$seed$;
