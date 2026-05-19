-- ============================================================
-- Seed: A0 English Path – STEP 4780 – Dialogue – take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Caller", "text": "Hello, this is Patricia Walsh from West End Holdings. I need to leave a message for Paul Hartley.", "es": "Hola, soy Patricia Walsh de West End Holdings. Necesito dejar un recado para Paul Hartley.", "de": "Hallo, hier ist Patricia Walsh von West End Holdings. Ich möchte eine Nachricht für Paul Hartley hinterlassen."}'::jsonb,
        '{"character": "Receptionist", "text": "Of course. Mr. Hartley is away until tomorrow afternoon. I will take the message for you.", "es": "Por supuesto. El señor Hartley estará fuera hasta mañana por la tarde. Tomaré el recado.", "de": "Natürlich. Herr Hartley ist bis morgen Nachmittag außer Haus. Ich nehme gerne die Nachricht auf."}'::jsonb,
        '{"character": "Caller", "text": "Please tell him that the contract signing is moved from Thursday to Tuesday at 10am.", "es": "Dígale que la firma del contrato se traslada del jueves al martes a las 10 de la mañana.", "de": "Bitte sagen Sie ihm, dass die Vertragsunterzeichnung vom Donnerstag auf Dienstag um 10 Uhr verlegt wird."}'::jsonb,
        '{"character": "Receptionist", "text": "Tuesday at 10am. Got it. Is there anything else?", "es": "Martes a las 10 de la mañana. Anotado. ¿Hay algo más?", "de": "Dienstag um 10 Uhr. Notiert. Gibt es noch etwas?"}'::jsonb,
        '{"character": "Caller", "text": "Yes. He must bring the signed version of the budget proposal.", "es": "Sí. Debe traer la versión firmada de la propuesta de presupuesto.", "de": "Ja. Er muss die unterzeichnete Version des Budgetvorschlags mitbringen."}'::jsonb,
        '{"character": "Receptionist", "text": "Bring the signed budget proposal. I have that.", "es": "Traer la propuesta de presupuesto firmada. Lo anoto.", "de": "Die unterzeichnete Budgetvorlage mitbringen. Das habe ich notiert."}'::jsonb,
        '{"character": "Caller", "text": "Also, the location is now our office at 12 Fleet Street, not the hotel.", "es": "Además, el lugar es ahora nuestra oficina en el 12 de Fleet Street, no el hotel.", "de": "Außerdem ist der Ort jetzt unser Büro in der Fleet Street 12, nicht das Hotel."}'::jsonb,
        '{"character": "Receptionist", "text": "12 Fleet Street, not the hotel. Understood.", "es": "12 de Fleet Street, no el hotel. Entendido.", "de": "Fleet Street 12, nicht das Hotel. Verstanden."}'::jsonb,
        '{"character": "Caller", "text": "Could he call me on 07700-909-432 before 5pm today to confirm?", "es": "¿Podría llamarme al 07700-909-432 antes de las 5 de la tarde para confirmar?", "de": "Könnte er mich heute vor 17 Uhr unter 07700-909-432 anrufen, um zu bestätigen?"}'::jsonb,
        '{"character": "Receptionist", "text": "I will give him the full message as soon as he returns.", "es": "Le daré el recado completo en cuanto regrese.", "de": "Ich werde ihm die vollständige Nachricht übermitteln, sobald er zurückkommt."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Patricia Walsh llama de West End Holdings.", "p_de": "Patricia Walsh ruft von West End Holdings an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Paul Hartley está disponible ahora mismo.", "p_de": "Paul Hartley ist sofort verfügbar.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La firma del contrato pasa del jueves al martes.", "p_de": "Die Vertragsunterzeichnung wird von Donnerstag auf Dienstag verlegt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La nueva hora de la firma es las 14:00.", "p_de": "Die neue Uhrzeit für die Unterzeichnung ist 14 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El lugar cambia a 12 Fleet Street.", "p_de": "Der Ort ändert sich zu 12 Fleet Street.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuándo volverá Paul Hartley?", "p_de": "Wann wird Paul Hartley zurück sein?", "s": {"type": "multiple_choice", "options": ["Tomorrow afternoon", "Today at noon", "Next week"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la nueva firma del contrato?", "p_de": "Um wie viel Uhr ist die neue Vertragsunterzeichnung?", "s": {"type": "multiple_choice", "options": ["10am", "2pm", "11am"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe llevar Paul?", "p_de": "Was muss Paul mitbringen?", "s": {"type": "multiple_choice", "options": ["The signed budget proposal", "His passport", "A new contract"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el nuevo lugar?", "p_de": "Wo ist der neue Ort?", "s": {"type": "multiple_choice", "options": ["12 Fleet Street", "The hotel", "West End Holdings office"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el número de teléfono de Patricia?", "p_de": "Wie lautet Patricias Telefonnummer?", "s": {"type": "multiple_choice", "options": ["07700-909-432", "07700-432-909", "07700-909-234"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid
        FROM dialogue
        WHERE step_order = 4780
          AND path_uuid = v_path_id
    );
    DELETE FROM dialogue
    WHERE step_order = 4780
      AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4780, 'en', 'dialogue', 'professional', '[{"name": "Caller", "gender": "female", "avatarURL": "https://example.com/avatars/caller.png"}, {"name": "Receptionist", "gender": "male", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Dialoga para tomar un recado telefónico complejo', 'Sigue un diálogo en el que recepción anota un cambio de firma, lugar y datos de contacto.');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Führe einen Dialog zum Aufnehmen einer komplexen Telefonnachricht', 'Verfolge einen Dialog, in dem der Empfang eine Terminänderung, einen Ort und Kontaktdaten notiert.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (
            v_line_id,
            'es',
            jsonb_build_array(
                jsonb_build_object(
                    'translations',
                    jsonb_build_array(
                        jsonb_build_object('languageCode', 'es', 'translation', line->>'es')
                    )
                )
            )
        );
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (
            v_line_id,
            'de',
            jsonb_build_array(
                jsonb_build_object(
                    'translations',
                    jsonb_build_array(
                        jsonb_build_object('languageCode', 'de', 'translation', line->>'de')
                    )
                )
            )
        );

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
