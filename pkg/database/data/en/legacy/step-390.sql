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
        '{"p":"La queja se hace en persona.","p_de":"Die Beschwerde wird persönlich gemacht.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La ducha está fría.","p_de":"Die Dusche ist kalt.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El problema de la ducha empezó hoy.","p_de":"Das Problem mit der Dusche begann heute.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La ventana se cierra bien.","p_de":"Das Fenster schließt richtig.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La calle es muy ruidosa.","p_de":"Die Straße ist sehr laut.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La recepción enviará a un fontanero en 30 minutos.","p_de":"Die Rezeption schickt in 30 Minuten einen Klempner.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El recepcionista ofrece un desayuno gratis.","p_de":"Der Rezeptionist bietet ein kostenloses Frühstück an.","s":{"type":"true_false","answer":false}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Qué problema menciona primero la huésped?","p_de":"Welches Problem nennt die Gästin zuerst?","s":{"type":"multiple_choice","options":["La ducha está fría","La cama está rota","No hay desayuno"],"answer":0}}'::jsonb,
        '{"p":"¿Cuánto tiempo lleva el agua fría?","p_de":"Wie lange ist das Wasser schon kalt?","s":{"type":"multiple_choice","options":["Desde esta mañana","Desde hace dos días","Desde hace una semana"],"answer":1}}'::jsonb,
        '{"p":"¿Qué otra cosa no funciona bien?","p_de":"Was funktioniert außerdem nicht richtig?","s":{"type":"multiple_choice","options":["La televisión","La puerta","La ventana"],"answer":2}}'::jsonb,
        '{"p":"¿Por qué la habitación es molesta por la noche?","p_de":"Warum ist das Zimmer nachts unangenehm?","s":{"type":"multiple_choice","options":["Porque hace demasiado calor","Porque entra mucho ruido de la calle","Porque la luz no se apaga"],"answer":1}}'::jsonb,
        '{"p":"¿A quién enviará recepción?","p_de":"Wen schickt die Rezeption?","s":{"type":"multiple_choice","options":["A un fontanero","A un cocinero","A un taxista"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo llegará esa persona?","p_de":"Wann kommt diese Person?","s":{"type":"multiple_choice","options":["En 5 minutos","Mañana por la tarde","En 30 minutos"],"answer":2}}'::jsonb,
        '{"p":"¿Qué otra solución ofrece el recepcionista?","p_de":"Welche andere Lösung bietet der Rezeptionist an?","s":{"type":"multiple_choice","options":["Un desayuno gratis","Un cambio de habitación","Un descuento en el parking"],"answer":1}}'::jsonb,
        '{"p":"¿Qué número de habitación se repite en la llamada?","p_de":"Welche Zimmernummer wird im Gespräch genannt?","s":{"type":"multiple_choice","options":["214","124","240"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 390 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 390 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    390,
    'en',
    'listening',
    'accommodation',
    $transcript$
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
Receptionist [concerned] I'm sorry to hear that. Have you tried running it for a few minutes?
Guest [frustrated but polite] Yes, I have. It is still cold. The water has been cold for two days now.
Receptionist [taking notes] Two days. I understand. I'm very sorry about that.
Guest [explaining] There is also another problem. The window won't close properly.
Receptionist [concerned] Oh, I see. Is the noise from the street bothering you?
Guest [confirming] Yes, the street is very noisy at night. It is hard to sleep.
Receptionist [apologetically] I'm very sorry. I can send a plumber in about 30 minutes to check the shower and fix the window.
Guest [seeking help] Thank you. If it cannot be fixed tonight, is it possible to change rooms?
Receptionist [reassuringly] Of course. I can also offer you a room change if you prefer. Just let me know.
Guest [calmer] Let's see the plumber first, please. I hope it can be fixed.
Receptionist [warmly] Of course. The plumber will come to room 214 in 30 minutes. Is there anything else I can help you with?
Guest [grateful] No, that is everything. Thank you very much.
Receptionist [politely] You are welcome. I hope you have a good night.
    $transcript$
)RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES (v_listening_id, 'es', 'Problemas en la habitación');

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES (v_listening_id, 'de', 'Anruf bei der Rezeption wegen Zimmerproblemen');

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
