-- ============================================================
-- Seed: A0 English Path – STEP 5400 – Reading – give a clear presentation on a familiar topic, and CAN answer predictable or factual questions (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La hoja aconseja decir el tema y el objetivo al principio.", "p_de": "Das Blatt rät, Thema und Ziel am Anfang zu nennen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Recomienda usar tres ideas principales.", "p_de": "Es empfiehlt, drei Hauptpunkte zu verwenden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que explicar todos los números del gráfico.", "p_de": "Man soll alle Zahlen des Diagramms erklären.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Conviene repetir la pregunta antes de responder.", "p_de": "Es ist sinnvoll, die Frage vor der Antwort zu wiederholen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si no sabes algo, debes inventar una respuesta.", "p_de": "Wenn man etwas nicht weiß, soll man eine Antwort erfinden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La hoja sugiere ofrecer comprobar la respuesta más tarde.", "p_de": "Das Blatt schlägt vor, die Antwort später zu prüfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También recomienda terminar a tiempo y aceptar preguntas finales.", "p_de": "Es empfiehlt auch, rechtzeitig zu enden und letzte Fragen anzunehmen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Un final claro ayuda a recordar la idea principal.", "p_de": "Ein klarer Schluss hilft, die Hauptidee zu behalten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué debes decir al principio de la presentación?", "p_de": "Was soll man am Anfang des Vortrags sagen?", "s": {"type": "multiple_choice", "options": ["The topic and aim", "Only your phone number", "The full bibliography"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos puntos principales sugiere la hoja?", "p_de": "Wie viele Hauptpunkte schlägt das Blatt vor?", "s": {"type": "multiple_choice", "options": ["Three main points", "One point only", "Six long sections"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes explicar de un gráfico?", "p_de": "Was soll man an einem Diagramm erklären?", "s": {"type": "multiple_choice", "options": ["Only the most important number or trend", "Every small detail", "Nothing at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces con una pregunta factual antes de responder?", "p_de": "Was macht man mit einer Sachfrage vor der Antwort?", "s": {"type": "multiple_choice", "options": ["Repeat the question first", "Ignore the question", "Change the topic"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si no sabes la respuesta?", "p_de": "Was macht man, wenn man die Antwort nicht weiß?", "s": {"type": "multiple_choice", "options": ["Say so honestly and check later", "Invent a new fact", "End the presentation immediately"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recomienda para el final?", "p_de": "Was empfiehlt das Blatt für das Ende?", "s": {"type": "multiple_choice", "options": ["Finish on time and invite final questions", "Speak faster and skip the ending", "Read the whole talk again"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ayuda a recordar la idea principal?", "p_de": "Was hilft dabei, die Hauptidee zu erinnern?", "s": {"type": "multiple_choice", "options": ["A clear ending", "A late start", "A crowded slide"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["An advice sheet for presentations", "A conference programme", "A research log"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5400 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5400 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5400, 'en', 'reading', 'academic', 'Presentation advice sheet. Start by saying the topic and aim of your talk. Use three main points so your audience can follow the structure easily.

When you show a chart, explain only the most important number or trend. If someone asks a factual question, repeat the question first and answer with one clear sentence. If you do not know the answer, say so honestly and offer to check later.

Finish on time and invite one or two final questions. A clear ending helps the audience remember the main idea.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Consejos para presentar y responder preguntas', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Tipps zum Präsentieren und Fragenbeantworten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
