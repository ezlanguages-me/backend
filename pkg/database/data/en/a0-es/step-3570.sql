-- ============================================================
-- Seed: A0 English Path – STEP 3570 – Dialogue – make a business appointment (Correspondencia e Informes Profesionales)
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
        '{"character": "Receptionist", "text": "Good morning, Stone Office Services.", "es": "Buenos días, Stone Office Services.", "de": "Guten Morgen, Stone Office Services."}'::jsonb,
    '{"character": "Client", "text": "Hello. This is Laura Kim from Bright Cargo. Can I make an appointment with Mr Patel?", "es": "Hola. Soy Laura Kim de Bright Cargo. ¿Puedo pedir una cita con Mr Patel?", "de": "Hallo. Hier ist Laura Kim von Bright Cargo. Kann ich einen Termin mit Mr Patel vereinbaren?"}'::jsonb,
    '{"character": "Receptionist", "text": "Yes. He is free on Tuesday at 10 AM or Wednesday at 3 PM.", "es": "Sí. Está libre el martes a las 10 AM o el miércoles a las 3 PM.", "de": "Ja. Er hat am Dienstag um 10 Uhr oder am Mittwoch um 15 Uhr Zeit."}'::jsonb,
    '{"character": "Client", "text": "Tuesday at 10 AM is better for me.", "es": "El martes a las 10 AM me viene mejor.", "de": "Dienstag um 10 Uhr passt mir besser."}'::jsonb,
    '{"character": "Receptionist", "text": "Great. What is the meeting about?", "es": "Muy bien. ¿Sobre qué es la reunión?", "de": "Sehr gut. Worum geht es in dem Treffen?"}'::jsonb,
    '{"character": "Client", "text": "I want to talk about a delivery contract.", "es": "Quiero hablar sobre un contrato de entrega.", "de": "Ich möchte über einen Liefervertrag sprechen."}'::jsonb,
    '{"character": "Receptionist", "text": "Okay. Can I have your phone number, please?", "es": "De acuerdo. ¿Me puede dar su número de teléfono, por favor?", "de": "Okay. Kann ich bitte Ihre Telefonnummer haben?"}'::jsonb,
    '{"character": "Client", "text": "Yes, it is 555-0184.", "es": "Sí, es 555-0184.", "de": "Ja, sie ist 555-0184."}'::jsonb,
    '{"character": "Receptionist", "text": "Thank you. The meeting is on Tuesday at 10 AM in Meeting Room 2.", "es": "Gracias. La reunión es el martes a las 10 AM en Meeting Room 2.", "de": "Danke. Das Treffen ist am Dienstag um 10 Uhr in Meeting Room 2."}'::jsonb,
    '{"character": "Client", "text": "Perfect. Thank you very much.", "es": "Perfecto. Muchas gracias.", "de": "Perfekt. Vielen Dank."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Laura Kim llama desde Bright Cargo.", "p_de": "Laura Kim ruft von Bright Cargo an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "Mr Patel solo está libre el jueves.", "p_de": "Mr Patel hat nur am Donnerstag Zeit.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "Laura elige el martes a las 10 AM.", "p_de": "Laura wählt Dienstag um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La reunión es sobre un contrato de entrega.", "p_de": "Das Treffen geht um einen Liefervertrag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La reunión final es en Meeting Room 5.", "p_de": "Das endgültige Treffen ist in Meeting Room 5.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Con quién quiere reunirse Laura?", "p_de": "Mit wem möchte Laura sich treffen?", "s_es": {"type": "multiple_choice", "options": ["Mr Patel", "Ms Lane", "Ben Stone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mr Patel", "Ms Lane", "Ben Stone"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué otra hora ofrece la recepcionista?", "p_de": "Welche andere Uhrzeit bietet die Rezeptionistin an?", "s_es": {"type": "multiple_choice", "options": ["Wednesday at 3 PM", "Tuesday at 8 AM", "Friday at 11 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mittwoch um 15 Uhr", "Dienstag um 8 Uhr", "Freitag um 11 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Sobre qué quiere hablar Laura?", "p_de": "Worüber möchte Laura sprechen?", "s_es": {"type": "multiple_choice", "options": ["A delivery contract", "A hotel room", "A train ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Liefervertrag", "Ein Hotelzimmer", "Eine Zugfahrkarte"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué dato pide la recepcionista?", "p_de": "Welche Information fragt die Rezeptionistin ab?", "s_es": {"type": "multiple_choice", "options": ["The phone number", "The passport number", "The office key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Telefonnummer", "Die Passnummer", "Den Büroschlüssel"], "answer": 0}}'::jsonb,
    '{"p": "¿Dónde será la reunión?", "p_de": "Wo findet das Treffen statt?", "s_es": {"type": "multiple_choice", "options": ["Meeting Room 2", "Reception Desk", "Warehouse B"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Meeting Room 2", "Am Empfang", "Lager B"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM dialogue
        WHERE step_order = 3570 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue'
    );
    DELETE FROM dialogue WHERE step_order = 3570 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3570, 'en', 'dialogue', 'professional', '[{"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}, {"name": "Client", "gender": "female", "avatarURL": "https://example.com/avatars/client.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Concerta una cita de negocios', 'Practica una llamada breve para reservar una reunión con una empresa.'),
        (v_dialogue_id, 'de', 'Vereinbare einen Geschäftstermin', 'Übe einen kurzen Anruf, um ein Treffen mit einer Firma zu vereinbaren.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
