-- ============================================================
-- Seed: A0 English Path – STEP 5180 – Speaking – ask detailed questions (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5180 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5180, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Hacer preguntas detalladas', '', '{"scenario": "Después de leer un texto o escuchar una exposición académica, quieres hacer preguntas más detalladas sobre datos, método, límites y siguientes pasos.", "tasks": ["Presenta brevemente a qué estudio o presentación te refieres.", "Pregunta por un número, porcentaje o dato concreto.", "Pregunta cómo se obtuvo ese dato.", "Pide un ejemplo que apoye la conclusión.", "Pregunta por una limitación del estudio o del proyecto.", "Pregunta qué comparación sería útil en el futuro.", "Resume con una frase lo que has entendido antes de seguir.", "Cierra con una última pregunta o un agradecimiento."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Detaillierte Fragen stellen', '', '{"scenario": "Nach einem Text oder einer akademischen Präsentation möchtest du detailliertere Fragen zu Daten, Methode, Grenzen und nächsten Schritten stellen.", "tasks": ["Sag kurz, auf welche Studie oder Präsentation du dich beziehst.", "Frag nach einer Zahl, einem Prozentsatz oder einer konkreten Information.", "Frag, wie diese Information gewonnen wurde.", "Bitte um ein Beispiel, das die Schlussfolgerung stützt.", "Frag nach einer Grenze der Studie oder des Projekts.", "Frag, welcher Vergleich in Zukunft nützlich wäre.", "Fass mit einem Satz zusammen, was du verstanden hast.", "Beende deinen Beitrag mit einer letzten Frage oder einem Dank."]}'::jsonb);
END;
$seed$;
