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
        '{"es": "¿Dónde están los probadores?", "de": "Wo sind die Umkleidekabinen?", "s_es": {"type": "multiple_choice", "options": ["Next to the jackets", "By the notebooks", "Behind the customer desk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neben den Jacken", "Bei den Heften", "Hinter dem Kundenschalter"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué precio tienen los cuadernos azules?", "de": "Wie viel kosten die blauen Hefte?", "s_es": {"type": "multiple_choice", "options": ["£2", "£12", "£20"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2 £", "12 £", "20 £"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué precio tiene una mochila pequeña?", "de": "Wie viel kostet ein kleiner Schulranzen?", "s_es": {"type": "multiple_choice", "options": ["£12", "£2", "£8"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 £", "2 £", "8 £"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde pide ayuda el cliente?", "de": "Wo fragt der Kunde nach Hilfe?", "s_es": {"type": "multiple_choice", "options": ["At the customer desk on the ground floor", "At the lift on Floor 3", "At the fitting room on Floor 2"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Kundenschalter im Erdgeschoss", "Am Aufzug im 3. Stock", "An der Umkleide im 2. Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde paga la ropa el cliente?", "de": "Wo bezahlt der Kunde Kleidung?", "s_es": {"type": "multiple_choice", "options": ["At the cashier on each floor", "Only at the exit", "At the customer desk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An der Kasse auf jeder Etage", "Nur am Ausgang", "Am Kundenschalter"], "answer": 0}}'::jsonb,
        '{"es": "¿Hasta qué hora abre la tienda?", "de": "Bis wann ist das Geschäft geöffnet?", "s_es": {"type": "multiple_choice", "options": ["8 PM", "6 PM", "9 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 Uhr", "18 Uhr", "21 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1120 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1120 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1120, 'en', 'reading', 'shopping', 'Welcome to Harton Department Store. School bags and notebooks are on Floor 1. Raincoats, jackets, and umbrellas are on Floor 2. Towels and bed sheets are on Floor 3.\n\nThe fitting rooms are next to the jackets on Floor 2. The lift is in the middle of the store. The escalator starts near the main entrance.\n\nToday there is a back-to-school sale. Blue notebooks are £2, and small school bags are £12. You pay for clothes and bags at the cashier on each floor.\n\nIf you need help, ask at the customer desk on the ground floor. The store closes at 8 PM.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee un plano de grandes almacenes para comprar lo que necesitas', 'Lee un aviso de unos grandes almacenes con plantas, secciones y servicios.'),
        (v_reading_id, 'de', 'Lies einen Kaufhausplan, um das Nötige zu kaufen', 'Lies einen Aushang eines Kaufhauses mit Etagen, Abteilungen und Servicepunkten.');

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
