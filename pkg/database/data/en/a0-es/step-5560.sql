-- ============================================================
-- Seed: A0 English Path – STEP 5560 – Reading – scan texts for relevant information, and grasp main topic of text (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El texto A trata de horarios de biblioteca y estudio.", "p_de": "Text A handelt von Bibliothekszeiten und Lernen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto B describe un estudio pequeño sobre sueño y concentración.", "p_de": "Text B beschreibt eine kleine Studie über Schlaf und Konzentration.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto C resume un proyecto de reciclaje en el campus.", "p_de": "Text C fasst ein Recyclingprojekt auf dem Campus zusammen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto D habla de llamadas profesionales en oficina.", "p_de": "Text D spricht von professionellen Anrufen im Büro.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Para buscar rápido, conviene mirar títulos, palabras repetidas y números.", "p_de": "Zum schnellen Suchen sollte man Titel, wiederholte Wörter und Zahlen ansehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que leer todos los textos en detalle antes de elegir uno.", "p_de": "Man muss alle Texte vollständig lesen, bevor man einen auswählt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La técnica sirve cuando un curso da varios textos cortos a la vez.", "p_de": "Die Technik hilft, wenn ein Kurs mehrere kurze Texte gleichzeitig gibt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El objetivo es encontrar el tipo de información necesario.", "p_de": "Das Ziel ist, die benötigte Informationsart zu finden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿De qué trata el texto A?", "p_de": "Worum geht es in Text A?", "s": {"type": "multiple_choice", "options": ["Library opening hours and study plans", "Urban gardens and rain barrels", "Professional phone scripts"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tema tiene el texto B?", "p_de": "Welches Thema hat Text B?", "s": {"type": "multiple_choice", "options": ["Sleep and concentration", "Parking fees", "Essay feedback"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué resume el texto C?", "p_de": "Was fasst Text C zusammen?", "s": {"type": "multiple_choice", "options": ["A campus recycling project", "A train timetable", "A hotel complaint"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué opciones menciona el texto D?", "p_de": "Welche Optionen erwähnt Text D?", "s": {"type": "multiple_choice", "options": ["Buses, bikes, or walking", "Phones, emails, or printers", "Labs, cafes, or hotels"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tres cosas debes mirar primero para escanear?", "p_de": "Welche drei Dinge soll man zuerst ansehen?", "s": {"type": "multiple_choice", "options": ["Titles, repeated words, and numbers", "Only the last sentence", "Only the teacher name"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es útil esta técnica?", "p_de": "Wann ist diese Technik nützlich?", "s": {"type": "multiple_choice", "options": ["When there are several short course texts", "When there is only one very long novel", "Only during phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces después de escanear?", "p_de": "Was macht man nach dem Scannen?", "s": {"type": "multiple_choice", "options": ["Read the selected text in more detail", "Ignore the text completely", "Write the final essay immediately"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve el escaneo?", "p_de": "Wofür dient das Scannen?", "s": {"type": "multiple_choice", "options": ["To find relevant information and the main topic", "To learn every word by heart", "To avoid reading forever"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5560 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5560 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5560, 'en', 'reading', 'academic', 'Four short course texts. Text A explains how library opening hours affect study plans. Text B describes a small study on sleep and concentration. Text C summarizes a project on campus recycling. Text D discusses why students choose buses, bikes, or walking.

To scan quickly, students should first look at titles, repeated words, and numbers. They should then match each text to the topic they need before reading in more detail.

The guide says scanning is useful when a course gives several short texts at the same time and a student needs only one kind of information.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Buscar información relevante y captar el tema principal', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Relevante Informationen finden und das Hauptthema erfassen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
