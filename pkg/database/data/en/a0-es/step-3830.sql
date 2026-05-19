-- ============================================================
-- Seed: A0 English Path – STEP 3830 – Dialogue – discuss work requirements (Servicios Laborales (Petición y Prestación))
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
        '{"character": "Client", "text": "We need 200 brochures for Friday.", "es": "Necesitamos 200 folletos para el viernes.", "de": "Wir brauchen 200 Broschüren für Freitag."}'::jsonb,
    '{"character": "Coordinator", "text": "No problem. Do you want the blue cover again?", "es": "No hay problema. ¿Quiere de nuevo la portada azul?", "de": "Kein Problem. Möchten Sie wieder das blaue Cover?"}'::jsonb,
    '{"character": "Client", "text": "Yes, please, and the logo on the front page.", "es": "Sí, por favor, y el logo en la portada.", "de": "Ja, bitte, und das Logo auf der Vorderseite."}'::jsonb,
    '{"character": "Coordinator", "text": "Okay. Can you send the final PDF today?", "es": "Bien. ¿Puede enviar hoy el PDF final?", "de": "Okay. Können Sie heute die endgültige PDF senden?"}'::jsonb,
    '{"character": "Client", "text": "Yes, I will send it before 4 PM.", "es": "Sí, lo enviaré antes de las 4 PM.", "de": "Ja, ich schicke sie vor 16 Uhr."}'::jsonb,
    '{"character": "Coordinator", "text": "Great. Where do you want the delivery?", "es": "Perfecto. ¿Dónde quiere la entrega?", "de": "Super. Wohin soll die Lieferung gehen?"}'::jsonb,
    '{"character": "Client", "text": "Please deliver it to reception at Green Tower.", "es": "Por favor, entréguelo en recepción de Green Tower.", "de": "Bitte liefern Sie sie an den Empfang von Green Tower."}'::jsonb,
    '{"character": "Coordinator", "text": "Understood. We will also send the invoice by email.", "es": "Entendido. También enviaremos la factura por email.", "de": "Verstanden. Wir schicken die Rechnung auch per E-Mail."}'::jsonb,
    '{"character": "Client", "text": "Perfect. Thank you for the quick help.", "es": "Perfecto. Gracias por la ayuda rápida.", "de": "Perfekt. Danke für die schnelle Hilfe."}'::jsonb,
    '{"character": "Coordinator", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente necesita 200 brochures para el viernes.", "p_de": "Der Kunde braucht 200 Broschüren für Freitag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La portada debe ser roja.", "p_de": "Das Cover soll rot sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El cliente enviará el PDF final hoy.", "p_de": "Der Kunde schickt heute die endgültige PDF.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La entrega va a Green Tower reception.", "p_de": "Die Lieferung geht an den Empfang von Green Tower.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La factura se enviará por correo postal.", "p_de": "Die Rechnung wird per Post geschickt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Cuántos brochures pide el cliente?", "p_de": "Wie viele Broschüren bestellt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["200", "20", "500"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["200", "20", "500"], "answer": 0}}'::jsonb,
    '{"p": "¿De qué color es la portada?", "p_de": "Welche Farbe hat das Cover?", "s_es": {"type": "multiple_choice", "options": ["Blue", "Red", "Black"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blau", "Rot", "Schwarz"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué debe enviar el cliente hoy?", "p_de": "Was muss der Kunde heute schicken?", "s_es": {"type": "multiple_choice", "options": ["The final PDF", "The chairs", "The payment card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die endgültige PDF", "Die Stühle", "Die Zahlungskarte"], "answer": 0}}'::jsonb,
    '{"p": "¿Antes de qué hora enviará el PDF?", "p_de": "Vor welcher Uhrzeit schickt er die PDF?", "s_es": {"type": "multiple_choice", "options": ["4 PM", "2 PM", "6 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["16 Uhr", "14 Uhr", "18 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Cómo llega la factura?", "p_de": "Wie kommt die Rechnung?", "s_es": {"type": "multiple_choice", "options": ["By email", "By taxi", "By hand"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per E-Mail", "Per Taxi", "Von Hand"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3830 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 3830 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3830, 'en', 'dialogue', 'professional', '[{"name": "Client", "gender": "female", "avatarURL": "https://example.com/avatars/client.png"}, {"name": "Coordinator", "gender": "male", "avatarURL": "https://example.com/avatars/coordinator.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre requisitos de trabajo', 'Practica una conversación sencilla para acordar cantidad, color, fecha y entrega de un trabajo.'),
        (v_dialogue_id, 'de', 'Sprich über Arbeitsanforderungen', 'Übe ein einfaches Gespräch, um Menge, Farbe, Termin und Lieferung eines Auftrags zu vereinbaren.');
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
