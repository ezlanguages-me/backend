-- ============================================================
-- Seed: A0 English Path – STEP 1310 – Speaking – understand where the shopkeeper explains the difference between two or more products (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1310 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1310, 'en', 'speaking', 'shopping')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para comparar productos en una tienda', 'Practica cómo pedir una comparación sencilla entre dos productos antes de decidir qué comprar.', '{"scenario": "Estás en una tienda y dudas entre dos productos parecidos, por ejemplo dos paraguas, dos mochilas o dos chaquetas. Quieres que el dependiente te explique las diferencias y después elegir uno.", "tasks": ["Saluda y di que quieres comparar dos productos.", "Nombra los dos productos o señala sus colores o tamaños.", "Pregunta cuál es más ligero, más grande o más fuerte.", "Pregunta por el precio de cada opción.", "Explica para qué lo necesitas, por ejemplo for school or for rain.", "Responde cuando el dependiente recomienda una opción.", "Di cuál producto eliges y por qué.", "Termina pidiendo bolsa, recibo o forma de pago y despídete."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um Produkte in einem Geschäft zu vergleichen', 'Übe, wie du vor dem Kauf einen einfachen Vergleich zwischen zwei Produkten verlangst.', '{"scenario": "Du bist in einem Geschäft und zweifelst zwischen zwei ähnlichen Produkten, zum Beispiel zwei Regenschirmen, zwei Rucksäcken oder zwei Jacken. Du möchtest, dass der Verkäufer die Unterschiede erklärt, und danach eins auswählen.", "tasks": ["Begrüße den Verkäufer und sag, dass du zwei Produkte vergleichen möchtest.", "Nenne die zwei Produkte oder zeige auf Farben oder Größen.", "Frage, welches leichter, größer oder stabiler ist.", "Frage nach dem Preis jeder Option.", "Erkläre, wofür du das Produkt brauchst, zum Beispiel for school oder for rain.", "Antworte, wenn der Verkäufer eine Option empfiehlt.", "Sag, welches Produkt du wählst und warum.", "Beende das Gespräch mit Tasche, Bon oder Bezahlung und verabschiede dich."]}'::jsonb);
END;
$seed$;
