-- ============================================================
-- Seed: A0 English Path – STEP 1870 – Reading – understand price labels and a range of advertisements such as Special Offer (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Las chaquetas de invierno tienen un 30% de descuento.", "p_de": "Winterjacken haben 30% Rabatt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los calcetines cuestan £6.99 hoy.", "p_de": "Socken kosten heute £6.99.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay una oferta 2 por 1 en champú.", "p_de": "Es gibt ein 2-für-1-Angebot für Shampoo.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El nuevo precio del café es £5.00.", "p_de": "Der neue Preis für Kaffee ist £5.00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El precio antiguo del café era £5.00.", "p_de": "Der alte Preis für Kaffee war £5.00.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pizza familiar cuesta £7.99.", "p_de": "Die Familienpizza kostet £7.99.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La oferta de la pizza termina el domingo.", "p_de": "Das Pizza-Angebot endet am Sonntag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda unidad de café es gratis.", "p_de": "Das zweite Kaffee-Glas ist kostenlos.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué descuento tienen las chaquetas?", "p_de": "Welchen Rabatt haben die Jacken?", "s": {"type": "multiple_choice", "options": ["30% off", "50% off", "10% off"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan hoy los calcetines?", "p_de": "Wie viel kosten die Socken heute?", "s": {"type": "multiple_choice", "options": ["£5.99", "£6.99", "£3.50"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué producto tiene oferta 2 por 1?", "p_de": "Welches Produkt hat ein 2-für-1-Angebot?", "s": {"type": "multiple_choice", "options": ["Shampoo", "Coffee jar", "Pizza"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el nuevo precio del café?", "p_de": "Wie hoch ist der neue Preis für Kaffee?", "s": {"type": "multiple_choice", "options": ["£3.50", "£5.00", "£7.99"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál era el precio antiguo del café?", "p_de": "Wie hoch war der alte Preis für Kaffee?", "s": {"type": "multiple_choice", "options": ["£5.00", "£3.50", "£2.50"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la pizza familiar?", "p_de": "Wie viel kostet die Familienpizza?", "s": {"type": "multiple_choice", "options": ["£7.99", "£5.99", "£9.99"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa limited time aquí?", "p_de": "Was bedeutet limited time hier?", "s": {"type": "multiple_choice", "options": ["The offer is only for a short time", "The shop is closed", "The food is cold"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué día es el último de la oferta?", "p_de": "Welcher Tag ist der letzte Tag des Angebots?", "s": {"type": "multiple_choice", "options": ["Sunday", "Saturday", "Monday"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1870 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1870 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1870, 'en', 'reading', 'Compras y Transacciones', $reading$
SALE 30% OFF all winter jackets. Today only: socks £5.99. Special Offer: 2 for 1 on shampoo.

Buy one coffee jar and get the second half price. New price: £3.50. Old price: £5.00.

Limited time: family pizza £7.99. Last day of offer: Sunday.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Etiquetas de precio y ofertas especiales');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Preisschilder und Sonderangebote');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
