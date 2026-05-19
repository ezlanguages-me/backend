-- ============================================================
-- Seed: A0 English Path – STEP 4020 – Reading – handle a wide range of situations – understand company brochure (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La empresa ofrece servicios de limpieza, mantenimiento y seguridad.", "p_de": "Das Unternehmen bietet Reinigungs-, Wartungs- und Sicherheitsdienste an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El horario de atención al cliente es de 8 AM a 8 PM de lunes a viernes.", "p_de": "Die Kundenbetreuungszeiten sind Montag bis Freitag von 8 bis 20 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empresa lleva 5 años en el mercado.", "p_de": "Das Unternehmen ist seit 5 Jahren auf dem Markt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se ofrecen descuentos por contrato anual.", "p_de": "Es gibt Rabatte bei Jahresvertrag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El servicio de emergencia está disponible las 24 horas.", "p_de": "Der Notfalldienst ist rund um die Uhr verfügbar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Solo trabajan con empresas grandes.", "p_de": "Sie arbeiten nur mit großen Unternehmen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se puede solicitar presupuesto gratuito por teléfono o en línea.", "p_de": "Man kann ein kostenloses Angebot per Telefon oder online anfragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empresa tiene certificación de calidad ISO.", "p_de": "Das Unternehmen hat eine ISO-Qualitätszertifizierung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué tres servicios ofrece la empresa?", "p_de": "Welche drei Dienste bietet das Unternehmen an?", "s_es": {"type": "multiple_choice", "options": ["Cleaning, maintenance and security", "Catering, transport and IT", "Design, printing and delivery"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Reinigung, Wartung und Sicherheit", "Verpflegung, Transport und IT", "Design, Druck und Lieferung"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos años lleva la empresa en el mercado?", "p_de": "Wie viele Jahre ist das Unternehmen schon auf dem Markt?", "s_es": {"type": "multiple_choice", "options": ["20 years", "5 years", "10 years"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 Jahre", "5 Jahre", "10 Jahre"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el horario de atención al cliente?", "p_de": "Wie sind die Kundenbetreuungszeiten?", "s_es": {"type": "multiple_choice", "options": ["8 AM to 8 PM Monday to Friday", "9 AM to 5 PM weekdays only", "24 hours, 7 days a week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8 bis 20 Uhr Montag bis Freitag", "9 bis 17 Uhr nur werktags", "24 Stunden, 7 Tage die Woche"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué descuento se ofrece?", "p_de": "Welcher Rabatt wird angeboten?", "s_es": {"type": "multiple_choice", "options": ["Discount for annual contract", "Discount for paying in cash", "No discounts available"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rabatt bei Jahresvertrag", "Rabatt bei Barzahlung", "Keine Rabatte verfügbar"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo está disponible el servicio de emergencia?", "p_de": "Wann ist der Notfalldienst verfügbar?", "s_es": {"type": "multiple_choice", "options": ["24 hours a day", "Only on weekdays", "Only in the morning"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["24 Stunden am Tag", "Nur werktags", "Nur am Morgen"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué tipo de empresas trabajan?", "p_de": "Mit welchen Unternehmen arbeiten sie?", "s_es": {"type": "multiple_choice", "options": ["All sizes", "Only large ones", "Only startups"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alle Größen", "Nur große", "Nur Startups"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se pide un presupuesto?", "p_de": "Wie fordert man ein Angebot an?", "s_es": {"type": "multiple_choice", "options": ["By phone or online", "Only in person", "Only by post"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per Telefon oder online", "Nur persönlich", "Nur per Post"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué certificación tiene la empresa?", "p_de": "Welche Zertifizierung hat das Unternehmen?", "s_es": {"type": "multiple_choice", "options": ["ISO quality certification", "National safety award only", "No certification"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["ISO-Qualitätszertifizierung", "Nur nationaler Sicherheitspreis", "Keine Zertifizierung"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4020 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4020 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4020, 'en', 'reading', 'professional', $content$ProServ Solutions – Company Brochure. We are a professional services company with 20 years of experience in cleaning, maintenance and security.

We serve businesses of all sizes. Our customer support line is open Monday to Friday, 8 AM to 8 PM. Emergency services are available 24 hours a day.

Annual contracts receive a 10% discount. Request a free quote by phone or online. We hold ISO 9001 quality certification.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un folleto de empresa', 'Lee un folleto con servicios, horarios, descuentos y certificaciones de una empresa de servicios.'),
            (v_reading_id, 'de', 'Lies eine Unternehmensbroschüre', 'Lies eine Broschüre mit Dienstleistungen, Zeiten, Rabatten und Zertifizierungen eines Serviceunternehmens.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
