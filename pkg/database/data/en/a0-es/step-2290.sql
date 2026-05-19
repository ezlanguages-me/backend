-- ============================================================
-- Seed: A0 English Path – STEP 2290 – Listening – order a meal and ask for clarification about dishes on the menu (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La ensalada de remolacha está templada.", "p_de": "Der Rote-Bete-Salat ist warm.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El queso de cabra es duro.", "p_de": "Der Ziegenkäse ist hart.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La lubina es un pescado blanco.", "p_de": "Seebarsch ist ein weißer Fisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lubina es picante.", "p_de": "Der Seebarsch ist scharf.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La salsa de limón y mantequilla es ligera y fresca.", "p_de": "Die Zitronen-Butter-Soße ist leicht und frisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La panna cotta es un postre frío con leche.", "p_de": "Panna cotta ist ein kaltes Dessert mit Milch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente dice que la explicación no ayuda.", "p_de": "Der Gast sagt, die Erklärung hilft nicht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La conversación sirve para aclarar palabras del menú.", "p_de": "Das Gespräch dient dazu, Wörter auf der Speisekarte zu erklären.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cómo está la ensalada de remolacha?", "p_de": "Wie ist der Rote-Bete-Salat?", "s": {"type": "multiple_choice", "options": ["Warm", "Frozen", "Very spicy"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es el queso de cabra?", "p_de": "Wie ist der Ziegenkäse?", "s": {"type": "multiple_choice", "options": ["Soft", "Hard and dry", "Sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de pescado es la lubina?", "p_de": "Welche Art Fisch ist Seebarsch?", "s": {"type": "multiple_choice", "options": ["A white fish", "A river plant", "A meat dish"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la salsa de limón y mantequilla?", "p_de": "Wie ist die Zitronen-Butter-Soße?", "s": {"type": "multiple_choice", "options": ["Light and fresh", "Dark and bitter", "Heavy and sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué contiene la panna cotta?", "p_de": "Was enthält die Panna cotta?", "s": {"type": "multiple_choice", "options": ["Milk", "Chicken", "Beans"], "answer": 0}}'::jsonb,
        '{"p": "¿Es picante la lubina?", "p_de": "Ist der Seebarsch scharf?", "s": {"type": "multiple_choice", "options": ["No, it is not spicy", "Yes, very spicy", "Only with rice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice el invitado al final?", "p_de": "Was sagt der Gast am Ende?", "s": {"type": "multiple_choice", "options": ["That helps a lot", "Bring the bill", "I do not understand"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué está haciendo la camarera?", "p_de": "Was macht die Kellnerin?", "s": {"type": "multiple_choice", "options": ["Explaining dishes on the menu", "Cleaning the floor", "Taking a taxi order"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2290 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2290 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2290, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: Clara, waiter
## "What Does This Dish Mean?"

## THE SCENE: Beside a restaurant table
A waiter explains menu words and dish details before the guest orders.
The explanation focuses on ingredients and simple culinary terms.

### DIRECTOR'S NOTES
Style:
* Helpful explanation with short definitions.
* Repetition of key menu terms.

Pace: Slow and descriptive.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners practise understanding clarifications about dishes on a menu.
The waiter explains fish, sauce, and dessert in simple language.

#### TRANSCRIPT
[waiter] Waiter: The beet salad is warm, and the goat cheese is soft.
[guest] Guest: Okay.
[waiter] Waiter: The sea bass is a white fish. It is not spicy.
[guest] Guest: Good.
[waiter] Waiter: The lemon butter sauce is light and fresh.
[guest] Guest: Nice.
[waiter] Waiter: The panna cotta is a cold dessert with milk.
[guest] Guest: Thank you. That helps a lot.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar explicaciones sobre platos del menú', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Erklärungen zu Gerichten auf der Speisekarte hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
