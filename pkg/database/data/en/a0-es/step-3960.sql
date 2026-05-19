-- ============================================================
-- Seed: A0 English Path – STEP 3960 – Dialogue – handle a work complaint (Servicios Laborales (Petición y Prestación))
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
        '{"character": "Client", "text": "I am calling because part of the order arrived damaged.", "es": "Llamo porque parte del pedido llegó dañada.", "de": "Ich rufe an, weil ein Teil der Bestellung beschädigt angekommen ist."}'::jsonb,
    '{"character": "Agent", "text": "I am very sorry about that.", "es": "Lo siento mucho.", "de": "Das tut mir sehr leid."}'::jsonb,
    '{"character": "Client", "text": "Three boxes are broken, and some folders are missing.", "es": "Tres cajas están rotas y faltan algunas carpetas.", "de": "Drei Kartons sind kaputt, und einige Ordner fehlen."}'::jsonb,
    '{"character": "Agent", "text": "Thank you for telling me. We can send replacements tomorrow morning.", "es": "Gracias por decírmelo. Podemos enviar reposición mañana por la mañana.", "de": "Danke für die Information. Wir können morgen früh Ersatz schicken."}'::jsonb,
    '{"character": "Client", "text": "That helps. What should I do with the damaged boxes?", "es": "Eso ayuda. ¿Qué hago con las cajas dañadas?", "de": "Das hilft. Was soll ich mit den beschädigten Kartons machen?"}'::jsonb,
    '{"character": "Agent", "text": "Please keep them. Our driver will collect them tomorrow.", "es": "Por favor, guárdelas. Nuestro conductor las recogerá mañana.", "de": "Bitte behalten Sie sie. Unser Fahrer holt sie morgen ab."}'::jsonb,
    '{"character": "Client", "text": "Okay. Can you also send a new invoice later?", "es": "Bien. ¿Puede enviar también una factura nueva más tarde?", "de": "Okay. Können Sie später auch eine neue Rechnung schicken?"}'::jsonb,
    '{"character": "Agent", "text": "Yes, I will send the corrected invoice after the replacement delivery.", "es": "Sí, enviaré la factura corregida después de la entrega de reposición.", "de": "Ja, ich schicke die korrigierte Rechnung nach der Ersatzlieferung."}'::jsonb,
    '{"character": "Client", "text": "Thank you for the quick solution.", "es": "Gracias por la solución rápida.", "de": "Danke für die schnelle Lösung."}'::jsonb,
    '{"character": "Agent", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La queja es por un pedido dañado.", "p_de": "Die Beschwerde betrifft eine beschädigte Bestellung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El agent dice que no puede hacer nada hoy.", "p_de": "Der Mitarbeiter sagt, dass er heute nichts tun kann.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "Se enviará reposición mañana por la mañana.", "p_de": "Ersatz wird morgen früh geschickt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El cliente debe tirar las cajas dañadas.", "p_de": "Der Kunde soll die beschädigten Kartons wegwerfen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "Habrá una factura corregida después de la nueva entrega.", "p_de": "Es gibt eine korrigierte Rechnung nach der Ersatzlieferung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Qué parte del pedido tiene problema?", "p_de": "Welcher Teil der Bestellung hat ein Problem?", "s_es": {"type": "multiple_choice", "options": ["Three boxes and some folders", "Only the invoice", "The hotel room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Kartons und einige Ordner", "Nur die Rechnung", "Das Hotelzimmer"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo llega la reposición?", "p_de": "Wann kommt der Ersatz?", "s_es": {"type": "multiple_choice", "options": ["Tomorrow morning", "Next month", "This evening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morgen früh", "Nächsten Monat", "Heute Abend"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué hará el conductor?", "p_de": "Was wird der Fahrer tun?", "s_es": {"type": "multiple_choice", "options": ["Collect the damaged boxes", "Paint the office", "Bring lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die beschädigten Kartons abholen", "Das Büro streichen", "Das Mittagessen bringen"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué más pide el cliente?", "p_de": "Was bittet der Kunde zusätzlich?", "s_es": {"type": "multiple_choice", "options": ["A new invoice", "A free concert ticket", "A new phone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine neue Rechnung", "Ein kostenloses Konzertticket", "Ein neues Telefon"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo se enviará la corrected invoice?", "p_de": "Wann wird die korrigierte Rechnung geschickt?", "s_es": {"type": "multiple_choice", "options": ["After the replacement delivery", "Before the complaint", "At the airport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach der Ersatzlieferung", "Vor der Beschwerde", "Am Flughafen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3960 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 3960 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3960, 'en', 'dialogue', 'professional', '[{"name": "Client", "gender": "female", "avatarURL": "https://example.com/avatars/client.png"}, {"name": "Agent", "gender": "male", "avatarURL": "https://example.com/avatars/agent.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Gestiona una queja de trabajo', 'Practica una respuesta profesional a una queja con disculpa, solución y plazo.'),
        (v_dialogue_id, 'de', 'Bearbeite eine Arbeitsbeschwerde', 'Übe eine professionelle Antwort auf eine Beschwerde mit Entschuldigung, Lösung und Frist.');
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
