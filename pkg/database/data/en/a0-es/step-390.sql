-- ============================================================
-- Seed: A0 English Path – STEP 390 – Listening – make a simple complaint at a hotel (Alojamiento)
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
        '{"p":"La huésped está en la habitación 214.","p_de":"Die Gästin ist in Zimmer 214.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La queja se hace por teléfono.","p_de":"Die Beschwerde wird am Telefon gemacht.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La ducha está fría.","p_de":"Die Dusche ist kalt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El problema de la ducha existe desde hace dos días.","p_de":"Das Problem mit der Dusche besteht seit zwei Tagen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La ventana se cierra bien.","p_de":"Das Fenster schließt richtig.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La calle es muy ruidosa.","p_de":"Die Straße ist sehr laut.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La recepción enviará a un fontanero en 30 minutos.","p_de":"Die Rezeption schickt in 30 Minuten einen Klempner.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El recepcionista ofrece cambiar de habitación.","p_de":"Der Rezeptionist bietet einen Zimmerwechsel an.","s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Qué problema menciona primero la huésped?","p_de":"Welches Problem nennt die Gästin zuerst?","s":{"type":"multiple_choice","options":["La ducha está fría","La cama está rota","No hay desayuno"],"answer":0}}'::jsonb,
        '{"p":"¿Cuánto tiempo lleva el agua fría?","p_de":"Wie lange ist das Wasser schon kalt?","s":{"type":"multiple_choice","options":["Desde hace dos días","Desde esta mañana","Desde hace una semana"],"answer":0}}'::jsonb,
        '{"p":"¿Qué otra cosa no funciona bien?","p_de":"Was funktioniert außerdem nicht richtig?","s":{"type":"multiple_choice","options":["La ventana","La televisión","La puerta"],"answer":0}}'::jsonb,
        '{"p":"¿Por qué la habitación es molesta por la noche?","p_de":"Warum ist das Zimmer nachts unangenehm?","s":{"type":"multiple_choice","options":["Porque entra mucho ruido de la calle","Porque hace demasiado calor","Porque la luz no se apaga"],"answer":0}}'::jsonb,
        '{"p":"¿A quién enviará recepción?","p_de":"Wen schickt die Rezeption?","s":{"type":"multiple_choice","options":["A un fontanero","A un cocinero","A un taxista"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo llegará esa persona?","p_de":"Wann kommt diese Person?","s":{"type":"multiple_choice","options":["En 30 minutos","En 5 minutos","Mañana por la tarde"],"answer":0}}'::jsonb,
        '{"p":"¿Qué otra solución ofrece el recepcionista?","p_de":"Welche andere Lösung bietet der Rezeptionist an?","s":{"type":"multiple_choice","options":["Un cambio de habitación","Un desayuno gratis","Un descuento en el parking"],"answer":0}}'::jsonb,
        '{"p":"¿Qué número de habitación se repite en la llamada?","p_de":"Welche Zimmernummer wird im Gespräch genannt?","s":{"type":"multiple_choice","options":["214","124","240"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 390 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 390 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 390, 'en', 'listening', 'accommodation', $transcript$
# AUDIO PROFILE: Clara and Mr Patel, hotel guest and receptionist
## "Room 214 Calls Reception"

## THE SCENE: A phone call from the guest room
Late in the evening, Clara calls reception from her room because two
problems are making it hard to rest. Mr Patel listens carefully,
apologizes, and gives a practical solution while keeping the tone calm
and reassuring.

### DIRECTOR'S NOTES
Style:
* Polite complaint call with clear problem reporting and clear solutions.
* Keep the key details very easy to catch: room number, time, and actions.

Pace: Slightly slower than normal conversation, like careful phone speech.

Accent: Neutral accent.

### SAMPLE CONTEXT
This type of listening helps learners understand how to report a problem
by phone in a hotel and how staff may respond.

#### TRANSCRIPT
Receptionist [professionally] Good evening, reception. How can I help you?
Guest [tiredly] Hello. This is room 214. I'm calling because the shower is cold.
Receptionist [concerned] I'm sorry to hear that. Is the water cold now?
Guest [frustrated but polite] Yes, and it has been cold for two days.
Receptionist [taking notes] I understand. Is there anything else wrong in the room?
Guest [explaining] Yes. The window won't close, so the street is very noisy.
Receptionist [apologetically] I'm very sorry. I can send a plumber in about 30 minutes to check the shower and the window.
Guest [seeking help] Thank you. If it cannot be fixed tonight, can I change rooms?
Receptionist [reassuringly] Of course. I can also offer you a room change if you prefer.
Guest [calmer] Let's see the plumber first, please.
Receptionist [warmly] No problem. The plumber will come to room 214 in 30 minutes.
Guest [grateful] Thank you very much.
    $transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Llamada a recepción por problemas en la habitación', '');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Anruf bei der Rezeption wegen Zimmerproblemen', '');

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
