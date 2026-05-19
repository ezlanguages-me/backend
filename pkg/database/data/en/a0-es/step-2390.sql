-- ============================================================
-- Seed: A0 English Path – STEP 2390 – Speaking – understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2390 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2390, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Describir platos con vocabulario culinario sencillo', '', '{"scenario": "Quieres hablar de platos del menú usando algunas palabras culinarias como grilled, roasted o creamy. Describe dos platos y explica qué significan esas palabras.", "tasks": ["Nombra un plato con grilled o roasted.", "Explica qué significa grilled o roasted.", "Nombra una sopa creamy u otro plato similar.", "Di qué ingrediente principal tiene ese plato.", "Usa la palabra marinated o crispy en una frase.", "Comenta si el plato te parece ligero, fuerte o fresco.", "Elige el plato que pedirías.", "Termina con una opinión general sobre el menú."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Gerichte mit einfachem Küchenvokabular beschreiben', '', '{"scenario": "Du möchtest über Gerichte auf der Speisekarte mit einigen Küchenwörtern wie grilled, roasted oder creamy sprechen. Beschreibe zwei Gerichte und erkläre, was diese Wörter bedeuten.", "tasks": ["Nenne ein Gericht mit grilled oder roasted.", "Erkläre, was grilled oder roasted bedeutet.", "Nenne eine creamy soup oder ein ähnliches Gericht.", "Sage, welche Hauptzutat dieses Gericht hat.", "Benutze das Wort marinated oder crispy in einem Satz.", "Kommentiere, ob das Gericht leicht, kräftig oder frisch wirkt.", "Wähle das Gericht, das du bestellen würdest.", "Beende mit einer allgemeinen Meinung über die Speisekarte."]}'::jsonb);
END;
$seed$;
