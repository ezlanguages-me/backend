-- ============================================================
-- Seed: A0 English Path – STEP 2240 – Reading – make a complaint about straightforward matters, for example, the service or the bill (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El correo trata de la cuenta 18.", "p_de": "Die E-Mail handelt von Rechnung 18.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Pidieron dos sopas y dos tés.", "p_de": "Sie bestellten zwei Suppen und zwei Tees.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En la cuenta aparecen dos tés.", "p_de": "Auf der Rechnung stehen zwei Tees.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La cuenta incluye un cargo por servicio del 15%.", "p_de": "Die Rechnung enthält einen Servicezuschlag von 15%.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El menú dice que el servicio está incluido al mediodía.", "p_de": "Die Speisekarte sagt, dass der Service mittags inbegriffen ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La persona pide revisar la cuenta.", "p_de": "Die Person bittet darum, die Rechnung zu prüfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona quiere un reembolso por un té extra.", "p_de": "Die Person möchte eine Rückerstattung für einen extra Tee.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El correo es para reservar una mesa nueva.", "p_de": "Die E-Mail dient dazu, einen neuen Tisch zu reservieren.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué número de cuenta aparece?", "p_de": "Welche Rechnungsnummer erscheint?", "s": {"type": "multiple_choice", "options": ["Bill 18", "Bill 8", "Bill 80"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos tés pidieron realmente?", "p_de": "Wie viele Tees bestellten sie wirklich?", "s": {"type": "multiple_choice", "options": ["Two teas", "Three teas", "One tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos tés aparecen en la cuenta?", "p_de": "Wie viele Tees stehen auf der Rechnung?", "s": {"type": "multiple_choice", "options": ["Three teas", "Two teas", "Four teas"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué porcentaje de servicio aparece?", "p_de": "Welcher Serviceprozentsatz steht dort?", "s": {"type": "multiple_choice", "options": ["15%", "10%", "5%"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice el menú sobre el servicio a la hora de comer?", "p_de": "Was sagt die Speisekarte über den Service zur Mittagszeit?", "s": {"type": "multiple_choice", "options": ["Service is not included", "Service is free and included", "Service is only for tourists"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide la persona al restaurante?", "p_de": "Worum bittet die Person das Restaurant?", "s": {"type": "multiple_choice", "options": ["Check the bill and refund the extra tea", "Bring another soup", "Send a taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida sobra en la cuenta?", "p_de": "Welches Getränk ist zu viel auf der Rechnung?", "s": {"type": "multiple_choice", "options": ["Tea", "Coffee", "Juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["An email of complaint", "A dinner invitation", "A menu"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2240 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2240 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2240, 'en', 'reading', 'Restauración', $reading$
EMAIL ABOUT BILL 18
Hello, I am writing about bill 18 from Saturday.
We ordered two soups and two teas. On the bill, there are three teas and a service charge of 15%.

The menu says service is not included at lunch.
Please check the bill and refund the extra tea. Thank you.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer una reclamación sobre la cuenta');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine Reklamation über die Rechnung lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
