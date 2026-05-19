-- ============================================================
-- Seed: A0 English Path – STEP 750 – Dialogue – understand a simple phone message and confirm details of the message (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p":"Alex recibió el mensaje de Nina.","p_de":"Alex hat Ninas Nachricht bekommen.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina llega el viernes.","p_de":"Nina kommt am Freitag an.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La hora es a las 5:30 PM.","p_de":"Die Uhrzeit ist 17:30 Uhr.","s":{"type":"true_false","answer":false},"s_de":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Se encuentran en Central Station.","p_de":"Sie treffen sich am Central Station.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina espera junto a la taquilla.","p_de":"Nina wartet beim Fahrkartenschalter.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Nina lleva una chaqueta amarilla.","p_de":"Nina trägt eine gelbe Jacke.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La bolsa es azul.","p_de":"Die Tasche ist blau.","s":{"type":"true_false","answer":false},"s_de":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"¿Quién devuelve la llamada?","p_de":"Wer ruft zurück?","s":{"type":"multiple_choice","options":["Alex","Nina","Tom"],"answer":0},"s_de":{"type":"multiple_choice","options":["Alex","Nina","Tom"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo llega Nina?","p_de":"Wann kommt Nina an?","s":{"type":"multiple_choice","options":["El viernes a las 4:30 PM","El jueves a las 4:30 PM","El viernes a las 5:30 PM"],"answer":0},"s_de":{"type":"multiple_choice","options":["Am Freitag um 16:30 Uhr","Am Donnerstag um 16:30 Uhr","Am Freitag um 17:30 Uhr"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde se encuentran?","p_de":"Wo treffen sie sich?","s":{"type":"multiple_choice","options":["En Central Station","En la biblioteca","En el aeropuerto"],"answer":0},"s_de":{"type":"multiple_choice","options":["Am Central Station","In der Bibliothek","Am Flughafen"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde espera Nina exactamente?","p_de":"Wo wartet Nina genau?","s":{"type":"multiple_choice","options":["Junto a la taquilla","En la puerta principal","Junto al autobús"],"answer":0},"s_de":{"type":"multiple_choice","options":["Beim Fahrkartenschalter","Am Haupteingang","Beim Bus"],"answer":0}}'::jsonb,
        '{"p":"¿De qué color es la chaqueta?","p_de":"Welche Farbe hat die Jacke?","s":{"type":"multiple_choice","options":["Amarilla","Negra","Blanca"],"answer":0},"s_de":{"type":"multiple_choice","options":["Gelb","Schwarz","Weiß"],"answer":0}}'::jsonb,
        '{"p":"¿Cuántas bolsas tiene Nina?","p_de":"Wie viele Taschen hat Nina?","s":{"type":"multiple_choice","options":["Una","Dos","Tres"],"answer":0},"s_de":{"type":"multiple_choice","options":["Eine","Zwei","Drei"],"answer":0}}'::jsonb,
        '{"p":"¿Qué dice Alex al final?","p_de":"Was sagt Alex am Ende?","s":{"type":"multiple_choice","options":["Nos vemos el viernes","Llámame más tarde","Voy tarde"],"answer":0},"s_de":{"type":"multiple_choice","options":["Bis Freitag","Ruf mich später an","Ich bin spät dran"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise_translation
    WHERE exercise_uuid IN (
        SELECT e.uuid
        FROM exercise e
        JOIN dialogue d ON d.uuid = e.target_uuid
        WHERE d.step_order = 750 AND d.path_uuid = v_path_id
    );

    DELETE FROM exercise
    WHERE target_uuid IN (
        SELECT uuid FROM dialogue WHERE step_order = 750 AND path_uuid = v_path_id
    );

    DELETE FROM dialogue
    WHERE step_order = 750 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        750,
        'en',
        'dialogue',
        'communication',
        '[{"name":"Nina","gender":"female","avatarURL":"https://example.com/avatars/nina.png"},{"name":"Alex","gender":"male","avatarURL":"https://example.com/avatars/alex.png"}]'::jsonb
    )
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Llamada para confirmar un mensaje', 'Sigue una llamada corta para confirmar día, hora, lugar y objetos.'),
        (v_dialogue_id, 'de', 'Anruf zur Bestätigung einer Nachricht', 'Folge einem kurzen Anruf, um Tag, Uhrzeit, Ort und Dinge zu bestätigen.');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 0, 'Alex', 'Hello, is this Nina?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Hola, ¿eres Nina?'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Hallo, bist du Nina?'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 1, 'Nina', 'Yes, this is Nina.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Sí, soy Nina.'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Ja, hier ist Nina.'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 2, 'Alex', 'Hi, I got your message.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Hola, he recibido tu mensaje.'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Hallo, ich habe deine Nachricht bekommen.'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 3, 'Alex', 'You arrive on Friday at 4:30 PM, right?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Llegas el viernes a las 4:30 PM, ¿verdad?'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Du kommst am Freitag um 16:30 Uhr an, richtig?'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 4, 'Nina', 'Yes, that is right.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Sí, es correcto.'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Ja, das stimmt.'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 5, 'Alex', 'And you are at Central Station, by the ticket office?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', '¿Y estás en Central Station, junto a la taquilla?'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Und du bist am Central Station, beim Fahrkartenschalter?'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 6, 'Nina', 'Yes, by the ticket office.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Sí, junto a la taquilla.'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Ja, beim Fahrkartenschalter.'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 7, 'Alex', 'Great. You have a yellow jacket and one black bag?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Perfecto. ¿Llevas una chaqueta amarilla y una bolsa negra?'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Super. Du hast eine gelbe Jacke und eine schwarze Tasche?'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 8, 'Nina', 'Yes. See you there.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Sí. Nos vemos allí.'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Ja. Wir sehen uns dort.'));

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 9, 'Alex', 'Perfect. See you on Friday.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Perfecto. Nos vemos el viernes.'));
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Perfekt. Bis Freitag.'));

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
