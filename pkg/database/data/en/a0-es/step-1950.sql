-- ============================================================
-- Seed: A0 English Path – STEP 1950 – Speaking – go to a self-service or fast food establishment and order a meal (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1950 AND path_uuid = v_path_id;
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category) VALUES (v_path_id, 1950, 'en', 'speaking', 'Restauración') RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt) VALUES (v_speaking_id, 'es', 'Haz tu pedido completo de comida rápida', '', '{"scenario": "Estás en el mostrador de un local de comida rápida. Debes pedir un menú, elegir bebida, cambiar un ingrediente y añadir un extra.", "tasks": ["Saluda y di qué menú quieres.", "Elige el tamaño de la bebida.", "Di qué bebida prefieres.", "Pide quitar o añadir un ingrediente.", "Añade un extra como salsa, batido o postre.", "Escucha la repetición del pedido y confírmala.", "Di si quieres algo más o no.", "Termina con gracias."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt) VALUES (v_speaking_id, 'de', 'Gib deine komplette Fast-Food-Bestellung auf', '', '{"scenario": "Du bist an der Theke eines Fast-Food-Restaurants. Du sollst ein Menü bestellen, ein Getränk wählen, eine Zutat ändern und etwas zusätzlich bestellen.", "tasks": ["Begrüße und sage, welches Menü du möchtest.", "Wähle die Größe des Getränks.", "Sage, welches Getränk du möchtest.", "Bitte darum, eine Zutat zu entfernen oder hinzuzufügen.", "Bestelle etwas extra wie Sauce, Shake oder Dessert.", "Höre die Wiederholung der Bestellung und bestätige sie.", "Sage, ob du noch etwas möchtest oder nicht.", "Beende mit einem Dank."]}'::jsonb);
END;
$seed$;
