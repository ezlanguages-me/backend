-- ============================================================
-- Seed: A0 English Path – STEP 1790 – Listening – bargain in the market place (minimal) (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Una bolsa de naranjas cuesta dos libras.", "p_de": "Eine Tüte Orangen kostet zwei Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dos bolsas de naranjas cuestan cuatro libras.", "p_de": "Zwei Tüten Orangen kosten vier Pfund.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Un kilo de tomates cuesta dos libras.", "p_de": "Ein Kilo Tomaten kostet zwei Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dos kilos de tomates cuestan tres libras.", "p_de": "Zwei Kilo Tomaten kosten drei Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una botella grande de agua cuesta una libra.", "p_de": "Eine große Flasche Wasser kostet ein Pfund.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Dos botellas grandes de agua cuestan dos libras cincuenta.", "p_de": "Zwei große Wasserflaschen kosten zwei Pfund fünfzig.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pide dos bolsas de naranjas.", "p_de": "Der Kunde bestellt zwei Tüten Orangen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pide dos aguas grandes.", "p_de": "Der Kunde bestellt zwei große Wasser.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto cuesta una bolsa de naranjas?", "p_de": "Wie viel kostet eine Tüte Orangen?", "s": {"type": "multiple_choice", "options": ["Two pounds", "Three pounds", "One pound fifty"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan dos bolsas de naranjas?", "p_de": "Wie viel kosten zwei Tüten Orangen?", "s": {"type": "multiple_choice", "options": ["Three pounds", "Four pounds", "Two pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta un kilo de tomates?", "p_de": "Wie viel kostet ein Kilo Tomaten?", "s": {"type": "multiple_choice", "options": ["Two pounds", "Three pounds", "One pound"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan dos kilos de tomates?", "p_de": "Wie viel kosten zwei Kilo Tomaten?", "s": {"type": "multiple_choice", "options": ["Three pounds", "Two pounds", "Two pounds fifty"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta una botella grande de agua?", "p_de": "Wie viel kostet eine große Wasserflasche?", "s": {"type": "multiple_choice", "options": ["One pound fifty", "One pound", "Two pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan dos botellas grandes de agua?", "p_de": "Wie viel kosten zwei große Wasserflaschen?", "s": {"type": "multiple_choice", "options": ["Two pounds fifty", "Three pounds", "Two pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide el cliente de naranjas?", "p_de": "Was bestellt der Kunde bei den Orangen?", "s": {"type": "multiple_choice", "options": ["Two bags", "One bag", "Three bags"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida pide el cliente?", "p_de": "Welches Getränk bestellt der Kunde?", "s": {"type": "multiple_choice", "options": ["One big water", "One juice", "Two coffees"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1790 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1790 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1790, 'en', 'listening', 'Compras y Transacciones', $transcript$
# AUDIO PROFILE: A lively fruit-and-drink seller
## "Fresh Prices at the Market"

## THE SCENE: A busy open-air market
A vendor calls out simple prices and offers a small discount if people buy more than one item.
The language is short and repetitive so learners can follow the numbers easily.

### DIRECTOR'S NOTES
Style:
* Energetic market voice with clear numbers.
* Repetition of prices and small discounts.

Pace: Medium but clearly separated by item.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for catching simple prices in a noisy market.
Learners hear how vendors repeat offers and short bargaining phrases.

#### TRANSCRIPT
[calling out] Vendor: Fresh oranges! One bag, two pounds! Two bags, three pounds!
[calling out] Vendor: Sweet tomatoes! One kilo, two pounds! Two kilos, three pounds!
[calling out] Vendor: Big bottles of water! One bottle, one pound fifty! Two bottles, two pounds fifty!
[customer] Customer: Two bags of oranges and one big water, please.
[vendor] Vendor: Yes, of course.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'El vendedor canta los precios', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Der Händler ruft die Preise', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
