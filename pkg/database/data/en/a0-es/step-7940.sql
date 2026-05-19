-- ============================================================
-- Seed: A0 English Path – STEP 7940 – Speaking – answer a set of predictable presentation questions (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7940 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7940, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Responde una serie de preguntas previsibles de presentación', 'Practica una ronda fija de preguntas habituales al final de una presentación breve.', '{"scenario": "Al final de tu presentación, la profesora o el moderador te hace una serie fija de preguntas muy típicas. Responde de forma simple y ordenada.", "tasks": ["Di tu nombre y el título de tu presentación.", "Explica el objetivo principal en una frase corta.", "Di cuánto dura la presentación.", "Menciona cuántos ejemplos o diapositivas tienes.", "Di para qué público es tu presentación.", "Explica dónde están las notas o el folleto.", "Di cuál es el siguiente paso después de la charla.", "Cierra con una frase amable y ofrece una última pregunta."]}'::jsonb),
        (v_speaking_id, 'de', 'Beantworte eine Reihe vorhersehbarer Präsentationsfragen', 'Übe eine feste Runde typischer Fragen am Ende einer kurzen Präsentation.', '{"scenario": "Am Ende deiner Präsentation stellt dir die Lehrerin oder der Moderator eine feste Reihe sehr typischer Fragen. Antworte einfach und geordnet.", "tasks": ["Nenne deinen Namen und den Titel deiner Präsentation.", "Erkläre das Hauptziel in einem kurzen Satz.", "Sag, wie lange die Präsentation dauert.", "Nenne, wie viele Beispiele oder Folien du hast.", "Sag, für welches Publikum deine Präsentation ist.", "Erkläre, wo die Notizen oder der Handzettel liegen.", "Sag, was der nächste Schritt nach dem Vortrag ist.", "Beende mit einem freundlichen Satz und biete eine letzte Frage an."]}'::jsonb);
END;
$seed$;
