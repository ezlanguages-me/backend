-- ============================================================
-- Seed: A0 English Path – STEP 5540 – Speaking – argue a point briefly (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5540 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5540, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Defender una idea brevemente', '', '{"scenario": "Participas en un debate o discusión y quieres defender una idea de manera breve, clara y con una razón simple.", "tasks": ["Di claramente cuál es tu posición.", "Da una razón principal para apoyarla.", "Añade un ejemplo breve o una situación concreta.", "Contrasta tu idea con otra postura posible.", "Usa una expresión simple de acuerdo o desacuerdo.", "Responde a una objeción con calma.", "Resume tu punto principal en una frase corta.", "Termina cediendo la palabra o invitando a otra opinión."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Einen Punkt kurz begründen', '', '{"scenario": "Du nimmst an einer Debatte oder Diskussion teil und möchtest eine Idee kurz, klar und mit einem einfachen Grund vertreten.", "tasks": ["Sag klar, welche Position du vertrittst.", "Gib einen Hauptgrund dafür an.", "Füge ein kurzes Beispiel oder eine konkrete Situation hinzu.", "Setze deine Idee zu einer anderen möglichen Position in Beziehung.", "Verwende einen einfachen Ausdruck für Zustimmung oder Widerspruch.", "Reagiere ruhig auf einen Einwand.", "Fasse deinen Hauptpunkt in einem kurzen Satz zusammen.", "Beende deinen Beitrag, indem du das Wort weitergibst oder eine andere Meinung einlädst."]}'::jsonb);
END;
$seed$;
