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
        '{"es": "La cesta debe quedarse con el cliente en la cola.", "de": "Der Korb soll beim Kunden in der Schlange bleiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La nota dice que una respuesta corta es suficiente.", "de": "Der Hinweis sagt, dass eine kurze Antwort reicht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde espera la gente?", "de": "Wo warten die Leute?", "s_es": {"type": "multiple_choice", "options": ["Behind the yellow line", "In front of the cashier", "Outside the shop"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter der gelben Linie", "Vor der Kasse", "Außerhalb des Geschäfts"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está la cola rápida?", "de": "Wo ist die schnelle Schlange?", "s_es": {"type": "multiple_choice", "options": ["On the right", "On the left", "At the back"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rechts", "Links", "Hinten"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace el cliente si sale de la cola?", "de": "Was macht ein Kunde, wenn er die Schlange verlässt?", "s_es": {"type": "multiple_choice", "options": ["He joins again at the end", "He keeps the same place", "He goes to the manager"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er stellt sich wieder hinten an", "Er behält denselben Platz", "Er geht zum Manager"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta simple hacen los clientes?", "de": "Welche einfache Frage stellen Kunden?", "s_es": {"type": "multiple_choice", "options": ["Are you next?", "Where is the museum?", "Do you study English?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Are you next?", "Where is the museum?", "Do you study English?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué respuesta permite pasar primero?", "de": "Welche Antwort lässt jemanden zuerst gehen?", "s_es": {"type": "multiple_choice", "options": ["No, you can go first", "I need a map", "The shop is closed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["No, you can go first", "I need a map", "The shop is closed"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué prepara el cliente antes de llegar a la caja?", "de": "Was bereitet der Kunde vor, bevor er an die Kasse kommt?", "s_es": {"type": "multiple_choice", "options": ["Cash or card", "A sandwich", "A bus ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bargeld oder Karte", "Ein Sandwich", "Ein Busticket"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ayuda a mover la cola rápido?", "de": "Was hilft, die Schlange schnell zu bewegen?", "s_es": {"type": "multiple_choice", "options": ["Being ready to pay", "Talking on the phone", "Leaving the basket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bereit zum Bezahlen sein", "Am Telefon sprechen", "Den Korb stehen lassen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué lleva el cliente consigo en la cola?", "de": "Was behält der Kunde in der Schlange bei sich?", "s_es": {"type": "multiple_choice", "options": ["The basket", "The shop sign", "The cashier"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Korb", "Das Ladenschild", "Die Kassiererin"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1200 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1200 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1200, 'en', 'reading', 'shopping', 'Checkout Notice. Please wait behind the yellow line. If you have one basket only, use the quick queue on the right.\n\nTake a place in the line and keep your basket with you. If you leave the line, please join again at the end.\n\nCustomers often ask: Are you next? or Do you have many items? A short answer is enough: Yes, I am next or No, you can go first.\n\nPlease have your card or cash ready before you reach the cashier. This helps the queue move quickly.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee información básica sobre una cola de clientes', 'Lee un cartel y unos mensajes cortos sobre el orden de una cola en un supermercado.'),
        (v_reading_id, 'de', 'Lies einfache Informationen über eine Warteschlange', 'Lies ein Schild und kurze Hinweise zur Reihenfolge in einer Schlange im Supermarkt.');

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
