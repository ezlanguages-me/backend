-- ============================================================
-- Seed: A0 English Path – STEP 1170 – Listening – ask for what is required in a shop and understand the reply (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente pide dos paquetes de pilas AA y un rollo de cinta.", "de": "Der Kunde bittet um zwei Packungen AA-Batterien und eine Rolle Klebeband.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tienda tiene ambos productos.", "de": "Der Laden hat beide Produkte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las pilas cuestan una libra cada paquete.", "de": "Die Batterien kosten ein Pfund pro Packung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La cinta cuesta una libra.", "de": "Das Klebeband kostet ein Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente calcula seis libras por las pilas y una por la cinta.", "de": "Der Kunde rechnet sechs Pfund für die Batterien und eins für das Band.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El total es siete libras.", "de": "Die Summe ist sieben Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente paga en una caja al fondo de la tienda.", "de": "Der Kunde bezahlt an einer Kasse hinten im Geschäft.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La tienda acepta efectivo y tarjeta.", "de": "Der Laden akzeptiert Bargeld und Karte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tipo de pilas pide el cliente?", "de": "Welche Art Batterien verlangt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["AA batteries", "AAA batteries", "C batteries"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["AA-Batterien", "AAA-Batterien", "C-Batterien"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos paquetes de pilas pide?", "de": "Wie viele Packungen Batterien verlangt er?", "s_es": {"type": "multiple_choice", "options": ["Two", "One", "Three"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Eins", "Drei"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta cada paquete de pilas?", "de": "Wie viel kostet jede Packung Batterien?", "s_es": {"type": "multiple_choice", "options": ["One pound", "Seven pounds", "Three pounds"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Ein Pfund", "Sieben Pfund", "Drei Pfund"], "answer": 2}}'::jsonb,
        '{"es": "¿Cuánto cuesta la cinta?", "de": "Wie viel kostet das Klebeband?", "s_es": {"type": "multiple_choice", "options": ["One pound", "Two pounds", "Three pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Pfund", "Zwei Pfund", "Drei Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el total?", "de": "Wie hoch ist die Gesamtsumme?", "s_es": {"type": "multiple_choice", "options": ["Six pounds", "Seven pounds", "Five pounds"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Sechs Pfund", "Sieben Pfund", "Fünf Pfund"], "answer": 1}}'::jsonb,
        '{"es": "¿Dónde paga el cliente?", "de": "Wo bezahlt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["At the exit", "At a machine", "At the counter"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Am Ausgang", "An einem Automaten", "Am Tresen"], "answer": 2}}'::jsonb,
        '{"es": "¿Cómo puede pagar?", "de": "Wie kann er bezahlen?", "s_es": {"type": "multiple_choice", "options": ["Only cash", "Cash or card", "Only card"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Nur mit Bargeld", "Mit Bargeld oder Karte", "Nur mit Karte"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué hace el cliente antes de pagar?", "de": "Was macht der Kunde vor dem Bezahlen?", "s_es": {"type": "multiple_choice", "options": ["He asks for a refund", "He checks the total", "He leaves the shop"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Er bittet um eine Rückgabe", "Er prüft den Gesamtpreis", "Er verlässt den Laden"], "answer": 1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1170 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1170 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    1170,
    'en',
    'listening',
    'shopping',
    $transcript$
# AUDIO PROFILE: Shop assistant and Customer, small hardware and convenience shop
## "Batteries and Tape"

## THE SCENE: A small neighbourhood hardware shop where a customer needs two everyday items
The customer asks for batteries and tape, checks the prices, and calculates the total before paying.
The audio practises quantity, prices, simple arithmetic, and payment at the counter.

### DIRECTOR'S NOTES
Style:
* Brisk but friendly counter-service exchange with clear price announcements.
* The customer's mental calculation out loud helps learners follow numbers naturally.

Pace: Slow to medium, with pauses before prices and the total.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear how to ask for everyday items in a small shop and understand prices and payment.
The audio practises product names, quantities, prices, and polite payment phrases.

#### TRANSCRIPT
[friendly] Assistant: Hello. What do you need today?
[polite] Customer: I need two packs of AA batteries, please.
[helpful] Assistant: Yes, we have those. Anything else?
[polite] Customer: Yes. One roll of tape, please.
[confirming] Assistant: Of course. We have tape.
[checking] Customer: How much are the batteries?
[clear] Assistant: The batteries are three pounds a pack.
[checking] Customer: And the tape?
[clear] Assistant: The tape is one pound.
[precise] Customer: So that is six pounds for the batteries and one pound for the tape.
[confirming] Assistant: Yes, seven pounds in total.
[practical] Customer: Great. Where do I pay?
[helpful] Assistant: You pay here at the counter.
[checking] Customer: Can I pay by card?
[reassuring] Assistant: Yes, cash or card is fine.
[thankful] Customer: Thank you. Here is my card.
$transcript$
)RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES
        (v_listening_id, 'es', 'Pilas y cinta en una tienda'), (v_listening_id, 'de', 'Batterien und Klebeband kaufen');

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
