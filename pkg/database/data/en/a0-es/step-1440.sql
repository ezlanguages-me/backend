-- ============================================================
-- Seed: A0 English Path – STEP 1440 – Reading – ask questions related to different types of post office services and understand answers (Servicios Financieros y Postales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El mostrador 1 vende sellos y sobres.", "p_de": "Schalter 1 verkauft Briefmarken und Umschläge.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mostrador 2 es para preguntas sobre seguimiento.", "p_de": "Schalter 2 ist für Fragen zur Sendungsverfolgung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mostrador 3 es para préstamos bancarios.", "p_de": "Schalter 3 ist für Bankkredite.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El correo certificado sirve como prueba de envío.", "p_de": "Einschreiben dient als Versandnachweis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El correo exprés es para entregas rápidas dentro de la ciudad.", "p_de": "Expresspost ist für schnelle Zustellung innerhalb der Stadt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puedes alquilar un apartado postal en el mostrador 1.", "p_de": "Ein Postfach kann man an Schalter 1 mieten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Para registrar un apartado postal hay que llevar identificación.", "p_de": "Für die Registrierung eines Postfachs braucht man einen Ausweis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El seguimiento solo está disponible por teléfono.", "p_de": "Sendungsverfolgung ist nur telefonisch verfügbar.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué vende el mostrador 1?", "p_de": "Was verkauft Schalter 1?", "s": {"type": "multiple_choice", "options": ["Stamps, envelopes, and postcards", "Only coffee", "Only passports"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve el mostrador 2?", "p_de": "Wofür ist Schalter 2?", "s": {"type": "multiple_choice", "options": ["Parcel drop-off, collection, and tracking questions", "Bank loans", "Cinema tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué eliges si quieres prueba de envío?", "p_de": "Was wählt man für einen Versandnachweis?", "s": {"type": "multiple_choice", "options": ["Registered mail", "A postcard", "A postbox"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué eliges para entrega rápida en la ciudad?", "p_de": "Was wählt man für eine schnelle Zustellung in der Stadt?", "s": {"type": "multiple_choice", "options": ["Express mail", "A debit card", "A savings account"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde alquilas un apartado postal?", "p_de": "Wo mietet man ein Postfach?", "s": {"type": "multiple_choice", "options": ["At the customer service desk", "At Counter 3", "At the ATM"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes llevar para registrar el apartado?", "p_de": "Was muss man für die Registrierung mitbringen?", "s": {"type": "multiple_choice", "options": ["Your ID", "A school book", "A parcel box"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo puedes hacer seguimiento?", "p_de": "Wie kann man Sendungen verfolgen?", "s": {"type": "multiple_choice", "options": ["Online or at Counter 2 with the receipt number", "Only at home without a number", "Only on Sunday"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A post office service guide", "A restaurant menu", "A train delay notice"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1440 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1440 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1440, 'en', 'reading', 'postal', 'Hill Post Office Service Guide

Counter 1 sells stamps, envelopes, and postcards. Counter 2 is for parcel drop-off, parcel collection, and tracking questions. Counter 3 is for express mail and registered mail.

If you need proof that a letter was sent, choose registered mail. If you need very fast delivery inside the city, choose express mail.

You can rent a post box at the customer service desk. Bring your ID for registration. Parcel tracking is available online or at Counter 2 with your receipt number.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Servicios de correos y dónde pedirlos', 'Lee una guía sencilla para saber qué servicio postal pedir y en qué mostrador.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Postdienste und wo man sie bekommt', 'Lies einen einfachen Leitfaden, um den richtigen Postdienst und Schalter zu finden.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
