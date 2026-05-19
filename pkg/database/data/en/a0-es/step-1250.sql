-- ============================================================
-- Seed: A0 English Path – STEP 1250 – Listening – understand a counter-service shop where items are requested and served by a shopkeeper (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente pide seis panecillos y una porción de tarta de manzana.", "de": "Der Kunde bestellt sechs Brötchen und ein Stück Apfelkuchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La dependienta repite el pedido.", "de": "Die Verkäuferin wiederholt die Bestellung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los panecillos cuestan dos libras.", "de": "Die Brötchen kosten zwei Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La tarta cuesta dos libras.", "de": "Der Kuchen kostet zwei Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El total es cinco libras.", "de": "Die Summe ist fünf Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente pide una bolsa de papel.", "de": "Der Kunde bittet um eine Papiertüte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente paga con tarjeta.", "de": "Der Kunde zahlt mit Karte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La dependienta le da el cambio al final.", "de": "Die Verkäuferin gibt am Ende das Wechselgeld.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuántos panecillos pide el cliente?", "de": "Wie viele Brötchen bestellt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["Six", "Four", "Eight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs", "Vier", "Acht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tarta pide?", "de": "Welchen Kuchen bestellt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["Apple cake", "Chocolate cake", "Lemon cake"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Apfelkuchen", "Schokoladenkuchen", "Zitronenkuchen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuestan los panecillos?", "de": "Wie viel kosten die Brötchen?", "s_es": {"type": "multiple_choice", "options": ["Three pounds", "Two pounds", "Five pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Pfund", "Zwei Pfund", "Fünf Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la tarta?", "de": "Wie viel kostet der Kuchen?", "s_es": {"type": "multiple_choice", "options": ["Two pounds", "Three pounds", "One pound"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Pfund", "Drei Pfund", "Ein Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el total?", "de": "Wie hoch ist die Gesamtsumme?", "s_es": {"type": "multiple_choice", "options": ["Five pounds", "Six pounds", "Four pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünf Pfund", "Sechs Pfund", "Vier Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué más pide el cliente?", "de": "Was möchte der Kunde außerdem?", "s_es": {"type": "multiple_choice", "options": ["A paper bag", "A second cake", "A bottle of water"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Papiertüte", "Einen zweiten Kuchen", "Eine Flasche Wasser"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo paga?", "de": "Wie bezahlt er?", "s_es": {"type": "multiple_choice", "options": ["In cash", "By card", "By phone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Bargeld", "Mit Karte", "Mit dem Handy"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué recibe al final?", "de": "Was bekommt er am Ende?", "s_es": {"type": "multiple_choice", "options": ["His change", "A discount card", "A free coffee"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sein Wechselgeld", "Eine Rabattkarte", "Einen kostenlosen Kaffee"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1250 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1250 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1250, 'en', 'listening', 'shopping', $transcript$
# AUDIO PROFILE: Rosa, a bakery assistant serving at the counter
## "Six Rolls and One Slice"

## THE SCENE: A neighbourhood bakery with fresh bread behind the counter
A customer orders simple items and Rosa repeats the order clearly before payment.
The exchange is short, practical, and focused on quantity and price.

### DIRECTOR'S NOTES
Style:
* Friendly bakery-counter service with careful repetition of the order.
* The assistant sounds patient and easy to understand for beginners.

Pace: Slow and even, with clear pauses before numbers and totals.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how to request items in a counter-service shop and how the shopkeeper repeats the order.
The audio practises quantity, totals, and payment at the counter.

#### TRANSCRIPT
[cheerful] Assistant: Good morning. What would you like?
[polite] Customer: Six bread rolls and one slice of apple cake, please.
[checking] Assistant: Six rolls and one slice of apple cake.
[confirming] Customer: Yes, please.
[practical] Assistant: The rolls are three pounds, and the cake is two pounds.
[clear] Assistant: That is five pounds in total.
[helpful] Customer: Great. Can I also have a paper bag?
[pleasant] Assistant: Of course.
[practical] Customer: I pay in cash.
[friendly] Assistant: Thank you. Here is your change.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha un pedido en una panadería con mostrador', 'Escucha un pedido simple con cantidades, total y pago en una panadería.'),
        (v_listening_id, 'de', 'Höre eine Bestellung in einer Bäckerei mit Theke', 'Höre eine einfache Bestellung mit Menge, Gesamtpreis und Bezahlung in einer Bäckerei.');

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
