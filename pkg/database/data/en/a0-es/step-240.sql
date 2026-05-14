-- ============================================================
-- Seed: A0 English Path – STEP 240 – Speaking – take part in a conversation of a basic factual nature on a predictable topic, i.e. her/his home country, family, school, etc (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_speaking_id UUID; 
BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Eliminar versión anterior del Step 240 si existiese (evita duplicados al re-ejecutar)
DELETE FROM speaking WHERE step_order = 240 AND path_uuid = v_path_id;

-- 3. Insertar la actividad de Speaking en el Step 240
INSERT INTO speaking (path_uuid, step_order, source_language, type, category) 
VALUES (v_path_id, 240, 'en', 'speaking', 'social') 
RETURNING uuid INTO v_speaking_id;

-- 4. Insertar Traducción, Instrucciones para el usuario (prompt) y el rol de la IA (ai_prompt)
INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt) 
VALUES (
    v_speaking_id, 
    'es', 
    'Presenta tu país y tu familia', 
    '', 
    '{
        "scenario": "Sarah, tu madre anfitriona en Boston, te ha pedido que grabes un audio de voz presentándote antes de llegar. Quiere compartirlo con el resto de la familia para que todos sepan quién eres. Habla de forma continua, como si fuera un mensaje de voz, y cubre los tres grandes temas: tu país, tu familia y tu escuela.",
        "tasks": [
            "Di de qué país y ciudad eres, y descríbela brevemente (grande o pequeña, el tiempo que hace, algo que te gusta de ella).",
            "Explica cómo es tu país: una o dos cosas típicas o interesantes que quieras contarles.",
            "Habla de tu familia: cuántas personas son, cómo se llaman y qué hacen (trabajo o estudios).",
            "Describe a un miembro de tu familia con más detalle: su edad, personalidad o afición.",
            "Habla de tu escuela o universidad: dónde está, cuántos alumnos hay aproximadamente y qué estudias.",
            "Di cuál es tu asignatura favorita y por qué.",
            "Despídete y di que tienes muchas ganas de conocerlos en persona."
        ]
    }'::jsonb
);

END;
$seed$;
