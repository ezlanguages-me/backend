-- ============================================================
-- Seed: A0 English Path – STEP 4850 – Listening – listen to a voicemail message (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El mensaje es de Oliver Grant.", "p_de": "Die Nachricht ist von Oliver Grant.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sesión empieza mañana a las nueve y cuarto.", "p_de": "Die Sitzung beginnt morgen um neun Uhr fünfzehn.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La formación será en la sala D.", "p_de": "Die Schulung findet in Raum D statt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que preparar el proyector antes de que llegue el grupo.", "p_de": "Der Projektor soll bereit sein, bevor die Gruppe ankommt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se necesitan doce acreditaciones en recepción.", "p_de": "Es werden zwölf Besucherausweise am Empfang benötigt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que devolver la llamada después de las cinco.", "p_de": "Man soll nach fünf Uhr zurückrufen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El coordinador enviará el horario por correo electrónico.", "p_de": "Der Koordinator schickt den Zeitplan per E-Mail.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La llamada trata de una fiesta de empresa.", "p_de": "Der Anruf geht um eine Firmenfeier.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Quién deja el mensaje?", "p_de": "Wer hinterlässt die Nachricht?", "s": {"type": "multiple_choice", "options": ["Oliver Grant", "Marta Lopez", "Ben Carter"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora empieza la sesión?", "p_de": "Um wie viel Uhr beginnt die Sitzung?", "s": {"type": "multiple_choice", "options": ["At 9:15", "At 8:30", "At 11:00"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué sala será la formación?", "p_de": "In welchem Raum ist die Schulung?", "s": {"type": "multiple_choice", "options": ["Room B", "Room D", "Hall A"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué equipo debe estar listo?", "p_de": "Welches Gerät soll bereit sein?", "s": {"type": "multiple_choice", "options": ["The projector", "The printer", "The coffee machine"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas acreditaciones se necesitan?", "p_de": "Wie viele Ausweise werden gebraucht?", "s": {"type": "multiple_choice", "options": ["Twelve visitor badges", "Two guest passes", "Twenty name cards"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número debe usar el equipo?", "p_de": "Welche Nummer soll das Team benutzen?", "s": {"type": "multiple_choice", "options": ["555-0172", "555-0712", "555-0271"], "answer": 0}}'::jsonb,
        '{"p": "¿Antes de qué hora hay que llamar si hay un problema?", "p_de": "Vor welcher Uhrzeit soll man bei einem Problem anrufen?", "s": {"type": "multiple_choice", "options": ["Before five o''clock", "Before noon", "Before eight o''clock"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué enviará Oliver por la tarde?", "p_de": "Was schickt Oliver am Nachmittag?", "s": {"type": "multiple_choice", "options": ["The schedule by email", "A taxi voucher", "A printed invoice"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4850 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 4850 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 4850, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Voicemail from an event coordinator
## THE SCENE: A recorded message for an office team
A coordinator leaves a clear voicemail about a training session, room details, and a callback request.

### DIRECTOR'S NOTES
Style:
* Slow, careful voicemail delivery with repeated numbers.
* Practical details are grouped by time, room, and callback.

Pace: Slow and deliberate.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise catching times, room names, equipment requests, and callback details in a voicemail.

#### TRANSCRIPT
[calm] Hello, this is Oliver Grant from Bright Office Training.
[clear] I am calling about tomorrow's customer service session. It now starts at nine fifteen in Room B.
[practical] Please make sure the projector is ready before the group arrives.
[organized] We also need twelve visitor badges at reception.
[helpful] Please call me back on 555-0172 before five o'clock today if there is any problem.
[friendly] Thank you. I will also send the schedule by email this afternoon.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Mensaje de voz sobre una sesión de formación', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Voicemail über eine Schulung', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
