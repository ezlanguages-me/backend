-- ============================================================
-- Seed: A0 English Path – STEP 2460 – Reading – understand bills, e.g. whether service is included (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La cuenta es para la mesa 12.", "p_de": "Die Rechnung ist für Tisch 12.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay dos sopas en la cuenta.", "p_de": "Es stehen zwei Suppen auf der Rechnung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pollo con arroz cuesta £10.", "p_de": "Das Hähnchen mit Reis kostet £10.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay dos limonadas.", "p_de": "Es gibt zwei Limonaden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El subtotal es £27.10.", "p_de": "Die Zwischensumme beträgt £27.10.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El servicio es del 5%.", "p_de": "Der Service beträgt 5%.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El impuesto está incluido.", "p_de": "Die Steuer ist inbegriffen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los precios del menú ya incluyen el servicio.", "p_de": "Die Menüpreise enthalten den Service bereits.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto cuesta el pollo con arroz?", "p_de": "Wie viel kostet das Hähnchen mit Reis?", "s": {"type": "multiple_choice", "options": ["£12.50", "£9.00", "£5.60"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas limonadas hay?", "p_de": "Wie viele Limonaden gibt es?", "s": {"type": "multiple_choice", "options": ["2", "1", "3"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el subtotal?", "p_de": "Wie hoch ist die Zwischensumme?", "s": {"type": "multiple_choice", "options": ["£27.10", "£29.81", "£2.71"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto es el servicio?", "p_de": "Wie hoch ist der Service?", "s": {"type": "multiple_choice", "options": ["£2.71", "£5.60", "£10.00"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el total final?", "p_de": "Wie hoch ist der Endbetrag?", "s": {"type": "multiple_choice", "options": ["£29.81", "£27.10", "£30.10"], "answer": 0}}'::jsonb,
        '{"p": "¿Está incluido el impuesto?", "p_de": "Ist die Steuer enthalten?", "s": {"type": "multiple_choice", "options": ["Yes, tax is included", "No, tax is extra", "Only tax is on drinks"], "answer": 0}}'::jsonb,
        '{"p": "¿Está incluido el servicio en los precios del menú?", "p_de": "Ist der Service in den Menüpreisen enthalten?", "s": {"type": "multiple_choice", "options": ["No, it is not included", "Yes, it is included", "Only at lunch"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A restaurant bill", "A bus timetable", "A shopping coupon"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2460 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2460 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2460, 'en', 'reading', 'Restauración', $reading$
TABLE 12 BILL
2 soups ................................ £9.00
1 chicken with rice .................... £12.50
2 lemonades ............................ £5.60
Subtotal ............................... £27.10
Service 10% ............................ £2.71
Total .................................. £29.81

Tax is included. Service is not included in menu prices.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer una cuenta y entender el servicio');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine Rechnung lesen und den Service verstehen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
