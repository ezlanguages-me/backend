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
        '{"es": "¿Qué lleva Elena?", "de": "Was hat Elena dabei?", "s_es": {"type": "multiple_choice", "options": ["A full basket", "A blue bag", "A shopping cart"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen vollen Korb", "Eine blaue Tasche", "Einen Einkaufswagen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ofrece Mark?", "de": "Was bietet Mark an?", "s_es": {"type": "multiple_choice", "options": ["Elena can go first", "A discount card", "A second basket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Elena kann zuerst gehen", "Eine Rabattkarte", "Einen zweiten Korb"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice Elena al final sobre el ofrecimiento?", "de": "Was sagt Elena am Ende zu dem Angebot?", "s_es": {"type": "multiple_choice", "options": ["Please go first", "I will go first", "I will leave the queue"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bitte gehen Sie zuerst", "Ich gehe zuerst", "Ich verlasse die Schlange"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué va lento hoy?", "de": "Was ist heute langsam?", "s_es": {"type": "multiple_choice", "options": ["The line", "The lift", "The bakery"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Schlange", "Der Aufzug", "Die Bäckerei"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué máquina va lenta?", "de": "Welche Maschine ist langsam?", "s_es": {"type": "multiple_choice", "options": ["The card machine", "The coffee machine", "The ticket machine"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Kartenlesegerät", "Die Kaffeemaschine", "Der Ticketautomat"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tienen preparado los clientes?", "de": "Was haben die Kunden vorbereitet?", "s_es": {"type": "multiple_choice", "options": ["Their card", "Their passport", "Their umbrella"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihre Karte", "Ihren Ausweis", "Ihren Regenschirm"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1210 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1210 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1210, 'en', 'listening', 'shopping', $transcript$
# AUDIO PROFILE: Elena and Mark, two customers waiting in line
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
[quietly] Elena: Excuse me, are you next?
[polite] Mark: Yes, I am next, but I only have three items.
[friendly] Elena: I have a full basket.
[helpful] Mark: You can go first if you are in a hurry.
[thankful] Elena: That is kind, but you are fine. Please go first.
[small laugh] Mark: Thank you.
[noticing] Elena: The line is slow today.
[agreeing] Mark: Yes, the card machine is a little slow.
[practical] Elena: I have my card ready.
[calm] Mark: Me too. That helps a lot.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una conversación en la cola del supermercado', 'Escucha a dos clientes que hablan de su turno y de cuántos productos llevan.'),
        (v_listening_id, 'de', 'Höre ein Gespräch in der Supermarktschlange', 'Höre zwei Kunden, die über ihren Platz in der Schlange und ihre Artikel sprechen.');

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
