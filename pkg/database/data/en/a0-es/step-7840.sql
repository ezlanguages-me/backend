-- ============================================================
-- Seed: A0 English Path - STEP 7840 - Speaking - answer factual questions in Q&A (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7840 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7840, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Responder preguntas factuales en una sesión de preguntas y respuestas', 'Practica respuestas breves y claras después de una presentación.', '{"scenario": "Después de tu charla, el público te hace preguntas factuales sobre tu proyecto de señales para salas de estudio. Debes responder con datos breves y claros.", "tasks": ["Escucha o repite la pregunta con una frase corta.", "Da una respuesta con un número cuando sea necesario, por ejemplo 3 o 40.", "Explica el significado de un color si te preguntan por una señal.", "Responde sobre el material si te preguntan por las tarjetas.", "Mantén cada respuesta en una o dos frases simples.", "Si no entiendes bien, pide que repitan la pregunta de forma educada.", "Usa un tono tranquilo y profesional.", "Termina con una frase amable, por ejemplo Thank you for the question."]}'::jsonb),
        (v_speaking_id, 'de', 'Sachfragen in einer Fragerunde beantworten', 'Übe kurze und klare Antworten nach einer Präsentation.', '{"scenario": "Nach deinem Vortrag stellt dir das Publikum Sachfragen zu deinem Projekt mit Schildern für Lernräume. Du sollst kurz und klar mit Fakten antworten.", "tasks": ["Höre zu oder wiederhole die Frage in einem kurzen Satz.", "Gib eine Antwort mit einer Zahl, wenn nötig, zum Beispiel 3 oder 40.", "Erkläre die Bedeutung einer Farbe, wenn nach einem Schild gefragt wird.", "Antworte zum Material, wenn nach den Karten gefragt wird.", "Halte jede Antwort in ein oder zwei einfachen Sätzen.", "Wenn du die Frage nicht gut verstehst, bitte höflich um Wiederholung.", "Benutze einen ruhigen und professionellen Ton.", "Beende mit einem freundlichen Satz, zum Beispiel Thank you for the question."]}'::jsonb);
END;
$seed$;
