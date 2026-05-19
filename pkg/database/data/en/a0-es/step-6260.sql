-- ============================================================
-- Seed: A0 English Path – STEP 6260 – Dialogue – habla sobre planes y actividades sociales (Convivencia)
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
        '{"character": "Marta","text": "Have you got any plans for Saturday?","es": "¿Tienes planes para el sábado?","de": "Hast du Pläne für Samstag?"}'::jsonb,
        '{"character": "Jon","text": "Not really. I am free after lunch.","es": "No realmente. Estoy libre después de comer.","de": "Nicht wirklich. Ich bin nach dem Mittagessen frei."}'::jsonb,
        '{"character": "Marta","text": "Great. We could go to the park or the museum.","es": "Genial. Podríamos ir al parque o al museo.","de": "Super. Wir könnten in den Park oder ins Museum gehen."}'::jsonb,
        '{"character": "Jon","text": "The park sounds better if the weather stays nice.","es": "El parque suena mejor si el tiempo sigue bueno.","de": "Der Park klingt besser, wenn das Wetter schön bleibt."}'::jsonb,
        '{"character": "Marta","text": "Yes. We can bring snacks and meet near the station.","es": "Sí. Podemos llevar algo para picar y quedar cerca de la estación.","de": "Ja. Wir können Snacks mitbringen und uns in der Nähe des Bahnhofs treffen."}'::jsonb,
        '{"character": "Jon","text": "That works for me. What time should we meet?","es": "A mí me va bien. ¿A qué hora quedamos?","de": "Das passt für mich. Um wie viel Uhr sollen wir uns treffen?"}'::jsonb,
        '{"character": "Marta","text": "Around two o''clock is fine.","es": "Sobre las dos está bien.","de": "Gegen zwei Uhr ist gut."}'::jsonb,
        '{"character": "Jon","text": "Perfect. I will ask Ana if she wants to come too.","es": "Perfecto. Le preguntaré a Ana si también quiere venir.","de": "Perfekt. Ich frage Ana, ob sie auch mitkommen möchte."}'::jsonb,
        '{"character": "Marta","text": "Good idea. The more the merrier.","es": "Buena idea. Cuantos más, mejor.","de": "Gute Idee. Je mehr, desto besser."}'::jsonb,
        '{"character": "Jon","text": "Great, see you on Saturday.","es": "Genial, nos vemos el sábado.","de": "Super, bis Samstag."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Marta pregunta por los planes del sábado.","de": "Marta fragt nach den Plänen für Samstag.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Jon está ocupado después de comer.","de": "Jon ist nach dem Mittagessen beschäftigt.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "El parque parece mejor si el tiempo sigue bueno.","de": "Der Park klingt besser, wenn das Wetter schön bleibt.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Quieren verse cerca de la estación.","de": "Sie wollen sich in der Nähe des Bahnhofs treffen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Ana ya ha dicho que no puede ir.","de": "Ana hat schon gesagt, dass sie nicht kommen kann.","s_es": {"type": "true_false","answer": false},"s_de": {"type": "true_false","answer": false}}'::jsonb,
        '{"es": "¿Qué actividad se menciona primero?","de": "Welche Aktivität wird zuerst erwähnt?","s_es": {"type": "multiple_choice","options": ["The park or the museum","The airport or the bank","The library or the gym"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Der Park oder das Museum","Der Flughafen oder die Bank","Die Bibliothek oder das Fitnessstudio"],"answer": 0}}'::jsonb,
        '{"es": "¿A qué hora piensan quedar?","de": "Um wie viel Uhr wollen sie sich treffen?","s_es": {"type": "multiple_choice","options": ["Around two o''clock","At eight in the morning","At midnight"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Gegen zwei Uhr","Um acht Uhr morgens","Um Mitternacht"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué llevará la pareja para compartir?","de": "Was bringt das Paar zum Teilen mit?","s_es": {"type": "multiple_choice","options": ["Snacks","Homework","A suitcase"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Snacks","Hausaufgaben","Einen Koffer"],"answer": 0}}'::jsonb,
        '{"es": "¿A quién quiere invitar Jon?","de": "Wen möchte Jon einladen?","s_es": {"type": "multiple_choice","options": ["Ana","A taxi driver","A neighbour"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Ana","Einen Taxifahrer","Einen Nachbarn"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué harían si el sábado no fuera posible?","de": "Was würden sie tun, wenn Samstag nicht möglich wäre?","s_es": {"type": "multiple_choice","options": ["Choose another day","Cancel forever","Go to work"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Einen anderen Tag wählen","Für immer absagen","Zur Arbeit gehen"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 6260 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 6260 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 6260, 'en', 'dialogue', 'Convivencia', '[{"name": "Marta","gender": "female","avatarURL": "https://example.com/avatars/student-3.png"},{"name": "Jon","gender": "male","avatarURL": "https://example.com/avatars/student-4.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'habla sobre planes y actividades sociales', 'Practica un diálogo para organizar una salida social y decidir dónde y cuándo verse.'),
        (v_dialogue_id, 'de', 'sprich über soziale Pläne und Aktivitäten', 'Übe einen Dialog, um einen sozialen Ausflug zu planen und Ort sowie Zeit festzulegen.');

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
