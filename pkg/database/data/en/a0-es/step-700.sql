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
    -- ------------------------------------------------------------
    -- Exercise definitions
    -- ------------------------------------------------------------
    v_exercises JSONB[] := ARRAY[
        '{"p":"Un mensaje confirma una cita con el dentista el viernes a las 3 PM.","p_de":"Eine Nachricht bestätigt einen Zahnarzttermin am Freitag um 15 Uhr.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Maria llega tarde veinte minutos.","p_de":"Maria kommt zwanzig Minuten zu spät.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Maria pide esperar en la entrada del café.","p_de":"Maria bittet darum, am Eingang des Cafés zu warten.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La biblioteca cierra a las 8 PM.","p_de":"Die Bibliothek schließt um 20 Uhr.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Los tres mensajes son de la misma persona.","p_de":"Alle drei Nachrichten sind von derselben Person.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hay un libro listo para recoger.","p_de":"Ein Buch ist zur Abholung bereit.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Tom llama por una reserva para comer.","p_de":"Tom ruft wegen einer Tischreservierung an.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hay tres mensajes en total.","p_de":"Es gibt insgesamt drei Nachrichten.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"¿Quién confirma una cita?","p_de":"Wer bestätigt einen Termin?","s":{"type":"multiple_choice","options":["Tom","Maria","The library"],"answer":0}}'::jsonb,
        '{"p":"¿Qué tipo de cita es?","p_de":"Was für ein Termin ist es?","s":{"type":"multiple_choice","options":["A dentist appointment","A bank meeting","A job interview"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo es la cita?","p_de":"Wann ist der Termin?","s":{"type":"multiple_choice","options":["Friday at 3 PM","Thursday at 3 PM","Friday at 5 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Cuánto tarda Maria?","p_de":"Wie spät kommt Maria?","s":{"type":"multiple_choice","options":["20 minutes","10 minutes","40 minutes"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde debe esperar la otra persona?","p_de":"Wo soll die andere Person warten?","s":{"type":"multiple_choice","options":["At the café entrance","Inside the library","At the station desk"],"answer":0}}'::jsonb,
        '{"p":"¿Qué está listo para recoger?","p_de":"Was ist zur Abholung bereit?","s":{"type":"multiple_choice","options":["A book","A parcel","A key"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo cierra la biblioteca?","p_de":"Wann schließt die Bibliothek?","s":{"type":"multiple_choice","options":["At 6 PM","At 5 PM","At 7 PM"],"answer":0}}'::jsonb,
        '{"p":"¿Cuántos mensajes hay?","p_de":"Wie viele Nachrichten gibt es?","s":{"type":"multiple_choice","options":["Three","Two","Four"],"answer":0}}'::jsonb
    ];

BEGIN

-- ------------------------------------------------------------
-- Path lookup and cleanup
-- ------------------------------------------------------------
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

DELETE FROM exercise WHERE target_uuid IN (
    SELECT uuid FROM listening WHERE step_order = 700 AND path_uuid = v_path_id
);
DELETE FROM listening WHERE step_order = 700 AND path_uuid = v_path_id;

-- ------------------------------------------------------------
-- Listening transcript
-- ------------------------------------------------------------
INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
VALUES (v_path_id, 700, 'en', 'listening', 'communication', $transcript$
# AUDIO PROFILE: A voicemail training track with Tom, Maria, and library staff
## "New Messages"

## THE SCENE: A phone mailbox with three messages in sequence
The listener hears three different voicemail messages one after another like a practice audio in class.
Each message gives one clear purpose: an appointment, a late arrival, and a library collection notice.

### DIRECTOR'S NOTES
Style:
* Clear message-by-message structure so beginners can separate the information easily.
* Practical everyday details with common times, places, and polite phone phrases.

Pace: Slow and segmented, with a pause between each voicemail.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for voicemail practice, everyday appointments, and short service messages.
Learners focus on listening for names, times, places, and simple requests.

#### TRANSCRIPT
[automated voice] You have three new messages.
[friendly] Message one. Hi, this is Tom. I am calling to confirm your dentist appointment.
[clear] It is on Friday at 3 PM. See you then.
[automated voice] End of message one.
[hurried] Message two. Hello, it is Maria. I am running 20 minutes late.
[helpfully] Please wait for me at the café entrance.
[automated voice] End of message two.
[professional] Message three. Hello, this is Riverside Library.
[clearly] Your book is ready to collect. Please remember that we close at 6 PM.
[automated voice] End of message three.
$transcript$)
RETURNING uuid INTO v_listening_id;

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'es', 'Tres mensajes de voz cortos', '');

INSERT INTO listening_translation (listening_uuid, language, title, description)
VALUES (v_listening_id, 'de', 'Drei kurze Mailboxnachrichten', '');

-- ------------------------------------------------------------
-- Exercise inserts
-- ------------------------------------------------------------
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
