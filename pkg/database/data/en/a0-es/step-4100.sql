-- ============================================================
-- Seed: A0 English Path – STEP 4100 – Reading – offer some help to a client/customer, for example, 'I''ll give you our new catalogue' (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La nota ofrece ayuda a la señora Chen.", "p_de": "Die Notiz bietet Frau Chen Hilfe an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La nota adjunta el catálogo del año pasado.", "p_de": "Die Notiz legt den Katalog vom letzten Jahr bei.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los nuevos precios entran en vigor el 1 de febrero.", "p_de": "Die neuen Preise treten am 1. Februar in Kraft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona que escribe la nota se llama James.", "p_de": "Die Person, die die Notiz schreibt, heißt James.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se ofrece una demostración gratuita del producto.", "p_de": "Es wird eine kostenlose Produktdemonstration angeboten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El nuevo catálogo ya no incluye la sección de equipos de oficina.", "p_de": "Der neue Katalog enthält den Bereich Bürogeräte nicht mehr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "James pide a la señora Chen que le llame si tiene preguntas.", "p_de": "James bittet Frau Chen, ihn anzurufen, wenn sie Fragen hat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La nota fue escrita en diciembre.", "p_de": "Die Notiz wurde im Dezember geschrieben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A quién va dirigida la nota?", "p_de": "An wen ist die Notiz gerichtet?", "s_es": {"type": "multiple_choice", "options": ["Ms Chen", "Mr Davies", "Rosa Herrera"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Frau Chen", "Herr Davies", "Rosa Herrera"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué catálogo se adjunta?", "p_de": "Welcher Katalog wird beigefügt?", "s_es": {"type": "multiple_choice", "options": ["The new catalogue", "Last year''s catalogue", "An online catalogue link"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der neue Katalog", "Der Katalog vom letzten Jahr", "Ein Online-Katalog-Link"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo entran en vigor los nuevos precios?", "p_de": "Wann treten die neuen Preise in Kraft?", "s_es": {"type": "multiple_choice", "options": ["1 February", "1 January", "1 March"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1. Februar", "1. Januar", "1. März"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se ofrece aparte del catálogo?", "p_de": "Was wird neben dem Katalog angeboten?", "s_es": {"type": "multiple_choice", "options": ["A free product demonstration", "A discount voucher", "A free sample"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine kostenlose Produktdemonstration", "Ein Rabattgutschein", "Eine kostenlose Probe"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué incluye el nuevo catálogo que el anterior no tenía?", "p_de": "Was enthält der neue Katalog, was der alte nicht hatte?", "s_es": {"type": "multiple_choice", "options": ["An expanded office equipment section", "A recipe section", "A map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen erweiterten Bürogerätebereich", "Einen Rezeptbereich", "Eine Karte"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide James que haga la señora Chen si tiene preguntas?", "p_de": "Was bittet James Frau Chen zu tun, wenn sie Fragen hat?", "s_es": {"type": "multiple_choice", "options": ["Call him", "Write a formal letter", "Visit the office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihn anzurufen", "Einen formellen Brief zu schreiben", "Das Büro zu besuchen"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué mes fue escrita la nota?", "p_de": "In welchem Monat wurde die Notiz geschrieben?", "s_es": {"type": "multiple_choice", "options": ["December", "January", "November"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dezember", "Januar", "November"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de documento se trata?", "p_de": "Um welche Art von Dokument handelt es sich?", "s_es": {"type": "multiple_choice", "options": ["An internal note offering help", "A purchase order", "A technical manual"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine interne Notiz mit Hilfsangebot", "Eine Bestellung", "Ein technisches Handbuch"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4100 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4100 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4100, 'en', 'reading', 'professional', $content$Internal Note – December

To: Ms Chen
From: James, Sales Team

Dear Ms Chen,

I will give you our new catalogue, which includes an expanded office equipment section. The new prices come into force on 1 February.

I would also like to offer a free product demonstration at your office. Please call me if you have any questions.

Kind regards,
James$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una nota de oferta de ayuda a un cliente', 'Lee una nota interna donde se ofrece ayuda, un catálogo nuevo y una demostración gratuita.'),
            (v_reading_id, 'de', 'Lies eine Notiz mit Hilfsangebot für einen Kunden', 'Lies eine interne Notiz, die Hilfe, einen neuen Katalog und eine kostenlose Demonstration anbietet.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
