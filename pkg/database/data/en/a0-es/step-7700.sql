-- ============================================================
-- Seed: A0 English Path - STEP 7700 - Speaking - understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7700 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7700, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Explicar la idea general de una presentación con apoyo visual', 'Habla sobre lo esencial de una presentación sencilla de conferencia con diapositivas e imágenes.', '{"scenario": "Has visto una presentación sencilla en una conferencia sobre señales de color para salas de estudio. Las diapositivas tienen una foto de tres puertas, colores y un gráfico simple. Ahora explicas a otra persona la idea general de la presentación.", "tasks": ["Di cuál era el tema principal de la presentación.", "Menciona qué mostraban los tres colores.", "Describe una imagen o visual que recuerdes de la diapositiva.", "Di quién usa este sistema.", "Menciona una cifra simple de la presentación, por ejemplo 3 o 40.", "Explica cuál era el problema antes de usar las señales.", "Di el resultado principal con una frase corta.", "Termina con una idea general, por ejemplo que las ayudas visuales simples ahorran tiempo."]}'::jsonb),
        (v_speaking_id, 'de', 'Die Grundidee einer Präsentation mit Bildern erklären', 'Sprich über das Wesentliche einer einfachen Konferenzpräsentation mit Folien und Bildern.', '{"scenario": "Du hast auf einer Konferenz eine einfache Präsentation über Farbschilder für Lernräume gesehen. Die Folien zeigen ein Foto von drei Türen, Farben und ein einfaches Diagramm. Jetzt erklärst du einer anderen Person die Grundidee der Präsentation.", "tasks": ["Sag, was das Hauptthema der Präsentation war.", "Nenne, was die drei Farben gezeigt haben.", "Beschreibe ein Bild oder eine visuelle Hilfe, an die du dich erinnerst.", "Sag, wer dieses System benutzt.", "Nenne eine einfache Zahl aus der Präsentation, zum Beispiel 3 oder 40.", "Erkläre, was das Problem vor den Schildern war.", "Sag das wichtigste Ergebnis in einem kurzen Satz.", "Beende mit einer allgemeinen Idee, zum Beispiel dass einfache visuelle Hilfen Zeit sparen."]}'::jsonb);
END;
$seed$;
