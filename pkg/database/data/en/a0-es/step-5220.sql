-- ============================================================
-- Seed: A0 English Path – STEP 5220 – Dialogue – discuss research topics (Conferencias, Seminarios y Clases)
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
        '{"character": "Elena", "text": "We need a research topic for our seminar project.", "es": "Necesitamos un tema de investigación para el proyecto del seminario.", "de": "Wir brauchen ein Forschungsthema für unser Seminarprojekt."}'::jsonb,
        '{"character": "Pablo", "text": "I am interested in student sleep habits, but reading habits could also work.", "es": "Me interesan los hábitos de sueño de los estudiantes, pero los hábitos de lectura también podrían servir.", "de": "Ich interessiere mich für Schlafgewohnheiten von Studierenden, aber auch Lesegewohnheiten könnten funktionieren."}'::jsonb,
        '{"character": "Elena", "text": "Reading habits may be easier because we can use a short log and interviews.", "es": "Los hábitos de lectura quizá sean más fáciles porque podemos usar un registro corto y entrevistas.", "de": "Lesegewohnheiten sind vielleicht leichter, weil wir ein kurzes Protokoll und Interviews nutzen können."}'::jsonb,
        '{"character": "Pablo", "text": "True. Sleep is important, but people may not remember exact hours.", "es": "Es verdad. El sueño es importante, pero quizá la gente no recuerde las horas exactas.", "de": "Stimmt. Schlaf ist wichtig, aber vielleicht erinnern sich die Leute nicht genau an die Stunden."}'::jsonb,
        '{"character": "Elena", "text": "For reading, we could compare science and humanities students.", "es": "Para la lectura podríamos comparar estudiantes de ciencias y de humanidades.", "de": "Für das Lesen könnten wir Natur- und Geisteswissenschafts-Studierende vergleichen."}'::jsonb,
        '{"character": "Pablo", "text": "Yes, and we can ask about daily time, distractions, and study spaces.", "es": "Sí, y podemos preguntar por el tiempo diario, las distracciones y los lugares de estudio.", "de": "Ja, und wir können nach täglicher Zeit, Ablenkungen und Lernorten fragen."}'::jsonb,
        '{"character": "Elena", "text": "Should we use a questionnaire first and then a few interviews?", "es": "¿Deberíamos usar primero un cuestionario y luego algunas entrevistas?", "de": "Sollen wir zuerst einen Fragebogen und dann einige Interviews verwenden?"}'::jsonb,
        '{"character": "Pablo", "text": "That sounds good. It gives us numbers and also examples.", "es": "Suena bien. Nos da números y también ejemplos.", "de": "Das klingt gut. Es gibt uns Zahlen und auch Beispiele."}'::jsonb,
        '{"character": "Elena", "text": "Great. Let us choose reading habits and write the method tonight.", "es": "Genial. Elijamos hábitos de lectura y escribamos hoy la metodología.", "de": "Gut. Dann wählen wir Lesegewohnheiten und schreiben heute die Methodik."}'::jsonb,
        '{"character": "Pablo", "text": "Perfect. I will start the first draft.", "es": "Perfecto. Yo empezaré el primer borrador.", "de": "Perfekt. Ich beginne mit dem ersten Entwurf."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Elena y Pablo buscan un tema para un proyecto de seminario.", "p_de": "Elena und Pablo suchen ein Thema für ein Seminarprojekt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Deciden estudiar hábitos de sueño porque son más fáciles de medir.", "p_de": "Sie entscheiden sich für Schlafgewohnheiten, weil diese leichter zu messen sind.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Elena cree que los hábitos de lectura son más fáciles de investigar.", "p_de": "Elena findet Lesegewohnheiten leichter zu erforschen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Quieren comparar estudiantes de ciencias y humanidades.", "p_de": "Sie wollen Natur- und Geisteswissenschafts-Studierende vergleichen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Al final planean escribir la metodología esa noche.", "p_de": "Am Ende wollen sie die Methodik noch am selben Abend schreiben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué dos temas consideran al principio?", "p_de": "Welche zwei Themen erwägen sie zuerst?", "s": {"type": "multiple_choice", "options": ["Sleep habits and reading habits", "Conference badges and lunch menus", "Parking and weather only"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué parece más fácil el tema de lectura?", "p_de": "Warum wirkt das Lesethema leichter?", "s": {"type": "multiple_choice", "options": ["Because they can use logs and interviews", "Because no students are needed", "Because it has no data"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué comparación proponen para la lectura?", "p_de": "Welchen Vergleich schlagen sie für das Lesen vor?", "s": {"type": "multiple_choice", "options": ["Science and humanities students", "Teachers and drivers", "Two office companies"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tres cosas quieren preguntar?", "p_de": "Welche drei Dinge wollen sie fragen?", "s": {"type": "multiple_choice", "options": ["Daily time, distractions, and study spaces", "Phone codes, room prices, and buses", "Water, bikes, and parking"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué método eligen al final?", "p_de": "Welche Methode wählen sie am Ende?", "s": {"type": "multiple_choice", "options": ["A questionnaire and a few interviews", "Only one email survey", "Only one long debate"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5220 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5220 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5220, 'en', 'dialogue', 'academic', '[{"name": "Elena", "gender": "female", "avatarURL": "https://example.com/avatars/elena.png"}, {"name": "Pablo", "gender": "male", "avatarURL": "https://example.com/avatars/pablo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Hablar sobre temas de investigación', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Über Forschungsthemen sprechen', '');

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
