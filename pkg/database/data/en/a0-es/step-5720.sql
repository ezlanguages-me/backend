-- ============================================================
-- Seed: A0 English Path – STEP 5720 – Reading – access all sources of information quickly and reliably (Textos, Ensayos e Investigación)
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
        '{"p": "Los libros de texto suelen dar visión general y definiciones.", "p_de": "Lehrbücher geben meist Überblick und Definitionen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los artículos de revista ofrecen investigación más centrada.", "p_de": "Zeitschriftenartikel bieten stärker fokussierte Forschung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las ponencias de congreso suelen mostrar trabajo reciente.", "p_de": "Konferenzbeiträge zeigen oft aktuelle Arbeit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El catálogo de biblioteca es la mejor herramienta para encontrar libros y ebooks.", "p_de": "Der Bibliothekskatalog ist das beste Werkzeug, um Bücher und E-Books zu finden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "JSTOR y Google Scholar ayudan a encontrar artículos y ponencias.", "p_de": "JSTOR und Google Scholar helfen, Artikel und Konferenzbeiträge zu finden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Todos los materiales académicos se abren siempre directamente sin acceso institucional.", "p_de": "Alle wissenschaftlichen Materialien öffnen sich immer direkt ohne institutionellen Zugang.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Algunos materiales impresos se recogen usando la signatura en la biblioteca.", "p_de": "Einige gedruckte Materialien holt man mit der Signatur in der Bibliothek ab.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Saber qué herramienta corresponde a cada tipo de fuente ahorra tiempo.", "p_de": "Zu wissen, welches Werkzeug zu welchem Quellentyp passt, spart Zeit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Qué tipo de fuente da visión general y definiciones?", "p_de": "Welche Quellenart gibt Überblick und Definitionen?", "s": {"type": "multiple_choice", "options": ["Textbooks", "Parking permits", "Lecture posters"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de fuente ofrece investigación centrada?", "p_de": "Welche Quellenart bietet fokussierte Forschung?", "s": {"type": "multiple_choice", "options": ["Journal articles", "Printer manuals", "Bus tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué muestran a menudo las ponencias de congreso?", "p_de": "Was zeigen Konferenzbeiträge oft?", "s": {"type": "multiple_choice", "options": ["Recent work", "Loan fines", "Building repairs"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué herramienta es mejor para libros y ebooks?", "p_de": "Welches Werkzeug ist für Bücher und E-Books am besten?", "s": {"type": "multiple_choice", "options": ["The library catalogue", "The weather app", "The cafeteria screen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué herramientas ayudan a encontrar artículos y ponencias?", "p_de": "Welche Werkzeuge helfen, Artikel und Konferenzbeiträge zu finden?", "s": {"type": "multiple_choice", "options": ["Subject databases, JSTOR, and Google Scholar", "Only the printer queue", "Only the student map"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede requerir una fuente para abrirse?", "p_de": "Was kann eine Quelle zum Öffnen erfordern?", "s": {"type": "multiple_choice", "options": ["Institutional login", "A bicycle helmet", "A lab coat only"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se recogen algunos materiales impresos?", "p_de": "Wie holt man einige gedruckte Materialien ab?", "s": {"type": "multiple_choice", "options": ["By call number from the library", "By email from the lecturer", "By phone from the café"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la ventaja principal de elegir bien la herramienta?", "p_de": "Was ist der Hauptvorteil der richtigen Werkzeugwahl?", "s": {"type": "multiple_choice", "options": ["It saves study time", "It changes the author", "It removes all citations"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5720 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5720 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5720, 'en', 'reading', 'academic', 'Different academic questions require different source types. Textbooks give overview and definitions, journal articles provide focused research, and conference papers often show recent work before it appears in a journal.

To reach these sources quickly, use the right access point. A library catalogue is best for books and ebooks. Subject databases, JSTOR, and Google Scholar help you find articles and conference papers, while citation links can lead from one useful source to another.

Reliable access also means checking availability and access route. Some items open directly online, some require institutional login, and some printed materials must be collected by call number from the library. Knowing which tool matches each source type saves time during study.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Acceder a fuentes académicas con rapidez y fiabilidad', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Schnell und zuverlässig auf akademische Quellen zugreifen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
