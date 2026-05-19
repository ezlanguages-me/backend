-- ============================================================
-- Seed: A0 English Path – STEP 1820 – Reading – bargain in the market place where what is purchased is a relatively straightforward item (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Las camisetas de algodón cuestan £12 cada una.", "p_de": "Baumwoll-T-Shirts kosten jeweils £12.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dos camisetas cuestan £24.", "p_de": "Zwei T-Shirts kosten £24.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los cinturones de cuero cuestan £15.", "p_de": "Ledergürtel kosten £15.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los sombreros de verano cuestan £12.", "p_de": "Sommerhüte kosten £12.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las tallas disponibles son S, M y L.", "p_de": "Die verfügbaren Größen sind S, M und L.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hoy hay camisetas azules y negras.", "p_de": "Heute gibt es blaue und schwarze T-Shirts.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se acepta efectivo y tarjeta.", "p_de": "Bar und Karte werden akzeptiert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede devolver cualquier artículo en oferta.", "p_de": "Man kann jeden Sonderangebotsartikel zurückgeben.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto cuesta una camiseta de algodón?", "p_de": "Wie viel kostet ein Baumwoll-T-Shirt?", "s": {"type": "multiple_choice", "options": ["£12", "£15", "£9"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan dos camisetas?", "p_de": "Wie viel kosten zwei T-Shirts?", "s": {"type": "multiple_choice", "options": ["£20", "£24", "£18"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta un cinturón de cuero?", "p_de": "Wie viel kostet ein Ledergürtel?", "s": {"type": "multiple_choice", "options": ["£15", "£12", "£25"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta un sombrero de verano?", "p_de": "Wie viel kostet ein Sommerhut?", "s": {"type": "multiple_choice", "options": ["£9", "£12", "£15"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tallas puedes pedir?", "p_de": "Welche Größen kannst du verlangen?", "s": {"type": "multiple_choice", "options": ["S, M, or L", "XS, S, or XL", "M only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué colores de camisetas hay hoy?", "p_de": "Welche T-Shirt-Farben gibt es heute?", "s": {"type": "multiple_choice", "options": ["Blue and black", "Red and green", "White and yellow"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se puede pagar?", "p_de": "Wie kann man bezahlen?", "s": {"type": "multiple_choice", "options": ["Cash and card", "Card only", "Cash only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué precio tienen dos cinturones?", "p_de": "Welchen Preis haben zwei Gürtel?", "s": {"type": "multiple_choice", "options": ["£25", "£30", "£20"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1820 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1820 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1820, 'en', 'reading', 'Compras y Transacciones', $reading$
MARTA'S MARKET CLOTHES
Cotton T-shirts: £12 each or 2 for £20. Leather belts: £15. Summer hats: £9.

Ask for size S, M, or L. Blue and black T-shirts are in stock today. Cash and card accepted.

Friendly price for two belts: £25. No returns on sale items.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Lista de precios de un puesto de ropa');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Preisliste an einem Kleidungsstand');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
