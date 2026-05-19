-- ============================================================
-- Seed: A0 English Path – STEP 5630 – Dialogue – discussing an essay draft with a peer (Textos, Ensayos e Investigación)
-- Source language: English
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_line_order SMALLINT := 0;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Lara dice que su tesis no está clara.", "p_de": "Lara sagt, ihre These sei nicht klar.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Sam señala que la introducción de Lara es demasiado larga.", "p_de": "Sam weist darauf hin, dass Laras Einleitung zu lang ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Lara pregunta cómo mejorar la conexión entre párrafos.", "p_de": "Lara fragt, wie sie die Verbindung zwischen Absätzen verbessern kann.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Sam sugiere añadir frases de transición para mejorar el flujo.", "p_de": "Sam schlägt vor, Übergangssätze hinzuzufügen, um den Fluss zu verbessern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Lara tiene demasiadas citas y Sam recomienda reducirlas.", "p_de": "Lara hat zu viele Zitate und Sam empfiehlt, diese zu reduzieren.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuál es el problema principal que señala Sam sobre el borrador?", "p_de": "Was ist das Hauptproblem, das Sam am Entwurf feststellt?", "s": {"type": "multiple_choice", "options": ["The body paragraphs lack supporting evidence", "The title is missing", "The essay is too short"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recomienda Sam para mejorar las conexiones entre párrafos?", "p_de": "Was empfiehlt Sam zur Verbesserung der Verbindungen zwischen Absätzen?", "s": {"type": "multiple_choice", "options": ["Use transition phrases like ''In addition'' and ''Furthermore''", "Add more footnotes", "Remove the conclusion"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo reacciona Lara a los comentarios de Sam?", "p_de": "Wie reagiert Lara auf Sams Kommentare?", "s": {"type": "multiple_choice", "options": ["She thanks him and says the feedback is helpful", "She disagrees and refuses to revise", "She asks another classmate for a second opinion"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué decide hacer Lara después de la conversación?", "p_de": "Was beschließt Lara nach dem Gespräch zu tun?", "s": {"type": "multiple_choice", "options": ["Revise the body paragraphs and add more evidence", "Submit the essay without changes", "Delete the introduction entirely"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué demuestra esta conversación sobre la revisión entre pares?", "p_de": "Was zeigt dieses Gespräch über das Peer-Review?", "s": {"type": "multiple_choice", "options": ["It helps identify weaknesses and improve the essay before submission", "It is only useful for grammar errors", "It replaces the tutor''s feedback"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5630 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5630 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5630, 'en', 'dialogue', 'academic-essay',
        '[{"name": "Lara", "gender": "female", "avatarURL": "https://ezlanguages.me/avatars/lara.png"}, {"name": "Sam", "gender": "male", "avatarURL": "https://ezlanguages.me/avatars/sam.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Discutir un borrador de ensayo con un compañero', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Einen Aufsatzentwurf mit einem Kommilitonen besprechen', '');

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Lara', 'Sam, can you read my draft essay and tell me what you think?')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'Sam, ¿puedes leer mi borrador de ensayo y decirme qué piensas?')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Sam, kannst du meinen Aufsatzentwurf lesen und mir sagen, was du denkst?')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Sam', 'Sure! I just read it. Your thesis is really clear — I know exactly what you are arguing.')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', '¡Claro! Acabo de leerlo. Tu tesis es muy clara: sé exactamente lo que argumentas.')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Klar! Ich habe es gerade gelesen. Deine These ist sehr klar — ich weiß genau, was du argumentierst.')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Lara', 'That''s a relief. But does the body work? I feel like the paragraphs don''t connect well.')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'Qué alivio. Pero, ¿funciona el cuerpo? Siento que los párrafos no conectan bien.')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Das ist eine Erleichterung. Aber funktioniert der Hauptteil? Ich habe das Gefühl, die Absätze verbinden sich nicht gut.')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Sam', 'You''re right. The ideas are good, but you need more transition phrases. Something like ''Furthermore'' or ''Building on this point''.')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'Tienes razón. Las ideas son buenas, pero necesitas más frases de transición. Algo como ''Además'' o ''Desarrollando este punto''.')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Du hast recht. Die Ideen sind gut, aber du brauchst mehr Übergangssätze. Etwas wie ''Außerdem'' oder ''Aufbauend auf diesem Punkt''.')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Lara', 'Got it. What about the evidence? Is there enough to support my claims?')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'Entendido. ¿Y la evidencia? ¿Hay suficiente para respaldar mis argumentos?')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Verstanden. Was ist mit den Belegen? Sind genug vorhanden, um meine Aussagen zu stützen?')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Sam', 'The second paragraph is a bit thin. You make a strong claim but don''t back it up with any source.')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'El segundo párrafo es un poco débil. Haces una afirmación sólida pero no la respaldas con ninguna fuente.')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Der zweite Absatz ist etwas dünn. Du machst eine starke Aussage, stützt sie aber mit keiner Quelle.')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Lara', 'I see. I''ll find a source for that section. Anything else?')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'Ya veo. Buscaré una fuente para esa sección. ¿Algo más?')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Ich verstehe. Ich werde eine Quelle für diesen Abschnitt finden. Noch etwas?')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Sam', 'The conclusion is good. It ties everything together nicely.')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'La conclusión es buena. Une todo muy bien.')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Der Schluss ist gut. Er verbindet alles sehr schön.')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Lara', 'Thank you so much, Sam. This peer feedback is really helpful.')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', 'Muchas gracias, Sam. Esta retroalimentación entre compañeros es muy útil.')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Vielen Dank, Sam. Dieses Peer-Feedback ist wirklich hilfreich.')))));

    v_line_order := v_line_order + 1;
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, v_line_order, 'Sam', 'Of course! Let me know when you''ve revised it — I''d be happy to read the final version.')
    RETURNING uuid INTO v_line_id;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', '¡Por supuesto! Avísame cuando lo hayas revisado. Con gusto leeré la versión final.')))));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', 'Natürlich! Lass mich wissen, wenn du es überarbeitet hast — ich lese gerne die endgültige Version.')))));

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
