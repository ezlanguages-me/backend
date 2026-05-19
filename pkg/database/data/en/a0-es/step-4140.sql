-- ============================================================
-- Seed: A0 English Path – STEP 4140 – Reading – understand a product catalogue (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El catálogo incluye aspiradoras industriales.", "p_de": "Der Katalog enthält Industriestaubsauger.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El modelo básico cuesta £195.", "p_de": "Das Basismodell kostet £195.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El modelo Pro tiene mayor capacidad que el modelo básico.", "p_de": "Das Pro-Modell hat eine größere Kapazität als das Basismodell.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Todos los productos incluyen garantía de 2 años.", "p_de": "Alle Produkte haben 2 Jahre Garantie.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los repuestos se piden por correo postal.", "p_de": "Ersatzteile werden per Post bestellt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El modelo Pro incluye filtro HEPA.", "p_de": "Das Pro-Modell enthält einen HEPA-Filter.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se ofrece instalación gratuita con cualquier pedido.", "p_de": "Mit jeder Bestellung wird kostenlose Installation angeboten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El catálogo tiene una sección de preguntas frecuentes al final.", "p_de": "Der Katalog enthält am Ende einen FAQ-Bereich.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué tipo de productos incluye el catálogo?", "p_de": "Welche Art von Produkten enthält der Katalog?", "s_es": {"type": "multiple_choice", "options": ["Industrial cleaning equipment", "Office furniture", "Computer hardware"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Industrielle Reinigungsgeräte", "Büromöbel", "Computerhardware"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el modelo básico?", "p_de": "Was kostet das Basismodell?", "s_es": {"type": "multiple_choice", "options": ["£149", "£195", "£220"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£149", "£195", "£220"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué diferencia al modelo Pro del básico?", "p_de": "Was unterscheidet das Pro-Modell vom Basismodell?", "s_es": {"type": "multiple_choice", "options": ["Larger capacity and HEPA filter", "Lower price", "Smaller size"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Größere Kapazität und HEPA-Filter", "Niedrigerer Preis", "Kleinere Größe"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué garantía tienen todos los productos?", "p_de": "Welche Garantie haben alle Produkte?", "s_es": {"type": "multiple_choice", "options": ["2 years", "1 year", "5 years"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["2 Jahre", "1 Jahr", "5 Jahre"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se piden los repuestos?", "p_de": "Wie bestellt man Ersatzteile?", "s_es": {"type": "multiple_choice", "options": ["Online or by phone", "By post only", "In person only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Online oder per Telefon", "Nur per Post", "Nur persönlich"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué pedidos se ofrece instalación gratuita?", "p_de": "Mit welchen Bestellungen wird kostenlose Installation angeboten?", "s_es": {"type": "multiple_choice", "options": ["Orders over £500", "All orders", "No installation offered"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bestellungen über £500", "Alle Bestellungen", "Keine Installation angeboten"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay al final del catálogo?", "p_de": "Was steht am Ende des Katalogs?", "s_es": {"type": "multiple_choice", "options": ["A FAQ section", "An order form", "A price history"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein FAQ-Bereich", "Ein Bestellformular", "Eine Preisentwicklung"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata este documento?", "p_de": "Worum geht es in diesem Dokument?", "s_es": {"type": "multiple_choice", "options": ["A product catalogue for industrial cleaning equipment", "A company newsletter", "A staff training manual"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Produktkatalog für industrielle Reinigungsgeräte", "Ein Unternehmens-Newsletter", "Ein Mitarbeiterschulungshandbuch"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4140 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4140 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4140, 'en', 'reading', 'professional', $content$CleanPro Equipment Catalogue – Spring Edition

Industrial Vacuum Cleaners:
• Model Basic – £149 – 20L tank – Suitable for small offices
• Model Pro – £299 – 40L tank – HEPA filter included – Suitable for large premises

All products include a 2-year warranty. Replacement parts can be ordered online or by phone.

Free installation is available on orders over £500.

See our FAQ section on the last page for common questions.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un catálogo de productos', 'Lee un catálogo de equipos de limpieza con modelos, precios, garantía y condiciones de pedido.'),
            (v_reading_id, 'de', 'Lies einen Produktkatalog', 'Lies einen Reinigungsgerätekatalog mit Modellen, Preisen, Garantie und Bestellbedingungen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
