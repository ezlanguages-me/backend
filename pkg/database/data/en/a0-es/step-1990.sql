-- ============================================================
-- Seed: A0 English Path – STEP 1990 – Speaking – get the attention of staff and order a meal in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1990 AND path_uuid = v_path_id;
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category) VALUES (v_path_id, 1990, 'en', 'speaking', 'Restauración') RETURNING uuid INTO v_speaking_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt) VALUES (v_speaking_id, 'es', 'Llamar al camarero y hacer el pedido', '', '{"scenario": "Estás sentado en un restaurante. Debes llamar al camarero de forma educada, pedir un entrante o plato principal, elegir bebida y responder a una pregunta sencilla sobre tu comida.", "tasks": ["Llama al camarero con una frase educada.", "Pide un primer plato o entrante.", "Pide un plato principal.", "Elige una bebida.", "Di si quieres o no un ingrediente extra.", "Responde si quieres postre ahora o más tarde.", "Pide la cuenta o di que pedirás más tarde.", "Termina con una frase amable."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt) VALUES (v_speaking_id, 'de', 'Den Kellner rufen und die Bestellung machen', '', '{"scenario": "Du sitzt in einem Restaurant. Du sollst den Kellner höflich rufen, eine Vorspeise oder ein Hauptgericht bestellen, ein Getränk wählen und eine einfache Frage zum Essen beantworten.", "tasks": ["Rufe den Kellner mit einem höflichen Satz.", "Bestelle eine Vorspeise oder einen ersten Gang.", "Bestelle ein Hauptgericht.", "Wähle ein Getränk.", "Sage, ob du eine Extra-Zutat möchtest oder nicht.", "Antworte, ob du jetzt oder später ein Dessert möchtest.", "Bitte um die Rechnung oder sage, dass du später fragst.", "Beende mit einem freundlichen Satz."]}'::jsonb);
END;
$seed$;
