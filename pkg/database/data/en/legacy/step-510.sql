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
                '{"p":"Laura vive en el piso 2B.","p_de":"Laura wohnt in Wohnung 2B.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"La cocina se rompió esta mañana.","p_de":"Der Herd ist heute Morgen kaputtgegangen.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"Laura todavía puede usar el horno sin problema.","p_de":"Laura kann den Ofen noch problemlos benutzen.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"Laura pregunta primero por una visita el martes.","p_de":"Laura fragt zuerst nach einem Termin am Dienstag.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"Hay un técnico disponible el martes.","p_de":"Am Dienstag ist ein Techniker verfügbar.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"El técnico irá el jueves por la mañana.","p_de":"Der Techniker kommt am Donnerstagvormittag.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"La visita será entre la una y las cuatro.","p_de":"Der Termin ist zwischen ein und vier Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"Si no pueden reparar la cocina, el propietario la sustituirá.","p_de":"Wenn der Herd nicht repariert werden kann, wird der Vermieter ihn ersetzen.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"¿Qué aparato está roto?","p_de":"Welches Gerät ist kaputt?","s":{"type":"multiple_choice","options":["La lavadora","La cocina","La nevera"],"answer":1}}'::jsonb,
                '{"p":"¿Cuándo dejó de funcionar la cocina?","p_de":"Wann hat der Herd aufgehört zu funktionieren?","s":{"type":"multiple_choice","options":["Ayer por la tarde","La semana pasada","Esta mañana"],"answer":0}}'::jsonb,
                '{"p":"¿Por qué llama Laura con urgencia?","p_de":"Warum ruft Laura dringend an?","s":{"type":"multiple_choice","options":["Porque perdió la llave","Porque necesita un taxi","Porque no puede cocinar la cena"],"answer":2}}'::jsonb,
                '{"p":"¿Qué día pide Laura al principio?","p_de":"Nach welchem Tag fragt Laura zuerst?","s":{"type":"multiple_choice","options":["El jueves","El martes","El domingo"],"answer":1}}'::jsonb,
                '{"p":"¿Qué dice el propietario sobre el martes?","p_de":"Was sagt der Vermieter über Dienstag?","s":{"type":"multiple_choice","options":["No hay ningún técnico libre","Puede pasar al mediodía","Solo puede ir un vecino"],"answer":0}}'::jsonb,
                '{"p":"¿Cuándo puede ir el técnico?","p_de":"Wann kann der Techniker kommen?","s":{"type":"multiple_choice","options":["El miércoles por la noche","El viernes por la tarde","El jueves entre las nueve y las doce"],"answer":2}}'::jsonb,
                '{"p":"¿Qué promete el propietario si no pueden repararla?","p_de":"Was verspricht der Vermieter, wenn man den Herd nicht reparieren kann?","s":{"type":"multiple_choice","options":["Bajará el alquiler","La sustituirá","Pedirá esperar una semana"],"answer":1}}'::jsonb,
                '{"p":"¿Cómo termina la llamada?","p_de":"Wie endet das Gespräch?","s":{"type":"multiple_choice","options":["Laura acepta la visita del jueves por la mañana","Laura cancela la reparación","Laura reserva un hotel"],"answer":0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM listening WHERE step_order = 510 AND path_uuid = v_path_id
            );
            DELETE FROM listening WHERE step_order = 510 AND path_uuid = v_path_id;

            INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
            VALUES (
                v_path_id,
                510,
                'en',
                'listening',
                'accommodation',
                $transcript$
# AUDIO PROFILE: Laura and Mr Green, tenant and landlord on the phone
## "The Cooker Is Broken"

## THE SCENE: Laura calls from her kitchen after dinner plans fail
Laura has just come home from work and wants to prepare a simple meal. The cooker does not work, so she phones Mr Green to explain the problem clearly, ask for a repair visit, and check what happens if the cooker cannot be repaired.

### DIRECTOR'S NOTES
Style:
* Clear and practical complaint language with very simple repair vocabulary.
* Keep the timeline easy to follow: when it broke, what Laura tried, and when the technician can come.

Pace: Slow and calm, but with a little urgency because Laura needs to cook.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for reporting a broken appliance, asking for a new appointment, and understanding a landlord's answer.
Learners hear the same information several times in slightly different words, which helps with dates, times, and repair promises.

#### TRANSCRIPT
Narrator [softly] Laura stands in her small kitchen in flat 2B. She wants to cook pasta, but the cooker is cold and dark, so she calls her landlord.
Tenant [politely] Hello, Mr Green. This is Laura from flat 2B. I am sorry to call in the evening, but I have a problem with the cooker.
Landlord [attentively] Hello, Laura. That is all right. Tell me what is happening.
Tenant [clearly] The cooker stopped working yesterday evening while I was making dinner. Today I tried again, and it still does not turn on.
Landlord [checking details] So the rings are cold now, and the oven is not working either?
Tenant [explaining] Yes, that is right. The rings stay cold, the oven light is off, and I cannot cook anything tonight.
Landlord [sympathetically] I understand. That is a real problem, especially after work.
Tenant [asking carefully] Could someone come on Tuesday morning? I can stay at home then, and I really need the cooker.
Landlord [apologetically] I am afraid Tuesday is not possible. The technician is already fully booked that day, and Wednesday is full too.
Tenant [looking for another option] I see. Then when is the first free appointment?
Landlord [clearly] The first possible visit is Thursday morning, between nine and twelve. The technician can check the cooker and see what is wrong.
Tenant [seeking reassurance] Thursday morning is better than nothing. If the technician cannot repair it, what will you do?
Landlord [reassuringly] If the cooker is too old or too damaged to repair, I will replace it. I do not want you without a cooker for long.
Tenant [checking again] So just to be clear, the technician comes on Thursday between nine and twelve, and you will replace the cooker if it cannot be fixed?
Landlord [firmly] Yes, exactly. I will also send you a text message on Wednesday evening to confirm the visit.
Tenant [relieved] Thank you. Thursday morning is fine for me.
Landlord [warmly] Good. I will book it now. Thanks for calling quickly, Laura.
Narrator [calmly] Laura ends the call. She is still disappointed, but now she knows the plan.
                $transcript$
            )RETURNING uuid INTO v_listening_id;

            INSERT INTO listening_translation (listening_uuid, language, title)
            VALUES (v_listening_id, 'es', 'Llamada por la cocina rota');

            INSERT INTO listening_translation (listening_uuid, language, title)
            VALUES (v_listening_id, 'de', 'Anruf wegen des kaputten Herds');

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
