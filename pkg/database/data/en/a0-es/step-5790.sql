-- ============================================================
-- Seed: A0 English Path – STEP 5790 – Listening – make all necessary arrangements regarding practical arrangements for study (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- 8 true_false exercises first
        '{"p": "La estudiante necesita una sala de estudio para el viernes por la tarde.", "p_de": "Die Studentin braucht einen Lernraum für Freitagnachmittag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las salas de estudio en grupo se reservan en línea por un máximo de dos horas.", "p_de": "Gruppenlernräume werden online für maximal zwei Stunden gebucht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala B2 no tiene pantalla instalada.", "p_de": "Raum B2 hat keinen installierten Bildschirm.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que reservar el equipo antes de reservar la sala.", "p_de": "Man muss die Geräte vor dem Raum buchen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Es necesario recoger una llave en recepción.", "p_de": "Man muss einen Schlüssel an der Rezeption abholen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tarjeta de estudiante abre la sala diez minutos antes del inicio.", "p_de": "Die Studierendenkarte öffnet den Raum zehn Minuten vor Beginn.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Solo la persona que hace la reserva necesita una cuenta activa.", "p_de": "Nur die Person, die die Buchung macht, braucht ein aktives Konto.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala multimedia silenciosa del segundo piso debe reservarse con al menos veinticuatro horas de antelación.", "p_de": "Der stille Medienraum im zweiten Stock muss mindestens vierundzwanzig Stunden im Voraus gebucht werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Para qué llama la estudiante?", "p_de": "Warum ruft die Studentin an?", "s": {"type": "multiple_choice", "options": ["To arrange a group study room", "To cancel an exam", "To order a textbook"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sala ya tiene pantalla?", "p_de": "Welcher Raum hat bereits einen Bildschirm?", "s": {"type": "multiple_choice", "options": ["Room B2", "Room 3.12", "Room C7"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se reserva por separado en la media desk?", "p_de": "Was wird separat am Medien-Schalter gebucht?", "s": {"type": "multiple_choice", "options": ["Cables and portable microphones", "Chairs and windows", "Pens and notebooks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer primero la estudiante?", "p_de": "Was sollte die Studentin zuerst tun?", "s": {"type": "multiple_choice", "options": ["Book the room first", "Collect a key first", "Activate every classmate first"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se abre la sala reservada?", "p_de": "Wie öffnet sich der gebuchte Raum?", "s": {"type": "multiple_choice", "options": ["With the student card", "With a paper ticket", "With a phone call"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién necesita una cuenta activa?", "p_de": "Wer braucht ein aktives Konto?", "s": {"type": "multiple_choice", "options": ["Only the person who makes the booking", "Every visitor in the building", "Only the lecturer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué espacio recomienda el empleado para grabar una presentación?", "p_de": "Welchen Raum empfiehlt der Mitarbeiter zum Aufnehmen einer Präsentation?", "s": {"type": "multiple_choice", "options": ["The silent media room on the second floor", "The main café", "The parking office"], "answer": 0}}'::jsonb,
        '{"p": "¿Con cuánta antelación debe reservarse esa sala especial?", "p_de": "Wie weit im Voraus muss dieser besondere Raum gebucht werden?", "s": {"type": "multiple_choice", "options": ["At least twenty four hours in advance", "Five minutes in advance", "After the meeting ends"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5790 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5790 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5790, 'en', 'listening', 'study-management', $transcript$
# AUDIO PROFILE: Elena Ruiz, undergraduate student; Mr Becker, library services assistant
## "Study Room Booking Call"
## THE SCENE: A student calls the university library help desk to arrange a group study room and ask about equipment booking. She needs a space for a presentation rehearsal before Friday. The staff member explains the exact procedure, access method, and equipment rules.

### DIRECTOR'S NOTES
Style:
* Warm service interaction with practical questions and clear procedural answers.
* Short turns with repeated key details, times, and conditions.
Pace: Steady and helpful.
Accent: Neutral international English.

### SAMPLE CONTEXT
Learners practise arranging practical study logistics, confirming requirements, and extracting times, places, and booking steps from a real service call.

#### TRANSCRIPT
[polite] Student: Good morning. I am calling because I need a study room for a group meeting on Friday afternoon.
[helpful] Library Assistant: Good morning. Group study rooms can be booked online for up to two hours with a student library account.
[clarifying] Student: There will be three of us, and we need a screen for a presentation rehearsal.
[informative] Library Assistant: Room B2 has a screen already installed, but cables and portable microphones are booked separately through the media desk.
[checking] Student: Should I reserve the equipment before I book the room?
[clear] Library Assistant: Please book the room first. After you receive the room confirmation email, you can request equipment with the same booking reference.
[concerned] Student: Do we need to collect a key from the front desk?
[reassuring] Library Assistant: No key is needed. Your student card opens the room ten minutes before the booking starts.
[asking] Student: One classmate has not activated a library account yet. Can she still come?
[practical] Library Assistant: Yes, she can use the room, but only the person who makes the booking needs an active account.
[planning] Student: I may also need a quieter space next week to record a short presentation.
[guiding] Library Assistant: In that case, choose the silent media room on the second floor. That room must be booked at least twenty four hours in advance.
[grateful] Student: Perfect, thank you. I will book Room B2 first and then contact the media desk.
[friendly] Library Assistant: You are welcome. If you have any problems, call us again or visit the help desk.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Llamada para reservar una sala de estudio', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Anruf zur Buchung eines Lernraums', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
