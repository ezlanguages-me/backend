-- ============================================================
-- Seed: A0 English Path – STEP 2030 – Speaking – ask simple questions about the menu and understand simple answers (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2030 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2030, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Preguntar y pedir con frases simples', '', '{"scenario": "Estás en una cafetería pequeña. Habla con el camarero para hacer preguntas simples sobre el menú y luego pide algo para comer y beber.", "tasks": ["Saluda al camarero de forma educada.", "Pregunta cuál es la sopa del día.", "Pregunta si el sándwich viene con ensalada.", "Pregunta si el zumo es fresco.", "Elige un plato principal sencillo.", "Pide una bebida.", "Haz una pregunta corta sobre el postre.", "Termina tu pedido con una frase amable."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Einfach nachfragen und bestellen', '', '{"scenario": "Du bist in einem kleinen Café. Sprich mit dem Kellner, stelle einfache Fragen zur Speisekarte und bestelle dann etwas zu essen und zu trinken.", "tasks": ["Begrüße den Kellner höflich.", "Frage nach der Tagessuppe.", "Frage, ob das Sandwich mit Salat kommt.", "Frage, ob der Saft frisch ist.", "Wähle ein einfaches Hauptgericht.", "Bestelle ein Getränk.", "Stelle eine kurze Frage zum Dessert.", "Beende deine Bestellung mit einem freundlichen Satz."]}'::jsonb);
END;
$seed$;
