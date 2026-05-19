-- ============================================================
-- Seed: A0 English Path – STEP 3930 – Speaking – give detailed product information (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3930 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3930, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Da información detallada sobre un producto', 'Practica una explicación oral de un producto con uso, tamaño, precio y garantía.', '{"scenario": "Un cliente te pide información clara sobre un producto de tu empresa. Quieres practicar una respuesta completa pero sencilla antes de hablar con él.", "tasks": ["Di el nombre del producto y para qué sirve.", "Explica una característica principal, como tamaño o capacidad.", "Añade un segundo detalle técnico fácil de entender.", "Di si el producto está disponible en varios colores o modelos.", "Explica cómo se conecta, se usa o se instala.", "Menciona el precio o el rango de precio.", "Añade información sobre garantía o soporte.", "Termina preguntando si el cliente necesita más detalles."]}'::jsonb),
        (v_item_id, 'de', 'Gib detaillierte Produktinformationen', 'Übe eine mündliche Erklärung eines Produkts mit Nutzung, Größe, Preis und Garantie.', '{"scenario": "Ein Kunde bittet dich um klare Informationen zu einem Produkt deiner Firma. Du möchtest vorher eine vollständige, aber einfache Antwort üben.", "tasks": ["Nenne den Produktnamen und wofür es gedacht ist.", "Erkläre ein Hauptmerkmal wie Größe oder Kapazität.", "Füge ein zweites technisches Detail hinzu, das leicht zu verstehen ist.", "Sag, ob das Produkt in mehreren Farben oder Modellen verfügbar ist.", "Erkläre, wie man es verbindet, benutzt oder installiert.", "Nenne den Preis oder den Preisbereich.", "Füge Informationen zu Garantie oder Support hinzu.", "Beende die Erklärung mit der Frage, ob der Kunde mehr Details braucht."]}'::jsonb);
END;
$seed$;
