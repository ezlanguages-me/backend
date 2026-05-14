-- ============================================================
-- Seed: A0 English Path – STEP 250 – Writing – write a short, simple letter introducing her/himself to a host/exchange family containing basic, factual information (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_writing_id UUID; 
BEGIN

-- 1. Obtener el path_uuid del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Writing principal (Step 250)
INSERT INTO writing (path_uuid, step_order, source_language, type, category) 
VALUES (
    v_path_id, 
    250, 
    'en', 
    'writing', 
    'Social'
) 
RETURNING uuid INTO v_writing_id;

-- 3. Insertar Traducción y Prompts del Writing
INSERT INTO writing_translation (writing_uuid, language, title, description, prompt) 
VALUES (
    v_writing_id, 
    'es', 
    'Correo a tu Host Family', 
    '', 
    
    -- Prompt para el usuario (lo que verá en pantalla para saber qué tiene que redactar)
    '{
        "scenario": "Vas a ir de intercambio a Estados Unidos el próximo mes. Escribe un correo electrónico corto y sencillo para presentarte a tu nueva familia anfitriona (Host Family). Es el primer contacto que tienen contigo, así que cuéntales lo más importante sobre ti, tu familia y tu vida.",
        "tasks": [
            "Empieza el correo con un saludo apropiado (ej. Dear Host Family,).",
            "Preséntate: di tu nombre completo, tu edad y de dónde eres (ciudad y país).",
            "Describe brevemente cómo es tu ciudad o tu país (una o dos frases simples).",
            "Habla de tu familia: cuántas personas sois, cómo se llaman y qué hacen.",
            "Menciona al menos un hobby o algo que te guste hacer en tu tiempo libre.",
            "Habla de tus estudios: qué estudias y cuál es tu asignatura favorita.",
            "Di algo que te emocione o que quieras hacer cuando llegues a Estados Unidos.",
            "Cierra el correo con una despedida educada y tu nombre."
        ]
    }'::jsonb
);
END;
$seed$;