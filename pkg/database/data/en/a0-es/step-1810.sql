-- ============================================================
-- Seed: A0 English Path – STEP 1810 – Speaking – bargain in the market place (minimal) (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1810 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1810, 'en', 'speaking', 'Compras y Transacciones') RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Hablar con gestos y un pequeño regateo', '', '{"scenario": "Estás en un mercado al aire libre. Quieres comprar uno o dos productos sencillos y pedir un precio un poco mejor usando palabras básicas y gestos.", "tasks": ["Di qué producto quieres comprar.", "Pregunta el precio con una frase corta.", "Usa los dedos para mostrar la cantidad.", "Pide un precio un poco más bajo.", "Pregunta si el vendedor puede incluir una bolsa.", "Di cuánto quieres pagar.", "Acepta o rechaza con una frase muy simple.", "Termina con gracias."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Mit Gesten und kleinem Handeln sprechen', '', '{"scenario": "Du bist auf einem offenen Markt. Du möchtest ein oder zwei einfache Produkte kaufen und mit einfachen Worten und Gesten um einen etwas besseren Preis bitten.", "tasks": ["Sage, welches Produkt du kaufen möchtest.", "Frage mit einem kurzen Satz nach dem Preis.", "Zeige die Menge mit den Fingern.", "Bitte um einen etwas niedrigeren Preis.", "Frage, ob der Verkäufer eine Tasche dazugibt.", "Sage, wie viel du zahlen möchtest.", "Nimm an oder lehne mit einem sehr einfachen Satz ab.", "Beende mit einem Dank."]}'::jsonb);
END;
$seed$;
