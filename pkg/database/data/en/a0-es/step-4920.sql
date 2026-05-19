-- ============================================================
-- Seed: A0 English Path – STEP 4920 – Listening – listen to a conference introduction (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La persona da la bienvenida a los asistentes a la conferencia.", "p_de": "Die Person begrüßt die Teilnehmenden zur Konferenz.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La primera sesión empieza a las nueve y media en la sala A.", "p_de": "Die erste Sitzung beginnt um halb zehn in Halle A.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clave del Wi-Fi está en la entrada principal.", "p_de": "Der WLAN-Code steht am Haupteingang.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las preguntas se hacen al final de cada charla.", "p_de": "Fragen werden am Ende jedes Vortrags gestellt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El café está en el vestíbulo a las once.", "p_de": "Der Kaffee ist um elf Uhr im Foyer.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La comida será a las doce y media en la cafetería.", "p_de": "Das Mittagessen ist um zwölf Uhr dreißig in der Cafeteria.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La voz dice que no hay pausas durante el día.", "p_de": "Die Stimme sagt, dass es keine Pausen gibt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La grabación es una bienvenida inicial.", "p_de": "Die Aufnahme ist eine einleitende Begrüßung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A qué evento se da la bienvenida?", "p_de": "Zu welcher Veranstaltung wird begrüßt?", "s": {"type": "multiple_choice", "options": ["The Learning and Cities Conference", "The Summer Sports Fair", "The Office Safety Meeting"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde empieza la primera sesión?", "p_de": "Wo beginnt die erste Sitzung?", "s": {"type": "multiple_choice", "options": ["In Hall A", "In Hall B", "In the cafeteria"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el código del Wi-Fi?", "p_de": "Wo ist der WLAN-Code?", "s": {"type": "multiple_choice", "options": ["On the back of the badge", "On the coffee table", "On the bus ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo deben hacerse las preguntas?", "p_de": "Wann sollen Fragen gestellt werden?", "s": {"type": "multiple_choice", "options": ["At the end of each talk", "During every slide", "Only at lunch"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde habrá café?", "p_de": "Wo gibt es Kaffee?", "s": {"type": "multiple_choice", "options": ["In the foyer", "In Room C", "At reception"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la comida?", "p_de": "Um wie viel Uhr ist das Mittagessen?", "s": {"type": "multiple_choice", "options": ["At 12:30", "At 11:00", "At 2:00"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für eine Audioaufnahme ist das?", "s": {"type": "multiple_choice", "options": ["An opening introduction", "A private phone call", "A train announcement"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo suena la persona que habla?", "p_de": "Wie klingt die sprechende Person?", "s": {"type": "multiple_choice", "options": ["Welcoming and organized", "Angry and rushed", "Confused and quiet"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4920 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 4920 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 4920, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Conference host
## THE SCENE: Opening remarks at the start of a conference day
A host welcomes participants, gives practical information, and explains how the day will work.

### DIRECTOR'S NOTES
Style:
* Warm and organized opening language.
* Practical information is grouped in clear short sentences.

Pace: Slow and welcoming.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding a welcome message, room information, Wi-Fi details, and question procedures.

#### TRANSCRIPT
[warm] Good morning, everyone, and welcome to the Learning and Cities Conference.
[clear] Our first session starts in Hall A at half past nine.
[helpful] The Wi-Fi code is on the back of your badge.
[organized] Please ask questions at the end of each talk, not during the presentation.
[friendly] Coffee is available in the foyer at eleven o'clock.
[calm] Lunch will be served in the cafeteria at twelve thirty.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Introducción a una conferencia', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Einführung in eine Konferenz', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
