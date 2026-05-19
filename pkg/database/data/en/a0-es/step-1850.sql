-- ============================================================
-- Seed: A0 English Path – STEP 1850 – Speaking – bargain in the market place (straightforward item) (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1850 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1850, 'en', 'speaking', 'Compras y Transacciones') RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Negociar por una camiseta o un cinturón', '', '{"scenario": "Estás en un puesto del mercado donde vendes o compras una camiseta de algodón o un cinturón de cuero. Debes preguntar por talla, precio y un pequeño descuento.", "tasks": ["Di qué artículo quieres comprar.", "Pregunta si hay tu talla o color.", "Pregunta el precio exacto.", "Di cuántas unidades quieres.", "Pide un descuento por comprar más de uno o por pagar en efectivo.", "Pregunta si aceptan tarjeta o efectivo.", "Acepta una oferta final o di tu último precio.", "Termina la compra con una frase amable."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Über ein T-Shirt oder einen Gürtel verhandeln', '', '{"scenario": "Du bist an einem Marktstand und kaufst oder verkaufst ein Baumwoll-T-Shirt oder einen Ledergürtel. Du sollst nach Größe, Preis und einem kleinen Rabatt fragen.", "tasks": ["Sage, welchen Artikel du kaufen möchtest.", "Frage, ob es deine Größe oder Farbe gibt.", "Frage nach dem genauen Preis.", "Sage, wie viele Stück du möchtest.", "Bitte um einen Rabatt für mehrere Stück oder Barzahlung.", "Frage, ob Karte oder bar akzeptiert wird.", "Nimm ein letztes Angebot an oder nenne deinen letzten Preis.", "Beende den Kauf mit einem freundlichen Satz."]}'::jsonb);
END;
$seed$;
