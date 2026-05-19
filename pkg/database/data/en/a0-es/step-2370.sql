-- ============================================================
-- Seed: A0 English Path – STEP 2370 – Listening – understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Grilled significa cocinado a fuego fuerte.", "p_de": "Grilled bedeutet bei starker Hitze gekocht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Roasted significa cocinado en el horno.", "p_de": "Roasted bedeutet im Ofen gekocht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pollo marinado se pone en aceite, limón y hierbas antes de cocinarse.", "p_de": "Mariniertes Hähnchen liegt vor dem Kochen in Öl, Zitrone und Kräutern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa cremosa no lleva leche ni nata.", "p_de": "Cremige Suppe enthält weder Milch noch Sahne.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las crispy onions son blandas.", "p_de": "Crispy onions sind weich.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La profesora menciona gambas a la parrilla.", "p_de": "Die Lehrerin erwähnt gegrillte Garnelen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La profesora menciona verduras asadas.", "p_de": "Die Lehrerin erwähnt geröstetes Gemüse.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La escena es una clase sencilla de cocina.", "p_de": "Die Szene ist ein einfacher Kochkurs.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué significa grilled?", "p_de": "Was bedeutet grilled?", "s": {"type": "multiple_choice", "options": ["Cooked over strong heat", "Cooked in cold water", "Served with sugar"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa roasted?", "p_de": "Was bedeutet roasted?", "s": {"type": "multiple_choice", "options": ["Cooked in the oven", "Served raw", "Mixed with milk"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tres cosas tiene el pollo marinado?", "p_de": "Welche drei Dinge hat mariniertes Hähnchen?", "s": {"type": "multiple_choice", "options": ["Oil, lemon, and herbs", "Cheese, rice, and salt", "Milk, sugar, and tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lleva una creamy soup?", "p_de": "Was enthält eine creamy soup?", "s": {"type": "multiple_choice", "options": ["Milk or cream", "Only bread", "Only fish"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo son las crispy onions?", "p_de": "Wie sind crispy onions?", "s": {"type": "multiple_choice", "options": ["Fried and hard", "Soft and cold", "Sweet and large"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué marisco menciona la profesora?", "p_de": "Welche Meeresfrucht erwähnt die Lehrerin?", "s": {"type": "multiple_choice", "options": ["Shrimp", "Lobster", "Crab"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué verduras menciona?", "p_de": "Welches Gemüse erwähnt sie?", "s": {"type": "multiple_choice", "options": ["Roasted vegetables", "Raw carrots only", "Mashed potatoes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué está haciendo la profesora?", "p_de": "Was macht die Lehrerin?", "s": {"type": "multiple_choice", "options": ["Explaining menu vocabulary", "Taking an order", "Complaining about a bill"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2370 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2370 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2370, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: A cooking teacher
## "Words You Hear on Menus"

## THE SCENE: A simple cooking class
The teacher explains a few common culinary words that appear on menus.
Each word is linked to one dish.

### DIRECTOR'S NOTES
Style:
* Teaching tone with short definitions.
* Menu words repeated clearly.

Pace: Slow and careful.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners hear culinary vocabulary in context before meeting it on a menu.
The explanation links each term to a simple restaurant dish.

#### TRANSCRIPT
[teacher] Teacher: On menus, grilled means cooked over strong heat.
[teacher] Teacher: Roasted means cooked in the oven.
[teacher] Teacher: Marinated chicken sits in oil, lemon, and herbs before cooking.
[teacher] Teacher: Creamy soup has milk or cream in it.
[teacher] Teacher: Crispy onions are fried and hard, not soft.
[teacher] Teacher: So, grilled shrimp and roasted vegetables are easy menu phrases to understand.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar vocabulario culinario explicado', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Erklärtes Küchenvokabular hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
