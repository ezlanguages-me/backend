-- ============================================================
-- Seed: A0 English Path – STEP 1140 – Dialogue – go to a department store to buy what is required (Compras y Transacciones)
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
        '{"character": "Shop assistant", "text": "Hello. Can I help you?", "es": "Hola. ¿Puedo ayudarla?", "de": "Hallo. Kann ich Ihnen helfen?"}'::jsonb,
        '{"character": "Customer", "text": "Yes, please. I need a warm blue jacket.", "es": "Sí, por favor. Necesito una chaqueta azul y abrigada.", "de": "Ja, bitte. Ich brauche eine warme blaue Jacke."}'::jsonb,
        '{"character": "Shop assistant", "text": "The jackets are on this floor, next to the scarves.", "es": "Las chaquetas están en esta planta, junto a las bufandas.", "de": "Die Jacken sind auf dieser Etage, neben den Schals."}'::jsonb,
        '{"character": "Customer", "text": "Do you have size small?", "es": "¿Tiene talla pequeña?", "de": "Haben Sie Größe S?"}'::jsonb,
        '{"character": "Shop assistant", "text": "Yes. Here is a small blue jacket.", "es": "Sí. Aquí tiene una chaqueta azul de talla pequeña.", "de": "Ja. Hier ist eine blaue Jacke in Größe S."}'::jsonb,
        '{"character": "Customer", "text": "Can I try it on?", "es": "¿Puedo probármela?", "de": "Kann ich sie anprobieren?"}'::jsonb,
        '{"character": "Shop assistant", "text": "Of course. The fitting room is behind that mirror.", "es": "Claro. El probador está detrás de ese espejo.", "de": "Natürlich. Die Umkleide ist hinter diesem Spiegel."}'::jsonb,
        '{"character": "Customer", "text": "Great. How much is it?", "es": "Genial. ¿Cuánto cuesta?", "de": "Super. Wie viel kostet sie?"}'::jsonb,
        '{"character": "Shop assistant", "text": "It is twenty-eight pounds today.", "es": "Hoy cuesta veintiocho libras.", "de": "Heute kostet sie achtundzwanzig Pfund."}'::jsonb,
        '{"character": "Customer", "text": "Perfect. I will take it and pay by card.", "es": "Perfecto. Me la llevo y pago con tarjeta.", "de": "Perfekt. Ich nehme sie und zahle mit Karte."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "La clienta necesita una chaqueta azul.", "de": "Die Kundin braucht eine blaue Jacke.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las chaquetas están junto a las bufandas.", "de": "Die Jacken sind neben den Schals.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La dependienta solo tiene talla grande.", "de": "Die Verkäuferin hat nur Größe L.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El probador está detrás de un espejo.", "de": "Die Umkleide ist hinter einem Spiegel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La clienta paga con tarjeta.", "de": "Die Kundin zahlt mit Karte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué color quiere la clienta?", "de": "Welche Farbe möchte die Kundin?", "s_es": {"type": "multiple_choice", "options": ["Blue", "Black", "Green"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blau", "Schwarz", "Grün"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué talla pregunta la clienta?", "de": "Nach welcher Größe fragt die Kundin?", "s_es": {"type": "multiple_choice", "options": ["Small", "Medium", "Large"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["S", "M", "L"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el probador?", "de": "Wo ist die Umkleide?", "s_es": {"type": "multiple_choice", "options": ["Behind the mirror", "Next to the cashier", "On Floor 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter dem Spiegel", "Neben der Kasse", "Im 3. Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la chaqueta?", "de": "Wie viel kostet die Jacke?", "s_es": {"type": "multiple_choice", "options": ["Twenty-eight pounds", "Twelve pounds", "Thirty-eight pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Achtundzwanzig Pfund", "Zwölf Pfund", "Achtunddreißig Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo paga la clienta?", "de": "Wie bezahlt die Kundin?", "s_es": {"type": "multiple_choice", "options": ["By card", "By cash", "By bank transfer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte", "Mit Bargeld", "Per Überweisung"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1140 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1140, 'en', 'dialogue', 'shopping', '[{"name": "Shop assistant", "gender": "female", "avatarURL": "https://example.com/avatars/shop-assistant.png"}, {"name": "Customer", "gender": "female", "avatarURL": "https://example.com/avatars/customer.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pide una chaqueta en unos grandes almacenes', 'Lee un diálogo breve en el que una clienta busca una chaqueta y pregunta por la talla y el pago.'),
        (v_dialogue_id, 'de', 'Bitte um eine Jacke in einem Kaufhaus', 'Lies einen kurzen Dialog, in dem eine Kundin eine Jacke sucht und nach Größe und Bezahlung fragt.');

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
