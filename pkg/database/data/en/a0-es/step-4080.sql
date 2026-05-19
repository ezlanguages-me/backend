-- ============================================================
-- Seed: A0 English Path – STEP 4080 – Dialogue – take and pass on simple messages of a routine kind (Servicios Laborales)
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
        '{"character": "Caller", "text": "Hello, could I speak to Mr Davies, please?", "es": "Hola, ¿podría hablar con el señor Davies, por favor?", "de": "Hallo, könnte ich bitte mit Herrn Davies sprechen?"}'::jsonb,
    '{"character": "Receptionist", "text": "I am afraid Mr Davies is in a meeting right now. Can I take a message?", "es": "Me temo que el señor Davies está en una reunión ahora mismo. ¿Puedo tomar un mensaje?", "de": "Herr Davies ist leider gerade in einem Meeting. Kann ich eine Nachricht aufnehmen?"}'::jsonb,
    '{"character": "Caller", "text": "Yes, please. This is Rosa Herrera from City Logistics.", "es": "Sí, por favor. Soy Rosa Herrera de City Logistics.", "de": "Ja, bitte. Hier ist Rosa Herrera von City Logistics."}'::jsonb,
    '{"character": "Receptionist", "text": "Hello Ms Herrera. What is the message?", "es": "Hola señora Herrera. ¿Cuál es el mensaje?", "de": "Hallo Frau Herrera. Was ist die Nachricht?"}'::jsonb,
    '{"character": "Caller", "text": "Please tell Mr Davies that the delivery for contract CN-1190 will be one day late.", "es": "Por favor, dígale al señor Davies que la entrega del contrato CN-1190 llegará con un día de retraso.", "de": "Bitte sagen Sie Herrn Davies, dass die Lieferung für Vertrag CN-1190 einen Tag verspätet sein wird."}'::jsonb,
    '{"character": "Receptionist", "text": "Understood. So the delivery for CN-1190 is one day late. Is there anything else?", "es": "Entendido. La entrega de CN-1190 llega con un día de retraso. ¿Algo más?", "de": "Verstanden. Die Lieferung für CN-1190 ist einen Tag verspätet. Noch etwas?"}'::jsonb,
    '{"character": "Caller", "text": "Yes, could you ask him to call me back on 07911 223 344?", "es": "Sí, ¿podría pedirle que me llame al 07911 223 344?", "de": "Ja, könnten Sie ihn bitten, mich unter 07911 223 344 zurückzurufen?"}'::jsonb,
    '{"character": "Receptionist", "text": "Of course. I will make sure he gets the message as soon as he is free.", "es": "Por supuesto. Me aseguraré de que reciba el mensaje en cuanto esté libre.", "de": "Natürlich. Ich sorge dafür, dass er die Nachricht bekommt, sobald er frei ist."}'::jsonb,
    '{"character": "Caller", "text": "Thank you very much.", "es": "Muchas gracias.", "de": "Vielen Dank."}'::jsonb,
    '{"character": "Receptionist", "text": "You are welcome. Goodbye.", "es": "De nada. Hasta luego.", "de": "Bitte schön. Auf Wiederhören."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El señor Davies está disponible para hablar.", "p_de": "Herr Davies ist für ein Gespräch verfügbar.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La persona que llama trabaja para City Logistics.", "p_de": "Die anrufende Person arbeitet für City Logistics.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El retraso de la entrega es de dos días.", "p_de": "Die Lieferverspätung beträgt zwei Tage.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La referencia del contrato es CN-1190.", "p_de": "Die Vertragsreferenz ist CN-1190.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La recepcionista pasará el mensaje cuando el señor Davies esté libre.", "p_de": "Die Rezeptionistin gibt die Nachricht weiter, wenn Herr Davies frei ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Dónde está el señor Davies?", "p_de": "Wo ist Herr Davies?", "s_es": {"type": "multiple_choice", "options": ["In a meeting", "At lunch", "On holiday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In einem Meeting", "Beim Mittagessen", "Im Urlaub"], "answer": 0}}'::jsonb,
    '{"p": "¿De dónde llama Rosa Herrera?", "p_de": "Von wo ruft Rosa Herrera an?", "s_es": {"type": "multiple_choice", "options": ["City Logistics", "Delta Supplies", "ProServ Solutions"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["City Logistics", "Delta Supplies", "ProServ Solutions"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuánto retraso tiene la entrega?", "p_de": "Wie groß ist die Lieferverspätung?", "s_es": {"type": "multiple_choice", "options": ["One day", "Two days", "One week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Tag", "Zwei Tage", "Eine Woche"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuál es el número de devolución de llamada?", "p_de": "Was ist die Rückrufnummer?", "s_es": {"type": "multiple_choice", "options": ["07911 223 344", "07700 900 123", "07922 334 455"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["07911 223 344", "07700 900 123", "07922 334 455"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo pasará la recepcionista el mensaje?", "p_de": "Wann gibt die Rezeptionistin die Nachricht weiter?", "s_es": {"type": "multiple_choice", "options": ["As soon as Mr Davies is free", "Tomorrow morning", "After lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sobald Herr Davies frei ist", "Morgen früh", "Nach dem Mittagessen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4080 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4080 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4080, 'en', 'dialogue', 'professional', '[{"name": "Caller", "gender": "female", "avatarURL": "https://example.com/avatars/caller.png"}, {"name": "Receptionist", "gender": "male", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Toma y transmite un mensaje rutinario', 'Practica una llamada para dejar un mensaje con referencia, retraso y número de contacto.'),
        (v_dialogue_id, 'de', 'Nimm eine Routinenachricht auf und gib sie weiter', 'Übe einen Anruf, um eine Nachricht mit Referenz, Verspätung und Kontaktnummer zu hinterlassen.');
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
