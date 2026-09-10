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
        '{"p":"¿Cuándo es el seminario?","p_de":"Wann ist das Seminar?","s":{"type":"multiple_choice","options":["Every Friday at 2 PM","Every Thursday at 2 PM","Every Thursday at 10 AM"],"answer":1}}'::jsonb,
        '{"p":"¿Qué páginas leen?","p_de":"Welche Seiten lesen sie?","s":{"type":"multiple_choice","options":["Pages 5 to 12","Pages 22 to 30","Pages 15 to 22"],"answer":2}}'::jsonb,
        '{"p":"¿Qué completan los estudiantes?","p_de":"Was bearbeiten die Studierenden?","s":{"type":"multiple_choice","options":["The worksheet","A test","A poster"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo la entregan?","p_de":"Wie geben sie es ab?","s":{"type":"multiple_choice","options":["By phone","By email","On paper in class"],"answer":1}}'::jsonb,
        '{"p":"¿Cuándo la entregan?","p_de":"Wann geben sie es ab?","s":{"type":"multiple_choice","options":["By 6 PM on Friday","By 5 PM on Thursday","By 5 PM on Friday"],"answer":2}}'::jsonb,
        '{"p":"¿Qué deben traer la semana que viene?","p_de":"Was sollen sie nächste Woche mitbringen?","s":{"type":"multiple_choice","options":["A dictionary","A laptop bag","A whiteboard"],"answer":0}}'::jsonb,
        '{"p":"¿Quién da las instrucciones?","p_de":"Wer gibt die Anweisungen?","s":{"type":"multiple_choice","options":["Ms Walker","Prof. Adams","Sofia"],"answer":1}}'::jsonb
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
VALUES (
    v_path_id,
    950,
    'en',
    'listening',
    'academic',
    $transcript$
# AUDIO PROFILE: Prof. Adams (lecturer) and Student, university seminar room
## "Write This Down"

## THE SCENE: A university seminar room where Prof. Adams announces the schedule and today's tasks
A student asks clarifying questions about the room number, working style, and submission method.
The audio practises room numbers, page ranges, deadlines, and email instructions.

### DIRECTOR'S NOTES
Style:
* Prof. Adams is authoritative but approachable; the student asks short, direct questions.
* Key details like room number, pages, and deadline are spoken clearly and confirmed by the student.

Pace: Slow to medium, with deliberate pauses before room numbers, pages, and deadlines.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear a lecturer give seminar instructions and a student check the key details.
The audio practises rooms, page numbers, submission deadlines, and academic task language.

#### TRANSCRIPT
[welcoming] Prof. Adams: Good afternoon, everyone. Welcome to the seminar.
[clear] Prof. Adams: Before we start, I will give you the schedule and today's task.
[precise] Prof. Adams: Our seminar is in Room 101 every Thursday at 2 PM.
[checking] Student: Excuse me. Is it Room 101 or Room 110?
[patient] Prof. Adams: It is Room 101. Please write that down.
[practical] Prof. Adams: Today, please read pages 15 to 22.
[helpful] Prof. Adams: After that, complete the worksheet on the table.
[checking] Student: Do we work alone or with a partner?
[calm] Prof. Adams: You work alone, please.
[precise] Prof. Adams: Submit the worksheet by 5 PM on Friday via email.
[noticing] Student: By email? Not on paper?
[confirming] Prof. Adams: Yes, by email only. My address is on the board.
[helpful] Prof. Adams: Next week, please bring a dictionary.
[agreeing] Student: A dictionary. Understood.
[cheerful] Prof. Adams: Thank you. We can begin now.
$transcript$
)RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'es', 'Profesor da instrucciones');

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'de', 'Gibt Seminaranweisungen');

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
