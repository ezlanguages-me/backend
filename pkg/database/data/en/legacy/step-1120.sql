-- ============================================================
-- Seed: A0 English Path – STEP 1120 – Reading – go to a department store to buy what is required (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Las mochilas escolares y los cuadernos están en la planta 1.", "de": "Schulranzen und Hefte sind im 1. Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los impermeables, las chaquetas y los paraguas están en la planta 2.", "de": "Regenmäntel, Jacken und Regenschirme sind im 2. Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las toallas están en la planta baja.", "de": "Handtücher sind im Erdgeschoss.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los probadores están junto a las chaquetas.", "de": "Die Umkleidekabinen sind neben den Jacken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El ascensor está al lado de la entrada principal.", "de": "Der Aufzug ist neben dem Haupteingang.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hoy hay una oferta de vuelta al colegio.", "de": "Heute gibt es ein Angebot zum Schulanfang.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los cuadernos azules cuestan doce libras.", "de": "Die blauen Hefte kosten zwölf Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La tienda cierra a las 8 PM.", "de": "Das Geschäft schließt um 20 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿En qué planta están las chaquetas?", "de": "In welchem Stock sind die Jacken?", "s_es": {"type": "multiple_choice", "options": ["Floor 2", "Floor 1", "Floor 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2. Stock", "1. Stock", "3. Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están las toallas?", "de": "Wo sind die Handtücher?", "s_es": {"type": "multiple_choice", "options": ["Floor 3", "Ground floor", "Floor 2"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3. Stock", "Erdgeschoss", "2. Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están los probadores?", "de": "Wo sind die Umkleidekabinen?", "s_es": {"type": "multiple_choice", "options": ["By the notebooks", "Next to the jackets", "Behind the customer desk"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Bei den Heften", "Neben den Jacken", "Hinter dem Kundenschalter"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué precio tienen los cuadernos azules?", "de": "Wie viel kosten die blauen Hefte?", "s_es": {"type": "multiple_choice", "options": ["£12", "£20", "£2"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["12 £", "20 £", "2 £"], "answer": 2}}'::jsonb,
        '{"es": "¿Qué precio tiene una mochila pequeña?", "de": "Wie viel kostet ein kleiner Schulranzen?", "s_es": {"type": "multiple_choice", "options": ["£2", "£12", "£8"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["2 £", "12 £", "8 £"], "answer": 1}}'::jsonb,
        '{"es": "¿Dónde pide ayuda el cliente?", "de": "Wo fragt der Kunde nach Hilfe?", "s_es": {"type": "multiple_choice", "options": ["At the lift on Floor 3", "At the customer desk on the ground floor", "At the fitting room on Floor 2"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Am Aufzug im 3. Stock", "Am Kundenschalter im Erdgeschoss", "An der Umkleide im 2. Stock"], "answer": 1}}'::jsonb,
        '{"es": "¿Dónde paga la ropa el cliente?", "de": "Wo bezahlt der Kunde Kleidung?", "s_es": {"type": "multiple_choice", "options": ["Only at the exit", "At the customer desk", "At the cashier on each floor"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Nur am Ausgang", "Am Kundenschalter", "An der Kasse auf jeder Etage"], "answer": 2}}'::jsonb,
        '{"es": "¿Hasta qué hora abre la tienda?", "de": "Bis wann ist das Geschäft geöffnet?", "s_es": {"type": "multiple_choice", "options": ["8 PM", "6 PM", "9 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 Uhr", "18 Uhr", "21 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1120 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1120 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1120, 'en', 'reading', 'shopping', 'Welcome to Harton Department Store.\n\nFloor 1: School bags and notebooks. This floor has everything for school. You can also find coloured pens here.\n\nFloor 2: Raincoats, jackets, and umbrellas. The fitting rooms are next to the jackets on Floor 2. Please take only two items into the fitting room at one time.\n\nFloor 3: Towels and bed sheets. Please note that towels are on Floor 3, not on the ground floor.\n\nThe lift is in the middle of the store. It is not next to the main entrance. The escalator starts near the main entrance.\n\nGround floor: Customer service desk. Ask here if you need help or have a question.\n\nToday there is a back-to-school sale. Blue notebooks are £2 each. Small school bags are £12 each.\n\nPay for clothes and bags at the cashier on each floor. You do not need to go to a different floor to pay.\n\nThe store closes at 8 PM today. Thank you for shopping with us.')RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES
        (v_reading_id, 'es', 'Grandes almacenes para comprar'), (v_reading_id, 'de', 'Kaufhausplan, um das Nötige');

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
