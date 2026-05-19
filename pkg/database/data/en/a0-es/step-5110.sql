-- ============================================================
-- Seed: A0 English Path – STEP 5110 – Reading – understand an academic argument (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El texto defiende que la biblioteca abra más tarde entre semana.", "p_de": "Der Text befürwortet längere Öffnungszeiten der Bibliothek unter der Woche.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Muchos estudiantes trabajan durante el día.", "p_de": "Viele Studierende arbeiten tagsüber.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los recursos en línea sustituyen totalmente la sala tranquila según el texto.", "p_de": "Laut Text ersetzen Online-Ressourcen den ruhigen Raum vollständig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El autor propone una prueba corta de lunes a jueves.", "p_de": "Der Autor schlägt einen kurzen Test von Montag bis Donnerstag vor.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los costes de seguridad serían limitados porque solo una planta seguiría abierta.", "p_de": "Die Sicherheitskosten wären begrenzt, weil nur ein Stockwerk offen bliebe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conclusión dice que solo los profesores usarían el horario tarde.", "p_de": "Der Schluss sagt, dass nur Lehrkräfte die späten Stunden nutzen würden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El argumento menciona a estudiantes con trayectos largos.", "p_de": "Das Argument erwähnt Studierende mit langen Wegen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto es un argumento a favor de más horas.", "p_de": "Der Text ist ein Argument für längere Öffnungszeiten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué cambio propone el texto?", "p_de": "Welche Änderung schlägt der Text vor?", "s": {"type": "multiple_choice", "options": ["Later library hours on weekdays", "More parking fees on campus", "Shorter seminar discussions"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué necesitan algunos estudiantes la biblioteca por la tarde?", "p_de": "Warum brauchen einige Studierende die Bibliothek am Abend?", "s": {"type": "multiple_choice", "options": ["They work during the day", "They live in the library", "They have no classes at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no reemplazan completamente los recursos en línea?", "p_de": "Was ersetzen Online-Ressourcen nicht vollständig?", "s": {"type": "multiple_choice", "options": ["A quiet room, books, and staff", "The weather outside", "The bus timetable"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de prueba se propone?", "p_de": "Welche Art von Test wird vorgeschlagen?", "s": {"type": "multiple_choice", "options": ["A short trial from Monday to Thursday", "A one-year closure", "A weekend sports event"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué serían limitados los costes de seguridad?", "p_de": "Warum wären die Sicherheitskosten begrenzt?", "s": {"type": "multiple_choice", "options": ["Only one floor would stay open", "Students would pay for guards", "The building would close earlier"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién ayudarían las horas más largas?", "p_de": "Wem würden längere Zeiten helfen?", "s": {"type": "multiple_choice", "options": ["Students with jobs and long commutes", "Only visitors from hotels", "Only office managers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["An academic argument", "A telephone script", "A conference schedule"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué posición tiene el autor?", "p_de": "Welche Position hat der Autor?", "s": {"type": "multiple_choice", "options": ["The library should stay open later", "The library should close forever", "The library should move to another city"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5110 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5110 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5110, 'en', 'reading', 'academic', 'Argument: The university library should stay open later on weekdays. Many students work during the day and need a quiet study space after dinner.

The writer says that online resources are useful, but they do not replace a calm room, printed books, and library staff. A short trial from Monday to Thursday could show if more evening hours are worth the cost.

The argument also says that security costs would be limited because only one floor needs to stay open. In conclusion, later hours would support students with jobs and long commutes.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Argumento académico sobre el horario de la biblioteca', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Akademisches Argument über Bibliothekszeiten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
