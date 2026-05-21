-- ============================================================
        -- Seed: A0 English Path – STEP 550 – Listening – understand/ask about house rules (Convivencia)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_listening_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"p":"El desayuno es de 7:30 a 8:30.","p_de":"Das Frühstück ist von 7:30 bis 8:30 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"La cena es a las 8 PM.","p_de":"Das Abendessen ist um 20 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"El día de la colada es el miércoles.","p_de":"Der Waschtag ist am Mittwoch.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"Las horas de silencio empiezan a las 10 PM.","p_de":"Die Ruhezeit beginnt um 22 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"Emma puede dejar la cocina sucia.","p_de":"Emma kann die Küche schmutzig lassen.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"Emma puede traer invitados sin preguntar.","p_de":"Emma kann Gäste ohne Fragen mitbringen.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"Sarah dice que Emma puede servirse té o fruta.","p_de":"Sarah sagt, dass Emma sich Tee oder Obst nehmen kann.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"La puerta principal se cierra a las 11 PM.","p_de":"Die Haustür wird um 23 Uhr abgeschlossen.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"¿Cuándo es el desayuno?","p_de":"Wann ist das Frühstück?","s":{"type":"multiple_choice","options":["De 8:30 a 9:30","De 7:30 a 8:30","De 6:30 a 7:30"],"answer":1}}'::jsonb,
                '{"p":"¿A qué hora es la cena?","p_de":"Um wie viel Uhr ist das Abendessen?","s":{"type":"multiple_choice","options":["A las 7 PM","A las 6 PM","A las 8 PM"],"answer":0}}'::jsonb,
                '{"p":"¿Qué puede tomar Emma en la cocina?","p_de":"Was kann Emma in der Küche nehmen?","s":{"type":"multiple_choice","options":["Un pastel grande","Una pizza entera","Té o fruta"],"answer":2}}'::jsonb,
                '{"p":"¿Qué debe hacer Emma antes de traer a un invitado?","p_de":"Was soll Emma tun, bevor sie einen Gast mitbringt?","s":{"type":"multiple_choice","options":["Abrir la puerta de atrás","Preguntar primero","Mandar un mensaje a medianoche"],"answer":1}}'::jsonb,
                '{"p":"¿Qué día es la colada?","p_de":"Welcher Tag ist Waschtag?","s":{"type":"multiple_choice","options":["El miércoles","El lunes","El sábado"],"answer":0}}'::jsonb,
                '{"p":"¿Cuándo empiezan las horas de silencio?","p_de":"Wann beginnt die Ruhezeit?","s":{"type":"multiple_choice","options":["A las 9 PM","A medianoche","A las 10 PM"],"answer":2}}'::jsonb,
                '{"p":"¿Qué debe hacer Emma después de usar la cocina?","p_de":"Was soll Emma nach der Benutzung der Küche tun?","s":{"type":"multiple_choice","options":["Llamar a Sarah","Limpiar su plato y la mesa","Cerrar la nevera con llave"],"answer":1}}'::jsonb,
                '{"p":"¿A qué hora se cierra la puerta principal?","p_de":"Um wie viel Uhr wird die Haustür abgeschlossen?","s":{"type":"multiple_choice","options":["A las 10 PM","A las 11 PM","A las 8 PM"],"answer":0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM listening WHERE step_order = 550 AND path_uuid = v_path_id
            );
            DELETE FROM listening WHERE step_order = 550 AND path_uuid = v_path_id;

            INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
            VALUES (
                v_path_id,
                550,
                'en',
                'listening',
                'social',
                $transcript$
# AUDIO PROFILE: Sarah, host mother, welcoming a new student
## "Welcome to the House"

## THE SCENE: A welcome talk at the kitchen table
Emma has just arrived with her suitcase and a notebook. Sarah wants to explain the main house rules slowly and clearly, so Emma can understand meal times, quiet hours, guests, and basic routines in the home.

### DIRECTOR'S NOTES
Style:
* Warm, practical, and patient, like a host mother speaking to a new student on the first evening.
* Repeat key times and rules in simple words so A0 learners can catch them.

Pace: Slow and steady with a short pause after each rule.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for homestay arrivals, short welcome talks, and simple social rules in a shared home.
Learners hear information about breakfast, dinner, kitchen use, laundry, quiet hours, and guests.

#### TRANSCRIPT
Narrator [warmly] Emma sits at the kitchen table with a cup of tea. Sarah smiles and starts to explain how life in the house works.
Sarah [kindly] Hi Emma. Welcome again. I want to tell you the most important house rules, so your first week is easy.
Sarah [clearly] Breakfast is from seven thirty to eight thirty in the morning. We usually eat in the kitchen, and there is bread, fruit, and tea on the table.
Sarah [helpfully] Dinner is at seven in the evening. We try to eat together, because it is a nice moment to talk about the day.
Sarah [carefully] If you are going to be late for dinner, please send me a message before six thirty. Then I know you are all right.
Sarah [gently] You can use the kitchen until nine at night. If you want tea or fruit later, that is fine, but after nine we keep the kitchen quiet.
Sarah [firm but friendly] After you use the kitchen, please wash your plate and cup and wipe the table. Do not leave dishes there for the next morning.
Sarah [pleasantly] Laundry day is Wednesday. Put your clothes in the basket in the bathroom, and I will show you the washing machine after dinner.
Sarah [slowly] Quiet hours start at ten at night. The children go to bed early, so after ten please keep music, phone calls, and showers very quiet.
Sarah [adding detail] We also lock the front door at ten, so take your key when you go out. If you come home late, open the door quietly.
Sarah [reassuringly] Friends can visit for a short time, but please ask me first. We need to know who is in the house.
Sarah [smiling] If you are hungry in the afternoon, you can help yourself to tea or fruit. Just tell me if something is finished.
Emma [softly] Thank you, Sarah. The rules are very clear.
Sarah [encouragingly] Good. Do not worry if you forget something on the first day. You can always ask me again.
Narrator [calmly] Emma writes down the times in her notebook. Now she feels more relaxed about her first evening with the host family.
                $transcript$
            )RETURNING uuid INTO v_listening_id;

            INSERT INTO listening_translation (listening_uuid, language, title)
            VALUES (v_listening_id, 'es', 'Sarah explica las normas de la casa');

            INSERT INTO listening_translation (listening_uuid, language, title)
            VALUES (v_listening_id, 'de', 'Sarah erklärt die Hausregeln der Familie');

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
