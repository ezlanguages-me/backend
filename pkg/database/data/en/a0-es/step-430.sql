-- ============================================================
-- Seed: A0 English Path – STEP 430 – Listening – complaint about the light not working (Alojamiento)
-- Source language: Spanish
-- ============================================================




DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- TRUE / FALSE (8 exercises)
        '{"p":"La huésped habla con recepción en persona.","p_de":"Die Gästin spricht persönlich mit der Rezeption.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La habitación es la 318.","p_de":"Das Zimmer ist die 318.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La luz del baño no funciona.","p_de":"Das Licht im Badezimmer funktioniert nicht.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El mando de la televisión está roto.","p_de":"Die TV-Fernbedienung ist kaputt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Mantenimiento llegará en 45 minutos.","p_de":"Die Wartung kommt in 45 Minuten.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La recepción entrega un mando nuevo inmediatamente.","p_de":"Die Rezeption gibt sofort eine neue Fernbedienung.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La huésped se queja de que la ducha está fría.","p_de":"Die Gästin beschwert sich, dass die Dusche kalt ist.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La huésped tiene que esperar hasta mañana por la ayuda.","p_de":"Die Gästin muss bis morgen auf Hilfe warten.","s":{"type":"true_false","answer":false}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Qué número de habitación menciona la huésped?","p_de":"Welche Zimmernummer nennt die Gästin?","s":{"type":"multiple_choice","options":["318","308","381"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está la luz que no funciona?","p_de":"Wo ist das Licht, das nicht funktioniert?","s":{"type":"multiple_choice","options":["En el baño","En el pasillo","En el ascensor"],"answer":0}}'::jsonb,
        '{"p":"¿Qué otro objeto está roto?","p_de":"Welcher andere Gegenstand ist kaputt?","s":{"type":"multiple_choice","options":["El mando de la TV","La ventana","La cama"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo vendrá mantenimiento?","p_de":"Wann kommt die Wartung?","s":{"type":"multiple_choice","options":["En 45 minutos","En 10 minutos","Mañana por la mañana"],"answer":0}}'::jsonb,
        '{"p":"¿Qué le da recepción a la huésped en ese momento?","p_de":"Was gibt die Rezeption der Gästin sofort?","s":{"type":"multiple_choice","options":["Un mando nuevo","Una factura nueva","Una manta"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde debe esperar la huésped?","p_de":"Wo soll die Gästin warten?","s":{"type":"multiple_choice","options":["En su habitación","En el bar","En la calle"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo hace la queja la huésped?","p_de":"Wie bringt die Gästin ihre Beschwerde vor?","s":{"type":"multiple_choice","options":["Bajando a recepción","Llamando a un taxi","Escribiendo un correo"],"answer":0}}'::jsonb,
        '{"p":"¿Qué departamento subirá a la habitación?","p_de":"Welche Abteilung kommt ins Zimmer?","s":{"type":"multiple_choice","options":["Mantenimiento","Cocina","Limpieza de desayuno"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 430 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 430 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 430, 'en', 'listening', 'accommodation', $transcript$
# AUDIO PROFILE: Sofia and Ben, hotel guest and receptionist
## "A Quick Stop at Reception"

## THE SCENE: Reception desk in the lobby
A guest has come downstairs in person after finding two irritating
problems in the room. The lobby is quiet, and Ben at reception responds
quickly, offering one immediate fix and one short wait for maintenance.

### DIRECTOR'S NOTES
Style:
* In-person complaint with polite but direct language.
* Make the practical details stand out clearly for beginner listeners.

Pace: Natural lobby conversation, calm and efficient.

Accent: Neutral accent.

### SAMPLE CONTEXT
This audio helps learners understand how to report simple room problems
face to face and follow the receptionist's instructions.

#### TRANSCRIPT
Guest [politely] Good evening. I'm in room 318, and I have two problems.
Receptionist [attentively] Of course. Tell me what's wrong.
Guest [clearly] The light in the bathroom doesn't work.
Receptionist [apologetically] I'm sorry about that.
Guest [continuing] And the TV remote is broken, so I can't change the channel.
Receptionist [helpfully] I can give you a new TV remote right now.
Guest [relieved] Great, thank you. What about the bathroom light?
Receptionist [professionally] Maintenance will come to room 318 in about 45 minutes.
Guest [checking] Do I need to stay in the room?
Receptionist [clearly] Yes, please wait there if you can. They will knock before they enter.
Guest [grateful] Perfect. Thanks for your help.
    $transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Queja en recepción por la luz y el mando', '');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Beschwerde an der Rezeption wegen Licht und Fernbedienung', '');

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
