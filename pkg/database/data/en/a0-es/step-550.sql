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
    -- ------------------------------------------------------------
    -- Exercise definitions
    -- ------------------------------------------------------------
    v_exercises JSONB[] := ARRAY[
        '{"p":"El desayuno es de 7:30 a 8:30.","p_de":"Das Frühstück ist von 7:30 bis 8:30 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La cena es a las 8 PM.","p_de":"Das Abendessen ist um 20 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El día de la colada es el miércoles.","p_de":"Der Waschtag ist am Mittwoch.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Las horas de silencio empiezan a las 10 PM.","p_de":"Die Ruhezeit beginnt um 22 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Emma puede dejar la cocina sucia.","p_de":"Emma kann die Küche schmutzig lassen.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Emma puede traer invitados sin preguntar.","p_de":"Emma kann Gäste ohne Fragen mitbringen.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Sarah dice que Emma puede servirse algo en la cocina.","p_de":"Sarah sagt, dass Emma sich in der Küche etwas nehmen kann.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Sarah dice que Emma debe preguntar antes de traer a un invitado.","p_de":"Sarah sagt, dass Emma vor einem Gast zuerst fragen soll.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Cuándo es el desayuno?","p_de":"Wann ist das Frühstück?","s":{"type":"multiple_choice","options":["From 7:30 to 8:30","From 8:30 to 9:30","From 6:30 to 7:30"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora es la cena?","p_de":"Um wie viel Uhr ist das Abendessen?","s":{"type":"multiple_choice","options":["At 6 PM","At 7 PM","At 8 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Qué día es la colada?","p_de":"Welcher Tag ist Waschtag?","s":{"type":"multiple_choice","options":["Wednesday","Monday","Saturday"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo empiezan las horas de silencio?","p_de":"Wann beginnt die Ruhezeit?","s":{"type":"multiple_choice","options":["At 10 PM","At 9 PM","At midnight"],"answer":0}}'::jsonb,
        '{"p":"¿Qué puede hacer Emma en la cocina?","p_de":"Was kann Emma in der Küche tun?","s":{"type":"multiple_choice","options":["Help herself and clean up","Cook for a party","Leave dishes on the table"],"answer":0}}'::jsonb,
        '{"p":"¿Qué debe hacer Emma antes de traer invitados?","p_de":"Was soll Emma tun, bevor sie Gäste mitbringt?","s":{"type":"multiple_choice","options":["Ask first","Text at midnight","Open the door"],"answer":0}}'::jsonb,
        '{"p":"¿Quién explica las normas?","p_de":"Wer erklärt die Regeln?","s":{"type":"multiple_choice","options":["Sarah","Emma","Jamie"],"answer":0}}'::jsonb,
        '{"p":"¿Qué debe hacer Emma después de usar la cocina?","p_de":"Was soll Emma nach der Benutzung der Küche tun?","s":{"type":"multiple_choice","options":["Clean up","Lock the fridge","Call Sarah"],"answer":0}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 550 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 550 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (v_path_id, 550, 'en', 'listening', 'social', $transcript$
# AUDIO PROFILE: Sarah, host mother, welcoming a new student
## "Welcome to the House"

## THE SCENE: The kitchen table in the host family home
Emma has just arrived with her suitcase and sits down for a quick welcome chat.
Sarah speaks slowly and kindly while she explains the most important house rules for the first week.

### DIRECTOR'S NOTES
Style:
* Warm and reassuring, like a friendly host mother helping a nervous new student.
* Very clear and practical so A0 learners can catch times, days, and simple rules.

Pace: Slow and steady, with a small pause after each rule.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for homestay arrivals, welcome talks, and simple social rules in a shared home.
Learners hear key routines such as meal times, laundry, kitchen use, and guests.

#### TRANSCRIPT
[warmly] Hi Emma. Welcome to our home. I want to tell you the house rules.
[clearly] Breakfast is from 7:30 to 8:30 in the morning.
[gently] Dinner is at 6 PM every day, so please come on time.
[helpfully] If you are late, send me a message before dinner.
[calmly] Laundry day is Wednesday. You can put your clothes in the basket in the bathroom.
[carefully] Quiet hours start at 10 PM, so please keep your room quiet after that time.
[pleasantly] You can use the kitchen when you want. Please help yourself to tea or fruit.
[firmly but kindly] After you use the kitchen, clean up your plate, cup, and the table.
[politely] If you want to bring a guest, ask me first.
[reassuringly] That is all for now. If you have a question, you can always ask me.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'Sarah explica las normas de la casa', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Sarah erklärt die Hausregeln', '');

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
