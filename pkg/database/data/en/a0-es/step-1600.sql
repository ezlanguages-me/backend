-- ============================================================
-- Seed: A0 English Path – STEP 1600 – Reading – understand most routine bank literature and written communications
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El extracto mensual tiene cinco columnas principales.", "p_de": "Der Monatsauszug hat fünf Hauptspalten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una de las columnas se llama Balance.", "p_de": "Eine der Spalten heißt Balance.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Opening balance es el dinero al final del mes.", "p_de": "Opening balance ist das Geld am Ende des Monats.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Money In muestra ingresos como salario o efectivo.", "p_de": "Money In zeigt Eingänge wie Gehalt oder Bargeld.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Money Out muestra pagos con tarjeta, transferencias y retiradas.", "p_de": "Money Out zeigt Kartenzahlungen, Überweisungen und Abhebungen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Closing balance es el total al final del mes.", "p_de": "Closing balance ist die Summe am Monatsende.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las comisiones aparecen en la columna Description.", "p_de": "Gebühren erscheinen in der Spalte Description.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que nunca puedes contactar con la sucursal.", "p_de": "Der Text sagt, dass man die Filiale nie kontaktieren kann.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué columna muestra la fecha?", "p_de": "Welche Spalte zeigt das Datum?", "s": {"type": "multiple_choice", "options": ["Date", "Money Out", "Balance only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa Opening balance?", "p_de": "Was bedeutet Opening balance?", "s": {"type": "multiple_choice", "options": ["Money in the account at the start of the month", "A parcel at the counter", "The cost of stamps"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué aparece en Money In?", "p_de": "Was erscheint bei Money In?", "s": {"type": "multiple_choice", "options": ["Deposits such as salary or cash", "Only ATM errors", "Only postcodes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué aparece en Money Out?", "p_de": "Was erscheint bei Money Out?", "s": {"type": "multiple_choice", "options": ["Card payments, transfers, and cash withdrawals", "Only letters and parcels", "Only loans for houses"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué es Closing balance?", "p_de": "Was ist Closing balance?", "s": {"type": "multiple_choice", "options": ["The total at the end of the month", "The first deposit", "The name of the branch"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde ves una comisión?", "p_de": "Wo sieht man eine Gebühr?", "s": {"type": "multiple_choice", "options": ["In the Description column", "In the postcode field", "In the tracking number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si tienes una pregunta?", "p_de": "Was macht man bei einer Frage?", "s": {"type": "multiple_choice", "options": ["Contact the branch", "Throw the statement away", "Go to the airport"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto estás leyendo?", "p_de": "Was für einen Text liest du?", "s": {"type": "multiple_choice", "options": ["A routine bank guide", "A restaurant bill", "A sports report"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1600 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1600 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1600, 'en', 'reading', 'banking', 'Monthly Statement Guide

Dear Customer,
Your monthly statement shows five main columns: Date, Description, Money In, Money Out, and Balance.

The opening balance is the money in your account at the start of the month. Money In shows deposits such as salary or cash. Money Out shows card payments, transfers, and cash withdrawals.

The closing balance is the total at the end of the month. If you see a fee, it appears in the Description column. Please contact the branch if you have a question about any entry.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Comunicación bancaria sobre el extracto mensual', 'Lee una comunicación bancaria rutinaria que explica cómo entender un extracto mensual.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Bankmitteilung zum Monatsauszug', 'Lies eine routinemäßige Bankmitteilung, die erklärt, wie man einen Monatsauszug versteht.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
