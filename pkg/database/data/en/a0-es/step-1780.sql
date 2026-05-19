-- ============================================================
-- Seed: A0 English Path – STEP 1780 – Reading – bargain in the market place to a minimal extent, with the help of body language (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Los tomates cuestan £2 por kilo.", "p_de": "Tomaten kosten £2 pro Kilo.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los plátanos cuestan £1.50 el manojo.", "p_de": "Bananen kosten £1.50 pro Bund.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El agua pequeña cuesta £1.", "p_de": "Das kleine Wasser kostet £1.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dos kilos de tomates cuestan £3.", "p_de": "Zwei Kilo Tomaten kosten £3.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dos aguas grandes cuestan £3.", "p_de": "Zwei große Wasser kosten £3.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se puede señalar el producto con el dedo.", "p_de": "Man kann mit dem Finger auf das Produkt zeigen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que enseñar el número con los dedos.", "p_de": "Man soll die Zahl mit den Fingern zeigen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede pagar con tarjeta en este puesto.", "p_de": "An diesem Stand kann man mit Karte zahlen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto cuestan los tomates?", "p_de": "Wie viel kosten die Tomaten?", "s": {"type": "multiple_choice", "options": ["£2 a kilo", "80p a bunch", "£1.50 each"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan los plátanos?", "p_de": "Wie viel kosten die Bananen?", "s": {"type": "multiple_choice", "options": ["80p a bunch", "£2 a kilo", "£1 each"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el agua pequeña?", "p_de": "Wie viel kostet das kleine Wasser?", "s": {"type": "multiple_choice", "options": ["£1", "£1.50", "50p"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto pagas por 2 kilos de tomates?", "p_de": "Wie viel zahlst du für 2 Kilo Tomaten?", "s": {"type": "multiple_choice", "options": ["£3", "£4", "£2.50"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan dos aguas grandes?", "p_de": "Wie viel kosten zwei große Wasser?", "s": {"type": "multiple_choice", "options": ["£2.50", "£3", "£2"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes hacer para comunicarte?", "p_de": "Was kannst du tun, um dich zu verständigen?", "s": {"type": "multiple_choice", "options": ["Point to the item", "Write a long letter", "Use a train ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo muestras la cantidad?", "p_de": "Wie zeigst du die Menge?", "s": {"type": "multiple_choice", "options": ["With your fingers", "With a map", "With a bag"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se paga en este puesto?", "p_de": "Wie bezahlt man an diesem Stand?", "s": {"type": "multiple_choice", "options": ["Cash only", "Card only", "By phone"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1780 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1780 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1780, 'en', 'reading', 'Compras y Transacciones', $reading$
SATURDAY MARKET TODAY
Tomatoes £2 a kilo. Bananas 80p a bunch. Small water £1. Big water £1.50.

Ask for 2 kilos of tomatoes and pay £3. Two big waters cost £2.50.

You can point to the item and show the number with your fingers. Cash only at this stall.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Precios básicos en el mercado');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Einfache Marktpreise');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
