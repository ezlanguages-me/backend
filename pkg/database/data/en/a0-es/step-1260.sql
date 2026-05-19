-- ============================================================
-- Seed: A0 English Path – STEP 1260 – Dialogue – understand a counter-service shop where items are requested and served by a shopkeeper (Compras y Transacciones)
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
        '{"character": "Shopkeeper", "text": "Good afternoon. What would you like?", "es": "Buenas tardes. ¿Qué desea?", "de": "Guten Tag. Was möchten Sie?"}'::jsonb,
        '{"character": "Customer", "text": "I would like two hundred grams of cheese, please.", "es": "Quisiera doscientos gramos de queso, por favor.", "de": "Ich hätte gern zweihundert Gramm Käse, bitte."}'::jsonb,
        '{"character": "Shopkeeper", "text": "Of course. Mild cheese or strong cheese?", "es": "Claro. ¿Queso suave o fuerte?", "de": "Gern. Milder Käse oder kräftiger Käse?"}'::jsonb,
        '{"character": "Customer", "text": "Mild cheese, please.", "es": "Queso suave, por favor.", "de": "Milden Käse, bitte."}'::jsonb,
        '{"character": "Shopkeeper", "text": "Anything else?", "es": "¿Algo más?", "de": "Noch etwas?"}'::jsonb,
        '{"character": "Customer", "text": "Yes, four slices of ham.", "es": "Sí, cuatro lonchas de jamón.", "de": "Ja, vier Scheiben Schinken."}'::jsonb,
        '{"character": "Shopkeeper", "text": "No problem. I put the cheese and ham in one bag.", "es": "No hay problema. Pongo el queso y el jamón en una sola bolsa.", "de": "Kein Problem. Ich packe Käse und Schinken in eine Tasche."}'::jsonb,
        '{"character": "Customer", "text": "Thank you. How much is it?", "es": "Gracias. ¿Cuánto es?", "de": "Danke. Wie viel kostet es?"}'::jsonb,
        '{"character": "Shopkeeper", "text": "It is six pounds fifty.", "es": "Son seis libras con cincuenta.", "de": "Es kostet sechs Pfund fünfzig."}'::jsonb,
        '{"character": "Customer", "text": "Great. I pay here, right?", "es": "Muy bien. Pago aquí, ¿verdad?", "de": "Gut. Ich bezahle hier, oder?"}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El cliente pide doscientos gramos de queso.", "de": "Der Kunde bestellt zweihundert Gramm Käse.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La dependienta ofrece queso suave o fuerte.", "de": "Die Verkäuferin bietet milden oder kräftigen Käse an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente quiere queso fuerte.", "de": "Der Kunde möchte kräftigen Käse.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Después pide cuatro lonchas de jamón.", "de": "Danach bestellt er vier Scheiben Schinken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El total es seis libras con cincuenta.", "de": "Die Summe ist sechs Pfund fünfzig.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué cantidad de queso pide?", "de": "Wie viel Käse bestellt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["Two hundred grams", "One kilo", "Fifty grams"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweihundert Gramm", "Ein Kilo", "Fünfzig Gramm"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de queso elige?", "de": "Welche Käsesorte wählt er?", "s_es": {"type": "multiple_choice", "options": ["Mild cheese", "Strong cheese", "Blue cheese"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Milden Käse", "Kräftigen Käse", "Blauschimmelkäse"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué más pide el cliente?", "de": "Was bestellt der Kunde außerdem?", "s_es": {"type": "multiple_choice", "options": ["Four slices of ham", "A loaf of bread", "Two apples"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vier Scheiben Schinken", "Ein Brot", "Zwei Äpfel"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo lo empaqueta la dependienta?", "de": "Wie verpackt die Verkäuferin alles?", "s_es": {"type": "multiple_choice", "options": ["In one bag", "In two boxes", "On a tray"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In einer Tasche", "In zwei Schachteln", "Auf einem Tablett"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta todo?", "de": "Wie viel kostet alles?", "s_es": {"type": "multiple_choice", "options": ["Six pounds fifty", "Five pounds", "Seven pounds fifty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs Pfund fünfzig", "Fünf Pfund", "Sieben Pfund fünfzig"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1260 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1260, 'en', 'dialogue', 'shopping', '[{"name": "Shopkeeper", "gender": "female", "avatarURL": "https://example.com/avatars/shopkeeper.png"}, {"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pide queso en un mostrador de charcutería', 'Lee un diálogo en una charcutería donde el cliente pide queso y jamón en el mostrador.'),
        (v_dialogue_id, 'de', 'Bitte um Käse an einer Feinkosttheke', 'Lies einen Dialog an einer Feinkosttheke, in dem der Kunde Käse und Schinken verlangt.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
