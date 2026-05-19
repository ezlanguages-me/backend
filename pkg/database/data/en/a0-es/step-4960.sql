-- ============================================================
-- Seed: A0 English Path – STEP 4960 – Dialogue – participate in a seminar discussion (Conferencias, Seminarios y Clases)
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
        '{"character": "Lucia", "text": "I think the bicycle survey is useful for the campus office.", "es": "Creo que la encuesta sobre bicicletas es útil para la oficina del campus.", "de": "Ich denke, die Fahrradumfrage ist nützlich für das Campusbüro."}'::jsonb,
        '{"character": "Mateo", "text": "Yes, especially because forty students ride at least twice a week.", "es": "Sí, sobre todo porque cuarenta estudiantes van al menos dos veces por semana.", "de": "Ja, besonders weil vierzig Studierende mindestens zweimal pro Woche fahren."}'::jsonb,
        '{"character": "Lucia", "text": "The health reason is interesting, but the cost reason is important too.", "es": "La razón de la salud es interesante, pero el coste también es importante.", "de": "Der Gesundheitsgrund ist interessant, aber der Kostenaspekt ist auch wichtig."}'::jsonb,
        '{"character": "Mateo", "text": "I agree. Rain is a problem, but unsafe parking is something the university can change.", "es": "Estoy de acuerdo. La lluvia es un problema, pero el aparcamiento inseguro sí lo puede cambiar la universidad.", "de": "Ich stimme zu. Regen ist ein Problem, aber unsichere Parkplätze kann die Universität ändern."}'::jsonb,
        '{"character": "Lucia", "text": "Maybe we should suggest covered parking near the library.", "es": "Quizá deberíamos proponer aparcamiento cubierto cerca de la biblioteca.", "de": "Vielleicht sollten wir überdachte Parkplätze nahe der Bibliothek vorschlagen."}'::jsonb,
        '{"character": "Mateo", "text": "That is a good idea. We can also compare bicycle use with bus use.", "es": "Es una buena idea. También podemos comparar el uso de la bici con el del autobús.", "de": "Das ist eine gute Idee. Wir können auch die Fahrradnutzung mit der Busnutzung vergleichen."}'::jsonb,
        '{"character": "Lucia", "text": "Do you think more students would cycle with safer parking?", "es": "¿Crees que más estudiantes irían en bici con un aparcamiento más seguro?", "de": "Glaubst du, dass mehr Studierende mit sichereren Parkplätzen Rad fahren würden?"}'::jsonb,
        '{"character": "Mateo", "text": "Yes, I think so. The seminar question could be about that.", "es": "Sí, eso creo. La pregunta del seminario podría ir sobre eso.", "de": "Ja, das denke ich. Die Seminarfrage könnte darum gehen."}'::jsonb,
        '{"character": "Lucia", "text": "Great. I will write our question and our practical idea.", "es": "Genial. Escribiré nuestra pregunta y nuestra idea práctica.", "de": "Super. Ich schreibe unsere Frage und unsere praktische Idee auf."}'::jsonb,
        '{"character": "Mateo", "text": "Perfect. Then we are ready for the discussion.", "es": "Perfecto. Entonces estamos listos para la discusión.", "de": "Perfekt. Dann sind wir bereit für die Diskussion."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Lucia piensa que la encuesta es útil para la oficina del campus.", "p_de": "Lucia findet die Umfrage nützlich für das Campusbüro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Mateo dice que cuarenta estudiantes van en bici al menos dos veces por semana.", "p_de": "Mateo sagt, dass vierzig Studierende mindestens zweimal pro Woche Fahrrad fahren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los dos creen que la lluvia puede cambiarla la universidad.", "p_de": "Beide glauben, dass die Universität den Regen ändern kann.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Lucia propone aparcamiento cubierto cerca de la biblioteca.", "p_de": "Lucia schlägt überdachte Parkplätze nahe der Bibliothek vor.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Al final quieren llevar una pregunta y una idea práctica.", "p_de": "Am Ende wollen sie eine Frage und eine praktische Idee mitbringen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué número repite Mateo?", "p_de": "Welche Zahl wiederholt Mateo?", "s": {"type": "multiple_choice", "options": ["Forty students", "Sixty rooms", "Ten buses"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema puede cambiar la universidad?", "p_de": "Welches Problem kann die Universität verändern?", "s": {"type": "multiple_choice", "options": ["Unsafe parking", "Rain", "The weather in winter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué solución propone Lucia?", "p_de": "Welche Lösung schlägt Lucia vor?", "s": {"type": "multiple_choice", "options": ["Covered parking near the library", "Free coffee in class", "More hotel rooms"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quieren comparar?", "p_de": "Was möchten sie vergleichen?", "s": {"type": "multiple_choice", "options": ["Bicycle use and bus use", "Lecture notes and exams", "Conference badges and tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará Lucia al final?", "p_de": "Was macht Lucia am Ende?", "s": {"type": "multiple_choice", "options": ["Write the question and idea", "Leave the seminar", "Call the transport office"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4960 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 4960 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4960, 'en', 'dialogue', 'academic', '[{"name": "Lucia", "gender": "female", "avatarURL": "https://example.com/avatars/lucia.png"}, {"name": "Mateo", "gender": "male", "avatarURL": "https://example.com/avatars/mateo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Conversación de seminario sobre la encuesta', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Seminargespräch über die Umfrage', '');

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
