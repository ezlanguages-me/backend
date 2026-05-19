-- ============================================================
-- Seed: A0 English Path – STEP 1190 – Speaking – ask for what is required in a shop and understand the reply (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1190 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1190, 'en', 'speaking', 'shopping')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para pedir un producto concreto en una tienda', 'Practica cómo pedir productos claros en una tienda pequeña y cómo responder a la ayuda del dependiente.', '{"scenario": "Entras en una tienda pequeña porque necesitas varias cosas para clase y para casa. No quieres mirar mucho tiempo: prefieres pedir los productos directamente al dependiente.", "tasks": ["Saluda y di qué producto principal necesitas.", "Añade una cantidad clara, por ejemplo two notebooks o one pack of batteries.", "Pregunta si tienen el producto hoy.", "Pide un segundo producto sencillo, como glue, stamps o tape.", "Pregunta cuánto cuesta uno de los productos.", "Responde si el dependiente ofrece una opción parecida o un tamaño diferente.", "Di cómo pagas y si quieres bolsa o recibo.", "Despídete de forma amable cuando termina la compra."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um in einem Geschäft ein bestimmtes Produkt zu verlangen', 'Übe, wie du in einem kleinen Geschäft klare Produkte verlangst und auf Hilfe des Verkäufers reagierst.', '{"scenario": "Du gehst in ein kleines Geschäft, weil du mehrere Dinge für den Unterricht und für zu Hause brauchst. Du willst nicht lange suchen und fragst die Produkte direkt beim Verkäufer.", "tasks": ["Begrüße den Verkäufer und sag, welches Hauptprodukt du brauchst.", "Nenne eine klare Menge, zum Beispiel two notebooks oder one pack of batteries.", "Frage, ob das Produkt heute da ist.", "Bitte um ein zweites einfaches Produkt wie glue, stamps oder tape.", "Frage, wie viel eines der Produkte kostet.", "Antworte, wenn der Verkäufer eine ähnliche Option oder eine andere Größe anbietet.", "Sag, wie du bezahlst und ob du eine Tasche oder einen Bon möchtest.", "Verabschiede dich freundlich, wenn der Einkauf fertig ist."]}'::jsonb);
END;
$seed$;
