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
        '{"es": "¿Cuánto cuesta cada paquete de pilas?", "de": "Wie viel kostet jede Packung Batterien?", "s_es": {"type": "multiple_choice", "options": ["Three pounds", "One pound", "Seven pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Pfund", "Ein Pfund", "Sieben Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la cinta?", "de": "Wie viel kostet das Klebeband?", "s_es": {"type": "multiple_choice", "options": ["One pound", "Two pounds", "Three pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Pfund", "Zwei Pfund", "Drei Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el total?", "de": "Wie hoch ist die Gesamtsumme?", "s_es": {"type": "multiple_choice", "options": ["Seven pounds", "Six pounds", "Five pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sieben Pfund", "Sechs Pfund", "Fünf Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde paga el cliente?", "de": "Wo bezahlt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["At the counter", "At the exit", "At a machine"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Tresen", "Am Ausgang", "An einem Automaten"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo puede pagar?", "de": "Wie kann er bezahlen?", "s_es": {"type": "multiple_choice", "options": ["Cash or card", "Only cash", "Only card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Bargeld oder Karte", "Nur mit Bargeld", "Nur mit Karte"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace el cliente antes de pagar?", "de": "Was macht der Kunde vor dem Bezahlen?", "s_es": {"type": "multiple_choice", "options": ["He checks the total", "He asks for a refund", "He leaves the shop"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er prüft den Gesamtpreis", "Er bittet um eine Rückgabe", "Er verlässt den Laden"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1170 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1170 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1170, 'en', 'listening', 'shopping', $transcript$
# AUDIO PROFILE: Omar, a shop assistant in a small hardware shop
## "What Do You Need Today?"

## THE SCENE: A quiet local shop with batteries, tape, and small tools
A customer asks for two simple items that are easy for the shopkeeper to understand.
Omar repeats the items, tells the price, and explains where to pay.

### DIRECTOR'S NOTES
Style:
* Clear shop-counter exchange with short requests and short answers.
* Repetition of the items helps beginner learners follow the whole interaction.

Pace: Slow and tidy, with extra stress on numbers, quantity, and price.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise asking for a specific item in a shop and understanding the assistant''s reply.
The audio focuses on quantity, availability, and payment.

#### TRANSCRIPT
[welcoming] Assistant: Hello. What do you need today?
[polite] Customer: I need two packs of AA batteries and one roll of tape, please.
[clear] Assistant: Yes, we have both.
[helpful] Assistant: The batteries are three pounds a pack, and the tape is one pound.
[checking] Customer: So that is six pounds for the batteries and one pound for the tape?
[confirming] Assistant: Yes, seven pounds in total.
[practical] Customer: Great. Where do I pay?
[clear] Assistant: You pay here at the counter.
[polite] Customer: Can I pay by card?
[reassuring] Assistant: Yes, cash or card is fine.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha cómo pedir pilas y cinta en una tienda', 'Escucha una compra simple en una tienda pequeña con cantidades, precio y pago.'),
        (v_listening_id, 'de', 'Höre, wie man Batterien und Klebeband in einem Geschäft verlangt', 'Höre einen einfachen Einkauf in einem kleinen Laden mit Menge, Preis und Bezahlung.');

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
