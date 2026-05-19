-- ============================================================
-- Seed: A0 English Path – STEP 730 – Reading – understand a simple phone message and confirm details of the message (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p":"Mark llega el martes a las 4:30 PM.","p_de":"Mark kommt am Dienstag um 16:30 Uhr an.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Paula debe encontrarse con Mark en el aeropuerto.","p_de":"Paula soll Mark am Flughafen treffen.","s":{"type":"true_false","answer":false},"s_de":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Mark tiene una bolsa verde pequeña.","p_de":"Mark hat eine kleine grüne Tasche.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El club de inglés es el jueves a las 6:00 PM.","p_de":"Der Englischclub ist am Donnerstag um 18:00 Uhr.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El club de inglés es en el aula 5.","p_de":"Der Englischclub ist in Raum 5.","s":{"type":"true_false","answer":false},"s_de":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Diego debe llevar un cuaderno rojo.","p_de":"Diego soll ein rotes Heft mitbringen.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El hermano de Rosa está en el dentista.","p_de":"Rosas Bruder ist beim Zahnarzt.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El hermano de Rosa vuelve a las 6:15 PM.","p_de":"Rosas Bruder kommt um 18:15 Uhr zurück.","s":{"type":"true_false","answer":false},"s_de":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La cena es a las 8:00 PM.","p_de":"Das Abendessen ist um 20:00 Uhr.","s":{"type":"true_false","answer":true},"s_de":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Quién llama en el mensaje 1?","p_de":"Wer ruft in Nachricht 1 an?","s":{"type":"multiple_choice","options":["Mark","Diego","Rosa"],"answer":0},"s_de":{"type":"multiple_choice","options":["Mark","Diego","Rosa"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde debe encontrarse Paula con Mark?","p_de":"Wo soll Paula Mark treffen?","s":{"type":"multiple_choice","options":["En Central Station","En el aeropuerto","En la escuela"],"answer":0},"s_de":{"type":"multiple_choice","options":["Am Central Station","Am Flughafen","In der Schule"],"answer":0}}'::jsonb,
        '{"p":"¿Qué color es la bolsa de Mark?","p_de":"Welche Farbe hat Marks Tasche?","s":{"type":"multiple_choice","options":["Verde","Azul","Roja"],"answer":0},"s_de":{"type":"multiple_choice","options":["Grün","Blau","Rot"],"answer":0}}'::jsonb,
        '{"p":"¿Qué día es el club de inglés?","p_de":"An welchem Tag ist der Englischclub?","s":{"type":"multiple_choice","options":["El jueves","El martes","El sábado"],"answer":0},"s_de":{"type":"multiple_choice","options":["Am Donnerstag","Am Dienstag","Am Samstag"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora es el club de inglés?","p_de":"Um wie viel Uhr ist der Englischclub?","s":{"type":"multiple_choice","options":["A las 6:00 PM","A las 4:00 PM","A las 7:00 PM"],"answer":0},"s_de":{"type":"multiple_choice","options":["Um 18:00 Uhr","Um 16:00 Uhr","Um 19:00 Uhr"],"answer":0}}'::jsonb,
        '{"p":"¿Qué debe llevar Diego?","p_de":"Was soll Diego mitbringen?","s":{"type":"multiple_choice","options":["Un cuaderno rojo","Una carpeta azul","Su teléfono"],"answer":0},"s_de":{"type":"multiple_choice","options":["Ein rotes Heft","Eine blaue Mappe","Sein Handy"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está el hermano de Rosa?","p_de":"Wo ist Rosas Bruder?","s":{"type":"multiple_choice","options":["En el dentista","En el banco","En la estación"],"answer":0},"s_de":{"type":"multiple_choice","options":["Beim Zahnarzt","Bei der Bank","Am Bahnhof"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora vuelve el hermano de Rosa?","p_de":"Um wie viel Uhr kommt Rosas Bruder zurück?","s":{"type":"multiple_choice","options":["A las 7:15 PM","A las 6:15 PM","A las 8:15 PM"],"answer":0},"s_de":{"type":"multiple_choice","options":["Um 19:15 Uhr","Um 18:15 Uhr","Um 20:15 Uhr"],"answer":0}}'::jsonb,
        '{"p":"¿A qué hora es la cena?","p_de":"Um wie viel Uhr ist das Abendessen?","s":{"type":"multiple_choice","options":["A las 8:00 PM","A las 7:00 PM","A las 9:00 PM"],"answer":0},"s_de":{"type":"multiple_choice","options":["Um 20:00 Uhr","Um 19:00 Uhr","Um 21:00 Uhr"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise_translation
    WHERE exercise_uuid IN (
        SELECT e.uuid
        FROM exercise e
        JOIN reading r ON r.uuid = e.target_uuid
        WHERE r.step_order = 730 AND r.path_uuid = v_path_id
    );

    DELETE FROM exercise
    WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 730 AND path_uuid = v_path_id
    );

    DELETE FROM reading
    WHERE step_order = 730 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (
        v_path_id,
        730,
        'en',
        'reading',
        'communication',
        'PHONE MESSAGE 1\n\nHi Paula. This is Mark. I arrive on Tuesday at 4:30 PM. Please meet me at Central Station, at the main entrance. I have a small green bag. Call me back.\n\nPHONE MESSAGE 2\n\nHello Diego. Sara called. The English club is on Thursday at 6:00 PM in Room 3. Please bring your red notebook.\n\nPHONE MESSAGE 3\n\nMessage for Rosa. Your brother is at the dentist. He will be back at 7:15 PM. Dinner is at 8:00 PM.'
    )
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Mensajes de teléfono: confirmar datos', 'Lee varios mensajes breves y confirma la hora, el lugar y otros detalles.'),
        (v_reading_id, 'de', 'Telefonnachrichten: Details bestätigen', 'Lies mehrere kurze Nachrichten und bestätige Uhrzeit, Ort und andere Details.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
