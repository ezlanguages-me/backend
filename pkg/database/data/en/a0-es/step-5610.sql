-- ============================================================
-- Seed: A0 English Path – STEP 5610 – Reading – understand an academic essay structure (Textos, Ensayos e Investigación)
-- Source language: English
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El ensayo académico tiene tres partes principales: introducción, cuerpo y conclusión.", "p_de": "Der akademische Aufsatz hat drei Hauptteile: Einleitung, Hauptteil und Schluss.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tesis aparece al final de la conclusión.", "p_de": "Die These erscheint am Ende der Schlussfolgerung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Cada párrafo del cuerpo empieza con una oración temática.", "p_de": "Jeder Absatz im Hauptteil beginnt mit einem Themensatz.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La introducción presenta el tema y anticipa los argumentos principales.", "p_de": "Die Einleitung stellt das Thema vor und kündigt die Hauptargumente an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cuerpo del ensayo puede tener solo un párrafo.", "p_de": "Der Hauptteil des Aufsatzes darf nur einen Absatz haben.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las fuentes y la evidencia apoyan las afirmaciones del cuerpo.", "p_de": "Quellen und Belege stützen die Aussagen im Hauptteil.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conclusión presenta argumentos completamente nuevos.", "p_de": "Der Schluss präsentiert völlig neue Argumente.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La conclusión resume los puntos principales y retoma la tesis.", "p_de": "Der Schluss fasst die Hauptpunkte zusammen und greift die These auf.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Dónde aparece la declaración de tesis?", "p_de": "Wo erscheint die Thesenaussage?", "s": {"type": "multiple_choice", "options": ["At the end of the introduction", "In the middle of the conclusion", "In every body paragraph"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la función de la oración temática de un párrafo?", "p_de": "Welche Funktion hat der Themensatz eines Absatzes?", "s": {"type": "multiple_choice", "options": ["To state the main point of that paragraph", "To cite all sources used", "To end the argument"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sigue a la oración temática en un párrafo del cuerpo?", "p_de": "Was folgt im Hauptteil nach dem Themensatz?", "s": {"type": "multiple_choice", "options": ["Evidence and explanation", "The thesis statement again", "A new introduction"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas partes principales tiene un ensayo académico estándar?", "p_de": "Wie viele Hauptteile hat ein akademischer Standardaufsatz?", "s": {"type": "multiple_choice", "options": ["Three", "Five", "One"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace la conclusión con los argumentos del cuerpo?", "p_de": "Was macht der Schluss mit den Argumenten des Hauptteils?", "s": {"type": "multiple_choice", "options": ["Synthesises them and reinforces the thesis", "Adds completely new evidence", "Restates only the introduction word for word"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué proporciona la evidencia en el cuerpo del ensayo?", "p_de": "Was liefert die Evidenz im Hauptteil des Aufsatzes?", "s": {"type": "multiple_choice", "options": ["Support for each topic sentence claim", "A list of all synonyms", "The essay title"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué señal de transición muestra que el autor pasa a un nuevo punto?", "p_de": "Welches Übergangssignal zeigt, dass der Autor zu einem neuen Punkt übergeht?", "s": {"type": "multiple_choice", "options": ["A new topic sentence with a linking phrase", "A larger font size", "A blank page"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve comprender la estructura del ensayo?", "p_de": "Wozu dient das Verständnis der Aufsatzstruktur?", "s": {"type": "multiple_choice", "options": ["To read and write essays more effectively", "To memorise every word", "To avoid using sources"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5610 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5610 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5610, 'en', 'reading', 'academic-essay', 'An academic essay has three main sections: the introduction, the body, and the conclusion. The introduction presents the topic, provides background information, and ends with a thesis statement that tells the reader the main argument of the essay.

The body is divided into paragraphs, and each paragraph develops one idea. It begins with a topic sentence that states the paragraph''s main point. This is followed by evidence from sources, examples, and explanation that support the claim. Using multiple body paragraphs allows the writer to build a layered and persuasive argument.

The conclusion does not introduce new arguments. Instead, it synthesises the key points from the body paragraphs and reinforces the thesis. A strong conclusion also suggests the wider significance of the argument or points to areas for further research.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Comprender la estructura de un ensayo académico', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Die Struktur eines akademischen Aufsatzes verstehen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
