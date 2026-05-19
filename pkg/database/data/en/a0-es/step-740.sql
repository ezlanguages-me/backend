-- ============================================================
-- Seed: A0 English Path – STEP 740 – Listening – understand a phone message and confirm details (Comunicación Telefónica)
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
        '{"p":"Nina llega el viernes 12 de mayo.","p_de":"Nina kommt am Freitag, dem 12. Mai, an.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina llega a las 4:30 PM.","p_de":"Nina kommt um 16:30 Uhr an.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina espera en la taquilla.","p_de":"Nina wartet am Fahrkartenschalter.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina llega al aeropuerto.","p_de":"Nina kommt am Flughafen an.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Carlos llama para confirmar los datos.","p_de":"Carlos ruft an, um die Details zu bestätigen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina dice que llega el sábado.","p_de":"Nina sagt, dass sie am Samstag ankommt.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Nina espera en la entrada del café.","p_de":"Nina wartet am Café-Eingang.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Carlos repite la fecha y la hora.","p_de":"Carlos wiederholt das Datum und die Uhrzeit.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Quién deja primero el mensaje?","p_de":"Wer hinterlässt zuerst die Nachricht?","s":{"type":"multiple_choice","options":["Nina","Carlos","Maria"],"answer":0}}'::jsonb,
        '{"p":"¿Quién devuelve la llamada?","p_de":"Wer ruft zurück?","s":{"type":"multiple_choice","options":["Carlos","Nina","Tom"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde llega Nina?","p_de":"Wo kommt Nina an?","s":{"type":"multiple_choice","options":["Central Station","North Station","The airport"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo llega Nina?","p_de":"Wann kommt Nina an?","s":{"type":"multiple_choice","options":["Friday, 12 May, at 4:30 PM","Friday, 12 May, at 5:30 PM","Saturday, 13 May, at 4:30 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde va a esperar Nina?","p_de":"Wo wird Nina warten?","s":{"type":"multiple_choice","options":["At the ticket desk","At the café entrance","At platform 6"],"answer":0}}'::jsonb,
        '{"p":"¿Qué confirma Carlos?","p_de":"Was bestätigt Carlos?","s":{"type":"multiple_choice","options":["The date, time, and place","Only the weather","A hotel room"],"answer":0}}'::jsonb,
        '{"p":"¿Qué tipo de mensaje es?","p_de":"Was für eine Nachricht ist das?","s":{"type":"multiple_choice","options":["A travel arrival message","A work report","A birthday invitation"],"answer":0}}'::jsonb,
        '{"p":"¿Qué quiere Nina que haga Carlos?","p_de":"Was soll Carlos laut Nina tun?","s":{"type":"multiple_choice","options":["Meet her at the station","Send a book","Call the dentist"],"answer":0}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 740 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 740 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (v_path_id, 740, 'en', 'listening', 'communication', $transcript$
# AUDIO PROFILE: Nina and Carlos, confirming travel details by phone
## "Meeting at the Station"

## THE SCENE: A voicemail followed by a short call back
Nina leaves a voicemail because Carlos cannot answer his phone at first.
Later, Carlos calls back and repeats each detail carefully to make sure the plan is correct.

### DIRECTOR'S NOTES
Style:
* Fact-based and very clear, with repeated details for date, time, and place.
* Simple confirmation language that helps A0 learners notice key travel information.

Pace: Slow and careful, especially when the details are repeated.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for travel arrivals, meeting plans, and checking facts from a voicemail.
Learners hear how a person repeats important details to confirm them.

#### TRANSCRIPT
[voicemail] Hi Carlos, this is Nina. I arrive at Central Station on Friday, 12 May, at 4:30 PM.
[clear] I will wait at the ticket desk. Please meet me there.
[phone tone] Later, Carlos calls Nina back.
[carefully] Hi Nina. This is Carlos. You arrive at Central Station on Friday, 12 May, at 4:30 PM. Right?
[confirming] Yes, that is right.
[checking] And you will wait at the ticket desk?
[confirming] Yes, I will wait there.
[relieved] Great. I will meet you at the station.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'Mensaje de Nina y llamada de confirmación', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Ninas Nachricht und Bestätigungsanruf', '');

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
