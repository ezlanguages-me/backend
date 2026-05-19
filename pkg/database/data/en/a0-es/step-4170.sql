-- ============================================================
-- Seed: A0 English Path – STEP 4170 – Speaking – demonstrate a product or service (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4170 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4170, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Demuestra un producto o servicio', 'Practica cómo hacer una presentación oral de un producto o servicio con características, precios y beneficios.', '{"scenario": "Tienes que hacer una demostración oral de un producto o servicio de tu empresa a un cliente potencial. Quieres destacar las características clave y convencer al cliente de su valor.", "tasks": ["Saluda al cliente y preséntate con tu nombre y empresa.", "Presenta el nombre del producto o servicio que vas a demostrar.", "Describe la primera característica principal con un dato concreto.", "Explica el principal beneficio para el cliente.", "Menciona una segunda característica o ventaja diferencial.", "Di el precio y las condiciones de garantía.", "Explica los pasos para hacer el pedido o contratar el servicio.", "Termina invitando al cliente a hacer preguntas."]}'::jsonb),
        (v_item_id, 'de', 'Demonstriere ein Produkt oder eine Dienstleistung', 'Übe eine mündliche Präsentation eines Produkts oder einer Dienstleistung mit Eigenschaften, Preisen und Vorteilen.', '{"scenario": "Du musst einem potenziellen Kunden ein Produkt oder eine Dienstleistung deines Unternehmens mündlich demonstrieren. Du möchtest die wichtigsten Merkmale hervorheben und den Kunden von seinem Wert überzeugen.", "tasks": ["Begrüße den Kunden und stelle dich mit Name und Unternehmen vor.", "Präsentiere den Namen des Produkts oder der Dienstleistung, die du demonstrierst.", "Beschreibe das erste Hauptmerkmal mit einer konkreten Zahl.", "Erkläre den Hauptnutzen für den Kunden.", "Nenne ein zweites Merkmal oder einen Differenzierungsvorteil.", "Nenne den Preis und die Garantiebedingungen.", "Erkläre die Schritte zur Bestellung oder Buchung des Dienstes.", "Beende mit einer Einladung an den Kunden, Fragen zu stellen."]}'::jsonb);
END;
$seed$;
