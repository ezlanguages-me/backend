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
) 
RETURNING uuid INTO v_speaking_id;

-- 3. Insertar Traducción y Prompts del Speaking
INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt) 
VALUES (
    v_speaking_id, 
    'es', 
    'Charla con tu Host Family', 
    '', 
    
    -- Prompt para el usuario (lo que verá en pantalla para saber qué tiene que hacer)Z
    '{
        "scenario": "Vas a grabar un audio de voz para enviárselo a Sarah, tu futura madre anfitriona (host mom) en Boston, antes de llegar. Ella no te conoce todavía y quiere saber quién eres. En el audio debes presentarte y hacerle las preguntas que tienes sobre la familia y la casa. Habla de forma continua, como si fuera un mensaje de voz.",
        "tasks": [
            "Salúdala y preséntate: di tu nombre completo y de dónde eres.",
            "Cuéntale algo breve sobre ti (tu edad, qué estudias o a qué te dedicas).",
            "Pregúntale cuántas personas viven en la casa y cómo se llaman.",
            "Pregunta si hay niños en la familia y qué edades tienen.",
            "Pregunta cómo está organizada la casa: cuántos pisos (floors) tiene y dónde está tu habitación (bedroom).",
            "Pregunta dónde está el baño (bathroom) que puedes usar.",
            "Pregunta a qué hora son las comidas (meals) en casa.",
            "Despídete de forma educada y di que tienes muchas ganas de llegar."
        ]
    }'::jsonb
);

INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
VALUES (
    v_speaking_id,
    'de',
    'Gespräch mit deiner Gastfamilie',
    '',
    '{
        "scenario": "Du wirst eine Sprachnachricht aufnehmen und an Sarah schicken, deine zukünftige Gastmutter in Boston, bevor du ankommst. Sie kennt dich noch nicht und möchte wissen, wer du bist. In der Nachricht sollst du dich vorstellen und ihr die Fragen stellen, die du über die Familie und das Haus hast. Sprich zusammenhängend, als wäre es eine Sprachnachricht.",
        "tasks": [
            "Begrüße sie und stell dich vor: Nenne deinen vollständigen Namen und woher du kommst.",
            "Erzähl ihr kurz etwas über dich (dein Alter, was du studierst oder was du beruflich machst).",
            "Frag sie, wie viele Personen im Haus wohnen und wie sie heißen.",
            "Frag, ob es Kinder in der Familie gibt und wie alt sie sind.",
            "Frag, wie das Haus aufgeteilt ist: wie viele Stockwerke (floors) es hat und wo dein Zimmer (bedroom) ist.",
            "Frag, wo das Bad (bathroom) ist, das du benutzen kannst.",
            "Frag, zu welcher Uhrzeit die Mahlzeiten (meals) zu Hause stattfinden.",
            "Verabschiede dich höflich und sag, dass du es kaum erwarten kannst anzukommen."
        ]
    }'::jsonb
);
END;
$seed$;
