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
    -- ------------------------------------------------------------
    v_exercises JSONB[] := ARRAY[
        '{"p":"Helen es la recepcionista de la oficina.","p_de":"Helen ist die Empfangskraft im Büro.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"David Green llama de TechCorp.","p_de":"David Green ruft von TechCorp an.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La reunión es el martes a las 2 PM.","p_de":"Das Treffen ist am Dienstag um 14 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La reunión es en la sala B12.","p_de":"Das Treffen ist in Raum B12.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El señor Richards debe llevar el informe del proyecto.","p_de":"Herr Richards soll den Projektbericht mitbringen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Helen toma un mensaje para la señora Brown.","p_de":"Helen nimmt eine Nachricht für Frau Brown auf.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La reunión es el miércoles.","p_de":"Das Treffen ist am Mittwoch.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Helen repite los detalles para confirmar.","p_de":"Helen wiederholt die Details zur Bestätigung.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Quién llama?","p_de":"Wer ruft an?","s":{"type":"multiple_choice","options":["David Green","Mr Richards","Helen"],"answer":0}}'::jsonb,
        '{"p":"¿De qué empresa llama David?","p_de":"Von welcher Firma ruft David an?","s":{"type":"multiple_choice","options":["TechCorp","ABC Solutions","Central Library"],"answer":0}}'::jsonb,
        '{"p":"¿Quién toma el mensaje?","p_de":"Wer nimmt die Nachricht auf?","s":{"type":"multiple_choice","options":["Helen","Susan Clark","Maria"],"answer":0}}'::jsonb,
        '{"p":"¿Para quién es el mensaje?","p_de":"Für wen ist die Nachricht?","s":{"type":"multiple_choice","options":["Mr Richards","James","Carlos"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo es la reunión?","p_de":"Wann ist das Treffen?","s":{"type":"multiple_choice","options":["Tuesday at 2 PM","Tuesday at 4 PM","Thursday at 2 PM"],"answer":0}}'::jsonb,
        '{"p":"¿En qué sala es la reunión?","p_de":"In welchem Raum ist das Treffen?","s":{"type":"multiple_choice","options":["Room B12","Room A12","Room B21"],"answer":0}}'::jsonb,
        '{"p":"¿Qué debe llevar el señor Richards?","p_de":"Was soll Herr Richards mitbringen?","s":{"type":"multiple_choice","options":["The project report","The price list","The station ticket"],"answer":0}}'::jsonb,
        '{"p":"¿Qué hace Helen al final?","p_de":"Was macht Helen am Ende?","s":{"type":"multiple_choice","options":["She reads the message back","She cancels the meeting","She asks for a taxi"],"answer":0}}'::jsonb
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
VALUES (v_path_id, 790, 'en', 'listening', 'communication', $transcript$
# AUDIO PROFILE: Helen, an office receptionist, and David Green from TechCorp
## "A Message for Mr Richards"

## THE SCENE: The reception desk in a busy office
Helen answers the main office phone while her manager is in another room.
She listens carefully, writes the details down, and then reads the full message back to confirm it.

### DIRECTOR'S NOTES
Style:
* Professional but simple, with clear spelling of key work details.
* Repetition at the end helps A0 learners catch time, room number, and what to bring.

Pace: Steady office pace, slowing down for the important details.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for reception work, office calls, and taking messages for a manager.
Learners practise understanding names, companies, meeting times, and requests.

#### TRANSCRIPT
[professional] Helen: Good morning. Richards Office. Helen speaking.
[clear] David: Hello. This is David Green from TechCorp. May I leave a message for Mr Richards?
[helpful] Helen: Yes, of course.
[businesslike] David: Please tell him I want to confirm our meeting on Tuesday at 2 PM in Room B12.
[careful] David: Please ask him to bring the project report.
[reading notes] Helen: Tuesday at 2 PM, Room B12, and Mr Richards needs the project report.
[checking] Helen: The message is from David Green at TechCorp. Is that correct?
[confirming] David: Yes, that is correct. Thank you.
[polite] Helen: You are welcome. I will give him the message.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'Helen toma un mensaje para su jefe', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Helen nimmt eine Nachricht für ihren Chef auf', '');

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
