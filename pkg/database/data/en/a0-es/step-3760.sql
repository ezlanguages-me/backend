-- ============================================================
-- Seed: A0 English Path – STEP 3760 – Listening – listen to entertainment listings (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El concierto de jazz es a las 8:30 PM.", "p_de": "Das Jazzkonzert ist um 20:30 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La comedy show es en el Blue Room.", "p_de": "Die Comedyshow ist im Blue Room.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cine River Lights tiene dos sesiones.", "p_de": "Das River Lights Cinema hat zwei Vorstellungen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La primera sesión del cine es a las 5:15 PM.", "p_de": "Die erste Kinovorstellung ist um 17:15 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La street dance es de pago.", "p_de": "Der Straßentanz kostet Eintritt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La street dance es a las 6 PM en Central Square.", "p_de": "Der Straßentanz ist um 18 Uhr am Central Square.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se pueden reservar entradas online.", "p_de": "Man kann Tickets online buchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El número de teléfono es 555-0910.", "p_de": "Die Telefonnummer ist 555-0910.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde es el concierto de jazz?", "p_de": "Wo ist das Jazzkonzert?", "s_es": {"type": "multiple_choice", "options": ["At the Blue Room", "In Town Hall", "At the cinema"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Blue Room", "In der Town Hall", "Im Kino"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora empieza la comedy show?", "p_de": "Um wie viel Uhr beginnt die Comedyshow?", "s_es": {"type": "multiple_choice", "options": ["7 PM", "6 PM", "8:45 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["19 Uhr", "18 Uhr", "20:45 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas sesiones tiene el River Lights Cinema?", "p_de": "Wie viele Vorstellungen hat das River Lights Cinema?", "s_es": {"type": "multiple_choice", "options": ["Two", "One", "Three"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Eine", "Drei"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la segunda sesión del cine?", "p_de": "Um wie viel Uhr ist die zweite Kinovorstellung?", "s_es": {"type": "multiple_choice", "options": ["8:45 PM", "5:15 PM", "7 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20:45 Uhr", "17:15 Uhr", "19 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué actividad es gratis?", "p_de": "Welche Aktivität ist kostenlos?", "s_es": {"type": "multiple_choice", "options": ["Street dance", "The jazz concert", "The cinema"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Straßentanz", "Das Jazzkonzert", "Das Kino"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es la street dance?", "p_de": "Wo ist der Straßentanz?", "s_es": {"type": "multiple_choice", "options": ["In Central Square", "At Town Hall", "At Blue Room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Central Square", "In der Town Hall", "Im Blue Room"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número se usa para las entradas?", "p_de": "Welche Nummer benutzt man für Tickets?", "s_es": {"type": "multiple_choice", "options": ["555-0190", "555-0910", "555-1900"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["555-0190", "555-0910", "555-1900"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo más se pueden comprar las entradas?", "p_de": "Wie kann man Tickets sonst noch kaufen?", "s_es": {"type": "multiple_choice", "options": ["Online", "At the airport", "Only by post"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Online", "Am Flughafen", "Nur per Post"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3760 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3760 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3760, 'en', 'listening', 'tourism', $transcript$
# AUDIO PROFILE: Mia, a local radio host reading evening listings
## "Tonight in River City"

## THE SCENE: A short entertainment bulletin on local radio
Mia lists the main events for the evening and repeats times and prices clearly.

### DIRECTOR'S NOTES
Style:
* Radio-announcer tone with clear times and places.
* Each listing is short and easy to note down.

Pace: Steady and clear.

Accent: Neutral accent.

#### TRANSCRIPT
[bright] Host: Here are tonight's entertainment listings for River City.
[informative] Host: The jazz concert starts at 8:30 PM at the Blue Room.
[clear] Host: The comedy show is at 7 PM in Town Hall.
[friendly] Host: River Lights Cinema has two screenings, at 5:15 PM and 8:45 PM.
[cheerful] Host: There is free street dance in Central Square at 6 PM.
[practical] Host: For tickets, call 555-0190 or book online.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha la agenda de ocio', 'Escucha una agenda de radio con conciertos, cine, humor y danza.'),
            (v_listening_id, 'de', 'Höre Veranstaltungshinweise', 'Höre eine Radioliste mit Konzert, Kino, Comedy und Tanz.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
