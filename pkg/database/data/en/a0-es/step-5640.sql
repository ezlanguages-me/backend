-- ============================================================
-- Seed: A0 English Path – STEP 5640 – Speaking – explain your essay planning process (Textos, Ensayos e Investigación)
-- Source language: English
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5640 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5640, 'en', 'speaking', 'academic-essay')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Explica tu proceso de planificación de ensayos', '', '{"scenario": "Imagina que le explicas a un compañero nuevo cómo planificas un ensayo académico antes de empezar a escribir. Describe cada etapa de tu proceso con detalle.", "tasks": ["Explica cómo eliges y delimitas el tema del ensayo.", "Describe cómo identificas las fuentes principales que vas a usar.", "Explica cómo organizas las ideas antes de escribir.", "Describe cómo decides cuántos párrafos del cuerpo necesitas.", "Explica cómo formulas tu tesis antes de comenzar el borrador.", "Describe qué herramientas o estrategias usas para hacer el esquema.", "Explica cómo decides el orden de los argumentos en el cuerpo.", "Describe cómo sabes cuándo estás listo para empezar a escribir."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Erkläre deinen Aufsatzplanungsprozess', '', '{"scenario": "Stell dir vor, du erklärst einem neuen Kommilitonen, wie du einen akademischen Aufsatz planst, bevor du anfängst zu schreiben. Beschreibe jeden Schritt deines Prozesses ausführlich.", "tasks": ["Erkläre, wie du das Thema des Aufsatzes wählst und eingrenzt.", "Beschreibe, wie du die wichtigsten Quellen identifizierst, die du verwenden wirst.", "Erkläre, wie du Ideen organisierst, bevor du schreibst.", "Beschreibe, wie du entscheidest, wie viele Hauptabsätze du brauchst.", "Erkläre, wie du deine These formulierst, bevor du den Entwurf beginnst.", "Beschreibe, welche Werkzeuge oder Strategien du zum Erstellen einer Gliederung verwendest.", "Erkläre, wie du die Reihenfolge der Argumente im Hauptteil festlegst.", "Beschreibe, woran du erkennst, dass du bereit bist, mit dem Schreiben zu beginnen."]}'::jsonb);
END;
$seed$;
