-- ============================================================
-- Seed: A0 English Path – STEP 2090 – Listening – make simple complaints, for example, 'The food is cold' (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La pasta está fría.", "p_de": "Die Pasta ist kalt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gerente no ofrece cambiar la pasta.", "p_de": "Der Manager bietet nicht an, die Pasta zu ersetzen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ensalada está bien.", "p_de": "Der Salat ist in Ordnung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pan está fresco.", "p_de": "Das Brot ist frisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El té no está caliente.", "p_de": "Der Tee ist nicht heiß.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gerente trae también un té caliente.", "p_de": "Der Manager bringt auch einen heißen Tee.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clienta grita al gerente.", "p_de": "Die Kundin schreit den Manager an.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La conversación termina de forma amable.", "p_de": "Das Gespräch endet freundlich.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué plato está frío?", "p_de": "Welches Gericht ist kalt?", "s": {"type": "multiple_choice", "options": ["The pasta", "The salad", "The cake"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el gerente con la pasta?", "p_de": "Was macht der Manager mit der Pasta?", "s": {"type": "multiple_choice", "options": ["He replaces it", "He removes the table", "He closes the kitchen"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está la ensalada?", "p_de": "Wie ist der Salat?", "s": {"type": "multiple_choice", "options": ["Fine", "Frozen", "Too salty"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está el pan?", "p_de": "Wie ist das Brot?", "s": {"type": "multiple_choice", "options": ["Stale", "Warm", "Sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida menciona la clienta?", "p_de": "Welches Getränk erwähnt die Kundin?", "s": {"type": "multiple_choice", "options": ["Tea", "Milk", "Cola"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de té trae el gerente?", "p_de": "Welche Art Tee bringt der Manager?", "s": {"type": "multiple_choice", "options": ["A hot tea", "An iced tea", "No tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice la clienta antes del final?", "p_de": "Was sagt die Kundin kurz vor dem Ende?", "s": {"type": "multiple_choice", "options": ["That is better", "I want to leave", "Call the police"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice el gerente al final?", "p_de": "Was sagt der Manager am Ende?", "s": {"type": "multiple_choice", "options": ["You are welcome", "Try another restaurant", "Come back next month"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2090 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2090 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2090, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: Nora, customer, and a manager
## "This Pasta Is Cold"

## THE SCENE: A busy dining room
A customer complains about several simple problems with the meal.
The manager answers politely and offers quick solutions.

### DIRECTOR'S NOTES
Style:
* Polite complaint language with clear requests.
* Short apologies and practical responses.

Pace: Slow to medium.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners hear common complaint phrases such as my food is cold and can you replace it.
The exchange shows how staff may respond in a helpful way.

#### TRANSCRIPT
[customer] Customer: Excuse me. The pasta is cold.
[manager] Manager: I am sorry. I will replace it now.
[customer] Customer: The salad is fine, but the bread is stale.
[manager] Manager: I can bring fresh bread.
[customer] Customer: Thank you. Also, my tea is not hot.
[manager] Manager: I will bring a hot tea too.
[customer] Customer: That is better. Thank you.
[manager] Manager: You are welcome.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar una queja sencilla', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Eine einfache Beschwerde hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
