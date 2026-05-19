-- ============================================================
-- Seed: A0 English Path – STEP 5330 – Dialogue – discuss presentation with peers (Conferencias, Seminarios y Clases)
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
        '{"character": "Clara", "text": "I think our presentation has good data, but slide three is too full.", "es": "Creo que nuestra presentación tiene buenos datos, pero la diapositiva tres está demasiado cargada.", "de": "Ich denke, unser Vortrag hat gute Daten, aber Folie drei ist zu voll."}'::jsonb,
        '{"character": "Luis", "text": "I agree. We should cut two bullet points and keep one chart.", "es": "Estoy de acuerdo. Deberíamos quitar dos viñetas y dejar un gráfico.", "de": "Ich stimme zu. Wir sollten zwei Stichpunkte streichen und ein Diagramm behalten."}'::jsonb,
        '{"character": "Clara", "text": "The opening is clear, but we need a stronger ending.", "es": "La apertura es clara, pero necesitamos un final más fuerte.", "de": "Der Einstieg ist klar, aber wir brauchen ein stärkeres Ende."}'::jsonb,
        '{"character": "Luis", "text": "Maybe we can repeat the main result in the conclusion.", "es": "Quizá podemos repetir el resultado principal en la conclusión.", "de": "Vielleicht können wir das Hauptergebnis im Schluss wiederholen."}'::jsonb,
        '{"character": "Clara", "text": "Good idea. I also speak too fast on slide four.", "es": "Buena idea. Además hablo demasiado rápido en la diapositiva cuatro.", "de": "Gute Idee. Ich spreche auf Folie vier auch zu schnell."}'::jsonb,
        '{"character": "Luis", "text": "Then let us practice that part again.", "es": "Entonces practiquemos esa parte otra vez.", "de": "Dann lass uns diesen Teil noch einmal üben."}'::jsonb,
        '{"character": "Clara", "text": "Do you think we should add one question for the audience?", "es": "¿Crees que deberíamos añadir una pregunta para el público?", "de": "Glaubst du, wir sollten eine Frage für das Publikum hinzufügen?"}'::jsonb,
        '{"character": "Luis", "text": "Yes, that will make the ending more active.", "es": "Sí, eso hará el final más activo.", "de": "Ja, das macht den Schluss aktiver."}'::jsonb,
        '{"character": "Clara", "text": "Great. I will fix slide three tonight.", "es": "Genial. Arreglaré la diapositiva tres esta noche.", "de": "Super. Ich überarbeite heute Abend Folie drei."}'::jsonb,
        '{"character": "Luis", "text": "And I will rewrite the conclusion.", "es": "Y yo reescribiré la conclusión.", "de": "Und ich schreibe den Schluss neu."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Clara cree que la diapositiva tres tiene demasiada información.", "p_de": "Clara findet, dass Folie drei zu viele Informationen hat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Luis quiere añadir más viñetas a la diapositiva tres.", "p_de": "Luis möchte mehr Stichpunkte auf Folie drei hinzufügen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los dos piensan que el final debe ser más fuerte.", "p_de": "Beide denken, dass das Ende stärker sein sollte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Clara dice que habla demasiado despacio en la diapositiva cuatro.", "p_de": "Clara sagt, dass sie auf Folie vier zu langsam spricht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Al final Clara corrige una diapositiva y Luis reescribe la conclusión.", "p_de": "Am Ende korrigiert Clara eine Folie und Luis schreibt den Schluss neu.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué problema tiene la diapositiva tres?", "p_de": "Welches Problem hat Folie drei?", "s": {"type": "multiple_choice", "options": ["It is too full", "It is too short", "It has no title"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quiere conservar Luis?", "p_de": "Was möchte Luis behalten?", "s": {"type": "multiple_choice", "options": ["One chart", "Three more bullets", "A phone number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué parte necesita más fuerza?", "p_de": "Welcher Teil braucht mehr Stärke?", "s": {"type": "multiple_choice", "options": ["The ending", "The room number", "The bibliography only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quiere añadir Clara para el público?", "p_de": "Was möchte Clara für das Publikum hinzufügen?", "s": {"type": "multiple_choice", "options": ["One question", "A parking ticket", "A second microphone"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tarea hace cada uno al final?", "p_de": "Welche Aufgabe übernimmt am Ende jede Person?", "s": {"type": "multiple_choice", "options": ["Clara fixes slide three and Luis rewrites the conclusion", "Both cancel the talk", "Luis changes the room and Clara calls the office"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5330 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5330 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5330, 'en', 'dialogue', 'academic', '[{"name": "Clara", "gender": "female", "avatarURL": "https://example.com/avatars/clara.png"}, {"name": "Luis", "gender": "male", "avatarURL": "https://example.com/avatars/luis.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Hablar de una presentación con compañeros', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Eine Präsentation mit Mitstudierenden besprechen', '');

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
