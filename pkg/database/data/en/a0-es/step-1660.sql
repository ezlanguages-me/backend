-- ============================================================
-- Seed: A0 English Path – STEP 1660 – Listening – give and understand straightforward directions (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El visitante quiere ir al centro de arte de la ciudad.", "p_de": "Der Besucher möchte zum Kunstzentrum der Stadt gehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El río queda a la derecha al empezar.", "p_de": "Der Fluss ist am Anfang auf der rechten Seite.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ruta pasa por un hotel y una oficina de barcos.", "p_de": "Der Weg führt an einem Hotel und einem Boots-Büro vorbei.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Después del hotel, hay que subir a un puente.", "p_de": "Nach dem Hotel muss man auf eine Brücke gehen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "En la estatua grande, hay que girar a la derecha.", "p_de": "An der großen Statue muss man rechts abbiegen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La calle se llama Museum Lane.", "p_de": "Die Straße heißt Museum Lane.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Pasas por un edificio de cristal y un camión de café.", "p_de": "Du gehst an einem Glasgebäude und einem Kaffeewagen vorbei.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El centro de arte está frente a la entrada del teatro.", "p_de": "Das Kunstzentrum liegt gegenüber dem Theatereingang.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Desde dónde empieza la ruta?", "p_de": "Wo beginnt der Weg?", "s": {"type": "multiple_choice", "options": ["Riverside Stop", "Museum Lane", "The theatre entrance"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde queda el río al empezar?", "p_de": "Wo ist der Fluss am Anfang?", "s": {"type": "multiple_choice", "options": ["On the left", "On the right", "Behind the visitor"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dos lugares pasas primero?", "p_de": "An welchen zwei Orten kommst du zuerst vorbei?", "s": {"type": "multiple_choice", "options": ["The hotel and the boat office", "The museum and the café", "The station and the church"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces en la estatua grande?", "p_de": "Was machst du an der großen Statue?", "s": {"type": "multiple_choice", "options": ["Turn right", "Turn left", "Stop and wait"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se llama la calle?", "p_de": "Wie heißt die Straße?", "s": {"type": "multiple_choice", "options": ["Museum Lane", "River Street", "Glass Avenue"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasas después de girar?", "p_de": "Woran gehst du nach dem Abbiegen vorbei?", "s": {"type": "multiple_choice", "options": ["A glass building and a coffee truck", "A school and a bank", "A bridge and a park"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué edificio es el centro de arte?", "p_de": "Welches Gebäude ist das Kunstzentrum?", "s": {"type": "multiple_choice", "options": ["The second building on the left", "The first building on the right", "The last building on the left"], "answer": 0}}'::jsonb,
        '{"p": "¿Frente a qué está?", "p_de": "Wogegenüber liegt es?", "s": {"type": "multiple_choice", "options": ["The theatre entrance", "The hotel entrance", "The boat office"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1660 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 1660 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 1660, 'en', 'listening', 'Viajes y Transporte', $transcript$
# AUDIO PROFILE: A station volunteer helping a visitor
## "Walk Along the River to the Art Centre"

## THE SCENE: Outside Riverside Stop
A visitor wants to walk from a busy stop to the city art centre.
The volunteer gives a route with landmarks so the visitor can follow it step by step.

### DIRECTOR'S NOTES
Style:
* Clear but slightly longer directions with practical landmarks.
* Emphasise the order of the route so learners can track each stage.

Pace: Slow to medium, with short pauses after each step.

Accent: Neutral accent.

### SAMPLE CONTEXT
Useful for understanding a route with several simple steps and clear landmarks.
Learners practise listening for sequence, direction, and place names.

#### TRANSCRIPT
[question] Visitor: Can you tell me how to get to the city art centre?
[helpful] Volunteer: Yes. Start at Riverside Stop and walk with the river on your left.
[clear] Volunteer: Go past the hotel and the boat office, then continue under the bridge.
[guiding] Volunteer: At the big statue, turn right into Museum Lane.
[steady] Volunteer: Walk past the glass building and the coffee truck.
[final step] Volunteer: The city art centre is the second building on the left, opposite the theatre entrance.
[grateful] Visitor: Thank you. That is very clear.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'es', 'Ruta detallada con puntos de referencia', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description) VALUES (v_listening_id, 'de', 'Detaillierte Route mit Orientierungspunkten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
