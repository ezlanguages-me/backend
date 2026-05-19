-- ============================================================
-- Seed: A0 English Path – STEP 3800 – Speaking – state simple requirements within own job area (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3800 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3800, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Indica requisitos simples de trabajo', 'Practica una petición profesional simple para pedir productos o cantidades en tu trabajo.', '{"scenario": "Trabajas en una pequeña oficina y necesitas pedir material para la próxima semana. Quieres practicar cómo decir cantidades, colores y fecha de entrega con claridad.", "tasks": ["Saluda y di el nombre de tu empresa o departamento.", "Explica qué producto necesitas.", "Di una cantidad exacta, por ejemplo 25 unidades.", "Añade un detalle como color, tamaño o modelo.", "Indica cuándo necesitas la entrega.", "Di a qué dirección o zona de trabajo debe llegar el pedido.", "Pregunta si el producto está disponible o si el proveedor puede confirmarlo.", "Cierra la petición con agradecimiento y una frase profesional."]}'::jsonb),
        (v_item_id, 'de', 'Nenne einfache Arbeitsanforderungen', 'Übe eine einfache berufliche Anfrage, um Produkte oder Mengen bei der Arbeit zu bestellen.', '{"scenario": "Du arbeitest in einem kleinen Büro und musst Material für die nächste Woche bestellen. Du möchtest üben, wie man Mengen, Farben und Lieferdaten klar nennt.", "tasks": ["Begrüße die Person und nenne deine Firma oder Abteilung.", "Erkläre, welches Produkt du brauchst.", "Nenne eine genaue Menge, zum Beispiel 25 Stück.", "Füge ein Detail wie Farbe, Größe oder Modell hinzu.", "Sag, wann du die Lieferung brauchst.", "Nenne die Adresse oder den Arbeitsbereich für die Lieferung.", "Frage, ob das Produkt verfügbar ist oder ob der Anbieter es bestätigen kann.", "Beende die Anfrage mit einem Dank und einem professionellen Satz."]}'::jsonb);
END;
$seed$;
