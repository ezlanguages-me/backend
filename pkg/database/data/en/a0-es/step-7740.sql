-- ============================================================
-- Seed: A0 English Path - STEP 7740 - Speaking - present using visual aids (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7740 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7740, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Presentar con apoyo visual', 'Practica una presentación corta de conferencia usando una diapositiva sencilla.', '{"scenario": "Vas a hacer una presentación breve en una conferencia con una diapositiva sobre señales de color para salas de estudio silenciosas. Tu diapositiva tiene un título, una foto, tres colores y dos cifras simples.", "tasks": ["Saluda al público y di el tema de tu diapositiva.", "Di qué se ve en la foto.", "Explica qué significa green.", "Explica qué significa yellow y qué significa red.", "Di dos cifras simples de la diapositiva, por ejemplo 3 y 40.", "Cuenta el resultado principal del gráfico.", "Señala la ayuda visual cuando hables de ella.", "Termina con una conclusión corta, por ejemplo que una pequeña tarjeta de color puede ahorrar tiempo."]}'::jsonb),
        (v_speaking_id, 'de', 'Mit visuellen Hilfen präsentieren', 'Übe eine kurze Konferenzpräsentation mit einer einfachen Folie.', '{"scenario": "Du hältst auf einer Konferenz eine kurze Präsentation mit einer Folie über Farbschilder für ruhige Lernräume. Deine Folie hat einen Titel, ein Foto, drei Farben und zwei einfache Zahlen.", "tasks": ["Begrüße das Publikum und nenne das Thema deiner Folie.", "Sag, was man auf dem Foto sieht.", "Erkläre, was green bedeutet.", "Erkläre, was yellow bedeutet und was red bedeutet.", "Nenne zwei einfache Zahlen von der Folie, zum Beispiel 3 und 40.", "Sag das wichtigste Ergebnis aus dem Diagramm.", "Zeige auf die visuelle Hilfe, wenn du darüber sprichst.", "Beende mit einem kurzen Schluss, zum Beispiel dass eine kleine Farbkarte Zeit sparen kann."]}'::jsonb);
END;
$seed$;
