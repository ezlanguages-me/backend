-- ============================================================
-- Seed: A0 English Path – STEP 1700 – Listening – go to a travel information centre (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que tomar la lanzadera B.", "p_de": "Man muss Shuttle B nehmen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lanzadera sale del andén 4.", "p_de": "Das Shuttle fährt von Bahnsteig 4 ab.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Sale cada veinte minutos.", "p_de": "Es fährt alle zwanzig Minuten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El trayecto dura veinte minutos.", "p_de": "Die Fahrt dauert zwanzig Minuten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La próxima lanzadera es a las 9 AM.", "p_de": "Das nächste Shuttle ist um 9 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El billete se compra dentro de la lanzadera.", "p_de": "Das Ticket kauft man im Shuttle.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Con un pase de tren no necesitas billete de lanzadera.", "p_de": "Mit einem Bahnpas braucht man kein Shuttle-Ticket.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que bajarse en Terminal 1.", "p_de": "Man muss am Terminal 1 aussteigen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué transporte toma el viajero?", "p_de": "Welches Verkehrsmittel nimmt der Reisende?", "s": {"type": "multiple_choice", "options": ["Shuttle B", "Train L2", "Bus 12"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde qué andén sale?", "p_de": "Von welchem Bahnsteig fährt es ab?", "s": {"type": "multiple_choice", "options": ["Platform 4", "Platform 2", "Platform 1"], "answer": 0}}'::jsonb,
        '{"p": "¿Cada cuánto sale?", "p_de": "Wie oft fährt es?", "s": {"type": "multiple_choice", "options": ["Every thirty minutes", "Every ten minutes", "Every hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura el viaje?", "p_de": "Wie lange dauert die Fahrt?", "s": {"type": "multiple_choice", "options": ["Twenty minutes", "Thirty minutes", "Ten minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo sale la próxima lanzadera?", "p_de": "Wann fährt das nächste Shuttle?", "s": {"type": "multiple_choice", "options": ["At 9 AM", "At 8 AM", "At 10 AM"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde compras el billete?", "p_de": "Wo kauft man das Ticket?", "s": {"type": "multiple_choice", "options": ["At the machine next to the information desk", "Inside the shuttle", "At Terminal 1"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa si tienes un pase de tren?", "p_de": "Was gilt, wenn man einen Bahnpas hat?", "s": {"type": "multiple_choice", "options": ["You still need a shuttle ticket", "You travel for free", "You must take platform 1"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde te bajas?", "p_de": "Wo steigt man aus?", "s": {"type": "multiple_choice", "options": ["At Terminal 1", "At the information desk", "At platform 4"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1700 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1700 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1700, 'en', 'listening', 'Viajes y Transporte', $transcript$
# AUDIO PROFILE: An information clerk and a traveller
## "Which Shuttle Goes to the Airport?"

## THE SCENE: A station travel information centre
A traveller asks how to get from the station to the airport.
The clerk gives a simple shuttle route, timing, and ticket information.

### DIRECTOR'S NOTES
Style:
* Helpful station language with short answers.
* Important numbers and places should be very clear.

Pace: Slow and careful.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for understanding travel information about platforms, times, and tickets.
Learners hear the kind of answer they get at an information booth.

#### TRANSCRIPT
[traveller] Traveller: Hello. How do I get to the airport from here?
[clerk] Clerk: Take shuttle B from platform 4.
[clear] Clerk: It leaves every thirty minutes, and the trip takes twenty minutes.
[helpful] Clerk: The next shuttle is at 9 AM.
[practical] Clerk: Buy your shuttle ticket at the machine next to the information desk.
[warning] Clerk: If you have a rail pass, you still need the shuttle ticket.
[final detail] Clerk: Get off at Terminal 1.
[traveller] Traveller: Thank you very much.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'En el mostrador de información para ir al aeropuerto', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Am Informationsschalter zum Flughafen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
