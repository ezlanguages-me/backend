-- ============================================================
-- Seed: A0 English Path – STEP 4040 – Dialogue – discuss professional services with a client (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Client", "text": "Good morning. I am interested in your cleaning services.", "es": "Buenos días. Estoy interesado en sus servicios de limpieza.", "de": "Guten Morgen. Ich interessiere mich für Ihre Reinigungsdienstleistungen."}'::jsonb,
    '{"character": "Agent", "text": "Good morning. I can tell you about our different plans.", "es": "Buenos días. Puedo explicarle nuestros distintos planes.", "de": "Guten Morgen. Ich kann Ihnen unsere verschiedenen Pläne erklären."}'::jsonb,
    '{"character": "Client", "text": "We need cleaning five days a week for a medium-sized office.", "es": "Necesitamos limpieza cinco días a la semana para una oficina mediana.", "de": "Wir brauchen fünfmal pro Woche Reinigung für ein mittelgroßes Büro."}'::jsonb,
    '{"character": "Agent", "text": "That sounds like our Standard Plan. It covers daily cleaning from Monday to Friday.", "es": "Eso parece nuestro Plan Estándar. Incluye limpieza diaria de lunes a viernes.", "de": "Das klingt nach unserem Standardplan. Er umfasst tägliche Reinigung von Montag bis Freitag."}'::jsonb,
    '{"character": "Client", "text": "Does it include window cleaning?", "es": "¿Incluye limpieza de ventanas?", "de": "Ist Fensterreinigung enthalten?"}'::jsonb,
    '{"character": "Agent", "text": "Window cleaning is done once a month as part of the plan.", "es": "La limpieza de ventanas se hace una vez al mes como parte del plan.", "de": "Fensterreinigung erfolgt einmal pro Monat als Teil des Plans."}'::jsonb,
    '{"character": "Client", "text": "What is the price per month?", "es": "¿Cuál es el precio mensual?", "de": "Was kostet es pro Monat?"}'::jsonb,
    '{"character": "Agent", "text": "The Standard Plan is £220 per month with a six-month minimum contract.", "es": "El Plan Estándar cuesta £220 al mes con un contrato mínimo de seis meses.", "de": "Der Standardplan kostet £220 pro Monat mit einem Mindestvertrag von sechs Monaten."}'::jsonb,
    '{"character": "Client", "text": "That seems reasonable. Can we arrange a site visit?", "es": "Parece razonable. ¿Podemos organizar una visita al local?", "de": "Das klingt vernünftig. Können wir einen Vorortbesuch vereinbaren?"}'::jsonb,
    '{"character": "Agent", "text": "Of course. I can book a free evaluation visit for next week.", "es": "Por supuesto. Puedo reservar una visita de evaluación gratuita para la próxima semana.", "de": "Natürlich. Ich kann einen kostenlosen Bewertungsbesuch für nächste Woche buchen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente necesita limpieza cinco días a la semana.", "p_de": "Der Kunde braucht fünfmal pro Woche Reinigung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El agente recomienda el Plan Básico.", "p_de": "Der Mitarbeiter empfiehlt den Basisplan.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La limpieza de ventanas se hace una vez al mes.", "p_de": "Fensterreinigung erfolgt einmal pro Monat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El Plan Estándar cuesta £200 al mes.", "p_de": "Der Standardplan kostet £200 pro Monat.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El agente puede reservar una visita de evaluación gratuita.", "p_de": "Der Mitarbeiter kann einen kostenlosen Bewertungsbesuch buchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Qué plan recomienda el agente?", "p_de": "Welchen Plan empfiehlt der Mitarbeiter?", "s_es": {"type": "multiple_choice", "options": ["Standard Plan", "Basic Plan", "Premium Plan"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Standardplan", "Basisplan", "Premium-Plan"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo se limpian las ventanas?", "p_de": "Wann werden die Fenster gereinigt?", "s_es": {"type": "multiple_choice", "options": ["Once a month", "Every day", "Only in summer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einmal pro Monat", "Jeden Tag", "Nur im Sommer"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuánto cuesta el Plan Estándar?", "p_de": "Was kostet der Standardplan?", "s_es": {"type": "multiple_choice", "options": ["£220 per month", "£150 per month", "£300 per month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£220 pro Monat", "£150 pro Monat", "£300 pro Monat"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuánto dura el contrato mínimo?", "p_de": "Wie lange ist der Mindestvertrag?", "s_es": {"type": "multiple_choice", "options": ["Six months", "One month", "One year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs Monate", "Ein Monat", "Ein Jahr"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué organiza el cliente al final?", "p_de": "Was organisiert der Kunde am Ende?", "s_es": {"type": "multiple_choice", "options": ["A site visit", "A contract signing", "A price negotiation"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Vorortbesuch", "Eine Vertragsunterzeichnung", "Eine Preisverhandlung"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4040 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4040 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4040, 'en', 'dialogue', 'professional', '[{"name": "Client", "gender": "male", "avatarURL": "https://example.com/avatars/client.png"}, {"name": "Agent", "gender": "female", "avatarURL": "https://example.com/avatars/agent.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla de servicios profesionales con un cliente', 'Practica una conversación sobre planes de limpieza, precios y visita de evaluación.'),
        (v_dialogue_id, 'de', 'Besprich professionelle Dienste mit einem Kunden', 'Übe ein Gespräch über Reinigungspläne, Preise und Bewertungsbesuch.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
