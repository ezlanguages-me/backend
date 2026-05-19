-- ============================================================
-- Seed: A0 English Path – STEP 6320 – Dialogue – habla de preferencias de entretenimiento (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Nina","text": "Do you feel like watching a film tonight?","es": "¿Te apetece ver una película esta noche?","de": "Hast du Lust, heute Abend einen Film zu sehen?"}'::jsonb,
        '{"character": "Tobias","text": "Maybe. I also like games and music nights.","es": "Quizá. También me gustan los juegos y las noches de música.","de": "Vielleicht. Ich mag auch Spiele und Musikabende."}'::jsonb,
        '{"character": "Nina","text": "I prefer something quiet, like a film at home.","es": "Prefiero algo tranquilo, como una película en casa.","de": "Ich bevorzuge etwas Ruhiges, wie einen Film zu Hause."}'::jsonb,
        '{"character": "Tobias","text": "That is fine. What kind of film do you like?","es": "Está bien. ¿Qué tipo de película te gusta?","de": "Das ist okay. Welche Art von Film magst du?"}'::jsonb,
        '{"character": "Nina","text": "Comedies are best for me.","es": "Las comedias son lo mejor para mí.","de": "Komödien sind für mich am besten."}'::jsonb,
        '{"character": "Tobias","text": "Good choice. I enjoy those too, especially with snacks.","es": "Buena elección. A mí también me gustan, sobre todo con algo para picar.","de": "Gute Wahl. Die mag ich auch, besonders mit Snacks."}'::jsonb,
        '{"character": "Nina","text": "We could invite Sam if he is free.","es": "Podríamos invitar a Sam si está libre.","de": "Wir könnten Sam einladen, wenn er frei ist."}'::jsonb,
        '{"character": "Tobias","text": "Yes, and maybe play cards after the film.","es": "Sí, y quizá jugar a las cartas después de la película.","de": "Ja, und vielleicht nach dem Film Karten spielen."}'::jsonb,
        '{"character": "Nina","text": "Nice. Let''s keep it simple.","es": "Bien. Mantengámoslo sencillo.","de": "Gut. Halten wir es einfach."}'::jsonb,
        '{"character": "Tobias","text": "Perfect. I will bring the drinks.","es": "Perfecto. Yo traeré las bebidas.","de": "Perfekt. Ich bringe die Getränke mit."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Nina quiere algo tranquilo.","de": "Nina wants something quiet.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "A Tobias no le gustan los juegos.","de": "Tobias does not like games.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "A Nina le gustan las comedias.","de": "Nina likes comedies.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Quieren mantener el plan sencillo.","de": "They want to keep the plan simple.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Tobias traerá las bebidas.","de": "Tobias will bring the drinks.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué tipo de actividad prefiere Nina?","de": "¿Qué tipo de actividad prefiere Nina?","s_es": {"type": "multiple_choice","options": ["A film at home","A long hike","A shopping trip"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una película en casa","Una excursión larga","Una compra"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué género de película le gusta a Nina?","de": "¿Qué género de película le gusta a Nina?","s_es": {"type": "multiple_choice","options": ["Comedies","Horror films","Documentaries"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Comedias","Películas de miedo","Documentales"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué podrían hacer después de la película?","de": "¿Qué podrían hacer después de la película?","s_es": {"type": "multiple_choice","options": ["Play cards","Go to work","Clean the kitchen"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Jugar a las cartas","Ir a trabajar","Limpiar la cocina"],"answer": 0}}'::jsonb,
        '{"es": "¿A quién quieren invitar?","de": "¿A quién quieren invitar?","s_es": {"type": "multiple_choice","options": ["Sam","The bus driver","The teacher"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["A Sam","Al conductor del autobús","Al profesor"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué llevará Tobias?","de": "¿Qué llevará Tobias?","s_es": {"type": "multiple_choice","options": ["Drinks","Shoes","Books"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Bebidas","Zapatos","Libros"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 6320 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 6320 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 6320, 'en', 'dialogue', 'Convivencia', '[{"name": "Nina","gender": "female","avatarURL": "https://example.com/avatars/student-5.png"},{"name": "Tobias","gender": "male","avatarURL": "https://example.com/avatars/student-6.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'habla de preferencias de entretenimiento', 'Practica cómo preguntar y responder sobre películas, juegos y planes tranquilos con amigos.'),
        (v_dialogue_id, 'de', 'sprich über Unterhaltungswünsche', 'Übe, wie man nach Filmen, Spielen und ruhigen Plänen mit Freunden fragt und antwortet.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
