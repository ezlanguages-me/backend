-- ============================================================
-- Seed: A0 English Path – STEP 1210 – Listening – exchange simple information with other customers in a queue (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Elena pregunta si Mark es el siguiente.", "de": "Elena fragt, ob Mark dran ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mark tiene solo tres productos.", "de": "Mark hat nur drei Artikel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Elena lleva una cesta vacía.", "de": "Elena hat einen leeren Korb.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Mark ofrece dejar pasar primero a Elena.", "de": "Mark bietet an, Elena zuerst vorzulassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Elena acepta pasar primero.", "de": "Elena nimmt an, zuerst zu gehen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La cola va lenta hoy.", "de": "Die Schlange ist heute langsam.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El problema es la puerta automática.", "de": "Das Problem ist die automatische Tür.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los dos clientes tienen la tarjeta preparada.", "de": "Beide Kunden haben ihre Karte bereit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué pregunta hace Elena al principio?", "de": "Was fragt Elena am Anfang?", "s_es": {"type": "multiple_choice", "options": ["Are you next?", "Where is the milk?", "Do you work here?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Are you next?", "Where is the milk?", "Do you work here?"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos productos tiene Mark?", "de": "Wie viele Artikel hat Mark?", "s_es": {"type": "multiple_choice", "options": ["Three", "Five", "Ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Fünf", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué lleva Elena?", "de": "Was hat Elena dabei?", "s_es": {"type": "multiple_choice", "options": ["A blue bag", "A full basket", "A shopping cart"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Eine blaue Tasche", "Einen vollen Korb", "Einen Einkaufswagen"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué ofrece Mark?", "de": "Was bietet Mark an?", "s_es": {"type": "multiple_choice", "options": ["A discount card", "Elena can go first", "A second basket"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Eine Rabattkarte", "Elena kann zuerst gehen", "Einen zweiten Korb"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué dice Elena al final sobre el ofrecimiento?", "de": "Was sagt Elena am Ende zu dem Angebot?", "s_es": {"type": "multiple_choice", "options": ["I will go first", "I will leave the queue", "Please go first"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Ich gehe zuerst", "Ich verlasse die Schlange", "Bitte gehen Sie zuerst"], "answer": 2}}'::jsonb,
        '{"es": "¿Qué va lento hoy?", "de": "Was ist heute langsam?", "s_es": {"type": "multiple_choice", "options": ["The line", "The lift", "The bakery"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Schlange", "Der Aufzug", "Die Bäckerei"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué máquina va lenta?", "de": "Welche Maschine ist langsam?", "s_es": {"type": "multiple_choice", "options": ["The coffee machine", "The ticket machine", "The card machine"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Die Kaffeemaschine", "Der Ticketautomat", "Das Kartenlesegerät"], "answer": 2}}'::jsonb,
        '{"es": "¿Qué tienen preparado los clientes?", "de": "Was haben die Kunden vorbereitet?", "s_es": {"type": "multiple_choice", "options": ["Their passport", "Their card", "Their umbrella"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Ihren Ausweis", "Ihre Karte", "Ihren Regenschirm"], "answer": 1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1210 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1210 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    1210,
    'en',
    'listening',
    'shopping',
    $transcript$
# AUDIO PROFILE: Elena and Mark, two customers chatting in a supermarket checkout queue
## "Are You Next?"

## THE SCENE: A supermarket checkout with a short but slow queue
Two customers speak politely while they wait for the cashier.
They talk about whose turn it is, how many items they have, and whether someone can go first.

### DIRECTOR'S NOTES
Style:
* Very natural customer-to-customer exchange with polite short sentences.
* Repetition of queue phrases helps learners notice useful formulas.

Pace: Slow and calm, like people speaking quietly in a checkout line.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear basic language for waiting in line and speaking politely to other customers.
The audio is useful for turns, places, and simple offers.

#### TRANSCRIPT
[polite] Elena: Excuse me, are you next?
[friendly] Mark: Yes, I am next, but I only have three items.
[noticing] Elena: I have a full basket.
[helpful] Mark: You can go first if you are in a hurry.
[polite] Elena: That is kind, but you are fine. Please go first.
[thankful] Mark: Thank you.
[noticing] Elena: The line is slow today.
[agreeing] Mark: Yes, the card machine is a little slow.
[practical] Elena: I have my card ready.
[agreeing] Mark: Me too. That helps a lot.
[checking] Elena: Are there many people in front?
[reassuring] Mark: Just two more. We are almost there.
[small laugh] Elena: Good. I have a lot of shopping today.
[agreeing] Mark: Me too. It is always busy on Fridays.
[calm] Elena: Yes. I hope the card machine is working today.
[reassuring] Mark: I think it is fine. I can see the screen.
$transcript$
)RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES
        (v_listening_id, 'es', 'Conversación en la cola'), (v_listening_id, 'de', 'Supermarktschlange');

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
