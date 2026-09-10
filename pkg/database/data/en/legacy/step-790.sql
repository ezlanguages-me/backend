-- ============================================================
-- Seed: A0 English Path – STEP 790 – Listening – receive simple messages at work (Teléfono Profesional)
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
    -- T/F: F,T,T,T,F,F,F,T = 4T/4F
    -- MC: 0,1,2,0,1,0,2,1 = {0:3,1:3,2:2}
    -- ------------------------------------------------------------
    v_exercises JSONB[] := ARRAY[
        '{"p":"Helen es la gerente de la oficina.","p_de":"Helen ist die Büroleiterin.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"David Green llama de TechCorp.","p_de":"David Green ruft von TechCorp an.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La reunión es el martes a las 2 PM.","p_de":"Das Treffen ist am Dienstag um 14 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La reunión es en la sala B12.","p_de":"Das Treffen ist in Raum B12.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El señor Richards debe llevar el contrato del cliente.","p_de":"Herr Richards soll den Kundenvertrag mitbringen.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Helen toma un mensaje para la señora Brown.","p_de":"Helen nimmt eine Nachricht für Frau Brown auf.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La reunión es el miércoles.","p_de":"Das Treffen ist am Mittwoch.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Helen repite los detalles para confirmar.","p_de":"Helen wiederholt die Details zur Bestätigung.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Quién llama?","p_de":"Wer ruft an?","s":{"type":"multiple_choice","options":["David Green","Mr Richards","Helen"],"answer":0}}'::jsonb,
        '{"p":"¿De qué empresa llama David?","p_de":"Von welcher Firma ruft David an?","s":{"type":"multiple_choice","options":["ABC Solutions","TechCorp","Central Library"],"answer":1}}'::jsonb,
        '{"p":"¿Quién toma el mensaje?","p_de":"Wer nimmt die Nachricht auf?","s":{"type":"multiple_choice","options":["Susan Clark","Maria","Helen"],"answer":2}}'::jsonb,
        '{"p":"¿Para quién es el mensaje?","p_de":"Für wen ist die Nachricht?","s":{"type":"multiple_choice","options":["Mr Richards","James","Carlos"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo es la reunión?","p_de":"Wann ist das Treffen?","s":{"type":"multiple_choice","options":["Tuesday at 4 PM","Tuesday at 2 PM","Thursday at 2 PM"],"answer":1}}'::jsonb,
        '{"p":"¿En qué sala es la reunión?","p_de":"In welchem Raum ist das Treffen?","s":{"type":"multiple_choice","options":["Room B12","Room A12","Room B21"],"answer":0}}'::jsonb,
        '{"p":"¿Qué debe llevar el señor Richards?","p_de":"Was soll Herr Richards mitbringen?","s":{"type":"multiple_choice","options":["The price list","The station ticket","The project report"],"answer":2}}'::jsonb,
        '{"p":"¿Qué hace Helen al final?","p_de":"Was macht Helen am Ende?","s":{"type":"multiple_choice","options":["She cancels the meeting","She reads the message back","She asks for a taxi"],"answer":1}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 790 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 790 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (
    v_path_id,
    790,
    'en',
    'listening',
    'communication',
    $transcript$
[phone ringing]
Helen: Good morning. Richards Office. This is Helen speaking. How can I help you?
David: Good morning. This is David Green calling from TechCorp. May I leave a message for Mr Richards, please?
Helen: Of course, Mr Green. Please go ahead.
David: Thank you. I would like to confirm our meeting on Tuesday at 2 PM. Could you please pass that on to Mr Richards?
Helen: Tuesday at 2 PM. Yes, I will note that. Where is the meeting, Mr Green?
David: The meeting is in Room B12 on the second floor.
Helen: Room B12 on the second floor. Very good. Is there anything he needs to prepare?
David: Yes, please ask him to bring the project report. He should have the most recent version.
Helen: Of course. The project report. I will write that down. Let me read the message back to you, Mr Green.
David: Please go ahead.
Helen: You would like Mr Richards to know that the meeting is on Tuesday at 2 PM in Room B12, and he should bring the project report. Is that correct?
David: Yes, that is completely correct. Thank you very much, Helen.
Helen: You are very welcome, Mr Green. I will make sure Mr Richards receives your message as soon as he is back at his desk.
David: That is very helpful. Thank you again, and have a good day.
Helen: Thank you, Mr Green. Goodbye.
David: Goodbye.
$transcript$
) RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'es', 'Helen toma un mensaje para el Sr. Richards');

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'de', 'Helen nimmt eine Nachricht für Herrn Richards auf');

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
