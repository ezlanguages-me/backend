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
    -- ------------------------------------------------------------
    -- Exercise definitions
    -- ------------------------------------------------------------
    v_exercises JSONB[] := ARRAY[
        '{"p":"A Alex le encanta la comida.","p_de":"Alex liebt das Essen.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"A Alex le gusta levantarse temprano.","p_de":"Alex steht gern früh auf.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Alex piensa que la ciudad es bonita.","p_de":"Alex findet die Stadt schön.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Alex dice que hace calor.","p_de":"Alex sagt, dass es warm ist.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"A Alex le gusta su habitación.","p_de":"Alex mag sein Zimmer.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Alex echa de menos a su perro.","p_de":"Alex vermisst seinen Hund.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Jamie y Alex hablan por teléfono.","p_de":"Jamie und Alex sprechen am Telefon.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Alex dice que la comida es terrible.","p_de":"Alex sagt, dass das Essen schrecklich ist.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Qué le encanta a Alex?","p_de":"Was liebt Alex?","s":{"type":"multiple_choice","options":["The food","The bus","The timetable"],"answer":0}}'::jsonb,
        '{"p":"¿Qué no le gusta a Alex?","p_de":"Was mag Alex nicht?","s":{"type":"multiple_choice","options":["Waking up early","The room","Jamie"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo es la ciudad para Alex?","p_de":"Wie ist die Stadt für Alex?","s":{"type":"multiple_choice","options":["Beautiful","Boring","Small"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo es el tiempo?","p_de":"Wie ist das Wetter?","s":{"type":"multiple_choice","options":["Cold","Hot","Dry"],"answer":0}}'::jsonb,
        '{"p":"¿Qué le gusta a Alex en la casa?","p_de":"Was mag Alex im Haus?","s":{"type":"multiple_choice","options":["The room","The garage","The garden"],"answer":0}}'::jsonb,
        '{"p":"¿A quién echa de menos Alex?","p_de":"Wen vermisst Alex?","s":{"type":"multiple_choice","options":["The dog","The teacher","The neighbor"],"answer":0}}'::jsonb,
        '{"p":"¿Quién hace las preguntas?","p_de":"Wer stellt die Fragen?","s":{"type":"multiple_choice","options":["Jamie","Sarah","Alex"],"answer":0}}'::jsonb,
        '{"p":"¿Qué tipo de respuestas da Alex?","p_de":"Welche Art von Antworten gibt Alex?","s":{"type":"multiple_choice","options":["Short opinion answers","Long stories","Only yes or no"],"answer":0}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 590 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 590 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (v_path_id, 590, 'en', 'listening', 'social', $transcript$
# AUDIO PROFILE: Alex and Jamie, friends on a short phone call
## "How Is the Host Family?"

## THE SCENE: A quick evening phone call from Alex to Jamie
Jamie asks short questions about life with the host family after Alex has been there for a few days.
Alex answers with simple one sentence opinions about food, the city, the weather, and home.

### DIRECTOR'S NOTES
Style:
* Friendly and natural, like two young friends catching up by phone.
* Short answers with very simple opinion language for beginner listeners.

Pace: Slow phone-call pace, with a short pause after each question.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for simple conversations about likes, dislikes, and first impressions.
Learners hear common opinion phrases such as I love, I like, I do not like, and I think.

#### TRANSCRIPT
[phone tone] Jamie calls Alex in the evening.
[cheerfully] Jamie: Hi Alex. How is your host family?
[positively] Alex: I love the food. It is very good every day.
[curiously] Jamie: Do you like the morning routine?
[honestly] Alex: I do not like waking up early.
[interested] Jamie: And what do you think about the city?
[admiringly] Alex: I think the city is beautiful.
[lightly complaining] Jamie: How is the weather there?
[simply] Alex: The weather is cold.
[warmly] Jamie: Do you like your room?
[softly] Alex: Yes, I like my room, but I miss my dog.
[kindly] Jamie: Thanks, Alex. Now I know a lot about your new life.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'Alex habla por teléfono sobre su experiencia', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Alex spricht am Telefon über seine Erfahrung', '');

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
