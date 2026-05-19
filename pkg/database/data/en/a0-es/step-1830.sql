-- ============================================================
-- Seed: A0 English Path – STEP 1830 – Listening – bargain in the market place (straightforward item) (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La lámpara pequeña del puesto A cuesta dieciocho libras.", "p_de": "Die kleine Lampe an Stand A kostet achtzehn Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lámpara del puesto A no incluye bombilla.", "p_de": "Die Lampe an Stand A enthält keine Glühbirne.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La misma lámpara en el puesto B cuesta dieciséis libras.", "p_de": "Dieselbe Lampe an Stand B kostet sechzehn Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En el puesto B hay bombilla incluida.", "p_de": "An Stand B ist eine Glühbirne dabei.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El puesto B no incluye bolsa.", "p_de": "Stand B gibt keine Tasche dazu.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lámpara grande del puesto B cuesta veinticuatro libras.", "p_de": "Die große Lampe an Stand B kostet vierundzwanzig Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Eva piensa que el puesto B es mejor para ella.", "p_de": "Eva denkt, dass Stand B besser für sie ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Leo dice que el puesto A cuesta más, pero está completo.", "p_de": "Leo sagt, Stand A kostet mehr, aber es ist komplett.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto cuesta la lámpara pequeña del puesto A?", "p_de": "Wie viel kostet die kleine Lampe an Stand A?", "s": {"type": "multiple_choice", "options": ["Eighteen pounds", "Sixteen pounds", "Twenty-four pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué incluye la lámpara del puesto A?", "p_de": "Was ist bei der Lampe an Stand A dabei?", "s": {"type": "multiple_choice", "options": ["A bulb", "A free table", "Two bags"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la misma lámpara en el puesto B?", "p_de": "Wie viel kostet dieselbe Lampe an Stand B?", "s": {"type": "multiple_choice", "options": ["Sixteen pounds", "Eighteen pounds", "Twenty pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no incluye el puesto B?", "p_de": "Was fehlt an Stand B?", "s": {"type": "multiple_choice", "options": ["A bulb", "A lamp shade", "A second lamp"], "answer": 0}}'::jsonb,
        '{"p": "¿Incluye bolsa el puesto B?", "p_de": "Gibt es an Stand B eine Tasche dazu?", "s": {"type": "multiple_choice", "options": ["No", "Yes", "Only on weekends"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la lámpara grande del puesto B?", "p_de": "Wie viel kostet die große Lampe an Stand B?", "s": {"type": "multiple_choice", "options": ["Twenty-four pounds", "Eighteen pounds", "Sixteen pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puesto prefiere Eva?", "p_de": "Welchen Stand bevorzugt Eva?", "s": {"type": "multiple_choice", "options": ["Stall A", "Stall B", "Neither stall"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué es mejor el puesto A para Eva?", "p_de": "Warum ist Stand A für Eva besser?", "s": {"type": "multiple_choice", "options": ["It is complete", "It is cheaper", "It has a free hat"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1830 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1830 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1830, 'en', 'listening', 'Compras y Transacciones', $transcript$
# AUDIO PROFILE: Two friends comparing prices at market stalls
## "Which Lamp Is the Better Buy?"

## THE SCENE: A Saturday market with home goods stalls
Two friends compare the price of the same small lamp at two different stands.
They notice that one price is lower, but the cheaper lamp does not include everything.

### DIRECTOR'S NOTES
Style:
* Natural comparison language for a simple object.
* Clear emphasis on prices and what is included.

Pace: Slow to medium.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for understanding simple price comparison and small bargaining decisions.
Learners hear how people compare value, not only the number on the tag.

#### TRANSCRIPT
[friend 1] Eva: The small lamp at stall A is eighteen pounds, and it comes with a bulb.
[friend 2] Leo: At stall B, the same lamp is sixteen pounds, but there is no bulb.
[friend 1] Eva: Does stall B include a bag?
[friend 2] Leo: No, and the larger lamp there is twenty-four pounds.
[friend 1] Eva: Then stall A is better for me.
[friend 2] Leo: Yes, it costs more, but it is complete.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Comparar precios de una lámpara', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Preise für eine Lampe vergleichen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
