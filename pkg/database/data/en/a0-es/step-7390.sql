-- ============================================================
-- Seed: A0 English Path – STEP 7390 – Reading – understand meeting agenda (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La agenda empieza a las 9:00.", "de": "Die Agenda beginnt um 9:00 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La impresora rota está en la sala A.", "de": "Der kaputte Drucker ist in Raum A.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las personas deben llevar su cuaderno.", "de": "Die Leute sollen ihr Notizbuch mitbringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El menú del almuerzo es para el día de visitantes.", "de": "Das Mittagsmenü ist für den Besuchertag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La idea de la pausa para el café es para el viernes.", "de": "Die Idee für die Kaffeepause ist für Freitag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Al final se confirma la próxima reunión.", "de": "Am Ende wird das nächste Meeting bestätigt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La revisión de las tareas de la semana pasada es a las 9:30.", "de": "Die Besprechung der Aufgaben der letzten Woche ist um 9:30 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Cada persona da un discurso largo.", "de": "Jede Person hält eine lange Rede.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿A qué hora empieza la reunión?", "de": "Um wie viel Uhr beginnt das Meeting?", "s_es": {"type": "multiple_choice", "options": ["At 9:00", "At 9:20", "At 10:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 9:00 Uhr", "Um 9:20 Uhr", "Um 10:00 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué sala está la impresora rota?", "de": "In welchem Raum ist der kaputte Drucker?", "s_es": {"type": "multiple_choice", "options": ["Room B", "Room A", "Room D"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum B", "Raum A", "Raum D"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué deben llevar las personas?", "de": "Was sollen die Leute mitbringen?", "s_es": {"type": "multiple_choice", "options": ["A notebook", "A laptop bag", "A visitor card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Notizbuch", "Eine Laptoptasche", "Eine Besucherkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Para qué día es la pausa para el café?", "de": "Für welchen Tag ist die Kaffeepause?", "s_es": {"type": "multiple_choice", "options": ["Friday", "Monday", "Wednesday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Freitag", "Montag", "Mittwoch"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué frase simple pueden usar las personas?", "de": "Welchen einfachen Satz können die Leute benutzen?", "s_es": {"type": "multiple_choice", "options": ["I agree", "Where is the bus?", "See you next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["I agree", "Where is the bus?", "See you next month"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pasa a las 9:05?", "de": "Was passiert um 9:05 Uhr?", "s_es": {"type": "multiple_choice", "options": ["Review last week tasks", "Choose one coffee break idea", "Confirm the next meeting"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Aufgaben der letzten Woche besprechen", "Eine Idee für die Kaffeepause wählen", "Das nächste Meeting bestätigen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tema está a las 9:10?", "de": "Welches Thema ist um 9:10 Uhr dran?", "s_es": {"type": "multiple_choice", "options": ["The lunch menu for visitor day", "The broken printer in Room B", "The next meeting room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Mittagsmenü für den Besuchertag", "Der kaputte Drucker in Raum B", "Der nächste Meetingraum"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pasa a las 9:40?", "de": "Was passiert um 9:40 Uhr?", "s_es": {"type": "multiple_choice", "options": ["Confirm the next meeting", "Welcome and attendance", "Talk about the printer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das nächste Meeting bestätigen", "Begrüßung und Anwesenheit", "Über den Drucker sprechen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7390 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7390 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7390, 'en', 'reading', 'meetings', 'Monday Team Meeting Agenda\n\n9:00 Welcome and attendance\n9:05 Review last week tasks\n9:10 Discuss the lunch menu for visitor day\n9:20 Talk about the broken printer in Room B\n9:30 Choose one idea for the Friday coffee break\n9:40 Confirm the next meeting\n\nPlease bring your notebook. Each person gives one short opinion. Use simple phrases like I agree, I do not agree, or Good idea.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee una agenda de reunión sencilla', 'Lee una agenda breve con horas, temas y una nota para dar opiniones cortas en una reunión.'),
        (v_reading_id, 'de', 'Lies eine einfache Meeting-Agenda', 'Lies eine kurze Agenda mit Uhrzeiten, Themen und einem Hinweis für kurze Meinungen im Meeting.');

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
