-- ============================================================
-- Seed: A0 English Path – STEP 1840 – Dialogue – bargain in the market place (straightforward item) (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Buyer", "text": "Good morning. How much are the peaches?", "es": "Buenos días. ¿Cuánto cuestan los melocotones?", "de": "Guten Morgen. Wie viel kosten die Pfirsiche?"}'::jsonb,
        '{"character": "Seller", "text": "They are four euros a kilo.", "es": "Cuestan cuatro euros el kilo.", "de": "Sie kosten vier Euro pro Kilo."}'::jsonb,
        '{"character": "Buyer", "text": "I want two kilos. Can you do seven euros?", "es": "Quiero dos kilos. ¿Me los puede dejar en siete euros?", "de": "Ich möchte zwei Kilo. Können Sie sieben Euro machen?"}'::jsonb,
        '{"character": "Seller", "text": "Seven fifty is better for me.", "es": "Siete cincuenta me va mejor.", "de": "Sieben fünfzig ist besser für mich."}'::jsonb,
        '{"character": "Buyer", "text": "Okay, seven fifty. Can you choose good ones, please?", "es": "Vale, siete cincuenta. ¿Me puede escoger unos buenos, por favor?", "de": "Okay, sieben fünfzig. Können Sie bitte gute aussuchen?"}'::jsonb,
        '{"character": "Seller", "text": "Yes, these are very sweet.", "es": "Sí, estos están muy dulces.", "de": "Ja, diese sind sehr süß."}'::jsonb,
        '{"character": "Buyer", "text": "Perfect. I take them.", "es": "Perfecto. Me los llevo.", "de": "Perfekt. Ich nehme sie."}'::jsonb,
        '{"character": "Seller", "text": "Thank you. Here you are.", "es": "Gracias. Aquí tiene.", "de": "Danke. Bitte sehr."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La compradora pregunta por melocotones.", "p_de": "Die Käuferin fragt nach Pfirsichen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los melocotones cuestan cinco euros el kilo.", "p_de": "Die Pfirsiche kosten fünf Euro pro Kilo.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La compradora quiere dos kilos.", "p_de": "Die Käuferin möchte zwei Kilo.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El vendedor acepta siete euros inmediatamente.", "p_de": "Der Verkäufer akzeptiert sieben Euro sofort.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La compradora pide melocotones buenos.", "p_de": "Die Käuferin bittet um gute Pfirsiche.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto cuesta un kilo de melocotones?", "p_de": "Wie viel kostet ein Kilo Pfirsiche?", "s": {"type": "multiple_choice", "options": ["Four euros", "Five euros", "Three euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos kilos quiere la compradora?", "p_de": "Wie viele Kilo möchte die Käuferin?", "s": {"type": "multiple_choice", "options": ["Two kilos", "One kilo", "Three kilos"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué precio propone la compradora?", "p_de": "Welchen Preis schlägt die Käuferin vor?", "s": {"type": "multiple_choice", "options": ["Seven euros", "Seven fifty", "Eight euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué precio propone el vendedor?", "p_de": "Welchen Preis schlägt der Verkäufer vor?", "s": {"type": "multiple_choice", "options": ["Seven fifty", "Six euros", "Nine euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué decide al final la compradora?", "p_de": "Was entscheidet die Käuferin am Ende?", "s": {"type": "multiple_choice", "options": ["She takes them", "She buys apples", "She leaves"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1840 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1840 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1840, 'en', 'dialogue', 'Compras y Transacciones', '[{"name": "Buyer", "gender": "female", "avatarURL": "https://example.com/avatars/buyer.png"}, {"name": "Seller", "gender": "male", "avatarURL": "https://example.com/avatars/seller.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Comprar melocotones regateando un poco', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Pfirsiche mit etwas Handeln kaufen', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
