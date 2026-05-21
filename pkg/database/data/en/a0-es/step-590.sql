-- ============================================================
        -- Seed: A0 English Path – STEP 590 – Listening – express opinions in a limited way (Convivencia)
        -- Source language: Spanish
        -- ============================================================
        DO $seed$
        DECLARE
            v_path_id UUID;
            v_listening_id UUID;
            v_ex_id UUID;
            ex JSONB;
            v_exercises JSONB[] := ARRAY[
                '{"p":"A Alex le encanta la comida.","p_de":"Alex liebt das Essen.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"A Alex le gusta levantarse temprano.","p_de":"Alex steht gern früh auf.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"Alex piensa que la ciudad es bonita.","p_de":"Alex findet die Stadt schön.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"Alex dice que hace calor.","p_de":"Alex sagt, dass es warm ist.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"A Alex le gusta su habitación.","p_de":"Alex mag sein Zimmer.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"Alex echa de menos a su perro.","p_de":"Alex vermisst seinen Hund.","s":{"type":"true_false","answer":true}}'::jsonb,
                '{"p":"Jamie y Alex hablan en un café.","p_de":"Jamie und Alex sprechen in einem Café.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"Alex dice que la comida es terrible.","p_de":"Alex sagt, dass das Essen schrecklich ist.","s":{"type":"true_false","answer":false}}'::jsonb,
                '{"p":"¿Qué le encanta a Alex?","p_de":"Was liebt Alex?","s":{"type":"multiple_choice","options":["El autobús","La comida","El horario"],"answer":1}}'::jsonb,
                '{"p":"¿Qué no le gusta a Alex?","p_de":"Was mag Alex nicht?","s":{"type":"multiple_choice","options":["Levantarse temprano","Su habitación","Jamie"],"answer":0}}'::jsonb,
                '{"p":"¿Cómo es la ciudad para Alex?","p_de":"Wie ist die Stadt für Alex?","s":{"type":"multiple_choice","options":["Pequeña", "Aburrida", "Bonita"],"answer":2}}'::jsonb,
                '{"p":"¿Cómo describe Alex su habitación?","p_de":"Wie beschreibt Alex sein Zimmer?","s":{"type":"multiple_choice","options":["Oscura y fría","Pequeña pero cómoda","Muy ruidosa"],"answer":1}}'::jsonb,
                '{"p":"¿Cómo es el tiempo allí?","p_de":"Wie ist das Wetter dort?","s":{"type":"multiple_choice","options":["Frío","Caluroso","Muy seco"],"answer":0}}'::jsonb,
                '{"p":"¿A quién echa de menos Alex?","p_de":"Wen vermisst Alex?","s":{"type":"multiple_choice","options":["Al profesor","Al vecino","A su perro"],"answer":2}}'::jsonb,
                '{"p":"¿Quién hace las preguntas?","p_de":"Wer stellt die Fragen?","s":{"type":"multiple_choice","options":["Alex","Jamie","Sarah"],"answer":1}}'::jsonb,
                '{"p":"¿Qué tipo de respuestas da Alex?","p_de":"Welche Art von Antworten gibt Alex?","s":{"type":"multiple_choice","options":["Respuestas cortas con opiniones","Historias muy largas","Solo sí o no"],"answer":0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM listening WHERE step_order = 590 AND path_uuid = v_path_id
            );
            DELETE FROM listening WHERE step_order = 590 AND path_uuid = v_path_id;

            INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
            VALUES (
                v_path_id,
                590,
                'en',
                'listening',
                'social',
                $transcript$
# AUDIO PROFILE: Alex and Jamie, friends on an evening phone call
## "How Is the Host Family?"

## THE SCENE: Jamie calls Alex after his second week abroad
Jamie wants to know how life is going with the host family. Alex answers with short, simple opinions about the food, the city, the weather, his room, and the small problems of daily life.

### DIRECTOR'S NOTES
Style:
* Friendly and natural, like two young friends catching up after school.
* Use easy opinion phrases many times: I love, I like, I do not like, I think.

Pace: Slow phone-call pace with clear pauses between the questions and answers.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for simple conversations about likes, dislikes, first impressions, and daily routines.
Learners hear very basic opinion language in a relaxed question-and-answer format.

#### TRANSCRIPT
Narrator [softly] In the evening, Jamie calls Alex to ask about the host family and the new city.
Jamie [cheerfully] Hi Alex. I wanted to call you today. How are things with your host family now?
Alex [positively] Hi Jamie. Things are good. I really love the food here, because Sarah cooks fresh meals every day, and dinner always smells great.
Jamie [curiously] That sounds nice. Do you like everything about the routine?
Alex [honestly] Not everything. I do not like getting up early for school. We have breakfast at seven thirty, so I leave my bed when it is still dark outside.
Jamie [laughing lightly] Yes, that is early. What do you think about the city?
Alex [admiringly] I think the city is beautiful. There is a river, an old square, and small streets with cafés. I like walking there at the weekend.
Jamie [interested] And the weather? Is it warm now?
Alex [simply] No, not really. The weather is quite cold for me, especially in the morning, so I wear a jacket every day.
Jamie [gently] Do you like your room in the house?
Alex [warmly] Yes, I do. My room is small but comfortable. It is bright in the afternoon, and I can study quietly at the desk by the window.
Jamie [kindly] Is there anything you miss from home?
Alex [softly] I miss my dog a lot. Sometimes the house is very nice and calm, but then I think about my dog and feel a little sad.
Jamie [supportively] I understand. And Sarah? Is she kind?
Alex [reassuringly] Yes, very kind. She helps me when I have questions, and she always asks if I am okay.
Jamie [smiling] Good. So it sounds like you like many things, even if a few parts are difficult.
Alex [calmly] Exactly. I like the family, I like my room, and I love the food. I only do not like the early mornings and the cold weather.
Narrator [calmly] Jamie says goodbye, and Alex feels happy after the short call.
                $transcript$
            )RETURNING uuid INTO v_listening_id;

            INSERT INTO listening_translation (listening_uuid, language, title)
            VALUES (v_listening_id, 'es', 'Alex habla por teléfono sobre su experiencia');

            INSERT INTO listening_translation (listening_uuid, language, title)
            VALUES (v_listening_id, 'de', 'Alex spricht am Telefon über seine Gastfamilie');

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
