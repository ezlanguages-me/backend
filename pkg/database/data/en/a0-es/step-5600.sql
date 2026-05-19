-- ============================================================
-- Seed: A0 English Path – STEP 5600 – Writing – academic note-taking from written sources (Textos, Ensayos e Investigación)
-- Source language: English
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5600 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5600, 'en', 'writing', 'academic-essay')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Tomar notas académicas de fuentes escritas', '', '{"scenario": "Estás preparando un ensayo sobre desigualdad social y debes tomar notas académicas a partir de tres artículos sobre el tema para organizar tus argumentos.", "tasks": ["Identifica la tesis principal de cada artículo sobre desigualdad.", "Anota dos o tres argumentos clave de cada fuente con tus propias palabras.", "Copia una cita textual breve que pueda apoyar tu argumento central.", "Distingue entre hechos, datos estadísticos y opiniones del autor.", "Escribe la referencia básica de cada fuente junto a las notas.", "Agrupa ideas similares de las tres fuentes bajo un mismo concepto.", "Marca qué ideas contradicen o complementan tu argumento.", "Organiza las notas en un esquema útil para redactar el ensayo."]}'::jsonb);

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Akademische Notizen aus schriftlichen Quellen machen', '', '{"scenario": "Du bereitest einen Aufsatz über soziale Ungleichheit vor und musst aus drei Artikeln zu diesem Thema akademische Notizen machen, um deine Argumente zu ordnen.", "tasks": ["Bestimme die Hauptthese jedes Artikels über Ungleichheit.", "Notiere zwei oder drei Kernargumente jeder Quelle mit eigenen Worten.", "Kopiere ein kurzes wörtliches Zitat, das dein Hauptargument stützen kann.", "Unterscheide zwischen Fakten, statistischen Daten und Autorenmeinungen.", "Schreibe die Grundreferenz jeder Quelle neben die Notizen.", "Ordne ähnliche Ideen aus allen drei Quellen unter einem gemeinsamen Konzept.", "Markiere, welche Ideen deinem Argument widersprechen oder es ergänzen.", "Ordne die Notizen in einer nützlichen Gliederung für den Aufsatz."]}'::jsonb);
END;
$seed$;
