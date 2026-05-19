-- ============================================================
-- Seed: A0 English Path – STEP 1290 – Listening – understand where the shopkeeper explains the difference between two or more products (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente busca un paraguas para la escuela.", "de": "Der Kunde sucht einen Regenschirm für die Schule.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El paraguas pequeño es ligero y fácil de llevar.", "de": "Der kleine Regenschirm ist leicht und einfach zu tragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El paraguas pequeño cuesta doce libras.", "de": "Der kleine Regenschirm kostet zwölf Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El paraguas grande es más fuerte y mejor con mucha lluvia.", "de": "Der große Regenschirm ist stärker und besser bei starkem Regen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El paraguas grande cuesta doce libras.", "de": "Der große Regenschirm kostet zwölf Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente confirma que el grande es más ligero.", "de": "Der Kunde bestätigt, dass der große leichter ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El cliente camina mucho.", "de": "Der Kunde läuft viel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El vendedor recomienda el paraguas grande.", "de": "Der Verkäufer empfiehlt den großen Regenschirm.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué producto compara el vendedor?", "de": "Welches Produkt vergleicht der Verkäufer?", "s_es": {"type": "multiple_choice", "options": ["Umbrellas", "Backpacks", "Shoes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Regenschirme", "Rucksäcke", "Schuhe"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el paraguas pequeño?", "de": "Wie viel kostet der kleine Regenschirm?", "s_es": {"type": "multiple_choice", "options": ["Eight pounds", "Twelve pounds", "Ten pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Acht Pfund", "Zwölf Pfund", "Zehn Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el paraguas grande?", "de": "Wie viel kostet der große Regenschirm?", "s_es": {"type": "multiple_choice", "options": ["Twelve pounds", "Eight pounds", "Fourteen pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwölf Pfund", "Acht Pfund", "Vierzehn Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué paraguas es más fácil de llevar?", "de": "Welcher Regenschirm ist leichter zu tragen?", "s_es": {"type": "multiple_choice", "options": ["The small umbrella", "The large umbrella", "Both are the same"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der kleine Regenschirm", "Der große Regenschirm", "Beide sind gleich"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué paraguas es mejor con lluvia fuerte?", "de": "Welcher Regenschirm ist bei starkem Regen besser?", "s_es": {"type": "multiple_choice", "options": ["The large umbrella", "The small umbrella", "Neither one"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der große Regenschirm", "Der kleine Regenschirm", "Keiner"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice el cliente sobre su día?", "de": "Was sagt der Kunde über seinen Alltag?", "s_es": {"type": "multiple_choice", "options": ["He walks a lot", "He drives every day", "He stays at home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er läuft viel", "Er fährt jeden Tag Auto", "Er bleibt zu Hause"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué necesita además de caminar mucho?", "de": "Was braucht der Kunde außer viel zu laufen?", "s_es": {"type": "multiple_choice", "options": ["Good rain cover", "A second bag", "A new notebook"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Guten Regenschutz", "Eine zweite Tasche", "Ein neues Heft"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué opción recomienda el vendedor?", "de": "Welche Option empfiehlt der Verkäufer?", "s_es": {"type": "multiple_choice", "options": ["The large umbrella", "The small umbrella", "No umbrella"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den großen Regenschirm", "Den kleinen Regenschirm", "Keinen Regenschirm"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1290 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1290 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1290, 'en', 'listening', 'shopping', $transcript$
# AUDIO PROFILE: Liam, a shopkeeper comparing two umbrellas
## "Small or Strong?"

## THE SCENE: A compact travel shop on a wet day
A customer wants an umbrella, and Liam explains the difference between two simple options.
He compares size, weight, strength, and price in beginner-friendly language.

### DIRECTOR'S NOTES
Style:
* Calm explanation with direct comparisons between product A and product B.
* Short repeated contrasts make the listening easy to follow.

Pace: Slow and measured, especially when naming the differences.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how a shopkeeper compares two products for a customer.
The audio practises adjectives, preferences, and simple shopping decisions.

#### TRANSCRIPT
[welcoming] Shopkeeper: Hello. Are you looking for an umbrella?
[polite] Customer: Yes, please. I need one for school.
[clear] Shopkeeper: This small umbrella is light and easy to carry.
[clear] Shopkeeper: It costs eight pounds.
[comparing] Shopkeeper: This large umbrella is stronger and better in heavy rain.
[comparing] Shopkeeper: It costs twelve pounds.
[checking] Customer: So the small one is lighter, but the large one is stronger?
[confirming] Shopkeeper: Exactly.
[thinking] Customer: I walk a lot, but I also need good rain cover.
[helpful] Shopkeeper: Then the large umbrella is a better choice for you.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha la diferencia entre dos paraguas', 'Escucha a un vendedor comparar dos paraguas por tamaño, peso y precio.'),
        (v_listening_id, 'de', 'Höre den Unterschied zwischen zwei Regenschirmen', 'Höre einen Verkäufer, der zwei Regenschirme nach Größe, Gewicht und Preis vergleicht.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
