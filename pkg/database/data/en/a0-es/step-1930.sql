-- ============================================================
-- Seed: A0 English Path – STEP 1930 – Listening – go to a self-service or fast food establishment and order a meal (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente pide un menú de chicken burger.", "p_de": "Der Kunde bestellt ein Chicken-Burger-Menü.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bebida es grande.", "p_de": "Das Getränk ist groß.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La bebida es una cola mediana.", "p_de": "Das Getränk ist eine mittlere Cola.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente quiere cebolla en la hamburguesa.", "p_de": "Der Kunde möchte Zwiebeln im Burger.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La cajera repite el pedido.", "p_de": "Die Kassiererin wiederholt die Bestellung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pide kétchup extra.", "p_de": "Der Kunde bittet um extra Ketchup.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente añade un postre al final.", "p_de": "Der Kunde fügt am Ende ein Dessert hinzu.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Al final no quiere nada más.", "p_de": "Am Ende möchte er nichts mehr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué menú pide el cliente?", "p_de": "Welches Menü bestellt der Kunde?", "s": {"type": "multiple_choice", "options": ["A chicken burger meal", "A cheeseburger meal", "A salad meal"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tamaño es la bebida?", "p_de": "Welche Größe hat das Getränk?", "s": {"type": "multiple_choice", "options": ["Medium", "Large", "Small"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida elige?", "p_de": "Welches Getränk wählt er?", "s": {"type": "multiple_choice", "options": ["Cola", "Orange juice", "Water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ingrediente no quiere?", "p_de": "Welche Zutat möchte er nicht?", "s": {"type": "multiple_choice", "options": ["Onion", "Cheese", "Tomato"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué añade después?", "p_de": "Was fügt er später hinzu?", "s": {"type": "multiple_choice", "options": ["Extra ketchup", "A pie", "Bacon"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién repite el pedido?", "p_de": "Wer wiederholt die Bestellung?", "s": {"type": "multiple_choice", "options": ["The cashier", "The customers friend", "The cook"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace la cajera al final?", "p_de": "Was fragt die Kassiererin am Ende?", "s": {"type": "multiple_choice", "options": ["Anything else?", "Do you want a table?", "Where are you from?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué responde el cliente?", "p_de": "Was antwortet der Kunde?", "s": {"type": "multiple_choice", "options": ["No, that is all", "Yes, one dessert", "I want a refund"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1930 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1930 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1930, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: A cashier and a customer at a fast-food counter
## "One Meal, No Onion"

## THE SCENE: A busy burger counter
A customer places a simple order and changes one ingredient.
The cashier repeats the key details to check the order.

### DIRECTOR'S NOTES
Style:
* Quick but clear service language.
* Repeat the meal, size, and change to the order.

Pace: Medium, with clear confirmation at the end.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for understanding the most common fast-food order patterns.
Learners hear a simple order, a small change, and a final check.

#### TRANSCRIPT
[cashier] Cashier: Hello. What would you like?
[customer] Customer: A chicken burger meal, please.
[cashier] Cashier: What size drink?
[customer] Customer: Medium cola, please, and no onion in the burger.
[cashier] Cashier: Okay. One chicken burger meal, medium cola, no onion.
[customer] Customer: Yes, and extra ketchup, please.
[cashier] Cashier: No problem. Anything else?
[customer] Customer: No, that is all.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Pedir en el mostrador', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'An der Theke bestellen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
