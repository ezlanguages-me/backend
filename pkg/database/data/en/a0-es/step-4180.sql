-- ============================================================
-- Seed: A0 English Path – STEP 4180 – Reading – read a client request letter (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La carta es de una empresa llamada Blue Ridge Partners.", "p_de": "Der Brief ist von einem Unternehmen namens Blue Ridge Partners.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente solicita servicio de limpieza tres veces a la semana.", "p_de": "Der Kunde bittet um einen dreimal wöchentlichen Reinigungsservice.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El servicio debe comenzar el 1 de marzo.", "p_de": "Der Dienst soll am 1. März beginnen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El local tiene 300 metros cuadrados.", "p_de": "Die Räumlichkeiten haben 300 Quadratmeter.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente pide que el servicio sea fuera del horario laboral.", "p_de": "Der Kunde bittet darum, dass der Dienst außerhalb der Arbeitszeiten stattfindet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona de contacto es la señora Reeves.", "p_de": "Die Ansprechperson ist Frau Reeves.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente solicita un contrato de prueba de seis meses.", "p_de": "Der Kunde bittet um einen sechsmonatigen Probevertrag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente adjunta el plano del local con la carta.", "p_de": "Der Kunde legt den Grundriss der Räumlichkeiten bei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cómo se llama la empresa que envía la carta?", "p_de": "Wie heißt das Unternehmen, das den Brief schickt?", "s_es": {"type": "multiple_choice", "options": ["Blue Ridge Partners", "ProServ Solutions", "City Logistics"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blue Ridge Partners", "ProServ Solutions", "City Logistics"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué frecuencia se pide el servicio de limpieza?", "p_de": "Wie oft wird der Reinigungsservice erbeten?", "s_es": {"type": "multiple_choice", "options": ["Five times a week", "Three times a week", "Daily"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfmal pro Woche", "Dreimal pro Woche", "Täglich"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debe comenzar el servicio?", "p_de": "Wann soll der Dienst beginnen?", "s_es": {"type": "multiple_choice", "options": ["1 March", "1 February", "1 April"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1. März", "1. Februar", "1. April"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos metros cuadrados tiene el local?", "p_de": "Wie viele Quadratmeter hat die Räumlichkeit?", "s_es": {"type": "multiple_choice", "options": ["450 square metres", "300 square metres", "200 square metres"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["450 Quadratmeter", "300 Quadratmeter", "200 Quadratmeter"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debe prestarse el servicio?", "p_de": "Wann soll der Dienst erbracht werden?", "s_es": {"type": "multiple_choice", "options": ["Outside working hours", "During lunch break", "On Sundays only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Außerhalb der Arbeitszeiten", "In der Mittagspause", "Nur sonntags"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién es la persona de contacto?", "p_de": "Wer ist die Ansprechperson?", "s_es": {"type": "multiple_choice", "options": ["Ms Reeves", "Ms Clark", "Mr Davies"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Frau Reeves", "Frau Clark", "Herr Davies"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se adjunta a la carta?", "p_de": "Was liegt dem Brief bei?", "s_es": {"type": "multiple_choice", "options": ["A floor plan of the premises", "A signed contract", "An invoice"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Grundriss der Räumlichkeiten", "Ein unterzeichneter Vertrag", "Eine Rechnung"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de documento se trata?", "p_de": "Um welche Art von Dokument handelt es sich?", "s_es": {"type": "multiple_choice", "options": ["A client service request letter", "A product brochure", "A complaint letter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Kundenserviceanfrageschreiben", "Eine Produktbroschüre", "Ein Beschwerdebrief"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4180 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4180 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4180, 'en', 'reading', 'professional', $content$Blue Ridge Partners
14 Marble Lane, London

Dear ProServ Solutions,

We are writing to request a professional cleaning service for our office. We require cleaning five times per week. The service should begin on 1 March.

Our premises cover 450 square metres. We ask that the cleaning takes place outside our working hours, preferably in the early morning.

Please find a floor plan enclosed. Our contact person is Ms Reeves.

Yours sincerely,
Blue Ridge Partners$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una carta de solicitud de servicio de un cliente', 'Lee una carta formal con solicitud de servicio, frecuencia, fecha de inicio y datos del local.'),
            (v_reading_id, 'de', 'Lies ein Kundenanfrageschreiben', 'Lies ein formelles Schreiben mit Serviceanfrage, Häufigkeit, Startdatum und Raumangaben.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
