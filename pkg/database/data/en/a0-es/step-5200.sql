-- ============================================================
-- Seed: A0 English Path – STEP 5200 – Reading – ask detailed questions (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Las buenas preguntas académicas suelen centrarse en la muestra, el método o una limitación.", "p_de": "Gute akademische Fragen konzentrieren sich oft auf Stichprobe, Methode oder Grenze.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una pregunta útil es por qué se eligió un grupo de participantes.", "p_de": "Eine nützliche Frage ist, warum eine Teilnehmergruppe gewählt wurde.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que no hay que preguntar por la definición de un término.", "p_de": "Der Text sagt, dass man nicht nach der Definition eines Begriffs fragen soll.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "También se puede preguntar cuándo se recogieron los datos.", "p_de": "Man kann auch fragen, wann die Daten gesammelt wurden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Otra pregunta es por qué se compararon dos grupos.", "p_de": "Eine weitere Frage ist, warum zwei Gruppen verglichen wurden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La guía sugiere terminar con una pregunta sobre el siguiente paso de la investigación.", "p_de": "Der Leitfaden empfiehlt, mit einer Frage zum nächsten Forschungsschritt zu enden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El objetivo es atacar al ponente.", "p_de": "Das Ziel ist, den Vortragenden anzugreifen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La meta es entender el estudio con más claridad.", "p_de": "Das Ziel ist, die Studie klarer zu verstehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿En qué se centran muchas buenas preguntas académicas?", "p_de": "Worauf richten sich viele gute akademische Fragen?", "s": {"type": "multiple_choice", "options": ["The sample, method, or study limit", "The speaker''s clothes and voice", "The lunch menu only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta se recomienda sobre los participantes?", "p_de": "Welche Frage wird zu den Teilnehmenden empfohlen?", "s": {"type": "multiple_choice", "options": ["Why the speaker chose that group", "Why the room is cold", "Why the bus was late"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede preguntarse sobre un término clave?", "p_de": "Was kann man über einen Schlüsselbegriff fragen?", "s": {"type": "multiple_choice", "options": ["How it was defined", "How much it costs in the cafe", "Who printed it"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cuestión temporal sugiere la guía?", "p_de": "Welche zeitliche Frage schlägt der Leitfaden vor?", "s": {"type": "multiple_choice", "options": ["When the data were collected", "When the library closes forever", "When the office printer arrives"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué comparación puede aclararse?", "p_de": "Welche Vergleichsfrage kann geklärt werden?", "s": {"type": "multiple_choice", "options": ["Why two groups were compared", "Why two trains were cancelled", "Why two menus were printed"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta final se recomienda?", "p_de": "Welche Abschlussfrage wird empfohlen?", "s": {"type": "multiple_choice", "options": ["What is the next research step?", "What is your favorite film?", "Can I leave early?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debe ser el objetivo?", "p_de": "Was soll nicht das Ziel sein?", "s": {"type": "multiple_choice", "options": ["To attack the speaker", "To understand the study", "To ask clearly"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve la guía?", "p_de": "Wofür dient der Leitfaden?", "s": {"type": "multiple_choice", "options": ["To help people ask detailed questions", "To teach phone greetings", "To explain bike parking rules"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5200 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5200 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5200, 'en', 'reading', 'academic', 'Question guide for research presentations. Good academic questions often focus on the sample, the method, or the limit of a study. One useful question asks why the speaker chose a certain group of participants.

Another good question asks how a key term was defined. You can also ask when the data were collected, why two groups were compared, or what the main limit of the study is.

The guide recommends finishing with a forward-looking question, for example: What is the next research step? The aim is not to attack the speaker, but to understand the study more clearly.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Guía para hacer preguntas detalladas', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Leitfaden für detaillierte Fragen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
