-- ============================================================
-- Seed: A0 English Path – STEP 5000 – Reading – understand some parts of a lecture (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El texto dice que revisar el mismo día ayuda a recordar más.", "p_de": "Der Text sagt, dass eine Wiederholung am selben Tag beim Erinnern hilft.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También puede ayudar una segunda revisión dos días después.", "p_de": "Eine zweite Wiederholung zwei Tage später kann ebenfalls helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El ejemplo compara tres grupos de estudiantes.", "p_de": "Das Beispiel vergleicht drei Gruppen von Studierenden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El grupo A revisó los apuntes quince minutos después de clase.", "p_de": "Gruppe A wiederholte die Notizen fünfzehn Minuten nach dem Unterricht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El grupo B revisó antes de la prueba final la noche anterior.", "p_de": "Gruppe B wiederholte erst am Abend vor dem Test.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El grupo B recordó más términos clave.", "p_de": "Gruppe B erinnerte sich an mehr Schlüsselbegriffe.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las sesiones cortas son más fáciles de repetir en una semana ocupada.", "p_de": "Kurze Einheiten lassen sich in einer vollen Woche leichter wiederholen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La idea principal es estudiar muchas horas de una vez.", "p_de": "Die Hauptidee ist, viele Stunden am Stück zu lernen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuándo recuerda más la gente según el texto?", "p_de": "Wann erinnert man sich laut Text besser?", "s": {"type": "multiple_choice", "options": ["When they review on the same day", "When they wait one month", "When they never look again"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué revisión adicional puede ayudar?", "p_de": "Welche zusätzliche Wiederholung kann helfen?", "s": {"type": "multiple_choice", "options": ["A second review two days later", "A review after one year", "A review only during lunch"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto tiempo revisó el grupo A?", "p_de": "Wie lange wiederholte Gruppe A?", "s": {"type": "multiple_choice", "options": ["Fifteen minutes", "Fifteen hours", "Five minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo revisó el grupo B?", "p_de": "Wann wiederholte Gruppe B?", "s": {"type": "multiple_choice", "options": ["The night before the test", "Right after class", "During the test itself"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué grupo recordó más términos?", "p_de": "Welche Gruppe erinnerte sich an mehr Begriffe?", "s": {"type": "multiple_choice", "options": ["Group A", "Group B", "Both groups equally"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué son útiles las sesiones cortas?", "p_de": "Warum sind kurze Einheiten nützlich?", "s": {"type": "multiple_choice", "options": ["They are easier to repeat in a busy week", "They always replace sleep", "They remove all homework"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no recomienda el texto?", "p_de": "Was empfiehlt der Text nicht?", "s": {"type": "multiple_choice", "options": ["Studying for many hours at once", "Returning to the material regularly", "Short review sessions"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata el extracto?", "p_de": "Worum geht es in dem Ausschnitt?", "s": {"type": "multiple_choice", "options": ["Review habits and memory", "Telephone rules in an office", "Directions at a conference"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5000 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5000 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5000, 'en', 'reading', 'academic', 'Lecture extract. The speaker says that students remember more when they review information on the same day. A second review two days later often helps too.

One classroom example compared two groups. Group A reviewed notes for fifteen minutes after class. Group B waited until the night before the test. Group A remembered more key terms in the final quiz.

The speaker adds that short review sessions are easier to repeat during a busy week. The main point is not to study for many hours at once, but to return to the material regularly.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Extracto de una clase sobre revisión y memoria', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Ausschnitt aus einer Vorlesung über Wiederholung und Gedächtnis', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
