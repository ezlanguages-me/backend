-- ============================================================
-- Seed: A0 English Path – STEP 2170 – Listening – ask basic questions about the food in relation to the menu, and about the services available (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El restaurante tiene terraza exterior.", "p_de": "Das Restaurant hat eine Terrasse draußen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No ofrecen comida para llevar.", "p_de": "Sie bieten kein Essen zum Mitnehmen an.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La sopa de hoy es de calabaza y es vegetariana.", "p_de": "Die Suppe des Tages ist Kürbis und vegetarisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El salmón viene con arroz.", "p_de": "Der Lachs kommt mit Reis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Tienen tronas para niños.", "p_de": "Sie haben Hochstühle für Kinder.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El agua gratis está en la cocina.", "p_de": "Das kostenlose Wasser ist in der Küche.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El invitado da las gracias al final.", "p_de": "Der Gast bedankt sich am Ende.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conversación ocurre cerca de la entrada.", "p_de": "Das Gespräch findet nahe am Eingang statt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué espacio exterior menciona la camarera?", "p_de": "Welchen Außenbereich erwähnt die Kellnerin?", "s": {"type": "multiple_choice", "options": ["A terrace", "A balcony", "A beach"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicio ofrece también el restaurante?", "p_de": "Welchen Service bietet das Restaurant auch an?", "s": {"type": "multiple_choice", "options": ["Takeaway", "Taxi service", "Laundry"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sopa hay hoy?", "p_de": "Welche Suppe gibt es heute?", "s": {"type": "multiple_choice", "options": ["Pumpkin soup", "Tomato soup", "Fish soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué viene el salmón?", "p_de": "Womit kommt der Lachs?", "s": {"type": "multiple_choice", "options": ["Potatoes", "Rice", "Pasta"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tienen para niños?", "p_de": "Was haben sie für Kinder?", "s": {"type": "multiple_choice", "options": ["High chairs", "Bicycles", "School bags"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el agua gratis?", "p_de": "Wo ist das kostenlose Wasser?", "s": {"type": "multiple_choice", "options": ["At the counter", "At the bar outside", "At the cashier"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo responde el invitado al final?", "p_de": "Wie reagiert der Gast am Ende?", "s": {"type": "multiple_choice", "options": ["Perfect. Thank you.", "I am leaving now.", "Bring the bill."], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de información da la camarera?", "p_de": "Welche Art von Information gibt die Kellnerin?", "s": {"type": "multiple_choice", "options": ["Menu and service information", "Bus times", "Hotel prices"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2170 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2170 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2170, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: Julia, waiter
## "Let Me Explain the Restaurant"

## THE SCENE: Near the entrance
A waiter answers basic questions about the restaurant and the menu.
The explanation includes services and one dish of the day.

### DIRECTOR'S NOTES
Style:
* Helpful service language with simple details.
* Useful vocabulary for facilities and daily specials.

Pace: Slow and informative.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners practise understanding short explanations about what a restaurant offers.
The audio mixes menu information with service information.

#### TRANSCRIPT
[waiter] Waiter: Welcome. We have a terrace outside and takeaway if you need it.
[guest] Guest: Good to know.
[waiter] Waiter: The soup today is pumpkin, and it is vegetarian.
[guest] Guest: That sounds nice.
[waiter] Waiter: The salmon comes with potatoes, not rice.
[guest] Guest: Okay.
[waiter] Waiter: We also have high chairs for children and free water at the counter.
[guest] Guest: Perfect. Thank you.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar explicaciones sobre platos y servicios', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Erklärungen zu Gerichten und Service hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
