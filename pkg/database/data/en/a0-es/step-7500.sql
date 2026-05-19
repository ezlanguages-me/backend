-- ============================================================
-- Seed: A0 English Path – STEP 7500 – Speaking – make a limited contribution to meetings on practical matters, for example problem-solving, where the language level is relatively simple (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7500 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7500, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Contribuye brevemente a una reunión para resolver un problema', 'Practica decir el problema, sugerir una solución y confirmar el siguiente paso con frases simples.', '{"scenario": "Estás en una reunión corta antes de empezar. La impresora no funciona bien y el equipo necesita una solución simple.", "tasks": ["Di cuál es el problema con una frase corta.", "Explica una cosa que ya revisaste.", "Sugiere una solución simple.", "Di si estás de acuerdo o no con otra idea.", "Haz una pregunta corta para comprobar el problema.", "Ofrece hacer una acción ahora mismo.", "Confirma cuál es el siguiente paso si el problema continúa.", "Termina con una frase breve como I will test it now."]}'::jsonb),
        (v_speaking_id, 'de', 'Leiste einen kurzen Beitrag zu einem Problemlösungs-Meeting', 'Übe, das Problem zu nennen, eine Lösung vorzuschlagen und den nächsten Schritt mit einfachen Sätzen zu bestätigen.', '{"scenario": "Du bist in einem kurzen Meeting vor dem Start. Der Drucker funktioniert nicht gut, und das Team braucht eine einfache Lösung.", "tasks": ["Nenne das Problem mit einem kurzen Satz.", "Erkläre eine Sache, die du schon geprüft hast.", "Schlage eine einfache Lösung vor.", "Sag, ob du einer anderen Idee zustimmst oder nicht.", "Stelle eine kurze Frage, um das Problem zu prüfen.", "Biete an, jetzt sofort eine Handlung zu machen.", "Bestätige den nächsten Schritt, falls das Problem bleibt.", "Beende mit einem kurzen Satz wie I will test it now."]}'::jsonb);
END;
$seed$;
