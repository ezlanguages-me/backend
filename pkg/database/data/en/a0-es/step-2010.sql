-- ============================================================
-- Seed: A0 English Path – STEP 2010 – Listening – ask simple questions about the menu and understand simple answers (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La sopa de tomate es picante.", "p_de": "Die Tomatensuppe ist scharf.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El camarero dice que la sopa es suave.", "p_de": "Der Kellner sagt, dass die Suppe mild ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El wrap de pollo viene con patatas fritas y una ensalada pequeña.", "p_de": "Der Hähnchen-Wrap kommt mit Pommes und einem kleinen Salat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El wrap viene con arroz.", "p_de": "Der Wrap kommt mit Reis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El zumo de naranja es fresco.", "p_de": "Der Orangensaft ist frisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tarta de manzana tiene nueces.", "p_de": "Der Apfelkuchen hat Nüsse.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La clienta pide el wrap y el zumo.", "p_de": "Die Gästin bestellt den Wrap und den Saft.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero no entiende a la clienta.", "p_de": "Der Kellner versteht die Gästin nicht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cómo es la sopa de tomate?", "p_de": "Wie ist die Tomatensuppe?", "s": {"type": "multiple_choice", "options": ["It is mild", "It is frozen", "It is sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué viene con el wrap de pollo?", "p_de": "Was kommt mit dem Hähnchen-Wrap?", "s": {"type": "multiple_choice", "options": ["Chips and a small salad", "Rice and beans", "Only bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida pregunta la clienta?", "p_de": "Nach welchem Getränk fragt die Gästin?", "s": {"type": "multiple_choice", "options": ["Orange juice", "Coffee", "Milk"], "answer": 0}}'::jsonb,
        '{"p": "¿Es fresco el zumo?", "p_de": "Ist der Saft frisch?", "s": {"type": "multiple_choice", "options": ["Yes, it is", "No, it is not", "Only on weekends"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre menciona la conversación?", "p_de": "Welches Dessert wird im Gespräch erwähnt?", "s": {"type": "multiple_choice", "options": ["Apple pie", "Ice cream", "Cheesecake"], "answer": 0}}'::jsonb,
        '{"p": "¿Tiene nueces la tarta?", "p_de": "Hat der Kuchen Nüsse?", "s": {"type": "multiple_choice", "options": ["No, it does not", "Yes, it does", "Only a little"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide finalmente la clienta?", "p_de": "Was bestellt die Gästin am Ende?", "s": {"type": "multiple_choice", "options": ["The wrap and the juice", "The soup and tea", "Only the pie"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué responde el camarero al final?", "p_de": "Was antwortet der Kellner am Ende?", "s": {"type": "multiple_choice", "options": ["Certainly", "Try tomorrow", "The kitchen is closed"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2010 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2010 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2010, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: Ben, waiter
## "Questions at Table Seven"

## THE SCENE: A small family restaurant
A guest asks short questions about dishes before ordering.
The waiter answers clearly and politely.

### DIRECTOR'S NOTES
Style:
* Short restaurant questions with direct answers.
* Clear information about ingredients and side dishes.

Pace: Slow and careful.

Accent: Neutral British English.

### SAMPLE CONTEXT
Learners hear useful menu questions in a real table-service setting.
The exchange models how to ask and understand simple answers.

#### TRANSCRIPT
[guest] Guest: Excuse me. Is the tomato soup spicy?
[waiter] Waiter: No, it is not spicy. It is mild.
[guest] Guest: What comes with the chicken wrap?
[waiter] Waiter: It comes with chips and a small salad.
[guest] Guest: Is the orange juice fresh?
[waiter] Waiter: Yes, it is fresh.
[guest] Guest: Does the apple pie have nuts?
[waiter] Waiter: No, it does not have nuts.
[guest] Guest: Great. I would like the wrap and the juice, please.
[waiter] Waiter: Certainly.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar preguntas simples sobre el menú', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Einfache Fragen zur Speisekarte hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
