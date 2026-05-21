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
        '{"p":"Los estudiantes abren el cuaderno en la página 18.","p_de":"Die Lernenden öffnen das Arbeitsbuch auf Seite 18.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Los estudiantes contestan las preguntas 1 a 8.","p_de":"Die Lernenden beantworten die Fragen 1 bis 8.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La tarea es terminar el ejercicio B.","p_de":"Die Hausaufgabe ist, Übung B zu beenden.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La tarea se entrega el viernes.","p_de":"Die Hausaufgabe wird am Freitag abgegeben.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La clase es martes y jueves.","p_de":"Der Unterricht ist am Dienstag und Donnerstag.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La clase es en el aula 41.","p_de":"Der Unterricht ist in Raum 41.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Cuándo es la clase de inglés?","p_de":"Wann ist der Englischunterricht?","s":{"type":"multiple_choice","options":["Monday, Wednesday, and Friday at 9 AM","Tuesday and Thursday at 10 AM","Every day at 8 AM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde es la clase?","p_de":"Wo ist der Unterricht?","s":{"type":"multiple_choice","options":["Room 14","Room 41","Room 4"],"answer":0}}'::jsonb,
        '{"p":"¿Qué deben abrir los estudiantes?","p_de":"Was sollen die Lernenden öffnen?","s":{"type":"multiple_choice","options":["Workbook page 8","Workbook page 18","Coursebook page 6"],"answer":0}}'::jsonb,
        '{"p":"¿Qué leen primero?","p_de":"Was lesen sie zuerst?","s":{"type":"multiple_choice","options":["A map","The text","An email"],"answer":1}}'::jsonb,
        '{"p":"¿Qué preguntas contestan?","p_de":"Welche Fragen beantworten sie?","s":{"type":"multiple_choice","options":["Questions 6 to 10","Questions 1 to 5","Question 8 only"],"answer":1}}'::jsonb,
        '{"p":"¿Cuál es la tarea?","p_de":"Was ist die Hausaufgabe?","s":{"type":"multiple_choice","options":["Write an essay","Finish exercise B","Bring a photo"],"answer":1}}'::jsonb,
        '{"p":"¿Cuándo la entregan?","p_de":"Wann geben sie sie ab?","s":{"type":"multiple_choice","options":["Wednesday","Monday","Friday"],"answer":2}}'::jsonb,
        '{"p":"¿Quién da las instrucciones?","p_de":"Wer gibt die Anweisungen?","s":{"type":"multiple_choice","options":["Marco","Prof Adams","Ms Walker"],"answer":2}}'::jsonb
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
VALUES (
    v_path_id,
    870,
    'en',
    'listening',
    'academic',
    $transcript$
Ms Walker: Good morning, everyone. Please take your seats.
Student: Good morning, Ms Walker.
Ms Walker: Before we start, let me give you some information. English class is on Monday, Wednesday, and Friday at 9 AM.
Student: And the room? Is it still Room 14?
Ms Walker: Yes, we are always in Room 14. Please write that down if you need to.
Student: Thank you.
Ms Walker: Today, please open your workbook at page 8.
Student: Page 8. Okay.
Ms Walker: First, read the text on the page. Take your time.
Ms Walker: Then answer questions 1 to 5. Work quietly on your own.
Student: Can we work with a partner?
Ms Walker: Not yet. Work alone first, and then we will check together.
Ms Walker: For homework, finish exercise B. It is short.
Student: When do we hand it in?
Ms Walker: Please hand it in on Friday. Bring it to class or leave it at reception.
Student: Got it. Thank you, Ms Walker.
Ms Walker: You are welcome. Let us begin.
$transcript$
)RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'es', 'Profesora da instrucciones');

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'de', 'Gibt Unterrichtsanweisungen');

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
