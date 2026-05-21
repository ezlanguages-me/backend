-- ============================================================
-- Seed: A0 English Path – STEP 700 – Listening – understand simple phone messages (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p":"Un mensaje confirma una cita con el dentista el viernes a las 3 PM.","p_de":"Eine Nachricht bestätigt einen Zahnarzttermin am Freitag um 15 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Maria llega tarde veinte minutos.","p_de":"Maria kommt zwanzig Minuten zu spät.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Maria pide esperar dentro del café.","p_de":"Maria bittet darum, im Café zu warten.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"La biblioteca cierra a las 8 PM.","p_de":"Die Bibliothek schließt um 20 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Los tres mensajes son de la misma persona.","p_de":"Alle drei Nachrichten sind von derselben Person.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hay un libro listo para recoger.","p_de":"Ein Buch ist zur Abholung bereit.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Tom llama por una reserva para comer.","p_de":"Tom ruft wegen einer Tischreservierung an.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hay tres mensajes en total.","p_de":"Es gibt insgesamt drei Nachrichten.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Quién confirma una cita?","p_de":"Wer bestätigt einen Termin?","s":{"type":"multiple_choice","options":["Tom","Maria","The library"],"answer":0}}'::jsonb,
        '{"p":"¿Qué tipo de cita es?","p_de":"Was für ein Termin ist es?","s":{"type":"multiple_choice","options":["A bank meeting","A dentist appointment","A job interview"],"answer":1}}'::jsonb,
        '{"p":"¿Cuándo es la cita?","p_de":"Wann ist der Termin?","s":{"type":"multiple_choice","options":["Thursday at 3 PM","Friday at 5 PM","Friday at 3 PM"],"answer":2}}'::jsonb,
        '{"p":"¿Cuánto tarda Maria?","p_de":"Wie spät kommt Maria?","s":{"type":"multiple_choice","options":["20 minutes","10 minutes","40 minutes"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde debe esperar la otra persona?","p_de":"Wo soll die andere Person warten?","s":{"type":"multiple_choice","options":["Inside the library","At the café entrance","At the station desk"],"answer":1}}'::jsonb,
        '{"p":"¿Qué está listo para recoger?","p_de":"Was ist zur Abholung bereit?","s":{"type":"multiple_choice","options":["A parcel","A key","A book"],"answer":2}}'::jsonb,
        '{"p":"¿Cuándo cierra la biblioteca?","p_de":"Wann schließt die Bibliothek?","s":{"type":"multiple_choice","options":["At 6 PM","At 5 PM","At 7 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Cuántos mensajes hay?","p_de":"Wie viele Nachrichten gibt es?","s":{"type":"multiple_choice","options":["Two","Three","Four"],"answer":1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 700 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 700 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
        v_path_id,
        700,
        'en',
        'listening',
        'communication',
        $transcript$
[automated voice] You have three new messages. First message, received today at 1:15 PM.
[Tom] Hello, this is Tom from Bright Smile Dental Clinic. I am calling with a friendly reminder about your appointment for this Friday.
[Tom] Your dentist appointment is on Friday at 3 PM with Dr Harris. Please arrive ten minutes early so you have time to check in at the desk.
[Tom] Bring your health card or another form of identification. If you need to change the time, please call us before noon on Friday.
[Tom] The clinic is on King Street, next to the bank and across from the small bakery. The waiting room is on the first floor.
[Tom] There is also a lift near the main entrance if you do not want to take the stairs. Thank you, and we look forward to seeing you on Friday at 3 PM.
[automated voice] End of first message.
[automated voice] Second message, received today at 4:40 PM.
[Maria] Hi, it is Maria. I am on the bus now, but there is a lot of traffic in the city centre and the bus is moving very slowly.
[Maria] I am running about 20 minutes late for our coffee. Please wait for me at the café entrance, not inside, because I may not see you near the tables.
[Maria] If it starts to rain, stand under the little red awning by the door. I will look there first when I arrive.
[Maria] I have not ordered anything yet, so we can choose drinks together. I should be there at about twenty past five.
[Maria] Sorry again for the delay. Thank you for waiting, and I will see you very soon at the café entrance.
[automated voice] End of second message.
[automated voice] Third message, received today at 5:10 PM.
[Library staff] Hello, this is Riverside Library with a service message for Anna Lopez. We are calling about the item you asked us to hold.
[Library staff] The book you requested, Easy City Walks, is now ready to collect at the front desk. Please come before 6 PM because the library closes at 6 PM today.
[Library staff] Bring your library card or an ID card when you arrive. The front desk is just inside the main entrance, on the left.
[Library staff] The book will stay on the hold shelf until tomorrow afternoon, but today is better because the desk is usually quiet before closing time.
[Library staff] If you need help, a staff member in a blue badge can show you where to go. Thank you for using Riverside Library.
[automated voice] End of third message.
$transcript$
    )RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES (v_listening_id, 'es', 'Tres mensajes de voz cortos');

    INSERT INTO listening_translation (listening_uuid, language, title)
    VALUES (v_listening_id, 'de', 'Drei kurze Mailboxnachrichten');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
