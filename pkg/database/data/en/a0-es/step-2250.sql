-- ============================================================
-- Seed: A0 English Path – STEP 2250 – Listening – make a complaint about straightforward matters, for example, the service or the bill (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente cree que la cuenta está mal.", "p_de": "Der Kunde glaubt, dass die Rechnung falsch ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tomaron una pasta y dos cafés.", "p_de": "Sie hatten eine Pasta und zwei Kaffees.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "De verdad tomaron dos pastas.", "p_de": "Sie hatten wirklich zwei Pastagerichte.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cajero revisa la cuenta.", "p_de": "Der Kassierer prüft die Rechnung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El servicio está incluido esa noche.", "p_de": "Der Service ist an diesem Abend inbegriffen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente pide quitar una pasta extra.", "p_de": "Der Kunde bittet darum, eine extra Pasta zu entfernen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cajero se niega a cambiar la cuenta.", "p_de": "Der Kassierer weigert sich, die Rechnung zu ändern.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Al final, el cliente recibe una cuenta nueva.", "p_de": "Am Ende bekommt der Kunde eine neue Rechnung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué problema tiene la cuenta?", "p_de": "Welches Problem hat die Rechnung?", "s": {"type": "multiple_choice", "options": ["It has an extra pasta", "It has no drinks", "It has the wrong table number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué comieron realmente?", "p_de": "Was haben sie wirklich gegessen?", "s": {"type": "multiple_choice", "options": ["One pasta and two coffees", "Two pastas and one coffee", "Only drinks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el cajero cuando escucha el problema?", "p_de": "Was macht der Kassierer, als er das Problem hört?", "s": {"type": "multiple_choice", "options": ["He checks the bill", "He closes the desk", "He calls the police"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es el servicio esa noche?", "p_de": "Wie ist der Service an diesem Abend?", "s": {"type": "multiple_choice", "options": ["Separate", "Included", "Free"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quiere quitar el cliente?", "p_de": "Was möchte der Kunde entfernen lassen?", "s": {"type": "multiple_choice", "options": ["The extra pasta", "The coffees", "The tax"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué entrega el cajero al final?", "p_de": "Was gibt der Kassierer am Ende?", "s": {"type": "multiple_choice", "options": ["A new bill", "A free dessert", "A takeaway box"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde ocurre la escena?", "p_de": "Wo spielt die Szene?", "s": {"type": "multiple_choice", "options": ["At the payment desk", "At the bus stop", "At the hotel reception"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tono tiene la conversación?", "p_de": "Welchen Ton hat das Gespräch?", "s": {"type": "multiple_choice", "options": ["Calm and practical", "Very loud and angry", "Silent"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2250 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2250 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2250, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: A customer and a cashier
## "This Bill Is Wrong"

## THE SCENE: At the payment desk
A customer explains that the bill includes the wrong items.
The cashier checks the bill and corrects it.

### DIRECTOR'S NOTES
Style:
* Clear billing vocabulary and calm complaint language.
* Short explanation with one correction.

Pace: Medium.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners practise understanding basic problems with bills and service charges.
The audio includes order details, a correction, and a new bill.

#### TRANSCRIPT
[customer] Customer: Excuse me, I think this bill is wrong.
[cashier] Cashier: What is the problem?
[customer] Customer: We had one pasta and two coffees, not two pastas.
[cashier] Cashier: Let me check.
[customer] Customer: Also, service is included, yes?
[cashier] Cashier: No, service is separate this evening.
[customer] Customer: Okay, but please remove the extra pasta.
[cashier] Cashier: Of course. Here is the new bill.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar una disputa por la cuenta', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Einen Streit über die Rechnung hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
