-- ============================================================
-- Seed: A0 English Path – STEP 510 – Listening – simple complaint about broken cooker (Alquileres)
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
        '{"p":"La persona que llama se llama Laura.","p_de":"Die anrufende Person heißt Laura.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La cocina se rompió ayer.","p_de":"Der Herd ist gestern kaputtgegangen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Laura puede cocinar sin problema.","p_de":"Laura kann ohne Problem kochen.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Laura pregunta si alguien puede ir el martes.","p_de":"Laura fragt, ob jemand am Dienstag kommen kann.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Hay disponibilidad para ir el martes.","p_de":"Am Dienstag ist jemand verfügbar.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El técnico irá el jueves por la mañana.","p_de":"Der Techniker kommt am Donnerstagvormittag.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La visita será entre las 9 y las 12.","p_de":"Der Termin ist zwischen 9 und 12 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Si no pueden arreglar la cocina, la cambiarán.","p_de":"Wenn der Herd nicht repariert werden kann, wird er ersetzt.","s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Qué aparato está roto?","p_de":"Welches Gerät ist kaputt?","s":{"type":"multiple_choice","options":["La cocina","La lavadora","La nevera"],"answer":0}}'::jsonb,
        '{"p":"¿Desde cuándo está rota la cocina?","p_de":"Seit wann ist der Herd kaputt?","s":{"type":"multiple_choice","options":["Desde ayer","Desde la semana pasada","Desde esta mañana"],"answer":0}}'::jsonb,
        '{"p":"¿Por qué llama Laura con urgencia?","p_de":"Warum ruft Laura dringend an?","s":{"type":"multiple_choice","options":["Porque no puede cocinar","Porque pierde las llaves","Porque no tiene agua"],"answer":0}}'::jsonb,
        '{"p":"¿Qué día pide Laura primero?","p_de":"Welchen Tag fragt Laura zuerst an?","s":{"type":"multiple_choice","options":["El martes","El jueves","El viernes"],"answer":0}}'::jsonb,
        '{"p":"¿Cuál es la respuesta sobre el martes?","p_de":"Was ist die Antwort auf Dienstag?","s":{"type":"multiple_choice","options":["No hay disponibilidad","Sí, por la tarde","Solo a medianoche"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo irá el técnico?","p_de":"Wann kommt der Techniker?","s":{"type":"multiple_choice","options":["El jueves entre 9 y 12","El martes por la tarde","El sábado por la noche"],"answer":0}}'::jsonb,
        '{"p":"¿Qué hará el propietario si no pueden reparar la cocina?","p_de":"Was macht der Vermieter, wenn der Herd nicht repariert werden kann?","s":{"type":"multiple_choice","options":["La reemplazará","Subirá el alquiler","Llamará a un hotel"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo termina la llamada?","p_de":"Wie endet das Gespräch?","s":{"type":"multiple_choice","options":["Laura acepta el jueves","Laura cancela la reparación","Laura pide un taxi"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 510 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 510 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 510, 'en', 'listening', 'accommodation', $transcript$
# AUDIO PROFILE: Laura and Mr Green, tenant and landlord
## "The Cooker Is Broken"

## THE SCENE: A phone call from the flat to the landlord
Laura is standing in her kitchen, frustrated because she cannot prepare
dinner. She calls her landlord to explain the problem clearly, ask for a
faster visit, and agree on the first realistic repair time.

### DIRECTOR'S NOTES
Style:
* Practical complaint call with simple repair vocabulary and scheduling.
* Keep the timeline easy to follow: when it broke, when the engineer comes,
  and what happens if it cannot be repaired.

Pace: Calm but slightly urgent, like a real maintenance phone call.

Accent: Neutral accent.

### SAMPLE CONTEXT
This listening helps learners understand how to report a broken appliance,
ask for a different time, and confirm an appointment.

#### TRANSCRIPT
Tenant [politely] Hello, Mr Green. This is Laura from flat 2B.
Landlord [attentively] Hi Laura. What seems to be the problem?
Tenant [frustrated but calm] The cooker is broken. It stopped working yesterday, and now I can't cook.
Landlord [sorry] I'm sorry about that.
Tenant [asking] Could someone come on Tuesday?
Landlord [explaining] I'm afraid not. No one is available on Tuesday.
Tenant [checking] Okay. So when can an engineer come?
Landlord [clearly] I can send an engineer on Thursday between 9 and 12.
Tenant [seeking reassurance] All right. And if they can't fix it?
Landlord [reassuringly] If the engineer can't repair the cooker, I will replace it.
Tenant [agreeing] Thursday is fine, then.
Landlord [warmly] Great. I'll book the visit for Thursday morning.
    $transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Laura llama por la cocina rota', '');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Laura ruft wegen des kaputten Herds an', '');

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
