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
        '{"p":"El aula es la 102.","p_de":"Der Raum ist 102.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Las páginas son de la 30 a la 36.","p_de":"Die Seiten sind 30 bis 36.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El trabajo es un proyecto final.","p_de":"Die Aufgabe ist ein Abschlussprojekt.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La entrega es el jueves a las 6 PM.","p_de":"Die Abgabe ist am Donnerstag um 18 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Sofia pregunta si la hora límite es 4 PM o 5 PM.","p_de":"Sofia fragt, ob die Frist 16 Uhr oder 17 Uhr ist.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El trabajo se envía al correo personal del profesor.","p_de":"Die Arbeit wird an die persönliche E-Mail des Professors geschickt.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuándo es el seminario?","p_de":"Wann ist das Seminar?","s":{"type":"multiple_choice","options":["Wednesday at 11 AM","Thursday at 2 PM","Wednesday at 1 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde es el seminario?","p_de":"Wo ist das Seminar?","s":{"type":"multiple_choice","options":["Room 101","Room 204","Room 240"],"answer":1}}'::jsonb,
        '{"p":"¿Qué páginas comprueba Sofia?","p_de":"Welche Seiten prüft Sofia?","s":{"type":"multiple_choice","options":["Pages 15 to 22","Pages 36 to 40","Pages 30 to 36"],"answer":2}}'::jsonb,
        '{"p":"¿Qué documento completan?","p_de":"Welches Dokument bearbeiten sie?","s":{"type":"multiple_choice","options":["The summary sheet","The project report","The blue form"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora es la fecha límite?","p_de":"Um wie viel Uhr ist die Frist?","s":{"type":"multiple_choice","options":["5 PM","6 PM","4 PM"],"answer":1}}'::jsonb,
        '{"p":"¿En qué día es la fecha límite?","p_de":"An welchem Tag ist die Frist?","s":{"type":"multiple_choice","options":["Friday","Wednesday","Thursday"],"answer":2}}'::jsonb,
        '{"p":"¿A dónde lo envían por correo?","p_de":"Wohin schicken sie es per E-Mail?","s":{"type":"multiple_choice","options":["To the class email","To the library desk","To the ticket office"],"answer":0}}'::jsonb,
        '{"p":"¿Qué deben traer la semana que viene?","p_de":"Was sollen sie nächste Woche mitbringen?","s":{"type":"multiple_choice","options":["The dictionary","The printed article","The price list"],"answer":1}}'::jsonb
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
VALUES (
    v_path_id,
    990,
    'en',
    'listening',
    'academic',
    $transcript$
# AUDIO PROFILE: Prof. Adams (lecturer) and Sofia (student), seminar class
## "Let Me Check Everything"

## THE SCENE: A seminar class where Prof. Adams announces the schedule, pages, and submission deadline
Sofia listens carefully and then checks every instruction one by one to make sure she has it right.
The audio practises days, times, page numbers, submission deadlines, and email addresses.

### DIRECTOR'S NOTES
Style:
* Prof. Adams is clear and direct; Sofia is conscientious and systematic when checking.
* Sofia's repeated confirmation questions help learners notice the pattern of checking instructions.

Pace: Slow, especially when Sofia repeats back key numbers and the professor confirms them.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear all the steps of checking instructions in a seminar setting.
The audio practises page numbers, deadlines, days, submission methods, and polite checking phrases.

#### TRANSCRIPT
[clear] Prof. Adams: Good morning. Today we start with the seminar schedule.
[precise] Prof. Adams: Our seminar is every Wednesday at 11 AM in Room 204.
[practical] Prof. Adams: Today, read pages 30 to 36 and complete the summary sheet.
[helpful] Prof. Adams: Please send it to the class email by 6 PM on Thursday.
[calm] Prof. Adams: Next week, bring the printed article.
[polite] Sofia: Excuse me. I want to check the instructions.
[checking] Sofia: Is it pages 30 to 36?
[confirming] Prof. Adams: Yes, pages 30 to 36. That is correct.
[checking] Sofia: And we complete the summary sheet?
[patient] Prof. Adams: Yes, the summary sheet. Not a full report.
[checking] Sofia: Did you say submit by 5 PM or 6 PM?
[precise] Prof. Adams: By 6 PM on Thursday.
[checking] Sofia: Do we email it to the class address?
[confirming] Prof. Adams: Yes, to the class email. You have it on the board.
[thankful] Sofia: Great. Thank you, Prof. Adams.
[friendly] Prof. Adams: No problem. You can start reading now.
$transcript$
)RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'es', 'Todas las instrucciones');

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'de', 'Sofia prüft alle Anweisungen');

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
