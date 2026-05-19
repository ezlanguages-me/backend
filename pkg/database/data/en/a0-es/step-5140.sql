-- ============================================================
-- Seed: A0 English Path – STEP 5140 – Speaking – contribute opinion to discussion (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5140 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5140, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Dar una opinión en una discusión académica', '', '{"scenario": "Participas en una discusión de clase y quieres expresar una opinión simple, compararla con otra y reaccionar a lo que dicen los demás.", "tasks": ["Di brevemente cuál es tu opinión general.", "Da una razón sencilla para esa opinión.", "Compara tu idea con otra postura del grupo.", "Usa una expresión simple como I agree o I do not agree.", "Añade un ejemplo corto de clase o de tu experiencia.", "Pregunta qué piensan los demás.", "Responde a una opinión diferente con educación.", "Cierra tu intervención con una frase breve."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine Meinung in eine akademische Diskussion einbringen', '', '{"scenario": "Du nimmst an einer Unterrichtsdiskussion teil und möchtest eine einfache Meinung äußern, sie vergleichen und auf andere reagieren.", "tasks": ["Sag kurz, was deine allgemeine Meinung ist.", "Gib einen einfachen Grund für diese Meinung.", "Vergleiche deine Idee mit einer anderen Position in der Gruppe.", "Verwende einen einfachen Ausdruck wie I agree oder I do not agree.", "Füge ein kurzes Beispiel aus dem Unterricht oder deiner Erfahrung hinzu.", "Frag, was die anderen denken.", "Reagiere höflich auf eine andere Meinung.", "Beende deinen Beitrag mit einem kurzen Satz."]}'::jsonb);
END;
$seed$;
