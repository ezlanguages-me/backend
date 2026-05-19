-- ============================================================
-- Seed: A0 English Path – STEP 1130 – Listening – go to a department store to buy what is required (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La clienta necesita una mochila escolar y un impermeable ligero.", "de": "Die Kundin braucht einen Schulranzen und einen leichten Regenmantel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las mochilas están en la planta 1 junto a los cuadernos.", "de": "Die Schulranzen sind im 1. Stock neben den Heften.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los impermeables están en la planta 3.", "de": "Die Regenmäntel sind im 3. Stock.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los probadores están cerca de las chaquetas.", "de": "Die Umkleidekabinen sind in der Nähe der Jacken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La clienta confirma Floor 1 para la mochila y Floor 2 para el impermeable.", "de": "Die Kundin bestätigt 1. Stock für die Tasche und 2. Stock für den Regenmantel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mochila azul pequeña cuesta doce libras.", "de": "Der kleine blaue Ranzen kostet zwölf Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La clienta paga la mochila en la caja de la planta baja.", "de": "Die Kundin bezahlt die Tasche an der Kasse im Erdgeschoss.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La dependienta dice que la clienta puede probarse el impermeable antes de pagar.", "de": "Die Verkäuferin sagt, dass die Kundin den Regenmantel vor dem Bezahlen anprobieren kann.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué compra busca la clienta además del impermeable?", "de": "Was sucht die Kundin außer dem Regenmantel?", "s_es": {"type": "multiple_choice", "options": ["A school bag", "A towel", "A pair of shoes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Schulranzen", "Ein Handtuch", "Ein Paar Schuhe"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están las mochilas?", "de": "Wo sind die Schulranzen?", "s_es": {"type": "multiple_choice", "options": ["On Floor 1", "On Floor 2", "On the ground floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im 1. Stock", "Im 2. Stock", "Im Erdgeschoss"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están los impermeables ligeros?", "de": "Wo sind die leichten Regenmäntel?", "s_es": {"type": "multiple_choice", "options": ["On Floor 2", "On Floor 1", "On Floor 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im 2. Stock", "Im 1. Stock", "Im 3. Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la mochila azul pequeña?", "de": "Wie viel kostet der kleine blaue Ranzen?", "s_es": {"type": "multiple_choice", "options": ["Twelve pounds", "Two pounds", "Twenty pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwölf Pfund", "Zwei Pfund", "Zwanzig Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué servicio usa la clienta antes de pagar el impermeable?", "de": "Welchen Service benutzt die Kundin vor dem Bezahlen des Regenmantels?", "s_es": {"type": "multiple_choice", "options": ["The fitting room", "The customer desk", "The lift"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Umkleidekabine", "Den Kundenschalter", "Den Aufzug"], "answer": 0}}'::jsonb,
        '{"es": "¿Junto a qué sección están los probadores?", "de": "Neben welcher Abteilung sind die Umkleiden?", "s_es": {"type": "multiple_choice", "options": ["The jackets", "The notebooks", "The towels"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Jacken", "Den Heften", "Den Handtüchern"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde paga la clienta el impermeable?", "de": "Wo bezahlt die Kundin den Regenmantel?", "s_es": {"type": "multiple_choice", "options": ["At the cashier on Floor 2", "At the customer desk", "At the store exit"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An der Kasse im 2. Stock", "Am Kundenschalter", "Am Ausgang des Geschäfts"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace primero la clienta cuando escucha la información?", "de": "Was macht die Kundin zuerst, nachdem sie die Information hört?", "s_es": {"type": "multiple_choice", "options": ["She checks the floor numbers", "She buys shoes", "She goes home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie prüft die Etagen", "Sie kauft Schuhe", "Sie geht nach Hause"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1130 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1130 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1130, 'en', 'listening', 'shopping', $transcript$
# AUDIO PROFILE: Mila, a department-store assistant helping a customer
## "Everything for School and Rain"

## THE SCENE: A busy department store on a rainy afternoon
A customer wants to buy two useful items before class tomorrow.
Mila speaks clearly, gives floor directions, and repeats the prices and services slowly.

### DIRECTOR'S NOTES
Style:
* Warm shop-assistant voice with short, practical answers.
* Important details like floor numbers, prices, and fitting-room location are repeated.

Pace: Slow to medium, with small pauses before numbers and key shopping words.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear how a customer asks for items in a large store and how an assistant gives directions.
The audio practises departments, prices, and basic payment information.

#### TRANSCRIPT
[friendly] Assistant: Good afternoon. Can I help you?
[polite] Customer: Yes, please. I need a school bag and a light raincoat.
[clear] Assistant: The school bags are on Floor 1, next to the notebooks.
[helpful] Assistant: The light raincoats are on Floor 2, near the fitting rooms.
[checking] Customer: Floor 1 for the bag and Floor 2 for the raincoat?
[confirming] Assistant: Yes, that''s right.
[practical] Customer: How much is the small blue bag?
[clear] Assistant: It is twelve pounds today.
[practical] Customer: And can I try the raincoat before I pay?
[reassuring] Assistant: Yes. The fitting rooms are next to the jackets, and you can pay at the cashier on Floor 2.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha cómo comprar una mochila y un impermeable', 'Escucha a una dependienta que indica plantas, precios y probadores en unos grandes almacenes.'),
        (v_listening_id, 'de', 'Höre, wie man einen Schulranzen und einen Regenmantel kauft', 'Höre eine Verkäuferin, die Etagen, Preise und Umkleiden in einem Kaufhaus erklärt.');

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
