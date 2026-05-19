-- ============================================================
-- Seed: A0 English Path – STEP 990 – Listening – check that all instructions are understood (Gestión del Estudio)
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
        '{"p":"Sofia repite las instrucciones para comprobarlas.","p_de":"Sofia wiederholt die Anweisungen, um sie zu prüfen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El seminario es el miércoles a las 11 AM.","p_de":"Das Seminar ist am Mittwoch um 11 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El aula es la 204.","p_de":"Der Raum ist 204.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Las páginas son de la 30 a la 36.","p_de":"Die Seiten sind 30 bis 36.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El trabajo es una hoja de resumen.","p_de":"Die Aufgabe ist ein Zusammenfassungsblatt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La entrega es el jueves a las 6 PM.","p_de":"Die Abgabe ist am Donnerstag um 18 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Sofia pregunta si la hora límite es 5 PM o 6 PM.","p_de":"Sofia fragt, ob die Frist 17 Uhr oder 18 Uhr ist.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El trabajo se envía al correo de la clase.","p_de":"Die Arbeit wird an die Kurs-E-Mail geschickt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Cuándo es el seminario?","p_de":"Wann ist das Seminar?","s":{"type":"multiple_choice","options":["Wednesday at 11 AM","Thursday at 2 PM","Wednesday at 1 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde es el seminario?","p_de":"Wo ist das Seminar?","s":{"type":"multiple_choice","options":["Room 204","Room 101","Room 240"],"answer":0}}'::jsonb,
        '{"p":"¿Qué páginas comprueba Sofia?","p_de":"Welche Seiten prüft Sofia?","s":{"type":"multiple_choice","options":["Pages 30 to 36","Pages 15 to 22","Pages 36 to 40"],"answer":0}}'::jsonb,
        '{"p":"¿Qué documento completan?","p_de":"Welches Dokument bearbeiten sie?","s":{"type":"multiple_choice","options":["The summary sheet","The project report","The blue form"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora es la fecha límite?","p_de":"Um wie viel Uhr ist die Frist?","s":{"type":"multiple_choice","options":["6 PM","5 PM","4 PM"],"answer":0}}'::jsonb,
        '{"p":"¿En qué día es la fecha límite?","p_de":"An welchem Tag ist die Frist?","s":{"type":"multiple_choice","options":["Thursday","Friday","Wednesday"],"answer":0}}'::jsonb,
        '{"p":"¿A dónde lo envían por correo?","p_de":"Wohin schicken sie es per E-Mail?","s":{"type":"multiple_choice","options":["To the class email","To the library desk","To the ticket office"],"answer":0}}'::jsonb,
        '{"p":"¿Qué deben traer la semana que viene?","p_de":"Was sollen sie nächste Woche mitbringen?","s":{"type":"multiple_choice","options":["The printed article","The dictionary","The price list"],"answer":0}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 990 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 990 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (v_path_id, 990, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Prof. Adams and Sofia, checking seminar instructions together
## "Did I Understand Everything?"

## THE SCENE: A university seminar with a student checking each detail
After a new set of seminar instructions, Sofia checks every important point before the class begins.
She repeats the pages, asks about the deadline time, and confirms the correct email address for submission.

### DIRECTOR'S NOTES
Style:
* Question-and-answer format with supportive clarification from the lecturer.
* Very explicit repetition of details so beginners can follow the full instruction set step by step.

Pace: Slow and deliberate, with emphasis on the corrected or confirmed facts.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for academic clarification, repeating instructions, and checking deadlines accurately.
Learners hear how students confirm all parts of a task instead of only one detail.

#### TRANSCRIPT
[lecturer] Prof. Adams: Our seminar is every Wednesday at 11 AM in Room 204.
[lecturer] Today, read pages 30 to 36 and complete the summary sheet.
[lecturer] Please send it to the class email by 6 PM on Thursday.
[lecturer] Next week, bring the printed article.
[checking] Sofia: Is it pages 30 to 36?
[confirming] Prof. Adams: Yes, pages 30 to 36.
[checking] Sofia: Did you say submit by 5 PM or 6 PM?
[confirming] Prof. Adams: By 6 PM.
[checking] Sofia: Do we email it to the class address?
[confirming] Prof. Adams: Yes, to the class email.
[satisfied] Sofia: Great. Thank you.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'Sofia comprueba todas las instrucciones', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Sofia prüft alle Anweisungen', '');

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
