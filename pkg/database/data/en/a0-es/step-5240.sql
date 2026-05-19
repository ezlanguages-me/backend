-- ============================================================
-- Seed: A0 English Path – STEP 5240 – Reading – understand a presentation structure (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La primera diapositiva introduce el tema con una pregunta inicial.", "p_de": "Die erste Folie führt das Thema mit einer Einstiegsfrage ein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda diapositiva explica por qué el problema importa.", "p_de": "Die zweite Folie erklärt, warum das Problem wichtig ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tercera diapositiva presenta resultados con un gráfico.", "p_de": "Die dritte Folie zeigt Ergebnisse mit einem Diagramm.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La cuarta diapositiva presenta el resultado principal con un gráfico.", "p_de": "Die vierte Folie zeigt das Hauptergebnis mit einem Diagramm.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La quinta diapositiva menciona una limitación del estudio.", "p_de": "Die fünfte Folie nennt eine Grenze der Studie.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sexta diapositiva ofrece conclusión y recomendación.", "p_de": "Die sechste Folie bietet Schluss und Empfehlung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La última diapositiva invita a preguntas del público.", "p_de": "Die letzte Folie lädt zu Fragen aus dem Publikum ein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las notas del ponente piden secciones largas y difíciles.", "p_de": "Die Notizen verlangen lange und schwierige Abschnitte.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué hace la diapositiva 1?", "p_de": "Was macht Folie 1?", "s": {"type": "multiple_choice", "options": ["Introduces the topic with an opening question", "Shows the final chart", "Lists the bibliography only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué explica la diapositiva 2?", "p_de": "Was erklärt Folie 2?", "s": {"type": "multiple_choice", "options": ["The problem and why it matters", "The hotel address", "The lunch menu"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué contiene la diapositiva 3?", "p_de": "Was enthält Folie 3?", "s": {"type": "multiple_choice", "options": ["The method in three short steps", "Only audience questions", "A phone protocol"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué aparece en la diapositiva 4?", "p_de": "Was erscheint auf Folie 4?", "s": {"type": "multiple_choice", "options": ["The main result with one chart", "The full reading list", "A city map"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice la diapositiva 5?", "p_de": "Was sagt Folie 5?", "s": {"type": "multiple_choice", "options": ["One limit of the study", "Three bus times", "The final grade"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofrece la diapositiva 6?", "p_de": "Was bietet Folie 6?", "s": {"type": "multiple_choice", "options": ["The conclusion and one recommendation", "The registration desk number", "A voicemail example"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve la última diapositiva?", "p_de": "Wofür dient die letzte Folie?", "s": {"type": "multiple_choice", "options": ["To invite audience questions", "To show parking tickets", "To explain the Wi-Fi code"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo deben ser las secciones principales?", "p_de": "Wie sollen die Hauptabschnitte sein?", "s": {"type": "multiple_choice", "options": ["Short and easy to follow", "Very long and complex", "Only one word each"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5240 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5240 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5240, 'en', 'reading', 'academic', 'Presentation outline. Slide 1 introduces the topic with one opening question. Slide 2 explains the problem and why it matters for students.

Slide 3 gives the method in three short steps. Slide 4 presents the main result with one chart. Slide 5 mentions one limit of the study, and Slide 6 gives the conclusion and one recommendation.

The final slide invites questions from the audience. The speaker notes say that each main section should be short and easy to follow.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Estructura de una presentación', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Struktur einer Präsentation', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
