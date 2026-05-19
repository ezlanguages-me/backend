-- ============================================================
-- Seed: A0 English Path – STEP 870 – Listening – understand basic instructions (class times, dates, room numbers, assignments) (Gestión del Estudio)
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
        '{"p":"La clase de inglés es lunes, miércoles y viernes a las 9 AM.","p_de":"Der Englischunterricht ist am Montag, Mittwoch und Freitag um 9 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La clase es en el aula 14.","p_de":"Der Unterricht ist in Raum 14.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Los estudiantes abren el cuaderno en la página 8.","p_de":"Die Lernenden öffnen das Arbeitsbuch auf Seite 8.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Los estudiantes contestan las preguntas 1 a 5.","p_de":"Die Lernenden beantworten die Fragen 1 bis 5.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La tarea es terminar el ejercicio B.","p_de":"Die Hausaufgabe ist, Übung B zu beenden.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La tarea se entrega el viernes.","p_de":"Die Hausaufgabe wird am Freitag abgegeben.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La clase es martes y jueves.","p_de":"Der Unterricht ist am Dienstag und Donnerstag.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La clase es en el aula 41.","p_de":"Der Unterricht ist in Raum 41.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuándo es la clase de inglés?","p_de":"Wann ist der Englischunterricht?","s":{"type":"multiple_choice","options":["Monday, Wednesday, and Friday at 9 AM","Tuesday and Thursday at 10 AM","Every day at 8 AM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde es la clase?","p_de":"Wo ist der Unterricht?","s":{"type":"multiple_choice","options":["Room 14","Room 41","Room 4"],"answer":0}}'::jsonb,
        '{"p":"¿Qué deben abrir los estudiantes?","p_de":"Was sollen die Lernenden öffnen?","s":{"type":"multiple_choice","options":["Workbook page 8","Workbook page 18","Coursebook page 6"],"answer":0}}'::jsonb,
        '{"p":"¿Qué leen primero?","p_de":"Was lesen sie zuerst?","s":{"type":"multiple_choice","options":["The text","A map","An email"],"answer":0}}'::jsonb,
        '{"p":"¿Qué preguntas contestan?","p_de":"Welche Fragen beantworten sie?","s":{"type":"multiple_choice","options":["Questions 1 to 5","Questions 6 to 10","Question 8 only"],"answer":0}}'::jsonb,
        '{"p":"¿Cuál es la tarea?","p_de":"Was ist die Hausaufgabe?","s":{"type":"multiple_choice","options":["Finish exercise B","Write an essay","Bring a photo"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo la entregan?","p_de":"Wann geben sie sie ab?","s":{"type":"multiple_choice","options":["Friday","Wednesday","Monday"],"answer":0}}'::jsonb,
        '{"p":"¿Quién da las instrucciones?","p_de":"Wer gibt die Anweisungen?","s":{"type":"multiple_choice","options":["Ms Walker","Marco","Prof Adams"],"answer":0}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 870 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 870 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (v_path_id, 870, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Ms Walker, a teacher at the start of class
## "Class Information for Today"

## THE SCENE: A classroom before the lesson begins
The students are taking their seats while Ms Walker starts the lesson with routine information.
She repeats the regular class schedule and then gives the task for today and the homework for later.

### DIRECTOR'S NOTES
Style:
* Teacher voice that is calm, organized, and easy to follow for new learners.
* Short instructional sentences with clear order words such as open, read, answer, and finish.

Pace: Slow classroom pace, with clear pauses between each instruction.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for school routines, class schedules, room numbers, and simple homework instructions.
Learners practise understanding times, days, pages, question numbers, and due dates.

#### TRANSCRIPT
[clear teacher voice] Good morning, everyone. English class is on Monday, Wednesday, and Friday at 9 AM in Room 14.
[organized] Today, please open your workbook at page 8.
[gently] Read the text on the page first.
[clearly] Then answer questions 1 to 5.
[helpfully] For homework, finish exercise B.
[firmly] Please hand it in on Friday.
[encouragingly] If you are ready, we can start now.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'La profesora da instrucciones de clase', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Die Lehrerin gibt Unterrichtsanweisungen', '');

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
