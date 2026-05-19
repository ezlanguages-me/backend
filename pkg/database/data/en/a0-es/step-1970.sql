-- ============================================================
-- Seed: A0 English Path – STEP 1970 – Listening – get the attention of staff and order a meal in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente dice Excuse me para llamar al camarero.", "p_de": "Der Gast sagt Excuse me, um den Kellner zu rufen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Pide pollo con arroz.", "p_de": "Er bestellt Hähnchen mit Reis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Pide pasta vegetal.", "p_de": "Er bestellt Gemüse-Pasta.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bebida es agua con gas.", "p_de": "Das Getränk ist Sprudelwasser.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El camarero pregunta por queso en la pasta.", "p_de": "Der Kellner fragt nach Käse auf der Pasta.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente quiere queso.", "p_de": "Der Gast möchte Käse.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El camarero repite el pedido completo.", "p_de": "Der Kellner wiederholt die ganze Bestellung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conversación termina con una despedida larga.", "p_de": "Das Gespräch endet mit einer langen Verabschiedung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cómo llama el cliente al camarero?", "p_de": "Wie ruft der Gast den Kellner?", "s": {"type": "multiple_choice", "options": ["Excuse me", "Hey you", "Come here"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato pide?", "p_de": "Welches Gericht bestellt er?", "s": {"type": "multiple_choice", "options": ["Vegetable pasta", "Grilled chicken", "Soup of the day"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida pide?", "p_de": "Welches Getränk bestellt er?", "s": {"type": "multiple_choice", "options": ["Still water", "Lemonade", "Tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el camarero?", "p_de": "Was fragt der Kellner?", "s": {"type": "multiple_choice", "options": ["Would you like cheese on the pasta?", "Would you like dessert first?", "Would you like a burger?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué responde el cliente sobre el queso?", "p_de": "Was antwortet der Gast zum Käse?", "s": {"type": "multiple_choice", "options": ["No cheese, please", "Yes, extra cheese", "No pasta, please"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué repite el camarero?", "p_de": "Was wiederholt der Kellner?", "s": {"type": "multiple_choice", "options": ["One vegetable pasta and one still water", "Two soups and one tea", "One burger and fries"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice el cliente al final?", "p_de": "Was sagt der Gast am Ende?", "s": {"type": "multiple_choice", "options": ["Thank you", "Goodbye forever", "Bring the bill"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué contesta el camarero al final?", "p_de": "Was antwortet der Kellner am Ende?", "s": {"type": "multiple_choice", "options": ["You are welcome", "Sit down", "Wait outside"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1970 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1970 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1970, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: A waiter and a restaurant guest
## "Could We Order, Please?"

## THE SCENE: A quiet table-service restaurant
A guest calls the waiter in a polite way and places a clear order.
The waiter checks one detail before confirming everything.

### DIRECTOR'S NOTES
Style:
* Polite restaurant language with short, complete sentences.
* Emphasis on courtesy phrases and the final order.

Pace: Slow to medium.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for understanding how to call staff politely and order in a restaurant.
Learners hear a simple exchange with one question about the dish.

#### TRANSCRIPT
[guest] Guest: Excuse me. Could we order, please?
[waiter] Waiter: Of course. What would you like?
[guest] Guest: I would like the vegetable pasta and a still water, please.
[waiter] Waiter: Would you like cheese on the pasta?
[guest] Guest: No cheese, please.
[waiter] Waiter: Certainly. One vegetable pasta and one still water.
[guest] Guest: Thank you.
[waiter] Waiter: You are welcome.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Llamar al camarero y pedir', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Den Kellner rufen und bestellen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
