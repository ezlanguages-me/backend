-- ============================================================
-- Seed: A0 English Path – STEP 2150 – Speaking – order a meal in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2150 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2150, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Pedir comida para un grupo', '', '{"scenario": "Estás en un restaurante con otras personas. Haz el pedido completo para tu mesa con platos, bebidas y una petición sencilla.", "tasks": ["Di cuántas personas hay en tu mesa.", "Pide un entrante para compartir.", "Pide un plato principal para una persona.", "Pide un segundo plato principal diferente.", "Pide dos bebidas.", "Haz una petición sencilla sobre un ingrediente o acompañamiento.", "Di si queréis postre ahora o más tarde.", "Confirma el pedido y agradece al camarero."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Essen für eine Gruppe bestellen', '', '{"scenario": "Du bist mit anderen Personen in einem Restaurant. Gib die vollständige Bestellung für deinen Tisch mit Gerichten, Getränken und einer einfachen Bitte auf.", "tasks": ["Sage, wie viele Personen an deinem Tisch sitzen.", "Bestelle eine Vorspeise zum Teilen.", "Bestelle ein Hauptgericht für eine Person.", "Bestelle ein zweites anderes Hauptgericht.", "Bestelle zwei Getränke.", "Bitte einfach um eine Zutat oder Beilage.", "Sage, ob ihr jetzt oder später Dessert möchtet.", "Bestätige die Bestellung und danke dem Kellner."]}'::jsonb);
END;
$seed$;
