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
        '{"p":"La clase real es martes y jueves.","p_de":"Der richtige Unterricht ist am Dienstag und Donnerstag.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Hoy abren el cuaderno en la página 12.","p_de":"Heute öffnen sie das Arbeitsbuch auf Seite 12.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Los estudiantes escuchan la pista 3.","p_de":"Die Lernenden hören Spur 3.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Escriben las respuestas 1 a 4.","p_de":"Sie schreiben die Antworten 1 bis 4.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La tarea es terminar la parte C y llevarla el jueves.","p_de":"Die Hausaufgabe ist, Teil C zu beenden und ihn am Donnerstag mitzubringen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Qué hora equivocada dice Marco primero?","p_de":"Welche falsche Uhrzeit sagt Marco zuerst?","s":{"type":"multiple_choice","options":["10 AM","11 AM","9 AM"],"answer":0}}'::jsonb,
        '{"p":"¿Cuál es la hora correcta?","p_de":"Was ist die richtige Uhrzeit?","s":{"type":"multiple_choice","options":["11 AM","10 AM","12 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Qué aula equivocada dice Marco primero?","p_de":"Welchen falschen Raum nennt Marco zuerst?","s":{"type":"multiple_choice","options":["Room 22","Room 24","Room 12"],"answer":0}}'::jsonb,
        '{"p":"¿Cuál es el aula correcta?","p_de":"Was ist der richtige Raum?","s":{"type":"multiple_choice","options":["Room 24","Room 22","Room 42"],"answer":0}}'::jsonb,
        '{"p":"¿Qué página abren?","p_de":"Welche Seite öffnen sie?","s":{"type":"multiple_choice","options":["Page 12","Page 8","Page 20"],"answer":0}}'::jsonb,
        '{"p":"¿Qué escuchan?","p_de":"Was hören sie?","s":{"type":"multiple_choice","options":["Track 3","Track 1","Track 5"],"answer":0}}'::jsonb,
        '{"p":"¿Qué respuestas escriben?","p_de":"Welche Antworten schreiben sie?","s":{"type":"multiple_choice","options":["1 to 4","5 to 8","1 to 10"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo es la tarea?","p_de":"Wann ist die Hausaufgabe fällig?","s":{"type":"multiple_choice","options":["Thursday","Tuesday","Friday"],"answer":0}}'::jsonb
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
VALUES (v_path_id, 910, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Ms Walker and Marco, a student checking class details
## "Let Me Check the Instructions"

## THE SCENE: The same school setting, but with a different class schedule and task
After the teacher gives the instructions, Marco repeats them back because he wants to be sure he understood.
He makes two small mistakes first, and Ms Walker corrects them before the task begins.

### DIRECTOR'S NOTES
Style:
* Supportive teacher-student tone, with gentle corrections and repeated key facts.
* Very simple checking language so A0 learners can hear how to confirm and correct information.

Pace: Slow and careful, with extra emphasis on the corrected details.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful when students repeat instructions to check times, rooms, pages, and homework.
Learners hear both mistakes and corrections, which strengthens listening for exact details.

#### TRANSCRIPT
[teacher voice] Ms Walker: Our English support class is on Tuesday and Thursday at 11 AM in Room 24.
[teacher voice] Today, open your workbook at page 12, listen to track 3, and write answers 1 to 4.
[teacher voice] For homework, finish part C and bring it on Thursday.
[checking] Marco: So, the class is on Tuesday and Thursday at 10 AM in Room 22?
[correcting kindly] Ms Walker: Not 10 AM. It is at 11 AM. And not Room 22. It is Room 24.
[checking again] Marco: Okay. Page 12, track 3, answers 1 to 4, and homework is part C for Thursday.
[approvingly] Ms Walker: Yes, that is correct.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'Marco repite las instrucciones para comprobarlas', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Marco wiederholt die Anweisungen zur Kontrolle', '');

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
