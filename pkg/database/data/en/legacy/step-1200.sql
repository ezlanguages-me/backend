-- ============================================================
-- Seed: A0 English Path – STEP 1200 – Reading – exchange simple information with other customers in a queue (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Los clientes esperan detrás de la línea amarilla.", "de": "Die Kunden warten hinter der gelben Linie.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La cola rápida está a la izquierda.", "de": "Die schnelle Schlange ist links.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Si un cliente sale de la cola, vuelve al final.", "de": "Wenn ein Kunde die Schlange verlässt, stellt er sich wieder hinten an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los clientes pueden preguntar Are you next?", "de": "Kunden können fragen: Are you next?", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La respuesta No, you can go first es una respuesta posible.", "de": "Die Antwort No, you can go first ist möglich.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los clientes preparan el dinero o la tarjeta después de pagar.", "de": "Die Kunden bereiten Geld oder Karte erst nach dem Bezahlen vor.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los clientes deben dejar la cesta en la entrada antes de hacer cola.", "de": "Kunden sollen den Korb am Eingang lassen, bevor sie sich anstellen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La nota dice que una respuesta corta es suficiente.", "de": "Der Hinweis sagt, dass eine kurze Antwort reicht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde espera la gente?", "de": "Wo warten die Leute?", "s_es": {"type": "multiple_choice", "options": ["Behind the yellow line", "In front of the cashier", "Outside the shop"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter der gelben Linie", "Vor der Kasse", "Außerhalb des Geschäfts"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está la cola rápida?", "de": "Wo ist die schnelle Schlange?", "s_es": {"type": "multiple_choice", "options": ["On the right", "On the left", "At the back"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rechts", "Links", "Hinten"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace el cliente si sale de la cola?", "de": "Was macht ein Kunde, wenn er die Schlange verlässt?", "s_es": {"type": "multiple_choice", "options": ["He joins again at the end", "He keeps the same place", "He goes to the manager"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er stellt sich wieder hinten an", "Er behält denselben Platz", "Er geht zum Manager"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta simple hacen los clientes?", "de": "Welche einfache Frage stellen Kunden?", "s_es": {"type": "multiple_choice", "options": ["Where is the museum?", "Are you next?", "Do you study English?"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Where is the museum?", "Are you next?", "Do you study English?"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué respuesta permite pasar primero?", "de": "Welche Antwort lässt jemanden zuerst gehen?", "s_es": {"type": "multiple_choice", "options": ["I need a map", "No, you can go first", "The shop is closed"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["I need a map", "No, you can go first", "The shop is closed"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué prepara el cliente antes de llegar a la caja?", "de": "Was bereitet der Kunde vor, bevor er an die Kasse kommt?", "s_es": {"type": "multiple_choice", "options": ["A sandwich", "A bus ticket", "Cash or card"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Ein Sandwich", "Ein Busticket", "Bargeld oder Karte"], "answer": 2}}'::jsonb,
        '{"es": "¿Qué ayuda a mover la cola rápido?", "de": "Was hilft, die Schlange schnell zu bewegen?", "s_es": {"type": "multiple_choice", "options": ["Talking on the phone", "Being ready to pay", "Leaving the basket"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Am Telefon sprechen", "Bereit zum Bezahlen sein", "Den Korb stehen lassen"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué lleva el cliente consigo en la cola?", "de": "Was behält der Kunde in der Schlange bei sich?", "s_es": {"type": "multiple_choice", "options": ["The shop sign", "The cashier", "The basket"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Das Ladenschild", "Die Kassiererin", "Den Korb"], "answer": 2}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1200 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1200 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1200, 'en', 'reading', 'shopping', 'Checkout Notice\n\nPlease wait behind the yellow line. One customer goes to the cashier at a time.\n\nIf you have only one basket with a few items, use the quick queue on the right side of the store. The quick queue is on the right, not on the left.\n\nTake your place in the line. Do not leave your basket on the floor or at the entrance. Keep it with you. If you need to leave the line to get something, please join the line again at the end.\n\nCustomers often talk while they wait. You can ask the person next to you: Are you next? or Do you have many items? A short answer is enough. For example: Yes, I am next. Or: No, you can go first.\n\nBefore you reach the cashier, have your cash or card ready. This helps the queue move quickly and is helpful for everyone.\n\nThank you for shopping with us today.')RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES
        (v_reading_id, 'es', 'Conversación en la cola'), (v_reading_id, 'de', 'Gespräch in der Schlange');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
