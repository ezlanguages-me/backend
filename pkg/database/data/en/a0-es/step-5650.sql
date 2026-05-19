-- ============================================================
-- Seed: A0 English Path – STEP 5650 – Reading – understand research methodology (Textos, Ensayos e Investigación)
-- Source language: English
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La investigación cualitativa recoge datos en forma de números y estadísticas.", "p_de": "Qualitative Forschung sammelt Daten in Form von Zahlen und Statistiken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La investigación cuantitativa recoge datos numéricos y medibles.", "p_de": "Quantitative Forschung sammelt numerische und messbare Daten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una hipótesis es una afirmación que puede ser probada o refutada.", "p_de": "Eine Hypothese ist eine Aussage, die überprüft oder widerlegt werden kann.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El tamaño de la muestra no afecta la fiabilidad de los resultados.", "p_de": "Die Stichprobengröße beeinflusst nicht die Zuverlässigkeit der Ergebnisse.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las entrevistas son un método de investigación cualitativa.", "p_de": "Interviews sind eine Methode der qualitativen Forschung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La triangulación mejora la fiabilidad al combinar múltiples métodos.", "p_de": "Triangulation verbessert die Zuverlässigkeit durch die Kombination mehrerer Methoden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las encuestas no pueden usarse para recoger datos cuantitativos.", "p_de": "Umfragen können nicht zur Erhebung quantitativer Daten verwendet werden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La revisión de literatura se hace antes de diseñar la metodología.", "p_de": "Die Literaturrecherche erfolgt vor der Gestaltung der Methodik.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué tipo de investigación analiza experiencias y opiniones?", "p_de": "Welche Forschungsart analysiert Erfahrungen und Meinungen?", "s": {"type": "multiple_choice", "options": ["Qualitative research", "Statistical modelling", "Laboratory experiment"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la función principal de una hipótesis?", "p_de": "Was ist die Hauptfunktion einer Hypothese?", "s": {"type": "multiple_choice", "options": ["To guide the direction of the study by proposing a testable prediction", "To summarise the bibliography", "To replace the conclusion"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué importa el tamaño de la muestra en la investigación cuantitativa?", "p_de": "Warum ist die Stichprobengröße bei quantitativer Forschung wichtig?", "s": {"type": "multiple_choice", "options": ["A larger sample produces more reliable and generalisable results", "A smaller sample is always more accurate", "Sample size has no effect on accuracy"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué es la triangulación en investigación?", "p_de": "Was ist Triangulation in der Forschung?", "s": {"type": "multiple_choice", "options": ["Using multiple methods or sources to confirm findings", "Drawing triangles in diagrams", "Selecting only three participants"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se escribe la sección de metodología en un artículo de investigación?", "p_de": "Wann wird der Methodenteil in einem Forschungsartikel geschrieben?", "s": {"type": "multiple_choice", "options": ["After the literature review and before the results", "Before choosing the research topic", "At the very end after the conclusion"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué herramienta se usa frecuentemente en la investigación cuantitativa?", "p_de": "Welches Instrument wird häufig in der quantitativen Forschung verwendet?", "s": {"type": "multiple_choice", "options": ["Surveys with numerical scales", "Open-ended interview scripts", "Narrative diaries"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál de los siguientes es un ejemplo de dato cualitativo?", "p_de": "Welches der folgenden Beispiele ist ein qualitativer Datensatz?", "s": {"type": "multiple_choice", "options": ["A participant''s personal account of their experience", "The average test score of 200 students", "A percentage from a government report"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué es importante la revisión de literatura antes de la metodología?", "p_de": "Warum ist die Literaturrecherche vor der Methodik wichtig?", "s": {"type": "multiple_choice", "options": ["It reveals existing knowledge and informs the research design", "It replaces the need for data collection", "It provides the final conclusion"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5650 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5650 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5650, 'en', 'reading', 'research-methodology', 'Research methodology refers to the systematic plan a researcher follows to collect and analyse data. Choosing the right methodology is one of the most important steps in any academic study.

Qualitative research explores experiences, opinions, and meanings. Methods such as interviews, focus groups, and observations allow researchers to gain in-depth understanding of a topic. The data produced is usually descriptive rather than numerical.

Quantitative research, on the other hand, collects numerical data that can be measured and statistically analysed. Surveys with rating scales, controlled experiments, and standardised tests are common tools. A larger sample size generally leads to more reliable results.

Before choosing a methodology, researchers conduct a literature review to understand what is already known about the topic. They then formulate a hypothesis — a testable prediction that the study aims to confirm or disprove. Using triangulation, which means combining multiple methods or data sources, increases the credibility and reliability of the findings.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Comprender la metodología de investigación', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Forschungsmethodik verstehen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
