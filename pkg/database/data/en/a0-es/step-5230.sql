-- ============================================================
-- Seed: A0 English Path – STEP 5230 – Speaking – present detailed academic content (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5230 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5230, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Presentar contenido académico detallado', '', '{"scenario": "Vas a presentar un pequeño estudio académico y quieres explicar el tema, el método, algunos resultados y una conclusión clara.", "tasks": ["Presenta el tema y la pregunta principal del estudio.", "Explica quién participó o cuál fue la muestra.", "Describe el método con dos o tres pasos claros.", "Da uno o dos resultados con números o comparaciones.", "Explica una limitación del estudio.", "Añade una conclusión simple sobre lo que significan los resultados.", "Menciona cuál podría ser el siguiente paso de investigación.", "Cierra la presentación con una frase clara y académica."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Detaillierte akademische Inhalte präsentieren', '', '{"scenario": "Du präsentierst eine kleine akademische Studie und möchtest Thema, Methode, Ergebnisse und eine klare Schlussfolgerung erklären.", "tasks": ["Stell Thema und Hauptfrage der Studie vor.", "Erkläre, wer teilnahm oder wie die Stichprobe aussah.", "Beschreibe die Methode in zwei oder drei klaren Schritten.", "Nenne ein oder zwei Ergebnisse mit Zahlen oder Vergleichen.", "Erkläre eine Grenze der Studie.", "Füge einen einfachen Schluss hinzu, was die Ergebnisse bedeuten.", "Nenne, was der nächste Forschungsschritt sein könnte.", "Beende die Präsentation mit einem klaren akademischen Satz."]}'::jsonb);
END;
$seed$;
