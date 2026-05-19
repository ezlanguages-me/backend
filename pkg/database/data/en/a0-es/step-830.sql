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
        '{"p":"La reunión del jueves se mueve a las 3 PM.","p_de":"Das Treffen am Donnerstag wird auf 15 Uhr verschoben.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La nueva sala es Conference Room 2.","p_de":"Der neue Raum ist Conference Room 2.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Necesitan la lista de precios actualizada.","p_de":"Sie brauchen die aktualisierte Preisliste.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"James pregunta si la clienta tiene un bolígrafo.","p_de":"James fragt, ob die Kundin einen Stift hat.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La reunión ahora es a la 1 PM.","p_de":"Das Treffen ist jetzt um 13 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"James recibe un mensaje en vez de darlo.","p_de":"James nimmt eine Nachricht auf, statt sie weiterzugeben.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Quién hace la llamada?","p_de":"Wer macht den Anruf?","s":{"type":"multiple_choice","options":["James","Susan Clark","Helen"],"answer":0}}'::jsonb,
        '{"p":"¿De quién es el mensaje?","p_de":"Von wem ist die Nachricht?","s":{"type":"multiple_choice","options":["Susan Clark","David Green","Mr Richards"],"answer":0}}'::jsonb,
        '{"p":"¿Qué empresa recibe la llamada?","p_de":"Welche Firma erhält den Anruf?","s":{"type":"multiple_choice","options":["ABC Solutions","TechCorp","Central Library"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo es ahora la reunión?","p_de":"Wann ist das Treffen jetzt?","s":{"type":"multiple_choice","options":["Thursday at 3 PM","Thursday at 2 PM","Friday at 3 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde es ahora la reunión?","p_de":"Wo ist das Treffen jetzt?","s":{"type":"multiple_choice","options":["Conference Room 2","Room B12","Room 101"],"answer":0}}'::jsonb,
        '{"p":"¿Qué necesitan llevar o enviar?","p_de":"Was müssen sie mitbringen oder senden?","s":{"type":"multiple_choice","options":["The updated price list","A dictionary","A train ticket"],"answer":0}}'::jsonb,
        '{"p":"¿Qué pregunta James antes de los detalles?","p_de":"Was fragt James vor den Details?","s":{"type":"multiple_choice","options":["Do you have a pen","Are you at the station","Can you call me later"],"answer":0}}'::jsonb,
        '{"p":"¿Por qué llama James?","p_de":"Warum ruft James an?","s":{"type":"multiple_choice","options":["To pass on a prepared message","To take a hotel booking","To cancel lunch"],"answer":0}}'::jsonb
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
VALUES (v_path_id, 830, 'en', 'listening', 'communication', $transcript$
# AUDIO PROFILE: James, an office assistant, calling ABC Solutions for his manager
## "A Changed Meeting Time"

## THE SCENE: An office desk during a planned outgoing call
James has a prepared note from his manager, Susan Clark, and calls the client to pass it on clearly.
He checks that the client is ready to write and then gives the new time, room, and one extra request.

### DIRECTOR'S NOTES
Style:
* Simple professional tone, with clear message delivery from start to finish.
* Very structured wording so beginners can follow one prepared message at a time.

Pace: Measured and organized, with pauses before each important detail.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for work calls where one person passes on a message from a manager.
Learners hear how to introduce the call, check readiness, and deliver changed details.

#### TRANSCRIPT
[professional] James: Good afternoon. This is James from Clark Consulting. May I speak to someone at ABC Solutions?
[polite] Paula: Yes, this is Paula speaking.
[clear] James: I am calling with a message from my manager, Susan Clark.
[checking] James: Do you have a pen to write this down?
[ready] Paula: Yes, I do.
[carefully] James: The meeting on Thursday is moved to 3 PM.
[carefully] James: It is now in Conference Room 2.
[businesslike] James: Susan also says that we need the updated price list.
[confirming] Paula: Thursday, 3 PM, Conference Room 2, and the updated price list.
[pleased] James: Perfect. Thank you very much.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'James llama para pasar un recado', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'James ruft an und gibt eine Nachricht weiter', '');

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
