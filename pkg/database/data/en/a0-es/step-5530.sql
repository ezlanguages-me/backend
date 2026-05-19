-- ============================================================
-- Seed: A0 English Path – STEP 5530 – Dialogue – defend a position (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Lina", "text": "I think students should be allowed to use laptops in class.", "es": "Creo que los estudiantes deberían poder usar portátiles en clase.", "de": "Ich denke, Studierende sollten Laptops im Unterricht nutzen dürfen."}'::jsonb,
        '{"character": "Marco", "text": "I am not sure. They can become a distraction.", "es": "No estoy seguro. Pueden convertirse en una distracción.", "de": "Ich bin nicht sicher. Sie können zur Ablenkung werden."}'::jsonb,
        '{"character": "Lina", "text": "That is possible, but laptops are useful for note-taking and quick research.", "es": "Eso es posible, pero los portátiles son útiles para tomar apuntes y buscar información rápida.", "de": "Das ist möglich, aber Laptops sind nützlich für Notizen und schnelle Recherche."}'::jsonb,
        '{"character": "Marco", "text": "Some students also start checking messages.", "es": "Algunos estudiantes también empiezan a mirar mensajes.", "de": "Einige Studierende beginnen auch, Nachrichten zu prüfen."}'::jsonb,
        '{"character": "Lina", "text": "Then the rule should focus on responsible use, not a complete ban.", "es": "Entonces la norma debería centrarse en un uso responsable, no en una prohibición total.", "de": "Dann sollte sich die Regel auf verantwortliche Nutzung konzentrieren, nicht auf ein vollständiges Verbot."}'::jsonb,
        '{"character": "Marco", "text": "So you support laptops with limits?", "es": "Entonces apoyas los portátiles con límites?", "de": "Du unterstützt also Laptops mit Grenzen?"}'::jsonb,
        '{"character": "Lina", "text": "Yes. For example, no messages and screens down during discussion.", "es": "Sí. Por ejemplo, sin mensajes y con pantallas bajadas durante la discusión.", "de": "Ja. Zum Beispiel keine Nachrichten und Bildschirme unten während der Diskussion."}'::jsonb,
        '{"character": "Marco", "text": "That sounds more reasonable to me.", "es": "Eso me parece más razonable.", "de": "Das klingt für mich vernünftiger."}'::jsonb,
        '{"character": "Lina", "text": "My main point is that laptops can support learning if the rules are clear.", "es": "Mi punto principal es que los portátiles pueden ayudar al aprendizaje si las normas son claras.", "de": "Mein Hauptpunkt ist, dass Laptops das Lernen unterstützen können, wenn die Regeln klar sind."}'::jsonb,
        '{"character": "Marco", "text": "Okay, I understand your position now.", "es": "Vale, ahora entiendo tu postura.", "de": "Okay, ich verstehe deine Position jetzt."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Lina defiende el uso de portátiles en clase.", "p_de": "Lina verteidigt die Nutzung von Laptops im Unterricht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Marco cree desde el principio que los portátiles nunca distraen.", "p_de": "Marco glaubt von Anfang an, dass Laptops nie ablenken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Lina dice que son útiles para apuntes e investigación rápida.", "p_de": "Lina sagt, dass sie für Notizen und schnelle Recherche nützlich sind.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Lina propone una prohibición total.", "p_de": "Lina schlägt ein vollständiges Verbot vor.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Al final Marco entiende mejor su postura.", "p_de": "Am Ende versteht Marco ihre Position besser.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué riesgo menciona Marco?", "p_de": "Welches Risiko nennt Marco?", "s": {"type": "multiple_choice", "options": ["They can become a distraction", "They are too heavy to carry", "They never connect to Wi-Fi"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirven los portátiles según Lina?", "p_de": "Wofür sind Laptops laut Lina nützlich?", "s": {"type": "multiple_choice", "options": ["For note-taking and quick research", "Only for playing videos", "For printing conference badges"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de regla propone Lina?", "p_de": "Welche Art Regel schlägt Lina vor?", "s": {"type": "multiple_choice", "options": ["Responsible use instead of a complete ban", "A total ban for everyone", "No rules at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ejemplo de límite da Lina?", "p_de": "Welches Beispiel für eine Grenze gibt Lina?", "s": {"type": "multiple_choice", "options": ["No messages and screens down during discussion", "Only use laptops outside the campus", "Close all study rooms"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo acaba la conversación?", "p_de": "Wie endet das Gespräch?", "s": {"type": "multiple_choice", "options": ["Marco understands her position better", "They call the office desk", "They agree to ban all laptops immediately"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5530 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5530 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5530, 'en', 'dialogue', 'academic', '[{"name": "Lina", "gender": "female", "avatarURL": "https://example.com/avatars/lina.png"}, {"name": "Marco", "gender": "male", "avatarURL": "https://example.com/avatars/marco.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Defender una postura', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Eine Position verteidigen', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
