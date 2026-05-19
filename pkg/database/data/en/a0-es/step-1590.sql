-- ============================================================
-- Seed: A0 English Path – STEP 1590 – Reading – distinguish between personal and promotional mail from banks
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La carta A es correo personal sobre la cuenta del cliente.", "p_de": "Brief A ist persönliche Post über das Konto des Kunden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La carta A habla de un saldo de 1.240 euros.", "p_de": "Brief A spricht von einem Kontostand von 1.240 Euro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La carta B invita a solicitar una tarjeta de crédito.", "p_de": "Brief B lädt dazu ein, eine Kreditkarte zu beantragen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La carta B es un extracto mensual personal.", "p_de": "Brief B ist ein persönlicher Monatsauszug.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La carta A ofrece ir a la sucursal para una copia en papel.", "p_de": "Brief A bietet an, für eine Papierkopie in die Filiale zu gehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La carta B menciona puntos de viaje para nuevos clientes.", "p_de": "Brief B erwähnt Reisepunkte für neue Kunden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las dos cartas son promocionales.", "p_de": "Beide Briefe sind Werbung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La carta A empieza con Dear Ms Torres.", "p_de": "Brief A beginnt mit Dear Ms Torres.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuál es la carta personal?", "p_de": "Welcher Brief ist der persönliche?", "s": {"type": "multiple_choice", "options": ["Letter A", "Letter B", "Both letters"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué contiene la carta A?", "p_de": "Was enthält Brief A?", "s": {"type": "multiple_choice", "options": ["An account statement notice", "A holiday coupon", "A parcel ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué producto promociona la carta B?", "p_de": "Welches Produkt bewirbt Brief B?", "s": {"type": "multiple_choice", "options": ["A Gold Credit Card", "A savings stamp", "A train pass"], "answer": 0}}'::jsonb,
        '{"p": "¿Para quién son los puntos de viaje?", "p_de": "Für wen sind die Reisepunkte?", "s": {"type": "multiple_choice", "options": ["For new customers", "For teachers only", "For post office staff"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes hacer si quieres copia en papel del extracto?", "p_de": "Was kann man tun, wenn man eine Papierkopie des Auszugs möchte?", "s": {"type": "multiple_choice", "options": ["Visit the branch", "Go to Counter 5", "Open a parcel"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo llama la carta B a la persona que la recibe?", "p_de": "Wie nennt Brief B die empfangende Person?", "s": {"type": "multiple_choice", "options": ["Dear Customer", "Dear Ms Torres", "Dear Postman"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es correo promocional?", "p_de": "Welcher Brief ist Werbung?", "s": {"type": "multiple_choice", "options": ["Letter B", "Letter A", "Neither letter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué habilidad practicas?", "p_de": "Welche Fähigkeit übt man?", "s": {"type": "multiple_choice", "options": ["Distinguishing personal mail from promotional mail", "Reading bus maps", "Buying train tickets"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1590 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1590 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1590, 'en', 'reading', 'financial', 'LETTER A - PERSONAL MAIL

Dear Ms Torres,
Your monthly account statement is ready. Your balance on 31 May is 1,240 euros. Please log in to online banking to read the full statement. If you need a paper copy, visit your branch.

LETTER B - PROMOTIONAL MAIL

Dear Customer,
Apply now for our Gold Credit Card. It has a special welcome offer and travel points for new customers. Visit our website or call the sales team for more information.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Correo personal y correo promocional del banco', 'Lee dos cartas distintas para separar un mensaje personal del banco de una oferta comercial.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Persönliche und werbliche Bankpost', 'Lies zwei unterschiedliche Briefe, um persönliche Bankpost von Werbung zu unterscheiden.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
