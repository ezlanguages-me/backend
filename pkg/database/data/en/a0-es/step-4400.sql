-- ============================================================
-- Seed: A0 English Path – STEP 4400 – Writing – Escribe un pedido rutinario de productos
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 4400 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'writing';
    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4400, 'en', 'writing', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Escribe un pedido rutinario de productos', 'Practica cómo escribir un pedido claro y completo a un proveedor.', '{"scenario": "Necesitas hacer un pedido rutinario de materiales de limpieza a tu proveedor habitual. Escribe un mensaje claro con todos los detalles necesarios.", "tasks": ["Escribe el saludo y el nombre de la empresa proveedora.", "Indica tu número de cuenta o referencia de cliente.", "Nombra el primer producto y su referencia o código.", "Indica la cantidad exacta que necesitas.", "Añade un segundo producto con su referencia y cantidad.", "Indica la fecha o plazo en que necesitas la entrega.", "Escribe la dirección de entrega.", "Pide confirmación del pedido y termina con tu nombre y datos de contacto."]}'::jsonb),
        (v_item_id, 'de', 'Schreibe eine routinemäßige Produktbestellung', 'Übe, wie man eine klare und vollständige Bestellung an einen Lieferanten schreibt.', '{"scenario": "Du musst bei deinem üblichen Lieferanten eine routinemäßige Bestellung für Reinigungsmaterialien aufgeben. Schreibe eine klare Nachricht mit allen notwendigen Details.", "tasks": ["Schreibe die Begrüßung und den Namen des Lieferanten.", "Nenne deine Kontonummer oder Kundenreferenz.", "Nenne das erste Produkt mit seiner Referenz oder seinem Code.", "Gib die genaue benötigte Menge an.", "Füge ein zweites Produkt mit Referenz und Menge hinzu.", "Nenne das gewünschte Lieferdatum oder den Zeitraum.", "Schreibe die Lieferadresse.", "Bitte um Bestellbestätigung und beende die Nachricht mit deinem Namen und Kontaktdaten."]}'::jsonb);
END;
$seed$;
