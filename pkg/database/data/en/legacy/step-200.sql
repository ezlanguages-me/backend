-- ============================================================
-- Seed: A0 English Path – STEP 200 – Speaking – understand straightforward explanations of, for example, the members of the host family and the layout of the house (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_speaking_id UUID; 
BEGIN

-- 1. Obtener el path_uuid del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Speaking principal (Step 200)
INSERT INTO speaking (path_uuid, step_order, source_language, type, category) 
VALUES (
    v_path_id,
    200,
    'en',
    'speaking',
    'social'
)RETURNING uuid INTO v_speaking_id;

-- 3. Insertar Traducción y Prompts del Speaking
INSERT INTO speaking_translation (speaking_uuid, language, title, prompt) 
VALUES (
    v_speaking_id,
    'es',
    'Charla con tu Host Family',
    -- Prompt para el usuario (lo que verá en pantalla para saber qué tiene que hacer)
    '{
        "scenario": "Acabas de leer el diálogo entre Alex y Sarah, su madre anfitriona (host mom) en Boston. Ahora vas a grabar un audio de voz para contarle a un amigo cómo es la familia y la casa. Usa solo lo que entendiste del diálogo. Habla de forma continua, como si fuera un mensaje de voz real.",
        "tasks": [
            "Describe a la familia de Sarah: di cuántos miembros son, cómo se llaman y quiénes son (husband, kids).",
            "Menciona la mascota: di cómo se llama, qué tipo de animal es y cómo es.",
            "Describe cómo está organizada la casa: cuántos pisos (floors) tiene y qué hay en cada planta.",
            "Explica dónde está el dormitorio (bedroom) de Alex y qué tiene (closet, view).",
            "Di qué baño (bathroom) puede usar Alex y dónde está.",
            "Menciona dónde está el cuarto de lavado (laundry room) y qué hay en él."
        ]
    }'::jsonb
);

INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
VALUES (
    v_speaking_id,
    'de',
    'Erzähl von deiner Gastfamilie',
    '{
        "scenario": "Du hast gerade den Dialog zwischen Alex und Sarah, seiner Gastmutter in Boston, gelesen. Jetzt nimmst du eine Sprachnachricht auf, um einem Freund zu erzählen, wie die Familie und das Haus sind. Benutze nur das, was du aus dem Dialog verstanden hast. Sprich zusammenhängend, als wäre es eine echte Sprachnachricht.",
        "tasks": [
            "Beschreibe Sarahs Familie: Wie viele Mitglieder gibt es, wie heißen sie und wer sind sie (husband, kids).",
            "Erwähne das Haustier: Wie heißt es, was für ein Tier ist es und wie ist es.",
            "Beschreibe, wie das Haus aufgeteilt ist: wie viele Stockwerke (floors) es hat und was auf jeder Etage ist.",
            "Erkläre, wo Alexs Schlafzimmer (bedroom) ist und was es hat (closet, view).",
            "Sag, welches Bad (bathroom) Alex benutzen kann und wo es ist.",
            "Erwähne, wo der Waschraum (laundry room) ist und was darin ist."
        ]
    }'::jsonb
);
END;
$seed$;
