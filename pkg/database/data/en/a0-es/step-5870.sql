-- ============================================================
-- Seed: A0 English Path – STEP 5870 – Speaking – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5870 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5870, 'en', 'speaking', 'Gestión del Estudio y Trámites')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Pide recursos académicos', 'Practica cómo pedir libros, revistas, ordenadores y ayuda en la biblioteca.', '{"scenario": "You are in the library and need academic resources for a class project. Ask for books, journals, a computer, and help using the catalogue.", "tasks": ["Greet the librarian politely.", "Ask for books about your topic.", "Ask where the journals are.", "Ask if you can use a computer.", "Ask if you can print one page.", "Ask how long you can borrow the book.", "Ask what you need to borrow items.", "Finish the conversation politely."]}'::jsonb),
        (v_speaking_id, 'de', 'Bitte um akademische Ressourcen', 'Übe, wie man in der Bibliothek nach Büchern, Zeitschriften, Computern und Hilfe fragt.', '{"scenario": "Du bist in der Bibliothek und brauchst akademische Materialien für ein Projekt. Frage nach Büchern, Zeitschriften, einem Computer und Hilfe beim Katalog.", "tasks": ["Begrüße die Bibliothekarin höflich.", "Bitte um Bücher zu deinem Thema.", "Frage, wo die Zeitschriften sind.", "Frage, ob du einen Computer benutzen darfst.", "Frage, ob du eine Seite drucken kannst.", "Frage, wie lange du das Buch ausleihen darfst.", "Frage, was du zum Ausleihen brauchst.", "Beende das Gespräch höflich."]}'::jsonb);
END;
$seed$;

