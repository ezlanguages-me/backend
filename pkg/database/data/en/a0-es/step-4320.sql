-- ============================================================
-- Seed: A0 English Path – STEP 4320 – Dialogue – practice dictation and clarification (Servicios Laborales)
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
        '{"character": "Manager", "text": "I will dictate a short message. Please type it as I speak.", "es": "Voy a dictar un mensaje corto. Por favor, escríbalo mientras hablo.", "de": "Ich werde eine kurze Nachricht diktieren. Bitte tippen Sie, während ich spreche."}'::jsonb,
    '{"character": "Assistant", "text": "I am ready. Please go ahead.", "es": "Estoy listo. Por favor, adelante.", "de": "Ich bin bereit. Bitte fahren Sie fort."}'::jsonb,
    '{"character": "Manager", "text": "To Mr Brown comma. We are pleased to confirm your order number 8801 full stop.", "es": "Para el señor Brown coma. Nos complace confirmar su pedido número 8801 punto.", "de": "An Herrn Brown Komma. Wir freuen uns, Ihre Bestellnummer 8801 zu bestätigen Punkt."}'::jsonb,
    '{"character": "Assistant", "text": "Sorry, could you repeat the order number? I want to make sure I have it right.", "es": "Perdone, ¿podría repetir el número de pedido? Quiero asegurarme de que lo tengo bien.", "de": "Entschuldigung, könnten Sie die Bestellnummer wiederholen? Ich möchte sicherstellen, dass ich sie richtig habe."}'::jsonb,
    '{"character": "Manager", "text": "Of course. The order number is 8801. Eight, eight, zero, one.", "es": "Por supuesto. El número de pedido es 8801. Ocho, ocho, cero, uno.", "de": "Natürlich. Die Bestellnummer ist 8801. Acht, acht, null, eins."}'::jsonb,
    '{"character": "Assistant", "text": "Thank you. I have that. Please continue.", "es": "Gracias. Ya lo tengo. Por favor, continúe.", "de": "Danke. Das habe ich. Bitte fahren Sie fort."}'::jsonb,
    '{"character": "Manager", "text": "The delivery is scheduled for Thursday the 14th full stop. Please confirm receipt of this message full stop.", "es": "La entrega está programada para el jueves 14 punto. Por favor confirme la recepción de este mensaje punto.", "de": "Die Lieferung ist für Donnerstag den 14. geplant Punkt. Bitte bestätigen Sie den Erhalt dieser Nachricht Punkt."}'::jsonb,
    '{"character": "Assistant", "text": "I have typed that. Shall I read it back to you?", "es": "Ya lo he escrito. ¿Le lo leo?", "de": "Ich habe das getippt. Soll ich es Ihnen vorlesen?"}'::jsonb,
    '{"character": "Manager", "text": "Yes, please do. That will help me check for any errors.", "es": "Sí, por favor. Eso me ayudará a comprobar si hay errores.", "de": "Ja, bitte. Das hilft mir, Fehler zu überprüfen."}'::jsonb,
    '{"character": "Assistant", "text": "To Mr Brown, we are pleased to confirm your order number 8801. The delivery is scheduled for Thursday the 14th. Please confirm receipt of this message.", "es": "Para el señor Brown, nos complace confirmar su pedido número 8801. La entrega está programada para el jueves 14. Por favor confirme la recepción de este mensaje.", "de": "An Herrn Brown, wir freuen uns, Ihre Bestellnummer 8801 zu bestätigen. Die Lieferung ist für Donnerstag den 14. geplant. Bitte bestätigen Sie den Erhalt dieser Nachricht."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El asistente escribe el mensaje mientras el gerente lo dicta.", "p_de": "Der Assistent tippt die Nachricht, während der Manager diktiert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El número de pedido es el 8901.", "p_de": "Die Bestellnummer ist 8901.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El asistente pide que se repita el número de pedido.", "p_de": "Der Assistent bittet darum, die Bestellnummer zu wiederholen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La entrega está programada para el jueves 14.", "p_de": "Die Lieferung ist für Donnerstag den 14. geplant.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El gerente no quiere que el asistente lea el mensaje de vuelta.", "p_de": "Der Manager möchte nicht, dass der Assistent die Nachricht vorliest.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Qué hace el asistente mientras el gerente habla?", "p_de": "Was macht der Assistent, während der Manager spricht?", "s_es": {"type": "multiple_choice", "options": ["Types the message", "Takes notes by hand", "Records the audio"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Tippt die Nachricht", "Macht handschriftliche Notizen", "Nimmt das Audio auf"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuál es el número de pedido?", "p_de": "Was ist die Bestellnummer?", "s_es": {"type": "multiple_choice", "options": ["8801", "8901", "8811"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8801", "8901", "8811"], "answer": 0}}'::jsonb,
    '{"p": "¿Por qué pide el asistente que se repita el número?", "p_de": "Warum bittet der Assistent darum, die Nummer zu wiederholen?", "s_es": {"type": "multiple_choice", "options": ["To make sure it is correct", "Because he did not hear it", "Because it was wrong"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um sicherzustellen, dass sie korrekt ist", "Weil er sie nicht gehört hat", "Weil sie falsch war"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo está programada la entrega?", "p_de": "Wann ist die Lieferung geplant?", "s_es": {"type": "multiple_choice", "options": ["Thursday the 14th", "Friday the 15th", "Wednesday the 13th"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Donnerstag den 14.", "Freitag den 15.", "Mittwoch den 13."], "answer": 0}}'::jsonb,
    '{"p": "¿Por qué quiere el gerente que se lea el mensaje de vuelta?", "p_de": "Warum möchte der Manager, dass die Nachricht vorgelesen wird?", "s_es": {"type": "multiple_choice", "options": ["To check for errors", "To save time", "To translate it"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um Fehler zu prüfen", "Um Zeit zu sparen", "Um es zu übersetzen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4320 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4320 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4320, 'en', 'dialogue', 'professional', '[{"name": "Manager", "gender": "female", "avatarURL": "https://example.com/avatars/manager.png"}, {"name": "Assistant", "gender": "male", "avatarURL": "https://example.com/avatars/assistant.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Practica dictado y aclaración', 'Practica un dictado de mensaje de trabajo con petición de aclaración y lectura de comprobación.'),
        (v_dialogue_id, 'de', 'Übe Diktat und Klärung', 'Übe ein Arbeitsnachrichten-Diktat mit Klärungsanfrage und Rücklesen zur Überprüfung.');
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
