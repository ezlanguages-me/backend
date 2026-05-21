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
    VALUES (v_path_id, 610, 'en', 'speaking', 'social')RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (
        v_speaking_id,
        'es',
        'Dar opiniones sencillas',
        '{"scenario": "Hablas con un amigo sobre tu estancia con la familia anfitriona. Da opiniones muy sencillas sobre las personas, la comida, la casa, la ciudad y tu rutina.", "tasks": ["Saluda a tu amigo y di que quieres contarle cómo va tu vida con la familia anfitriona.", "Da una opinión sencilla sobre tu familia anfitriona.", "Di qué te parece la comida o la hora de la cena.", "Comenta cómo te parece tu habitación o la casa.", "Da una opinión simple sobre la ciudad o el barrio donde vives.", "Di algo que te gusta o no te gusta de la rutina diaria o del fin de semana.", "Cierra la conversación con una despedida amable y una opinión final corta."]}'::jsonb
    );

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (
        v_speaking_id,
        'de',
        'Einfache Meinungen äußern',
        '{"scenario": "Du sprichst mit einem Freund über deinen Aufenthalt bei der Gastfamilie. Gib sehr einfache Meinungen über die Menschen, das Essen, das Haus, die Stadt und deinen Alltag.", "tasks": ["Begrüße deinen Freund und sage, dass du kurz über dein Leben bei der Gastfamilie sprechen möchtest.", "Gib eine einfache Meinung über deine Gastfamilie.", "Sage, wie du das Essen oder die Uhrzeit vom Abendessen findest.", "Kommentiere, wie du dein Zimmer oder das Haus findest.", "Gib eine einfache Meinung über die Stadt oder das Viertel, in dem du wohnst.", "Sage etwas, das dir am Alltag oder am Wochenende gefällt oder nicht gefällt.", "Beende das Gespräch mit einer freundlichen Verabschiedung und einer kurzen Schlussmeinung."]}'::jsonb
    );
END;
$seed$;
