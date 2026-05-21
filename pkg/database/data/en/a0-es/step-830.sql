-- ============================================================
-- Seed: A0 English Path – STEP 830 – Listening – make outgoing call and pass on simple messages (Teléfono Profesional)
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
        '{"p":"James llama a ABC Solutions.","p_de":"James ruft bei ABC Solutions an.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El mensaje es de Susan Clark.","p_de":"Die Nachricht ist von Susan Clark.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La reunión del jueves se mueve a las 2 PM.","p_de":"Das Treffen am Donnerstag wird auf 14 Uhr verschoben.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La nueva sala es Conference Room 1.","p_de":"Der neue Raum ist Conference Room 1.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Necesitan la lista de precios actualizada.","p_de":"Sie brauchen die aktualisierte Preisliste.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"James pregunta si la clienta tiene un bolígrafo.","p_de":"James fragt, ob die Kundin einen Stift hat.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La reunión ahora es a la 1 PM.","p_de":"Das Treffen ist jetzt um 13 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"James recibe un mensaje en vez de darlo.","p_de":"James nimmt eine Nachricht auf, statt sie weiterzugeben.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Quién hace la llamada?","p_de":"Wer macht den Anruf?","s":{"type":"multiple_choice","options":["James","Susan Clark","Helen"],"answer":0}}'::jsonb,
        '{"p":"¿De quién es el mensaje?","p_de":"Von wem ist die Nachricht?","s":{"type":"multiple_choice","options":["Susan Clark","David Green","Mr Richards"],"answer":0}}'::jsonb,
        '{"p":"¿Qué empresa recibe la llamada?","p_de":"Welche Firma erhält den Anruf?","s":{"type":"multiple_choice","options":["TechCorp","Central Library","ABC Solutions"],"answer":2}}'::jsonb,
        '{"p":"¿Cuándo es ahora la reunión?","p_de":"Wann ist das Treffen jetzt?","s":{"type":"multiple_choice","options":["Thursday at 2 PM","Thursday at 3 PM","Friday at 3 PM"],"answer":1}}'::jsonb,
        '{"p":"¿Dónde es ahora la reunión?","p_de":"Wo ist das Treffen jetzt?","s":{"type":"multiple_choice","options":["Room B12","Conference Room 2","Room 101"],"answer":1}}'::jsonb,
        '{"p":"¿Qué necesitan llevar o enviar?","p_de":"Was müssen sie mitbringen oder senden?","s":{"type":"multiple_choice","options":["A dictionary","A train ticket","The updated price list"],"answer":2}}'::jsonb,
        '{"p":"¿Qué pregunta James antes de los detalles?","p_de":"Was fragt James vor den Details?","s":{"type":"multiple_choice","options":["Do you have a pen","Are you at the station","Can you call me later"],"answer":0}}'::jsonb,
        '{"p":"¿Por qué llama James?","p_de":"Warum ruft James an?","s":{"type":"multiple_choice","options":["To take a hotel booking","To pass on a prepared message","To cancel lunch"],"answer":1}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 830 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 830 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (
    v_path_id,
    830,
    'en',
    'listening',
    'communication',
    $transcript$
James: Good afternoon. This is James from Clark Consulting. May I speak to someone at ABC Solutions?
Paula: Yes, this is Paula speaking. How can I help?
James: I am calling with a message from my manager, Susan Clark.
Paula: Of course. Go ahead.
James: Do you have a pen to write this down?
Paula: Yes, I do. I am ready.
James: Thank you. The meeting on Thursday is moved to 3 PM.
Paula: Sorry, did you say 3 PM?
James: Yes, that is correct. 3 PM on Thursday.
James: Also, the meeting is now in Conference Room 2, not Conference Room 1.
Paula: Conference Room 2. Got it.
James: And Susan also says that we need the updated price list before the meeting.
Paula: The updated price list. I will pass that on.
James: So to confirm: Thursday at 3 PM, Conference Room 2, and the updated price list.
Paula: Thursday, 3 PM, Conference Room 2, and the updated price list. Correct.
James: Perfect. Thank you very much, Paula.
Paula: You are welcome. Goodbye.
James: Goodbye.
$transcript$
)RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'es', 'Llama para pasar un recado');

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'de', 'Gibt eine Nachricht weiter');

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
