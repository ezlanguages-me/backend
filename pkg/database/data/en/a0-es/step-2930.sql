-- ============================================================
-- Seed: A0 English Path – STEP 2930 – Dialogue – buy a ticket
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
        '{"character": "Clerk", "text": "Hello. How can I help you?", "es": "Hola. ¿En qué puedo ayudarle?", "de": "Hallo. Wie kann ich Ihnen helfen?"}'::jsonb,
        '{"character": "Traveler", "text": "I want two return tickets to Blue Island, please.", "es": "Quiero dos billetes de ida y vuelta a Blue Island, por favor.", "de": "Ich möchte bitte zwei Hin- und Rückfahrkarten nach Blue Island."}'::jsonb,
        '{"character": "Clerk", "text": "Sure. The next ferry is at 11:00.", "es": "Claro. El próximo ferry sale a las 11:00.", "de": "Gern. Die nächste Fähre fährt um 11:00 Uhr."}'::jsonb,
        '{"character": "Traveler", "text": "Great. Is there space for two adults?", "es": "Muy bien. ¿Hay sitio para dos adultos?", "de": "Super. Gibt es Platz für zwei Erwachsene?"}'::jsonb,
        '{"character": "Clerk", "text": "Yes, there is space. The tickets are twelve pounds each.", "es": "Sí, hay sitio. Los billetes cuestan doce libras cada uno.", "de": "Ja, es gibt Platz. Die Fahrkarten kosten zwölf Pfund pro Stück."}'::jsonb,
        '{"character": "Traveler", "text": "Okay. Can I pay by card?", "es": "Vale. ¿Puedo pagar con tarjeta?", "de": "Okay. Kann ich mit Karte bezahlen?"}'::jsonb,
        '{"character": "Clerk", "text": "Yes, you can. Please go to gate B after you pay.", "es": "Sí, puede. Vaya a la puerta B después de pagar.", "de": "Ja, das geht. Gehen Sie bitte nach dem Bezahlen zu Gate B."}'::jsonb,
        '{"character": "Traveler", "text": "Thank you. Do we need to print the tickets?", "es": "Gracias. ¿Tenemos que imprimir los billetes?", "de": "Danke. Müssen wir die Fahrkarten ausdrucken?"}'::jsonb,
        '{"character": "Clerk", "text": "No. Show them on your phone.", "es": "No. Enséñelos en su teléfono.", "de": "Nein. Zeigen Sie sie auf Ihrem Handy."}'::jsonb,
        '{"character": "Traveler", "text": "Perfect. Thank you very much.", "es": "Perfecto. Muchas gracias.", "de": "Perfekt. Vielen Dank."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El viajero quiere dos billetes de ida y vuelta a Blue Island.", "de": "Der Reisende möchte zwei Hin- und Rückfahrkarten nach Blue Island.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El próximo ferry sale a las 10:00.", "de": "Die nächste Fähre fährt um 10:00 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Cada billete cuesta doce libras.", "de": "Jede Fahrkarte kostet zwölf Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los viajeros tienen que imprimir los billetes.", "de": "Die Reisenden müssen die Fahrkarten ausdrucken.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Después de pagar, deben ir a la puerta B.", "de": "Nach dem Bezahlen sollen sie zu Gate B gehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿A dónde quiere ir el viajero?", "de": "Wohin möchte der Reisende fahren?", "s_es": {"type": "multiple_choice", "options": ["Blue Island", "West Airport", "Greenhill"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blue Island", "West Airport", "Greenhill"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos billetes quiere?", "de": "Wie viele Fahrkarten möchte er?", "s_es": {"type": "multiple_choice", "options": ["Dos", "Una", "Tres"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Eine", "Drei"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo quiere pagar?", "de": "Wie möchte er bezahlen?", "s_es": {"type": "multiple_choice", "options": ["Con tarjeta", "En efectivo", "En línea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Karte", "Bar", "Online"], "answer": 0}}'::jsonb,
        '{"es": "¿A dónde debe ir después de pagar?", "de": "Wohin soll er nach dem Bezahlen gehen?", "s_es": {"type": "multiple_choice", "options": ["A la puerta B", "Al andén 4", "A la oficina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zu Gate B", "Zu Bahnsteig 4", "Ins Büro"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo puede mostrar los billetes?", "de": "Wie kann er die Fahrkarten zeigen?", "s_es": {"type": "multiple_choice", "options": ["En el teléfono", "En papel azul", "En una tarjeta de banco"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Handy", "Auf blauem Papier", "Auf einer Bankkarte"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2930 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2930 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2930, 'en', 'dialogue', 'transport', '[{"name": "Clerk", "gender": "female", "avatarURL": "https://example.com/avatars/clerk.png"}, {"name": "Traveler", "gender": "male", "avatarURL": "https://example.com/avatars/traveler.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Compra billetes para un ferry', 'Lee un diálogo corto en una taquilla de ferry con precio, puerta y formato del billete.'),
        (v_dialogue_id, 'de', 'Kaufe Fahrkarten für eine Fähre', 'Lies einen kurzen Dialog am Fährschalter mit Preis, Gate und Ticketformat.');

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
