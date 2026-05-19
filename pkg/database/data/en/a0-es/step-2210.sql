-- ============================================================
-- Seed: A0 English Path – STEP 2210 – Listening – ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clienta tiene alergia a los frutos secos.", "p_de": "Die Kundin hat eine Nussallergie.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El curry de pollo es seguro para ella.", "p_de": "Das Hähnchen-Curry ist für sie sicher.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El curry de pollo tiene cacahuetes.", "p_de": "Das Hähnchen-Curry hat Erdnüsse.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El arroz con verduras tiene frutos secos.", "p_de": "Der Gemüsereis hat Nüsse.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La clienta tampoco puede tomar lácteos.", "p_de": "Die Kundin kann auch keine Milchprodukte essen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tarta de queso es una buena opción para ella.", "p_de": "Die Käsepastete ist eine gute Option für sie.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ensalada de fruta no tiene lácteos.", "p_de": "Der Obstsalat ist milchfrei.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clienta elige arroz con verduras y ensalada de fruta.", "p_de": "Die Kundin wählt Gemüsereis und Obstsalat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué alergia menciona primero la clienta?", "p_de": "Welche Allergie erwähnt die Kundin zuerst?", "s": {"type": "multiple_choice", "options": ["A nut allergy", "A fish allergy", "A gluten allergy"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato tiene cacahuetes?", "p_de": "Welches Gericht hat Erdnüsse?", "s": {"type": "multiple_choice", "options": ["The chicken curry", "The vegetable rice", "The fruit salad"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato no tiene frutos secos?", "p_de": "Welches Gericht hat keine Nüsse?", "s": {"type": "multiple_choice", "options": ["The vegetable rice", "The cheese pie", "The curry"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué segunda restricción menciona?", "p_de": "Welche zweite Einschränkung nennt sie?", "s": {"type": "multiple_choice", "options": ["She cannot eat dairy", "She cannot drink water", "She cannot eat bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe evitar?", "p_de": "Was soll sie vermeiden?", "s": {"type": "multiple_choice", "options": ["The cheese pie", "The fruit salad", "The vegetable rice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre es seguro?", "p_de": "Welches Dessert ist sicher?", "s": {"type": "multiple_choice", "options": ["The fruit salad", "The cheese pie", "The chocolate cake"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide al final?", "p_de": "Was bestellt sie am Ende?", "s": {"type": "multiple_choice", "options": ["The vegetable rice and the fruit salad", "Only the curry", "Soup and bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo responde el camarero al final?", "p_de": "Wie antwortet der Kellner am Ende?", "s": {"type": "multiple_choice", "options": ["Very good", "Try again tomorrow", "No more food"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2210 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2210 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2210, 'en', 'listening', 'Restauración', $transcript$
# AUDIO PROFILE: Sara, customer, and a waiter
## "I Have a Nut Allergy"

## THE SCENE: At a restaurant table
A customer explains two dietary restrictions and checks which dishes are safe.
The waiter gives simple explanations and safe alternatives.

### DIRECTOR'S NOTES
Style:
* Calm explanation of allergies and safe dishes.
* Repetition of key ingredients for clarity.

Pace: Slow and precise.

Accent: Neutral English.

### SAMPLE CONTEXT
Learners hear how to explain allergies and understand menu explanations.
The waiter offers alternatives based on dietary needs.

#### TRANSCRIPT
[customer] Customer: I have a nut allergy. Is the chicken curry safe?
[waiter] Waiter: No, it is not. The chicken curry has peanuts.
[customer] Customer: What about the vegetable rice?
[waiter] Waiter: That dish has no nuts.
[customer] Customer: I also cannot eat dairy.
[waiter] Waiter: Then avoid the cheese pie. The fruit salad is dairy-free.
[customer] Customer: Great. I will take the vegetable rice and the fruit salad.
[waiter] Waiter: Very good.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Escuchar una conversación sobre alergias', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Ein Gespräch über Allergien hören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
