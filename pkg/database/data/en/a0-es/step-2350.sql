-- ============================================================
-- Seed: A0 English Path – STEP 2350 – Speaking – maintain an interaction related to the nature and quality of the food (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2350 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2350, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Criticar una comida de forma sencilla', '', '{"scenario": "Has terminado una comida y quieres hablar de la calidad de varios platos. Describe lo bueno y lo mejorable de forma clara.", "tasks": ["Di qué plato principal has probado.", "Comenta si la comida está fresca o no.", "Habla de la textura de un ingrediente.", "Menciona una parte muy positiva de la comida.", "Menciona un detalle que no te gusta tanto.", "Pide una pequeña mejora, por ejemplo salsa o sal.", "Comenta algo sobre las verduras, el arroz o el pan.", "Termina con una valoración general."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine Mahlzeit einfach bewerten', '', '{"scenario": "Du hast eine Mahlzeit beendet und möchtest über die Qualität mehrerer Gerichte sprechen. Beschreibe klar, was gut war und was besser sein könnte.", "tasks": ["Sage, welches Hauptgericht du probiert hast.", "Kommentiere, ob das Essen frisch ist oder nicht.", "Sprich über die Textur einer Zutat.", "Nenne einen sehr positiven Teil des Essens.", "Nenne ein Detail, das dir weniger gefällt.", "Bitte um eine kleine Verbesserung, zum Beispiel Soße oder Salz.", "Kommentiere etwas über Gemüse, Reis oder Brot.", "Beende mit einer Gesamtbewertung."]}'::jsonb);
END;
$seed$;
