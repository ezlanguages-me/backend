-- ============================================================
-- Seed: A0 English Path – STEP 2400 – Reading – complain effectively about most situations that are likely to arise in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Esperaron cuarenta minutos por los platos principales.", "p_de": "Sie warteten vierzig Minuten auf die Hauptgerichte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pareja recibió la pasta vegetariana correcta.", "p_de": "Die Partnerin bekam die richtige vegetarische Pasta.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La sopa llegó fría.", "p_de": "Die Suppe kam kalt an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero recordó la nota sobre la alergia a los frutos secos.", "p_de": "Der Kellner erinnerte sich an den Hinweis zur Nussallergie.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La cuenta incluía dos refrescos que no tomaron.", "p_de": "Die Rechnung enthielt zwei Softdrinks, die sie nicht hatten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona solo quiere un postre gratis.", "p_de": "Die Person möchte nur ein kostenloses Dessert.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La carta pide disculpa, cuenta corregida y reembolso.", "p_de": "Der Brief bittet um Entschuldigung, korrigierte Rechnung und Rückerstattung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto es una queja formal al gerente.", "p_de": "Der Text ist eine formelle Beschwerde an den Manager.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto tiempo esperaron?", "p_de": "Wie lange warteten sie?", "s": {"type": "multiple_choice", "options": ["Forty minutes", "Ten minutes", "Two hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato recibió la pareja por error?", "p_de": "Welches Gericht bekam die Partnerin irrtümlich?", "s": {"type": "multiple_choice", "options": ["Chicken", "Vegetarian pasta", "Fish"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo llegó la sopa?", "p_de": "Wie kam die Suppe an?", "s": {"type": "multiple_choice", "options": ["Cold", "Too sweet", "Perfect"], "answer": 0}}'::jsonb,
        '{"p": "¿Sobre qué alergia había una nota?", "p_de": "Zu welcher Allergie gab es einen Hinweis?", "s": {"type": "multiple_choice", "options": ["Nuts", "Fish", "Milk"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué había de más en la cuenta?", "p_de": "Was war zu viel auf der Rechnung?", "s": {"type": "multiple_choice", "options": ["Two soft drinks", "One soup", "A taxi fee"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tres cosas pide la persona?", "p_de": "Welche drei Dinge fordert die Person?", "s": {"type": "multiple_choice", "options": ["An apology, a corrected bill, and a refund for the dessert", "A hotel room, free coffee, and music", "Only a phone call"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién va dirigida la carta?", "p_de": "An wen ist der Brief gerichtet?", "s": {"type": "multiple_choice", "options": ["The manager", "The chef only", "A taxi company"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A formal complaint letter", "A recipe", "A menu"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2400 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2400 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2400, 'en', 'reading', 'Restauración', $reading$
LETTER TO THE MANAGER
Dear Manager,
I visited your restaurant on Friday at 8 p.m. First, we waited forty minutes for our main dishes.
Then my partner received chicken instead of the vegetarian pasta she ordered.

My soup arrived cold, and the waiter forgot my allergy note about nuts in the dessert.
Finally, the bill included two soft drinks we did not have.

We would like an apology, a corrected bill, and a refund for the dessert.
I hope you can respond soon.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer una reclamación formal completa');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine vollständige formelle Beschwerde lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
