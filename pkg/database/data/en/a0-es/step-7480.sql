-- ============================================================
-- Seed: A0 English Path – STEP 7480 – Reading – read problem-solving notes (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La reunión semanal empieza tarde porque falta el cable del proyector.", "de": "Das wöchentliche Meeting beginnt spät, weil das Projektorkabel fehlt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se debe guardar un cable en la sala A.", "de": "Ein Kabel soll in Raum A bleiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Nina debe revisar la caja cada viernes.", "de": "Nina soll die Box jeden Freitag prüfen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hoy se compra un cable nuevo.", "de": "Heute wird ein neues Kabel gekauft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La etiqueta dice Meeting Cable.", "de": "Das Etikett lautet Meeting Cable.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El proyector se prueba después de la reunión.", "de": "Der Projektor wird nach dem Meeting getestet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las notas son sobre una ventana rota.", "de": "Die Notizen handeln von einem kaputten Fenster.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El problema afecta a la reunión semanal del equipo.", "de": "Das Problem betrifft das wöchentliche Teammeeting.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Por qué empieza tarde la reunión?", "de": "Warum beginnt das Meeting spät?", "s_es": {"type": "multiple_choice", "options": ["Because the projector cable is missing", "Because the lunch is late", "Because the room is closed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil das Projektorkabel fehlt", "Weil das Mittagessen spät ist", "Weil der Raum geschlossen ist"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde debe quedarse un cable?", "de": "Wo soll ein Kabel bleiben?", "s_es": {"type": "multiple_choice", "options": ["In Room A", "In the kitchen", "At reception"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Raum A", "In der Küche", "Am Empfang"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién revisa la caja cada lunes?", "de": "Wer prüft die Box jeden Montag?", "s_es": {"type": "multiple_choice", "options": ["Nina", "Omar", "Sara"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nina", "Omar", "Sara"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se prueba el proyector?", "de": "Wann wird der Projektor getestet?", "s_es": {"type": "multiple_choice", "options": ["Before the 9:00 meeting", "After the 9:00 meeting", "On Friday afternoon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor dem 9:00-Uhr-Meeting", "Nach dem 9:00-Uhr-Meeting", "Am Freitagnachmittag"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué se escribe en la caja?", "de": "Was wird auf die Box geschrieben?", "s_es": {"type": "multiple_choice", "options": ["Meeting Cable", "Visitor List", "Coffee Cups"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Meeting Cable", "Visitor List", "Coffee Cups"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué se compra hoy?", "de": "Was wird heute gekauft?", "s_es": {"type": "multiple_choice", "options": ["One new cable", "One new printer", "One new chair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein neues Kabel", "Ein neuer Drucker", "Ein neuer Stuhl"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de texto es?", "de": "Welche Art Text ist das?", "s_es": {"type": "multiple_choice", "options": ["Problem-solving notes", "Meeting invitation", "Project budget"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Problemlösungsnotizen", "Meetingeinladung", "Projektbudget"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué equipo tiene el problema?", "de": "Welches Gerät hat das Problem?", "s_es": {"type": "multiple_choice", "options": ["The projector cable", "The coffee machine", "The wall clock"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Projektorkabel", "Die Kaffeemaschine", "Die Wanduhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7480 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7480 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7480, 'en', 'reading', 'meetings', 'Problem-Solving Notes\n\nProblem: The weekly team meeting starts late because the projector cable is missing.\n\nIdeas:
- Keep one cable in Room A.
- Put a label on the cable box.
- Ask Nina to check the box every Monday.\n\nChosen action:
- Buy one new cable today.
- Write Meeting Cable on the box.
- Test the projector before the 9:00 meeting.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee notas para resolver un problema', 'Lee unas notas simples con problema, ideas y acciones elegidas para una reunión.'),
        (v_reading_id, 'de', 'Lies Problemlösungsnotizen', 'Lies einfache Notizen mit Problem, Ideen und gewählten Maßnahmen für ein Meeting.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
