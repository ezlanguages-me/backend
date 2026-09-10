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
    -- T/F: F,T,T,F,T,F,F,T = 4T/4F
    -- MC: 0,1,2,0,1,0,2,1 = {0:3,1:3,2:2}
    -- ------------------------------------------------------------
    v_exercises JSONB[] := ARRAY[
        '{"p":"Nina llega el sábado 13 de mayo.","p_de":"Nina kommt am Samstag, dem 13. Mai, an.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Nina llega a las 4:30 PM.","p_de":"Nina kommt um 16:30 Uhr an.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina espera en la taquilla.","p_de":"Nina wartet am Fahrkartenschalter.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina llega al aeropuerto.","p_de":"Nina kommt am Flughafen an.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Carlos llama para confirmar los datos.","p_de":"Carlos ruft an, um die Details zu bestätigen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina dice que llega el sábado.","p_de":"Nina sagt, dass sie am Samstag ankommt.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Nina espera en la entrada del café.","p_de":"Nina wartet am Café-Eingang.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Carlos repite la fecha y la hora.","p_de":"Carlos wiederholt das Datum und die Uhrzeit.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Quién deja primero el mensaje?","p_de":"Wer hinterlässt zuerst die Nachricht?","s":{"type":"multiple_choice","options":["Nina","Carlos","Maria"],"answer":0}}'::jsonb,
        '{"p":"¿Quién devuelve la llamada?","p_de":"Wer ruft zurück?","s":{"type":"multiple_choice","options":["Nina","Carlos","Tom"],"answer":1}}'::jsonb,
        '{"p":"¿Dónde llega Nina?","p_de":"Wo kommt Nina an?","s":{"type":"multiple_choice","options":["North Station","The airport","Central Station"],"answer":2}}'::jsonb,
        '{"p":"¿Cuándo llega Nina?","p_de":"Wann kommt Nina an?","s":{"type":"multiple_choice","options":["Friday, 12 May, at 4:30 PM","Friday, 12 May, at 5:30 PM","Saturday, 13 May, at 4:30 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde va a esperar Nina?","p_de":"Wo wird Nina warten?","s":{"type":"multiple_choice","options":["At the café entrance","At the ticket desk","At platform 6"],"answer":1}}'::jsonb,
        '{"p":"¿Qué confirma Carlos?","p_de":"Was bestätigt Carlos?","s":{"type":"multiple_choice","options":["The date, time, and place","Only the weather","A hotel room"],"answer":0}}'::jsonb,
        '{"p":"¿Qué tipo de mensaje es?","p_de":"Was für eine Nachricht ist das?","s":{"type":"multiple_choice","options":["A work report","A birthday invitation","A travel arrival message"],"answer":2}}'::jsonb,
        '{"p":"¿Qué quiere Nina que haga Carlos?","p_de":"Was soll Carlos laut Nina tun?","s":{"type":"multiple_choice","options":["Send a book","Meet her at the station","Call the dentist"],"answer":1}}'::jsonb
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
VALUES (
    v_path_id,
    740,
    'en',
    'listening',
    'communication',
    $transcript$
[voicemail tone]
Nina: Hi Carlos, this is Nina. I am calling to confirm my travel plans. I am arriving at Central Station on Friday, the twelfth of May, at four thirty in the afternoon. I will be on the main platform, number six. I will wait at the ticket desk near the main entrance. It is just inside the front doors on the left. I have one small blue bag and I am wearing a dark green jacket, so you should spot me easily. Please call me back to confirm you got this message. Thank you, Carlos. See you on Friday.
[phone rings]
Carlos: Hello, Nina?
Nina: Hi Carlos! Great, you got my message.
Carlos: Yes, I did. Let me just check the details with you.
Nina: Of course. Go ahead.
Carlos: So, you arrive at Central Station on Friday, the twelfth of May, at four thirty in the afternoon. Is that right?
Nina: Yes, exactly. Friday the twelfth, at four thirty.
Carlos: And you will wait at the ticket desk near the main entrance?
Nina: Yes, at the ticket desk. It is easy to find.
Carlos: And I should look for a small blue bag and a dark green jacket?
Nina: That is right. One small blue bag and a dark green jacket.
Carlos: Perfect. I will be there at four fifteen so I am ready when you arrive.
Nina: That is great, thank you for calling back.
Carlos: No problem. See you on Friday then.
Nina: See you on Friday. Goodbye, Carlos.
Carlos: Goodbye, Nina. Have a safe journey.
$transcript$
) RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'es', 'Nina y llamada de confirmación');

INSERT INTO listening_translation (listening_uuid, language, title)
VALUES (v_listening_id, 'de', 'Bestätigungsanruf');

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
