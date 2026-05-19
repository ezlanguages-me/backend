-- ============================================================
-- Seed: A0 English Path – STEP 2070 – Speaking – express an opinion about food (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2070 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2070, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Dar tu opinión sobre un plato', '', '{"scenario": "Acabas de comer en un restaurante. Describe tu plato favorito y da opiniones simples sobre la comida, la bebida y el servicio.", "tasks": ["Di qué plato has comido.", "Explica si te gusta mucho o poco.", "Describe el sabor con una palabra sencilla.", "Comenta la temperatura de la comida.", "Di algo sobre la bebida.", "Menciona un punto positivo del servicio.", "Menciona un punto negativo pequeño.", "Termina diciendo si volverías o no."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Deine Meinung über ein Gericht sagen', '', '{"scenario": "Du hast gerade in einem Restaurant gegessen. Beschreibe dein Lieblingsgericht und gib einfache Meinungen über das Essen, das Getränk und den Service.", "tasks": ["Sage, welches Gericht du gegessen hast.", "Erkläre, ob es dir sehr oder wenig gefällt.", "Beschreibe den Geschmack mit einem einfachen Wort.", "Kommentiere die Temperatur des Essens.", "Sage etwas über das Getränk.", "Nenne einen positiven Punkt beim Service.", "Nenne einen kleinen negativen Punkt.", "Beende damit, ob du wiederkommen würdest oder nicht."]}'::jsonb);
END;
$seed$;
