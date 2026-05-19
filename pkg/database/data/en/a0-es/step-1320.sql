-- ============================================================
-- Seed: A0 English Path – STEP 1320 – Reading – ask for simple post office services (Servicios Financieros y Postales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La oficina de correos abre también los sábados por la mañana.", "p_de": "Die Post ist auch am Samstagvormittag geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En el mostrador principal puedes comprar sobres y postales.", "p_de": "Am Hauptschalter kann man Umschläge und Postkarten kaufen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mostrador 1 es para paquetes internacionales.", "p_de": "Schalter 1 ist für internationale Pakete.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Para un paquete internacional hay que completar un formulario de aduanas.", "p_de": "Für ein internationales Paket muss man ein Zollformular ausfüllen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El empleado pesa el paquete antes de dar el precio.", "p_de": "Der Mitarbeiter wiegt das Paket, bevor er den Preis nennt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El recibo puede tener el número de seguimiento.", "p_de": "Auf dem Beleg kann die Sendungsnummer stehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La última recogida de paquetes es a las 4 PM.", "p_de": "Die letzte Paketabholung ist um 16 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La oficina abre todos los domingos.", "p_de": "Die Post ist jeden Sonntag geöffnet.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué puedes comprar en el mostrador principal?", "p_de": "Was kann man am Hauptschalter kaufen?", "s": {"type": "multiple_choice", "options": ["Stamps, envelopes, postcards, and small boxes", "Shoes and newspapers", "Only passports"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué es el mostrador 1?", "p_de": "Wofür ist Schalter 1?", "s": {"type": "multiple_choice", "options": ["Letters inside the country", "International parcels only", "Bank transfers"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué es el mostrador 2?", "p_de": "Wofür ist Schalter 2?", "s": {"type": "multiple_choice", "options": ["Parcels, registered mail, and international post", "Coffee and snacks", "Bus tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes escribir claramente?", "p_de": "Was muss man deutlich schreiben?", "s": {"type": "multiple_choice", "options": ["The full address", "The weather", "The opening hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué formulario completas para un paquete internacional?", "p_de": "Welches Formular füllt man für ein internationales Paket aus?", "s": {"type": "multiple_choice", "options": ["A customs form", "A hotel form", "A school form"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el empleado con el paquete?", "p_de": "Was macht der Mitarbeiter mit dem Paket?", "s": {"type": "multiple_choice", "options": ["He weighs it", "He opens it", "He throws it away"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué guardas el recibo?", "p_de": "Warum bewahrt man den Beleg auf?", "s": {"type": "multiple_choice", "options": ["For the tracking number", "For a cinema discount", "For a bus pass"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es la última recogida de paquetes entre semana?", "p_de": "Wann ist die letzte Paketabholung unter der Woche?", "s": {"type": "multiple_choice", "options": ["At 5 PM", "At 1 PM", "At 7 PM"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1320 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1320 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1320, 'en', 'reading', 'postal', 'River Post Office is open from Monday to Friday, from 9 AM to 5 PM, and on Saturday from 9 AM to 1 PM.

At the front counter you can buy stamps, envelopes, postcards, and small boxes. Counter 1 is for letters inside the country. Counter 2 is for parcels, registered mail, and international post.

If you send an international parcel, write the full address clearly and complete a customs form. The clerk weighs the parcel, tells you the price, and prints a receipt.

Keep the receipt if you need the tracking number. The last parcel collection is at 5 PM on weekdays.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Servicios básicos de la oficina de correos', 'Lee un aviso sencillo de una oficina de correos con mostradores, horarios y pasos para enviar un paquete.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Einfache Postdienste', 'Lies einen einfachen Hinweis einer Postfiliale mit Schaltern, Öffnungszeiten und Schritten zum Versenden eines Pakets.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
