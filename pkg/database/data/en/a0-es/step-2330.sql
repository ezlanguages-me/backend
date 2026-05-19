-- ============================================================
-- Seed: A0 English Path – STEP 2330 – Listening – maintain an interaction related to the nature and quality of the food (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La sopa es popular porque usan tomates frescos cada mañana.", "p_de": "Die Suppe ist beliebt, weil sie jeden Morgen frische Tomaten verwenden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pollo se cocina rápido y queda seco.", "p_de": "Das Hähnchen wird schnell gekocht und wird trocken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las patatas se fríen dos veces.", "p_de": "Die Pommes werden zweimal frittiert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La textura de las patatas es crujiente.", "p_de": "Die Textur der Pommes ist knusprig.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hoy no hay ningún problema con la comida.", "p_de": "Heute gibt es kein Problem mit dem Essen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El arroz necesita más salsa.", "p_de": "Der Reis braucht mehr Soße.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La entrevista habla de calidad y cocción.", "p_de": "Das Interview spricht über Qualität und Garweise.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El chef dice que la sopa se hace con tomates enlatados.", "p_de": "Der Chef sagt, die Suppe wird mit Dosentomaten gemacht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Por qué es popular la sopa?", "p_de": "Warum ist die Suppe beliebt?", "s": {"type": "multiple_choice", "options": ["Because they use fresh tomatoes every morning", "Because it is free", "Because it has chocolate"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo cocinan el pollo?", "p_de": "Wie kochen sie das Hähnchen?", "s": {"type": "multiple_choice", "options": ["Slowly, so it stays juicy", "Very fast, so it burns", "Only in water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hacen con las patatas fritas?", "p_de": "Was machen sie mit den Pommes?", "s": {"type": "multiple_choice", "options": ["They fry them twice", "They bake them once", "They serve them cold"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué textura tienen las patatas?", "p_de": "Welche Textur haben die Pommes?", "s": {"type": "multiple_choice", "options": ["Crisp", "Wet", "Soft like soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema menciona el chef?", "p_de": "Welches Problem erwähnt der Chef?", "s": {"type": "multiple_choice", "options": ["The rice needs more sauce", "The chicken is raw", "The restaurant is closed"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién hace las preguntas?", "p_de": "Wer stellt die Fragen?", "s": {"type": "multiple_choice", "options": ["The host", "The customer", "The cashier"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ingrediente fresco menciona el chef?", "p_de": "Welche frische Zutat erwähnt der Chef?", "s": {"type": "multiple_choice", "options": ["Tomatoes", "Bananas", "Peanuts"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata la entrevista?", "p_de": "Worum geht es im Interview?", "s": {"type": "multiple_choice", "options": ["Food quality and cooking", "Train times", "Weather only"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2330 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2330 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2330, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: A radio host and a chef
## "Why Does This Dish Taste Good?"

## THE SCENE: A short food interview on local radio
The chef explains why several dishes taste fresh and well cooked.
One small problem on the menu is also mentioned.

### DIRECTOR'S NOTES
Style:
* Short interview answers with food-quality vocabulary.
* Focus on freshness, texture, and cooking method.

Pace: Medium and clear.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners hear how people talk about freshness, texture, and cooking.
The chef explains both strengths and one weakness in simple words.

#### TRANSCRIPT
[host] Host: Why is the soup popular?
[chef] Chef: Because we use fresh tomatoes every morning.
[host] Host: And the chicken?
[chef] Chef: We cook it slowly, so it stays juicy.
[host] Host: What about the fries?
[chef] Chef: We fry them twice for a crisp texture.
[host] Host: Any problem today?
[chef] Chef: Only the rice needs more sauce.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar una entrevista sobre la calidad de la comida', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Ein Interview über die Qualität des Essens hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
