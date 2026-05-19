-- ============================================================
-- Seed: A0 English Path – STEP 950 – Listening – understand instructions on classes and assignments (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    -- ------------------------------------------------------------
    -- Exercise definitions
    -- ------------------------------------------------------------
    v_exercises JSONB[] := ARRAY[
        '{"p":"El seminario es en el aula 101 todos los jueves a las 2 PM.","p_de":"Das Seminar ist jeden Donnerstag um 14 Uhr in Raum 101.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Hoy leen las páginas 15 a 22.","p_de":"Heute lesen sie die Seiten 15 bis 22.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Después completan una hoja de trabajo.","p_de":"Danach bearbeiten sie ein Arbeitsblatt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La hoja se entrega por correo electrónico antes de las 5 PM del viernes.","p_de":"Das Arbeitsblatt wird vor Freitag 17 Uhr per E-Mail abgegeben.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La semana que viene deben traer un diccionario.","p_de":"Nächste Woche sollen sie ein Wörterbuch mitbringen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El seminario es el miércoles.","p_de":"Das Seminar ist am Mittwoch.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La entrega es a las 6 PM.","p_de":"Die Abgabe ist um 18 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La semana que viene deben traer una calculadora.","p_de":"Nächste Woche sollen sie einen Taschenrechner mitbringen.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Dónde es el seminario?","p_de":"Wo ist das Seminar?","s":{"type":"multiple_choice","options":["Room 101","Room 110","Room 22"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo es el seminario?","p_de":"Wann ist das Seminar?","s":{"type":"multiple_choice","options":["Every Thursday at 2 PM","Every Friday at 2 PM","Every Thursday at 10 AM"],"answer":0}}'::jsonb,
        '{"p":"¿Qué páginas leen?","p_de":"Welche Seiten lesen sie?","s":{"type":"multiple_choice","options":["Pages 15 to 22","Pages 5 to 12","Pages 22 to 30"],"answer":0}}'::jsonb,
        '{"p":"¿Qué completan los estudiantes?","p_de":"Was bearbeiten die Studierenden?","s":{"type":"multiple_choice","options":["The worksheet","A test","A poster"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo la entregan?","p_de":"Wie geben sie es ab?","s":{"type":"multiple_choice","options":["By email","By phone","On paper in class"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo la entregan?","p_de":"Wann geben sie es ab?","s":{"type":"multiple_choice","options":["By 5 PM on Friday","By 6 PM on Friday","By 5 PM on Thursday"],"answer":0}}'::jsonb,
        '{"p":"¿Qué deben traer la semana que viene?","p_de":"Was sollen sie nächste Woche mitbringen?","s":{"type":"multiple_choice","options":["A dictionary","A laptop bag","A whiteboard"],"answer":0}}'::jsonb,
        '{"p":"¿Quién da las instrucciones?","p_de":"Wer gibt die Anweisungen?","s":{"type":"multiple_choice","options":["Prof. Adams","Ms Walker","Sofia"],"answer":0}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 950 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 950 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (v_path_id, 950, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Prof. Adams, a university lecturer at the start of a seminar
## "Seminar Instructions"

## THE SCENE: A university seminar room before the session starts
Students are settling into a small seminar while Prof. Adams begins with the weekly information.
He tells them the regular room and time, then gives the reading task, the submission deadline, and one item to bring next week.

### DIRECTOR'S NOTES
Style:
* Academic but simple, with clean instructions suited to beginner listeners.
* Key details are practical and repeated in a direct order: where, when, what to do, when to submit.

Pace: Steady lecturer pace, slightly slower for page numbers and deadlines.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for university timetables, seminar tasks, and assignment submission instructions.
Learners practise understanding academic spaces, deadlines, and materials to bring.

#### TRANSCRIPT
[formal but friendly] Good afternoon. Our seminar is in Room 101 every Thursday at 2 PM.
[organized] Today, please read pages 15 to 22.
[clear] After that, complete the worksheet.
[firmly] Submit the worksheet by 5 PM on Friday via email.
[helpful] Next week, please bring a dictionary.
[encouragingly] Thank you. We can begin now.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'El profesor da instrucciones para el seminario', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Der Professor gibt Seminaranweisungen', '');

-- ------------------------------------------------------------
-- Exercise inserts
-- ------------------------------------------------------------
FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_listening_id, NULL)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
END LOOP;
END;
$seed$;
