-- ============================================================
-- Seed: A0 English Path – STEP 1800 – Dialogue – bargain in the market place (minimal) (Compras y Transacciones)
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
        '{"character": "Customer", "text": "Hello. How much is this scarf?", "es": "Hola. ¿Cuánto cuesta esta bufanda?", "de": "Hallo. Wie viel kostet dieser Schal?"}'::jsonb,
        '{"character": "Vendor", "text": "It is ten pounds.", "es": "Cuesta diez libras.", "de": "Er kostet zehn Pfund."}'::jsonb,
        '{"character": "Customer", "text": "Ten? Can you do nine?", "es": "¿Diez? ¿Me lo puede dejar en nueve?", "de": "Zehn? Können Sie neun machen?"}'::jsonb,
        '{"character": "Vendor", "text": "Okay, nine pounds.", "es": "Vale, nueve libras.", "de": "Okay, neun Pfund."}'::jsonb,
        '{"character": "Customer", "text": "Can I have a small bag too?", "es": "¿Me da también una bolsa pequeña?", "de": "Kann ich auch eine kleine Tasche bekommen?"}'::jsonb,
        '{"character": "Vendor", "text": "Yes, of course.", "es": "Sí, claro.", "de": "Ja, natürlich."}'::jsonb,
        '{"character": "Customer", "text": "Great. I take it.", "es": "Perfecto. Me la llevo.", "de": "Super. Ich nehme ihn."}'::jsonb,
        '{"character": "Vendor", "text": "Thank you very much.", "es": "Muchas gracias.", "de": "Vielen Dank."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clienta pregunta por una bufanda.", "p_de": "Die Kundin fragt nach einem Schal.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bufanda cuesta ocho libras al principio.", "p_de": "Der Schal kostet am Anfang acht Pfund.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La clienta pide pagar nueve libras.", "p_de": "Die Kundin möchte neun Pfund zahlen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El vendedor rechaza el precio de nueve libras.", "p_de": "Der Verkäufer lehnt neun Pfund ab.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La clienta también pide una bolsa pequeña.", "p_de": "Die Kundin bittet auch um eine kleine Tasche.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué artículo quiere comprar la clienta?", "p_de": "Welchen Artikel möchte die Kundin kaufen?", "s": {"type": "multiple_choice", "options": ["A scarf", "A hat", "A belt"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el primer precio?", "p_de": "Wie hoch ist der erste Preis?", "s": {"type": "multiple_choice", "options": ["Ten pounds", "Nine pounds", "Eight pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué precio propone la clienta?", "p_de": "Welchen Preis schlägt die Kundin vor?", "s": {"type": "multiple_choice", "options": ["Nine pounds", "Seven pounds", "Five pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué extra pide la clienta?", "p_de": "Worum bittet die Kundin zusätzlich?", "s": {"type": "multiple_choice", "options": ["A small bag", "A free drink", "Another scarf"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué decide al final?", "p_de": "Was entscheidet sie am Ende?", "s": {"type": "multiple_choice", "options": ["She takes it", "She walks away", "She buys two"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1800 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1800 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1800, 'en', 'dialogue', 'Compras y Transacciones', '[{"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Vendor", "gender": "male", "avatarURL": "https://example.com/avatars/vendor.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', '¿Me deja la bufanda un poco más barata?', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Geht der Schal etwas billiger?', '');

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
