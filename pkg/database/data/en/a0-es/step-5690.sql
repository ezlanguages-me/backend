-- ============================================================
-- Seed: A0 English Path – STEP 5690 – Reading – scan articles, textbooks etc. to form reliable judgements as to relevance/usefulness (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- 8 true_false exercises first
        '{"p": "El macro-scan mira la estructura general del texto.", "p_de": "Der Macro-Scan betrachtet die Gesamtstruktur des Textes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En el macro-scan puedes mirar título, introducción, conclusión y diagramas.", "p_de": "Beim Macro-Scan kann man Titel, Einleitung, Schluss und Diagramme ansehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El meso-scan se centra en títulos de sección, términos en negrita y tablas.", "p_de": "Der Meso-Scan konzentriert sich auf Abschnittsüberschriften, fett gedruckte Begriffe und Tabellen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El micro-scan exige leer cada línea del libro o artículo.", "p_de": "Der Micro-Scan verlangt, jede Zeile des Buches oder Artikels zu lesen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "En el micro-scan se leen las frases iniciales de algunos párrafos.", "p_de": "Beim Micro-Scan liest man die Anfangssätze einiger Absätze.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las tres técnicas ayudan a juzgar relevancia y utilidad sin leerlo todo.", "p_de": "Die drei Techniken helfen, Relevanz und Nutzen zu beurteilen, ohne alles zu lesen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El meso-scan puede mostrar qué subtemas cubre un texto.", "p_de": "Der Meso-Scan kann zeigen, welche Unterthemen ein Text behandelt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto diferencia entre macro-scan, meso-scan y micro-scan.", "p_de": "Der Text unterscheidet zwischen Macro-Scan, Meso-Scan und Micro-Scan.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Qué técnica mira primero la estructura global?", "p_de": "Welche Technik betrachtet zuerst die Gesamtstruktur?", "s": {"type": "multiple_choice", "options": ["Macro-scan", "Meso-scan", "Micro-scan"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué elementos pertenecen al meso-scan?", "p_de": "Welche Elemente gehören zum Meso-Scan?", "s": {"type": "multiple_choice", "options": ["Section headings, bold terms, tables, and captions", "Only the bibliography", "Only the page color"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces en el micro-scan?", "p_de": "Was macht man beim Micro-Scan?", "s": {"type": "multiple_choice", "options": ["Read opening sentences of selected paragraphs", "Memorize all footnotes", "Print the whole article"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirven juntas las tres técnicas?", "p_de": "Wozu dienen die drei Techniken zusammen?", "s": {"type": "multiple_choice", "options": ["To judge relevance and usefulness quickly", "To replace all note taking", "To check room equipment"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede mostrar un diagrama en el macro-scan?", "p_de": "Was kann ein Diagramm im Macro-Scan zeigen?", "s": {"type": "multiple_choice", "options": ["What the text is trying to do overall", "Who borrowed the book", "How the library is painted"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué te indican los términos en negrita?", "p_de": "Was zeigen fett gedruckte Begriffe an?", "s": {"type": "multiple_choice", "options": ["Important subtopics or key concepts", "The final exam date", "A telephone extension"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué frase puede leerse además de la inicial en el micro-scan?", "p_de": "Welchen Satz kann man neben dem ersten im Micro-Scan noch lesen?", "s": {"type": "multiple_choice", "options": ["The final sentence when needed", "Only the title page", "Only the author signature"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de juicio permite este método?", "p_de": "Welche Art von Urteil erlaubt diese Methode?", "s": {"type": "multiple_choice", "options": ["A reliable judgement about relevance and usefulness", "A pronunciation score", "A booking confirmation"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5690 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5690 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5690, 'en', 'reading', 'academic', 'When you need a reliable judgement quickly, begin with macro-scan. Look at the overall structure: title, introduction, conclusion, chapter titles, and diagrams. This tells you what the article or textbook is trying to do before you read details.

Next, use meso-scan. Move through section headings, bold terms, tables, and figure captions. These middle level signals show which subtopics are covered and where the most useful section may be located.

Finally, use micro-scan on a few paragraphs. Read the opening sentence of each paragraph and, when needed, the final sentence to confirm the direction of the argument. Together, macro-scan, meso-scan, and micro-scan help you judge relevance and usefulness without reading every line.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Escanear fuentes para juzgar relevancia y utilidad', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Quellen scannen und Relevanz beurteilen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
