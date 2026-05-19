-- ============================================================
-- Seed: A0 English Path – STEP 3870 – Speaking – place a professional order (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3870 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3870, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Haz un pedido profesional', 'Practica un pedido profesional completo con producto, cantidad, fecha y datos de entrega.', '{"scenario": "Vas a llamar a un proveedor para hacer un pedido para tu empresa. Quieres practicar una versión clara y profesional antes de la llamada real.", "tasks": ["Saluda y di tu nombre y empresa.", "Indica qué producto quieres pedir.", "Di la cantidad exacta.", "Añade detalles como tamaño, color o referencia.", "Indica la fecha o franja de entrega que necesitas.", "Da la dirección o el punto exacto de entrega.", "Pide confirmación del precio o de la disponibilidad.", "Cierra el pedido con una despedida profesional."]}'::jsonb),
        (v_item_id, 'de', 'Gib eine berufliche Bestellung auf', 'Übe eine vollständige berufliche Bestellung mit Produkt, Menge, Termin und Lieferdaten.', '{"scenario": "Du willst einen Lieferanten anrufen, um eine Bestellung für deine Firma aufzugeben. Du möchtest vorher eine klare und professionelle Version üben.", "tasks": ["Begrüße die Person und nenne deinen Namen und deine Firma.", "Sag, welches Produkt du bestellen möchtest.", "Nenne die genaue Menge.", "Füge Details wie Größe, Farbe oder Referenz hinzu.", "Nenne das gewünschte Lieferdatum oder Lieferfenster.", "Gib die genaue Lieferadresse oder den Lieferpunkt an.", "Bitte um Bestätigung von Preis oder Verfügbarkeit.", "Beende die Bestellung mit einer professionellen Verabschiedung."]}'::jsonb);
END;
$seed$;
