-- ============================================================
-- Seed: A0 English Path – STEP 5260 – Dialogue – participate in presentation Q&A (Conferencias, Seminarios y Clases)
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
        '{"character": "Audience member", "text": "Thank you for the presentation. Why did you start with the library bins?", "es": "Gracias por la presentación. ¿Por qué empezaron con los contenedores de la biblioteca?", "de": "Danke für den Vortrag. Warum haben Sie mit den Bibliotheksbehältern begonnen?"}'::jsonb,
        '{"character": "Presenter", "text": "Because the library has heavy daily use and clear student traffic.", "es": "Porque la biblioteca tiene mucho uso diario y un flujo claro de estudiantes.", "de": "Weil die Bibliothek täglich stark genutzt wird und einen klaren Studierendenstrom hat."}'::jsonb,
        '{"character": "Audience member", "text": "How did you measure the seventy percent result?", "es": "¿Cómo midieron el resultado del setenta por ciento?", "de": "Wie haben Sie das Ergebnis von siebzig Prozent gemessen?"}'::jsonb,
        '{"character": "Presenter", "text": "Volunteers checked the bins once a week and counted correct items.", "es": "Los voluntarios revisaban los contenedores una vez por semana y contaban los residuos correctos.", "de": "Freiwillige prüften die Behälter einmal pro Woche und zählten die richtigen Abfälle."}'::jsonb,
        '{"character": "Audience member", "text": "Did students understand the poster design immediately?", "es": "¿Entendieron los estudiantes el diseño de los carteles desde el principio?", "de": "Verstanden die Studierenden das Posterdesign sofort?"}'::jsonb,
        '{"character": "Presenter", "text": "Mostly yes, but we changed one image after the first month.", "es": "En general sí, pero cambiamos una imagen después del primer mes.", "de": "Meistens ja, aber wir änderten ein Bild nach dem ersten Monat."}'::jsonb,
        '{"character": "Audience member", "text": "What will happen in the cafeteria next?", "es": "¿Qué pasará ahora en la cafetería?", "de": "Was passiert als Nächstes in der Cafeteria?"}'::jsonb,
        '{"character": "Presenter", "text": "We want to test reusable cup points near the coffee area.", "es": "Queremos probar puntos de vasos reutilizables cerca de la zona de café.", "de": "Wir wollen Mehrwegbecher-Stationen beim Kaffeebereich testen."}'::jsonb,
        '{"character": "Audience member", "text": "That sounds useful. Thank you for the answer.", "es": "Suena útil. Gracias por la respuesta.", "de": "Das klingt nützlich. Danke für die Antwort."}'::jsonb,
        '{"character": "Presenter", "text": "Thank you for the question.", "es": "Gracias por la pregunta.", "de": "Danke für die Frage."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La primera pregunta es por qué empezaron en la biblioteca.", "p_de": "Die erste Frage ist, warum sie in der Bibliothek begonnen haben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El ponente dice que la biblioteca casi no tiene uso diario.", "p_de": "Der Referent sagt, dass die Bibliothek kaum täglich genutzt wird.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los voluntarios contaban los residuos correctos una vez por semana.", "p_de": "Die Freiwilligen zählten einmal pro Woche die richtigen Abfälle.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Cambiaron una imagen del cartel después del primer mes.", "p_de": "Sie änderten ein Bild des Posters nach dem ersten Monat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Después quieren probar puntos de vasos reutilizables en la cafetería.", "p_de": "Danach wollen sie Mehrwegbecher-Stationen in der Cafeteria testen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué empezaron con la biblioteca?", "p_de": "Warum begannen sie mit der Bibliothek?", "s": {"type": "multiple_choice", "options": ["Because it has heavy daily use", "Because it closes every day", "Because it has no students"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo midieron el setenta por ciento?", "p_de": "Wie maßen sie die siebzig Prozent?", "s": {"type": "multiple_choice", "options": ["Volunteers counted correct items weekly", "They guessed after one day", "They asked the bus driver"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasó con el diseño del cartel?", "p_de": "Was geschah mit dem Posterdesign?", "s": {"type": "multiple_choice", "options": ["One image changed after the first month", "All posters were removed", "The text was never printed"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quieren probar en la cafetería?", "p_de": "Was wollen sie in der Cafeteria testen?", "s": {"type": "multiple_choice", "options": ["Reusable cup points", "A second library desk", "A new parking app"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo termina la conversación?", "p_de": "Wie endet das Gespräch?", "s": {"type": "multiple_choice", "options": ["With thanks for the answer", "With an angry complaint", "With a delivery message"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5260 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5260 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5260, 'en', 'dialogue', 'academic', '[{"name": "Audience member", "gender": "female", "avatarURL": "https://example.com/avatars/audience-member.png"}, {"name": "Presenter", "gender": "male", "avatarURL": "https://example.com/avatars/presenter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Participar en preguntas tras una presentación', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'An einer Fragerunde nach einem Vortrag teilnehmen', '');

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
