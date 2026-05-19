-- ============================================================
-- Seed: A0 English Path – STEP 7410 – Reading – read meeting minutes (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La reunión fue el martes.", "de": "Das Meeting war am Dienstag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Había cuatro personas presentes.", "de": "Es waren vier Personen anwesend.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La máquina de café vuelve a funcionar.", "de": "Die Kaffeemaschine funktioniert wieder.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El correo para visitantes se envía el miércoles por la mañana.", "de": "Die E-Mail an die Besucher wird am Mittwochmorgen gesendet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La próxima reunión es el viernes a las 2:00.", "de": "Das nächste Meeting ist am Freitag um 2:00 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Lina compra el rotulador.", "de": "Lina kauft den Marker.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El equipo revisó la agenda del lunes.", "de": "Das Team hat die Agenda vom Montag geprüft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La reunión empezó a las 3:00.", "de": "Das Meeting begann um 3:00 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Quién abrió la reunión?", "de": "Wer hat das Meeting eröffnet?", "s_es": {"type": "multiple_choice", "options": ["Sara", "Omar", "Lina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sara", "Omar", "Lina"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué máquina vuelve a funcionar?", "de": "Welche Maschine funktioniert wieder?", "s_es": {"type": "multiple_choice", "options": ["The coffee machine", "The printer", "The lift"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Kaffeemaschine", "Der Drucker", "Der Aufzug"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién pidió un rotulador nuevo?", "de": "Wer hat einen neuen Marker verlangt?", "s_es": {"type": "multiple_choice", "options": ["Lina", "Sara", "Omar"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lina", "Sara", "Omar"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se envía el correo para visitantes?", "de": "Wann wird die Besuchere-Mail gesendet?", "s_es": {"type": "multiple_choice", "options": ["On Wednesday morning", "On Tuesday evening", "On Friday morning"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Mittwochmorgen", "Am Dienstagabend", "Am Freitagmorgen"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién compra el rotulador?", "de": "Wer kauft den Marker?", "s_es": {"type": "multiple_choice", "options": ["Omar", "Sara", "Lina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Omar", "Sara", "Lina"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué escribe Sara?", "de": "Was schreibt Sara?", "s_es": {"type": "multiple_choice", "options": ["The visitor email", "The room sign", "The shopping list"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Besucher-E-Mail", "Das Raumschild", "Die Einkaufsliste"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué trae Lina?", "de": "Was bringt Lina mit?", "s_es": {"type": "multiple_choice", "options": ["The printed agenda", "The coffee cups", "The blue marker"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die gedruckte Agenda", "Die Kaffeetassen", "Den blauen Marker"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo es la próxima reunión?", "de": "Wann ist das nächste Meeting?", "s_es": {"type": "multiple_choice", "options": ["Friday at 2:00", "Tuesday at 2:00", "Friday at 3:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Freitag um 2:00 Uhr", "Dienstag um 2:00 Uhr", "Freitag um 3:00 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7410 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7410 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7410, 'en', 'reading', 'meetings', 'Meeting Minutes - Tuesday Support Meeting\n\nPresent: Sara, Omar, Lina
Time: 2:00 to 2:20\n\n1. Sara opened the meeting at 2:00.
2. The team checked the agenda from Monday.
3. Omar said the coffee machine was working again.
4. Lina asked for a new marker for the whiteboard.
5. The team agreed to send the visitor email on Wednesday morning.
6. Next meeting: Friday at 2:00.\n\nAction list:
- Omar buys the marker.
- Sara writes the visitor email.
- Lina brings the printed agenda.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee unas actas de reunión', 'Lee unas actas simples con asistentes, decisiones y tareas de seguimiento.'),
        (v_reading_id, 'de', 'Lies ein Meetingprotokoll', 'Lies ein einfaches Protokoll mit Teilnehmenden, Entscheidungen und Aufgaben.');

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
