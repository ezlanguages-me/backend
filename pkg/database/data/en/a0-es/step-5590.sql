-- ============================================================
-- Seed: A0 English Path – STEP 5590 – Writing – make notes that are of reasonable use for essay or revision purposes (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5590 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5590, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Tomar notas útiles para un ensayo o repaso', '', '{"scenario": "Lees dos fuentes sobre sueño y tiempo de pantalla y quieres tomar notas ordenadas que luego te sirvan para un ensayo breve o para repasar.", "tasks": ["Anota la pregunta o tema central de las fuentes.", "Separa las ideas principales de cada texto.", "Recoge cifras, ejemplos o comparaciones útiles.", "Agrupa la información por subtemas claros.", "Marca relaciones simples como causa, efecto o contraste.", "Escribe una posible conclusión con tus propias palabras.", "Deja una nota sobre qué fuente apoya mejor cada idea.", "Ordena el conjunto para que te sirva luego en un ensayo o revisión."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Nützliche Notizen für Aufsatz oder Wiederholung machen', '', '{"scenario": "Du liest zwei Quellen über Schlaf und Bildschirmzeit und möchtest geordnete Notizen machen, die später für einen kurzen Aufsatz oder zur Wiederholung nützlich sind.", "tasks": ["Notiere die zentrale Frage oder das Hauptthema der Quellen.", "Trenne die Hauptideen jedes Textes voneinander.", "Sammle nützliche Zahlen, Beispiele oder Vergleiche.", "Ordne die Informationen nach klaren Unterthemen.", "Markiere einfache Beziehungen wie Ursache, Wirkung oder Gegensatz.", "Schreibe eine mögliche Schlussfolgerung mit eigenen Worten auf.", "Notiere, welche Quelle welche Idee am besten stützt.", "Ordne alles so, dass es später für Aufsatz oder Wiederholung nützlich ist."]}'::jsonb);
END;
$seed$;
