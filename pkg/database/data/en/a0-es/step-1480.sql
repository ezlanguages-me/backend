-- ============================================================
-- Seed: A0 English Path – STEP 1480 – Reading – understand routine explanations such as when statements will be issued, notice of withdrawal required (Servicios Financieros y Postales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El extracto mensual se emite el primer día laborable de cada mes.", "p_de": "Der monatliche Kontoauszug wird am ersten Werktag jedes Monats erstellt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El extracto se envía por correo electrónico.", "p_de": "Der Auszug wird per E-Mail geschickt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La copia en papel es gratuita.", "p_de": "Die Papierkopie ist kostenlos.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una retirada de más de 500 euros en la cuenta de ahorro necesita aviso previo.", "p_de": "Eine Auszahlung von mehr als 500 Euro vom Sparkonto braucht Vorankündigung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El banco necesita dos días laborables de aviso.", "p_de": "Die Bank braucht zwei Werktage Vorlauf.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La solicitud puede hacerse por teléfono o con un formulario.", "p_de": "Die Anfrage kann telefonisch oder mit einem Formular gemacht werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta llevar identificación para recoger el dinero.", "p_de": "Man braucht keinen Ausweis, um das Geld abzuholen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La carta es de una oficina de correos.", "p_de": "Der Brief ist von einer Postfiliale.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuándo se emite el extracto mensual?", "p_de": "Wann wird der monatliche Kontoauszug erstellt?", "s": {"type": "multiple_choice", "options": ["On the first business day of every month", "Every Sunday night", "Only in December"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se envía normalmente?", "p_de": "Wie wird er normalerweise geschickt?", "s": {"type": "multiple_choice", "options": ["By email", "By taxi", "By postcard"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la copia en papel?", "p_de": "Wie viel kostet die Papierkopie?", "s": {"type": "multiple_choice", "options": ["2 euros", "10 euros", "Nothing"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué tipo de retirada hace falta aviso?", "p_de": "Für welche Auszahlung braucht man eine Vorankündigung?", "s": {"type": "multiple_choice", "options": ["Savings withdrawals above 500 euros", "Any withdrawal of 5 euros", "Post office stamp purchases"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto aviso necesita el banco?", "p_de": "Wie viel Vorlauf braucht die Bank?", "s": {"type": "multiple_choice", "options": ["Two working days", "Two months", "One hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo puedes hacer la solicitud?", "p_de": "Wie kann man die Anfrage machen?", "s": {"type": "multiple_choice", "options": ["By phone or with a form", "Only by text message", "Only by letter abroad"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes llevar al recoger el dinero?", "p_de": "Was muss man bei der Abholung mitbringen?", "s": {"type": "multiple_choice", "options": ["Your ID", "A parcel", "A school bag"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto lees?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A bank letter", "A weather forecast", "A museum ticket"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1480 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1480 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1480, 'en', 'reading', 'banking', 'Dear Customer,

Your monthly account statement is issued on the first business day of every month and sent by email. If you prefer a paper statement, please visit the branch. The paper copy costs 2 euros.

For withdrawals from your savings account above 500 euros, we need two working days notice. Please call the branch or complete the request form at the counter.

Bring your ID when you collect the money. Thank you for banking with us.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Carta del banco sobre extractos y avisos de retirada', 'Lee una carta del banco con explicaciones rutinarias sobre extractos y retiradas.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Bankbrief über Kontoauszüge und Auszahlungsfrist', 'Lies einen Bankbrief mit routinemäßigen Erklärungen zu Auszügen und Auszahlungen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
