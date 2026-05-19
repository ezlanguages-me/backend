-- ============================================================
-- Seed: A0 English Path – STEP 620 – Writing – leave a simple message for host family saying, for example, where (s)he has gone, what time (s)he will be back (Convivencia)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM writing WHERE step_order = 620 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 620, 'en', 'writing', 'social')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Mensaje para la familia anfitriona', '', '{"scenario": "Has salido de casa y tu familia anfitriona no está. Escribe una nota o un mensaje corto para decir dónde estás, por qué has salido y a qué hora vuelves.", "tasks": ["Empieza con un saludo corto para tu familia anfitriona.", "Di adónde has ido, por ejemplo al supermercado o a la biblioteca.", "Explica en una frase simple por qué has salido.", "Di a qué hora vas a volver.", "Termina con una despedida breve y amable."]}'::jsonb);

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Nachricht an die Gastfamilie', '', '{"scenario": "Du bist aus dem Haus gegangen und deine Gastfamilie ist nicht da. Schreib eine kurze Notiz oder Nachricht, um zu sagen, wo du bist, warum du weggegangen bist und wann du zurückkommst.", "tasks": ["Beginne mit einer kurzen Begrüßung an deine Gastfamilie.", "Sag, wohin du gegangen bist, zum Beispiel in den Supermarkt oder in die Bibliothek.", "Erkläre in einem einfachen Satz, warum du weggegangen bist.", "Sag, um wie viel Uhr du zurückkommst.", "Beende die Nachricht mit einer kurzen und freundlichen Verabschiedung."]}'::jsonb);
END;
$seed$;
