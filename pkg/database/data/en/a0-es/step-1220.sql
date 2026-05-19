-- ============================================================
-- Seed: A0 English Path – STEP 1220 – Dialogue – exchange simple information with other customers in a queue (Compras y Transacciones)
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
        '{"character": "Customer A", "text": "Excuse me, are you next?", "es": "Perdone, ¿es usted el siguiente?", "de": "Entschuldigung, sind Sie als Nächster dran?"}'::jsonb,
        '{"character": "Customer B", "text": "Yes, I am next.", "es": "Sí, yo soy el siguiente.", "de": "Ja, ich bin als Nächster dran."}'::jsonb,
        '{"character": "Customer A", "text": "No problem. I only have one loaf of bread.", "es": "No pasa nada. Solo llevo una barra de pan.", "de": "Kein Problem. Ich habe nur ein Brot."}'::jsonb,
        '{"character": "Customer B", "text": "If you want, you can go before me.", "es": "Si quiere, puede pasar antes que yo.", "de": "Wenn Sie möchten, können Sie vor mir gehen."}'::jsonb,
        '{"character": "Customer A", "text": "That is very kind. Are you sure?", "es": "Es muy amable. ¿Está seguro?", "de": "Das ist sehr nett. Sind Sie sicher?"}'::jsonb,
        '{"character": "Customer B", "text": "Yes. I am waiting for a large order.", "es": "Sí. Estoy esperando un pedido grande.", "de": "Ja. Ich warte auf eine große Bestellung."}'::jsonb,
        '{"character": "Customer A", "text": "Thank you very much.", "es": "Muchas gracias.", "de": "Vielen Dank."}'::jsonb,
        '{"character": "Customer B", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb,
        '{"character": "Customer A", "text": "The queue is long this morning.", "es": "La cola es larga esta mañana.", "de": "Die Schlange ist heute Morgen lang."}'::jsonb,
        '{"character": "Customer B", "text": "Yes, but the bread is always good here.", "es": "Sí, pero aquí el pan siempre está bueno.", "de": "Ja, aber das Brot hier ist immer gut."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Customer B es el siguiente en la cola.", "de": "Kunde B ist als Nächster in der Schlange.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Customer A lleva una barra de pan.", "de": "Kundin A hat ein Brot dabei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Customer B dice que no puede dejar pasar a nadie.", "de": "Kunde B sagt, dass er niemanden vorlassen kann.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Customer B espera un pedido grande.", "de": "Kunde B wartet auf eine große Bestellung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los dos clientes dicen que la cola es larga.", "de": "Beide Kunden sagen, dass die Schlange lang ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué lleva Customer A?", "de": "Was hat Kundin A dabei?", "s_es": {"type": "multiple_choice", "options": ["One loaf of bread", "A cake and coffee", "Two bags"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Brot", "Einen Kuchen und Kaffee", "Zwei Taschen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ofrece Customer B?", "de": "Was bietet Kunde B an?", "s_es": {"type": "multiple_choice", "options": ["Go before me", "A cheaper loaf", "A shopping bag"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gehen Sie vor mir", "Ein billigeres Brot", "Eine Einkaufstasche"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué puede pasar primero Customer A?", "de": "Warum kann Kundin A zuerst gehen?", "s_es": {"type": "multiple_choice", "options": ["Because Customer B has a large order", "Because the shop is closing", "Because the bread is cold"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil Kunde B eine große Bestellung hat", "Weil der Laden schließt", "Weil das Brot kalt ist"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo describe Customer A la cola?", "de": "Wie beschreibt Kundin A die Schlange?", "s_es": {"type": "multiple_choice", "options": ["Long", "Quiet", "Empty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lang", "Ruhig", "Leer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice Customer B sobre el pan?", "de": "Was sagt Kunde B über das Brot?", "s_es": {"type": "multiple_choice", "options": ["It is always good here", "It is too expensive", "It is very small"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Es ist hier immer gut", "Es ist zu teuer", "Es ist sehr klein"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1220 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1220, 'en', 'dialogue', 'shopping', '[{"name": "Customer A", "gender": "female", "avatarURL": "https://example.com/avatars/customer-a.png"}, {"name": "Customer B", "gender": "male", "avatarURL": "https://example.com/avatars/customer-b.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla con otro cliente en una cola', 'Lee un diálogo corto entre dos clientes en la cola de una panadería.'),
        (v_dialogue_id, 'de', 'Sprich mit einem anderen Kunden in einer Schlange', 'Lies einen kurzen Dialog zwischen zwei Kunden in der Schlange einer Bäckerei.');

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
