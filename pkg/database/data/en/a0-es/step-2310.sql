-- ============================================================
-- Seed: A0 English Path – STEP 2310 – Speaking – order a meal and ask for clarification about dishes on the menu (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2310 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2310, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Pedir aclaraciones sobre ingredientes y platos', '', '{"scenario": "Estás leyendo un menú con platos que no conoces bien. Haz preguntas para entender los ingredientes, la salsa y el tipo de plato antes de pedir.", "tasks": ["Pregunta qué significa el nombre de un plato.", "Pregunta si un plato es carne, pescado o postre.", "Pregunta cómo es una salsa del menú.", "Pregunta si un plato está caliente, templado o frío.", "Pregunta por un ingrediente principal.", "Decide qué plato quieres pedir.", "Añade una bebida a tu pedido.", "Da las gracias por la explicación."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Nach Zutaten und Gerichten fragen', '', '{"scenario": "Du liest eine Speisekarte mit Gerichten, die du nicht gut kennst. Stelle Fragen, um Zutaten, Soße und die Art des Gerichts zu verstehen, bevor du bestellst.", "tasks": ["Frage, was der Name eines Gerichts bedeutet.", "Frage, ob ein Gericht Fleisch, Fisch oder Dessert ist.", "Frage, wie eine Soße auf der Karte ist.", "Frage, ob ein Gericht heiß, warm oder kalt ist.", "Frage nach einer Hauptzutat.", "Entscheide, welches Gericht du bestellen möchtest.", "Füge ein Getränk zu deiner Bestellung hinzu.", "Bedanke dich für die Erklärung."]}'::jsonb);
END;
$seed$;
