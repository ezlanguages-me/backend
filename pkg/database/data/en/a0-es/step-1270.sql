-- ============================================================
-- Seed: A0 English Path – STEP 1270 – Speaking – understand a counter-service shop where items are requested and served by a shopkeeper (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1270 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1270, 'en', 'speaking', 'shopping')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla en una tienda con mostrador', 'Practica cómo pedir comida o productos en un mostrador donde el dependiente te sirve.', '{"scenario": "Estás en una panadería, carnicería o charcutería. Los productos están detrás del mostrador y debes pedirlos con cantidad, tipo y forma de pago.", "tasks": ["Saluda al dependiente y di qué producto quieres.", "Da una cantidad clara: one kilo, six rolls, four slices, etc.", "Responde si el dependiente te ofrece dos tipos diferentes.", "Pide un segundo producto sencillo.", "Indica si quieres una bolsa o dos bolsas.", "Pregunta el precio total.", "Di si pagas con tarjeta o en efectivo.", "Termina la compra con un agradecimiento y una despedida corta."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich in einem Geschäft mit Bedienungstheke', 'Übe, wie du Essen oder Produkte an einer Bedienungstheke bestellst.', '{"scenario": "Du bist in einer Bäckerei, Metzgerei oder Feinkosttheke. Die Produkte liegen hinter dem Tresen und du musst Menge, Sorte und Bezahlung nennen.", "tasks": ["Begrüße den Verkäufer und sag, welches Produkt du möchtest.", "Nenne eine klare Menge: one kilo, six rolls, four slices usw.", "Antworte, wenn der Verkäufer dir zwei verschiedene Sorten anbietet.", "Bitte um ein zweites einfaches Produkt.", "Sag, ob du eine oder zwei Taschen möchtest.", "Frage nach dem Gesamtpreis.", "Sag, ob du mit Karte oder bar bezahlst.", "Beende den Einkauf mit einem Dank und einer kurzen Verabschiedung."]}'::jsonb);
END;
$seed$;
