-- ============================================================
-- Seed: A0 English Path – STEP 1940 – Dialogue – go to a self-service or fast food establishment and order a meal (Restauración)
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
        '{"character": "Customer", "text": "Hi. Can I have a double burger meal, please?", "es": "Hola. ¿Me pone un menú de doble hamburguesa, por favor?", "de": "Hallo. Kann ich bitte ein Double-Burger-Menü haben?"}'::jsonb,
        '{"character": "Cashier", "text": "Sure. What drink would you like?", "es": "Claro. ¿Qué bebida quiere?", "de": "Gern. Welches Getränk möchten Sie?"}'::jsonb,
        '{"character": "Customer", "text": "A large lemon soda, please.", "es": "Una soda de limón grande, por favor.", "de": "Eine große Zitronenlimonade, bitte."}'::jsonb,
        '{"character": "Cashier", "text": "Do you want pickles in the burger?", "es": "¿Quiere pepinillos en la hamburguesa?", "de": "Möchten Sie Gurken im Burger?"}'::jsonb,
        '{"character": "Customer", "text": "No pickles, please.", "es": "Sin pepinillos, por favor.", "de": "Keine Gurken, bitte."}'::jsonb,
        '{"character": "Cashier", "text": "Anything else?", "es": "¿Algo más?", "de": "Sonst noch etwas?"}'::jsonb,
        '{"character": "Customer", "text": "Yes, a chocolate shake too.", "es": "Sí, también un batido de chocolate.", "de": "Ja, auch einen Schokoladen-Milchshake."}'::jsonb,
        '{"character": "Cashier", "text": "No problem. That is one double burger meal and one chocolate shake.", "es": "Sin problema. Entonces es un menú de doble hamburguesa y un batido de chocolate.", "de": "Kein Problem. Dann ist es ein Double-Burger-Menü und ein Schokoladen-Milchshake."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente pide un menú de doble hamburguesa.", "p_de": "Der Kunde bestellt ein Double-Burger-Menü.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bebida es pequeña.", "p_de": "Das Getränk ist klein.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La bebida principal es una soda de limón grande.", "p_de": "Das Hauptgetränk ist eine große Zitronenlimonade.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente quiere pepinillos.", "p_de": "Der Kunde möchte Gurken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente añade un batido de chocolate.", "p_de": "Der Kunde bestellt zusätzlich einen Schokoladen-Milchshake.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué menú pide el cliente?", "p_de": "Welches Menü bestellt der Kunde?", "s": {"type": "multiple_choice", "options": ["A double burger meal", "A chicken wrap meal", "A kids box"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida elige al principio?", "p_de": "Welches Getränk wählt er zuerst?", "s": {"type": "multiple_choice", "options": ["A large lemon soda", "A small cola", "Water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ingrediente no quiere?", "p_de": "Welche Zutat möchte er nicht?", "s": {"type": "multiple_choice", "options": ["Pickles", "Cheese", "Onion"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué añade después?", "p_de": "Was bestellt er zusätzlich?", "s": {"type": "multiple_choice", "options": ["A chocolate shake", "Extra fries", "An apple pie"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué repite la cajera al final?", "p_de": "Was wiederholt die Kassiererin am Ende?", "s": {"type": "multiple_choice", "options": ["One double burger meal and one chocolate shake", "Two burgers and water", "A wrap and a shake"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1940 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1940 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1940, 'en', 'dialogue', 'Restauración', '[{"name": "Customer", "gender": "male", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Cashier", "gender": "female", "avatarURL": "https://example.com/avatars/cashier.png"}]'::jsonb) RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Pedido en una hamburguesería', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Bestellung in einem Burger-Restaurant', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_id;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));
        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
