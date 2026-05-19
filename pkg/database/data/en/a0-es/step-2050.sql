-- ============================================================
-- Seed: A0 English Path – STEP 2050 – Listening – express an opinion about food (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Leo dice que la hamburguesa estaba buena.", "p_de": "Leo sagt, dass der Burger gut war.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pan de la hamburguesa estaba jugoso.", "p_de": "Das Burgerbrot war saftig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Ana dice que las patatas fritas estaban calientes y crujientes.", "p_de": "Ana sagt, die Pommes waren heiß und knusprig.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ensalada era muy grande.", "p_de": "Der Salat war sehr groß.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La sopa estaba peor que ayer.", "p_de": "Die Suppe war schlechter als gestern.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El té era demasiado dulce para Leo.", "p_de": "Der Tee war Leo zu süß.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ana pregunta si volverían.", "p_de": "Ana fragt, ob sie zurückkommen würden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Leo no quiere volver al café.", "p_de": "Leo möchte nicht ins Café zurückkommen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué comida comenta primero Ana?", "p_de": "Welches Essen erwähnt Ana zuerst?", "s": {"type": "multiple_choice", "options": ["The burger", "The soup", "The cake"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo estaba el pan?", "p_de": "Wie war das Brot?", "s": {"type": "multiple_choice", "options": ["A little dry", "Very soft", "Too salty"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué le encantó a Ana?", "p_de": "Was liebte Ana?", "s": {"type": "multiple_choice", "options": ["The fries", "The salad", "The tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo era la ensalada?", "p_de": "Wie war der Salat?", "s": {"type": "multiple_choice", "options": ["Very small", "Very hot", "Very spicy"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué compara Ana la sopa?", "p_de": "Womit vergleicht Ana die Suppe?", "s": {"type": "multiple_choice", "options": ["Yesterday", "Last week", "Another restaurant"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida menciona Leo?", "p_de": "Welches Getränk erwähnt Leo?", "s": {"type": "multiple_choice", "options": ["Tea", "Coffee", "Juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace Ana al final?", "p_de": "Welche Frage stellt Ana am Ende?", "s": {"type": "multiple_choice", "options": ["Would you come back?", "Would you like dessert?", "Do you need the bill?"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué volvería Leo?", "p_de": "Warum würde Leo zurückkommen?", "s": {"type": "multiple_choice", "options": ["For the fries and the soup", "For the burger and tea", "For the music"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2050 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2050 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2050, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: Ana and Leo, two friends
## "After Lunch"

## THE SCENE: Outside a café
Two friends talk about what they ate and share simple opinions.
They compare the best and worst parts of the meal.

### DIRECTOR'S NOTES
Style:
* Natural reactions with simple opinion words.
* Contrast between positive and negative comments.

Pace: Medium and relaxed.

Accent: Neutral international English.

### SAMPLE CONTEXT
Learners hear how to agree, disagree, and describe food quality.
The dialogue focuses on short opinions after eating.

#### TRANSCRIPT
[ana] Ana: What did you think of the burger?
[leo] Leo: It was good, but the bread was a little dry.
[ana] Ana: I loved the fries. They were hot and crispy.
[leo] Leo: The salad was fine, but it was very small.
[ana] Ana: The soup was better than yesterday.
[leo] Leo: Yes, and the tea was too sweet for me.
[ana] Ana: Would you come back?
[leo] Leo: Yes, for the fries and the soup.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar opiniones sobre un almuerzo', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Meinungen über ein Mittagessen hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
