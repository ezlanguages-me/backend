-- ============================================================
-- Seed: A0 English Path – STEP 910 – Listening – check instructions by virtually repeating them (Gestión del Estudio)
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
        '{"p":"Marco comprueba las instrucciones repitiéndolas.","p_de":"Marco prüft die Anweisungen, indem er sie wiederholt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Marco primero dice las 10 AM en vez de las 11 AM.","p_de":"Marco sagt zuerst 10 Uhr statt 11 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Marco primero dice el aula 22 en vez del aula 24.","p_de":"Marco sagt zuerst Raum 22 statt Raum 24.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La clase real es lunes y miércoles.","p_de":"Der richtige Unterricht ist am Montag und Mittwoch.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hoy abren el cuaderno en la página 8.","p_de":"Heute öffnen sie das Arbeitsbuch auf Seite 8.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Los estudiantes escuchan la pista 1.","p_de":"Die Lernenden hören Spur 1.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Escriben las respuestas 1 a 4.","p_de":"Sie schreiben die Antworten 1 bis 4.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La tarea es terminar la parte C y llevarla el viernes.","p_de":"Die Hausaufgabe ist, Teil C zu beenden und ihn am Freitag mitzubringen.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué hora equivocada dice Marco primero?","p_de":"Welche falsche Uhrzeit sagt Marco zuerst?","s":{"type":"multiple_choice","options":["10 AM","11 AM","9 AM"],"answer":0}}'::jsonb,
        '{"p":"¿Cuál es la hora correcta?","p_de":"Was ist die richtige Uhrzeit?","s":{"type":"multiple_choice","options":["10 AM","11 AM","12 PM"],"answer":1}}'::jsonb,
        '{"p":"¿Qué aula equivocada dice Marco primero?","p_de":"Welchen falschen Raum nennt Marco zuerst?","s":{"type":"multiple_choice","options":["Room 24","Room 12","Room 22"],"answer":2}}'::jsonb,
        '{"p":"¿Cuál es el aula correcta?","p_de":"Was ist der richtige Raum?","s":{"type":"multiple_choice","options":["Room 24","Room 22","Room 42"],"answer":0}}'::jsonb,
        '{"p":"¿Qué página abren?","p_de":"Welche Seite öffnen sie?","s":{"type":"multiple_choice","options":["Page 8","Page 12","Page 20"],"answer":1}}'::jsonb,
        '{"p":"¿Qué escuchan?","p_de":"Was hören sie?","s":{"type":"multiple_choice","options":["Track 1","Track 5","Track 3"],"answer":2}}'::jsonb,
        '{"p":"¿Qué respuestas escriben?","p_de":"Welche Antworten schreiben sie?","s":{"type":"multiple_choice","options":["1 to 4","5 to 8","1 to 10"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo es la tarea?","p_de":"Wann ist die Hausaufgabe fällig?","s":{"type":"multiple_choice","options":["Tuesday","Thursday","Friday"],"answer":1}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 910 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 910 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (
    v_path_id,
    910,
    'en',
    'listening',
    'academic',
    $transcript$
# AUDIO PROFILE: Ms Walker (teacher) and Marco (student), English support class
## "Did I Get It Right?"

## THE SCENE: An English support class where Ms Walker announces the schedule and today's task
Marco listens carefully and then repeats back the instructions to check he has them right.
The audio practises times, room numbers, workbook pages, and task instructions.

### DIRECTOR'S NOTES
Style:
* Ms Walker is clear and encouraging; Marco sounds attentive and slightly unsure.
* Marco repeats the instructions with one mistake before the teacher corrects him, reinforcing key numbers.

Pace: Slow and deliberate, with pauses before times, room numbers, and task steps.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear a teacher give class details and a student check them by repeating the information back.
The audio practises times, rooms, workbook pages, track numbers, and homework instructions.

#### TRANSCRIPT
[welcoming] Ms Walker: Good morning, everyone. Please take your seats.
[clear] Ms Walker: Today I will give you the class schedule and your task.
[clear] Ms Walker: Our English support class is on Tuesday and Thursday at 11 AM in Room 24.
[practical] Ms Walker: Today, open your workbook at page 12, listen to track 3, and write answers 1 to 4.
[calm] Ms Walker: Work quietly and check your answers with a partner after.
[helpful] Ms Walker: For homework, finish part C and bring it on Thursday.
[checking] Marco: Excuse me, Ms Walker. Can I check the details?
[friendly] Ms Walker: Of course, Marco. Go ahead.
[thinking] Marco: So, the class is on Tuesday and Thursday at 10 AM in Room 22?
[patient] Ms Walker: Not 10 AM. It is at 11 AM. And not Room 22. It is Room 24.
[confirming] Marco: I see. 11 AM, Room 24. Got it.
[checking] Marco: And today we open page 12, listen to track 3, and write answers 1 to 4?
[encouraging] Ms Walker: That is right. Well done.
[checking] Marco: And the homework is finish part C and bring it on Thursday?
[confirming] Ms Walker: Yes, that is correct. Good listening, Marco.
[calm] Ms Walker: You may all open your workbooks now.
$transcript$
)RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'es', 'Marco repite las instrucciones');

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'de', 'Wiederholt die Anweisungen');

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
