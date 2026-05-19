-- ============================================================
-- Seed: A0 English Path – STEP 2130 – Listening – order a meal in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clienta pide sopa de zanahoria.", "p_de": "Die Kundin bestellt Karottensuppe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clienta pide pollo a la plancha.", "p_de": "Die Kundin bestellt gegrilltes Hähnchen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El camarero pregunta por té o agua.", "p_de": "Der Mitarbeiter fragt nach Tee oder Wasser.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clienta elige agua.", "p_de": "Die Kundin wählt Wasser.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La clienta no quiere nada más.", "p_de": "Die Kundin möchte nichts Weiteres.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero repite el pedido completo.", "p_de": "Der Mitarbeiter wiederholt die ganze Bestellung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conversación termina con un desacuerdo.", "p_de": "Das Gespräch endet mit einer Meinungsverschiedenheit.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La bebida del pedido es té.", "p_de": "Das Getränk der Bestellung ist Tee.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pide primero la clienta?", "p_de": "Was bestellt die Kundin zuerst?", "s": {"type": "multiple_choice", "options": ["Carrot soup and the cheese omelette", "Only tea", "Fish and rice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dos bebidas ofrece el camarero?", "p_de": "Welche zwei Getränke bietet der Mitarbeiter an?", "s": {"type": "multiple_choice", "options": ["Tea or water", "Coffee or juice", "Milk or cola"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida elige la clienta?", "p_de": "Welches Getränk wählt die Kundin?", "s": {"type": "multiple_choice", "options": ["Tea", "Water", "Lemonade"], "answer": 0}}'::jsonb,
        '{"p": "¿Quiere algo más?", "p_de": "Möchte sie noch etwas?", "s": {"type": "multiple_choice", "options": ["No, thank you", "Yes, a dessert", "Yes, another soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato principal pide?", "p_de": "Welches Hauptgericht bestellt sie?", "s": {"type": "multiple_choice", "options": ["The cheese omelette", "The chicken", "The pasta"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el camarero al final?", "p_de": "Was macht der Mitarbeiter am Ende?", "s": {"type": "multiple_choice", "options": ["He repeats the order", "He changes the table", "He brings the bill"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice la clienta al final?", "p_de": "Was sagt die Kundin am Ende?", "s": {"type": "multiple_choice", "options": ["Yes, that is right", "No, that is wrong", "See you tomorrow"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde ocurre la escena?", "p_de": "Wo spielt die Szene?", "s": {"type": "multiple_choice", "options": ["At a counter-service restaurant", "On a train", "In a hotel room"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2130 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2130 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2130, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: Emma, customer, and a server
## "Lunch at the Counter"

## THE SCENE: A casual counter-service restaurant
A customer orders lunch and answers one simple follow-up question.
The server repeats the order before payment.

### DIRECTOR'S NOTES
Style:
* Clear ordering phrases for a short lunch purchase.
* One extra detail about the drink.

Pace: Steady and clear.

Accent: Neutral American English.

### SAMPLE CONTEXT
Learners practise following a simple order from start to finish.
The audio includes food, drink, and order confirmation.

#### TRANSCRIPT
[server] Server: Hello. What would you like today?
[customer] Customer: I would like the carrot soup and the cheese omelette, please.
[server] Server: Would you like tea or water with that?
[customer] Customer: Tea, please.
[server] Server: Anything else?
[customer] Customer: No, thank you.
[server] Server: So, one carrot soup, one cheese omelette, and one tea.
[customer] Customer: Yes, that is right.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar un pedido en el mostrador', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Eine Bestellung an der Theke hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
