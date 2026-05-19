-- ============================================================
-- Seed: A0 English Path – STEP 610 – Speaking – express opinions in a limited way (Convivencia - Host Families)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking WHERE step_order = 610 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 610, 'en', 'speaking', 'social')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Dar opiniones sencillas', '', '{"scenario": "Hablas con un amigo sobre tu estancia con la familia anfitriona. Da opiniones muy sencillas sobre la comida, la ciudad y tu rutina.", "tasks": ["Di algo que te encanta de tu estancia.", "Di algo que no te gusta mucho.", "Da tu opinión sobre la ciudad.", "Describe el tiempo con una frase simple.", "Termina con una opinión sobre tu habitación o los fines de semana."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Einfache Meinungen äußern', '', '{"scenario": "Du sprichst mit einem Freund über deinen Aufenthalt bei der Gastfamilie. Gib sehr einfache Meinungen über das Essen, die Stadt und deinen Alltag.", "tasks": ["Sage etwas, das du an deinem Aufenthalt liebst.", "Sage etwas, das du nicht so gern magst.", "Gib deine Meinung über die Stadt.", "Beschreibe das Wetter mit einem einfachen Satz.", "Beende mit einer Meinung über dein Zimmer oder die Wochenenden."]}'::jsonb);
END;
$seed$;
