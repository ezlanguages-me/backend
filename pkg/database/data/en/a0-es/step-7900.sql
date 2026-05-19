-- ============================================================
-- Seed: A0 English Path – STEP 7900 – Speaking – answer predictable questions (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7900 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7900, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Responde preguntas previsibles sobre tu presentación', 'Practica respuestas cortas a preguntas típicas antes o justo después de una presentación.', '{"scenario": "Has terminado una presentación muy breve y una persona te hace preguntas básicas y previsibles sobre tu tema, tu material y el momento para las preguntas.", "tasks": ["Responde cuál es tu tema.", "Di para quién es la presentación.", "Di cuánto dura tu presentación.", "Explica cuántas diapositivas o materiales usas.", "Di cuándo puede preguntar el público.", "Explica dónde pueden encontrar tus notas o tu folleto.", "Di una ventaja o idea principal de tu tema.", "Termina con una respuesta amable, por ejemplo Thank you for your question."]}'::jsonb),
        (v_speaking_id, 'de', 'Beantworte vorhersehbare Fragen zu deiner Präsentation', 'Übe kurze Antworten auf typische Fragen vor oder direkt nach einer Präsentation.', '{"scenario": "Du hast gerade eine sehr kurze Präsentation beendet, und eine Person stellt dir einfache und vorhersehbare Fragen zu deinem Thema, deinem Material und dem Zeitpunkt für Fragen.", "tasks": ["Beantworte, was dein Thema ist.", "Sag, für wen die Präsentation ist.", "Sag, wie lange deine Präsentation dauert.", "Erkläre, wie viele Folien oder Materialien du benutzt.", "Sag, wann das Publikum Fragen stellen kann.", "Erkläre, wo man deine Notizen oder deinen Handzettel finden kann.", "Nenne einen Vorteil oder eine Hauptidee deines Themas.", "Beende mit einer freundlichen Antwort, zum Beispiel Thank you for your question."]}'::jsonb);
END;
$seed$;
