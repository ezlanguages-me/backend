-- ============================================================
-- Seed: A0 English Path – STEP 3860 – Dialogue – clarify an order (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Buyer", "text": "I want to confirm the paper order.", "es": "Quiero confirmar el pedido de papel.", "de": "Ich möchte die Papierbestellung bestätigen."}'::jsonb,
    '{"character": "Supplier", "text": "Sure. Is it thirty boxes of A4 white paper?", "es": "Claro. ¿Son treinta cajas de papel blanco A4?", "de": "Sicher. Sind es dreißig Kartons weißes A4-Papier?"}'::jsonb,
    '{"character": "Buyer", "text": "Yes, and ten packs of envelopes too.", "es": "Sí, y también diez paquetes de sobres.", "de": "Ja, und zusätzlich zehn Packungen Umschläge."}'::jsonb,
    '{"character": "Supplier", "text": "Delivery to Floor 2 reception?", "es": "¿La entrega es en la recepción del segundo piso?", "de": "Lieferung an den Empfang im zweiten Stock?"}'::jsonb,
    '{"character": "Buyer", "text": "No, please deliver it to loading bay 3.", "es": "No, por favor, entréguelo en la zona de carga 3.", "de": "Nein, bitte liefern Sie an Laderampe 3."}'::jsonb,
    '{"character": "Supplier", "text": "Understood. Do you need it on Monday?", "es": "Entendido. ¿Lo necesita el lunes?", "de": "Verstanden. Brauchen Sie es am Montag?"}'::jsonb,
    '{"character": "Buyer", "text": "Tuesday morning is better.", "es": "El martes por la mañana es mejor.", "de": "Dienstagmorgen ist besser."}'::jsonb,
    '{"character": "Supplier", "text": "Fine. I will update the order now.", "es": "Bien. Actualizaré el pedido ahora.", "de": "Gut. Ich aktualisiere die Bestellung jetzt."}'::jsonb,
    '{"character": "Buyer", "text": "Thank you. Please keep the same order number.", "es": "Gracias. Mantenga el mismo número de pedido, por favor.", "de": "Danke. Bitte behalten Sie dieselbe Bestellnummer."}'::jsonb,
    '{"character": "Supplier", "text": "No problem.", "es": "No hay problema.", "de": "Kein Problem."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El pedido es de papel.", "p_de": "Die Bestellung ist für Papier.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "Se piden treinta cajas de papel blanco A4.", "p_de": "Es werden dreißig Kartons weißes A4-Papier bestellt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "También se piden veinte paquetes de sobres.", "p_de": "Es werden auch zwanzig Packungen Umschläge bestellt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La entrega final es en loading bay 3.", "p_de": "Die endgültige Lieferung geht an Laderampe 3.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La compradora prefiere el lunes por la mañana.", "p_de": "Die Käuferin bevorzugt Montagmorgen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Cuántas cajas de papel se confirman?", "p_de": "Wie viele Kartons Papier werden bestätigt?", "s_es": {"type": "multiple_choice", "options": ["Thirty", "Ten", "Three"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dreißig", "Zehn", "Drei"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué tamaño de papel es?", "p_de": "Welches Papierformat ist es?", "s_es": {"type": "multiple_choice", "options": ["A4", "A3", "Letter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A4", "A3", "Letter"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué otro producto aparece?", "p_de": "Welches weitere Produkt kommt vor?", "s_es": {"type": "multiple_choice", "options": ["Envelopes", "Chairs", "Towels"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Umschläge", "Stühle", "Handtücher"], "answer": 0}}'::jsonb,
    '{"p": "¿Dónde va la entrega?", "p_de": "Wohin geht die Lieferung?", "s_es": {"type": "multiple_choice", "options": ["Loading bay 3", "Floor 2 reception", "Meeting Room 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Laderampe 3", "Empfang im zweiten Stock", "Meeting Room 1"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué día prefiere la compradora?", "p_de": "Welchen Tag bevorzugt die Käuferin?", "s_es": {"type": "multiple_choice", "options": ["Tuesday morning", "Monday night", "Friday afternoon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dienstagmorgen", "Montagabend", "Freitagnachmittag"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3860 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 3860 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3860, 'en', 'dialogue', 'professional', '[{"name": "Buyer", "gender": "female", "avatarURL": "https://example.com/avatars/buyer.png"}, {"name": "Supplier", "gender": "male", "avatarURL": "https://example.com/avatars/supplier.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Aclara un pedido', 'Practica una conversación corta para confirmar cantidad, formato y lugar de entrega.'),
        (v_dialogue_id, 'de', 'Klär eine Bestellung', 'Übe ein kurzes Gespräch, um Menge, Format und Lieferort zu bestätigen.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
