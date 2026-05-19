-- ============================================================
-- Seed: A0 English Path – STEP 4000 – Writing – deal with all routine requests for goods or services (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 4000 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'writing';
    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4000, 'en', 'writing', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Escribe solicitudes rutinarias de bienes o servicios', 'Practica un mensaje escrito para pedidos o peticiones habituales en el trabajo.', '{"scenario": "En tu trabajo necesitas hacer una solicitud rutinaria a un proveedor. Quieres escribir un mensaje claro con producto, cantidad, fecha y datos de contacto.", "tasks": ["Escribe el saludo y el nombre de la empresa o persona.", "Indica qué producto o servicio necesitas.", "Di la cantidad o frecuencia exacta.", "Añade un detalle importante como tamaño, modelo o referencia.", "Indica la fecha o franja en la que lo necesitas.", "Escribe el lugar de entrega o el punto de servicio.", "Pide confirmación de disponibilidad, precio o plazo.", "Termina con un agradecimiento y tus datos de contacto."]}'::jsonb),
        (v_item_id, 'de', 'Schreibe routinemäßige Anfragen für Waren oder Dienstleistungen', 'Übe eine schriftliche Nachricht für normale Bestellungen oder Anfragen bei der Arbeit.', '{"scenario": "Bei deiner Arbeit musst du eine routinemäßige Anfrage an einen Lieferanten schicken. Du möchtest eine klare Nachricht mit Produkt, Menge, Termin und Kontaktdaten schreiben.", "tasks": ["Schreibe die Begrüßung und den Namen der Firma oder Person.", "Nenne die Ware oder Dienstleistung, die du brauchst.", "Nenne die genaue Menge oder Häufigkeit.", "Füge ein wichtiges Detail wie Größe, Modell oder Referenz hinzu.", "Nenne das gewünschte Datum oder Lieferfenster.", "Schreibe den Lieferort oder Einsatzort.", "Bitte um Bestätigung von Verfügbarkeit, Preis oder Termin.", "Beende die Nachricht mit einem Dank und deinen Kontaktdaten."]}'::jsonb);
END;
$seed$;
