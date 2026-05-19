-- ============================================================
-- Seed: A0 English Path – STEP 3260 – Listening – listen to safety announcements
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hay humo cerca del Café 2.", "de": "Es gibt Rauch in der Nähe von Café 2.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los pasajeros deben quedarse en la sala de espera.", "de": "Die Fahrgäste sollen in der Wartehalle bleiben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La salida correcta es Exit C.", "de": "Der richtige Ausgang ist Exit C.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El anuncio dice que se use el ascensor.", "de": "In der Durchsage heißt es, man soll den Aufzug benutzen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los padres deben llevar a los niños con ellos.", "de": "Eltern sollen die Kinder bei sich behalten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mesa de información está fuera de Exit C.", "de": "Der Informationsschalter ist außerhalb von Exit C.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los autobuses 14 y 18 paran ahora en Queen Street.", "de": "Die Busse 14 und 18 halten jetzt in Queen Street.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los empleados llevan chaquetas amarillas.", "de": "Die Mitarbeitenden tragen gelbe Jacken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tipo de mensaje es?", "de": "Was für eine Nachricht ist das?", "s_es": {"type": "multiple_choice", "options": ["A safety announcement", "A weather report", "A shop advert"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Sicherheitsdurchsage", "Ein Wetterbericht", "Eine Ladenwerbung"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué causa el anuncio?", "de": "Was ist der Grund für die Durchsage?", "s_es": {"type": "multiple_choice", "options": ["Smoke near Café 2", "A lost bag", "A late bus"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rauch in der Nähe von Café 2", "Eine verlorene Tasche", "Ein verspäteter Bus"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué salida usan los pasajeros?", "de": "Welchen Ausgang benutzen die Fahrgäste?", "s_es": {"type": "multiple_choice", "options": ["Exit C", "Exit A", "Exit D"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ausgang C", "Ausgang A", "Ausgang D"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están las escaleras?", "de": "Wo ist die Treppe?", "s_es": {"type": "multiple_choice", "options": ["On the left side", "On the right side", "Behind the cafe"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf der linken Seite", "Auf der rechten Seite", "Hinter dem Café"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde va una persona que necesita ayuda?", "de": "Wohin geht eine Person, die Hilfe braucht?", "s_es": {"type": "multiple_choice", "options": ["To the information desk outside Exit C", "To the ticket machine", "To the cafe"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zum Informationsschalter außerhalb von Ausgang C", "Zum Fahrkartenautomaten", "Zum Café"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué autobuses tienen una nueva parada?", "de": "Welche Busse haben jetzt einen neuen Halt?", "s_es": {"type": "multiple_choice", "options": ["14 and 18", "4 and 8", "11 and 16"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["14 und 18", "4 und 8", "11 und 16"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué deben llevar siempre con ellos los pasajeros?", "de": "Was sollen die Fahrgäste immer bei sich behalten?", "s_es": {"type": "multiple_choice", "options": ["Their ticket and bag", "Their umbrella and hat", "Their coffee and newspaper"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihr Ticket und ihre Tasche", "Ihren Regenschirm und Hut", "Ihren Kaffee und die Zeitung"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién revisa la zona antes de abrir otra vez?", "de": "Wer kontrolliert den Bereich, bevor er wieder geöffnet wird?", "s_es": {"type": "multiple_choice", "options": ["Firefighters", "Bus drivers", "Cleaners"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Feuerwehr", "Die Busfahrer", "Die Reinigungskräfte"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3260 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3260 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3260 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3260 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3260 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3260 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3260 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3260 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3260 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3260 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3260, 'en', 'listening', 'emergency', $transcript$
# AUDIO PROFILE: A station announcer over the loudspeaker
## "Please Leave the Waiting Hall"

## THE SCENE: A bus station after smoke appears near a café
Passengers hear a safety message that tells them where to go and what not to do.
The announcement is repeated slowly so everyone can follow it.

### DIRECTOR'S NOTES
Style:
* Public announcement with short, direct instructions.
* Key places and numbers are repeated for beginner learners.

Pace: Slow, formal, and very clear.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding safety announcements in public places.

#### TRANSCRIPT
[clear speaker] Announcer: Attention please. This is a safety announcement for all passengers in the East Bus Station.
[steady] Announcer: Because of smoke near Café 2, please leave the waiting hall now.
[firm] Announcer: Use Exit C and follow the staff in yellow jackets.
[careful] Announcer: Do not use the lift. Use the stairs on the left side.
[gentle] Announcer: Parents, keep children with you.
[helpful] Announcer: If you need help, go to the information desk outside Exit C.
[practical] Announcer: Buses 14 and 18 now stop on King Street.
[reminding] Announcer: Keep your ticket and bag with you at all times.
[official] Announcer: The hall stays closed until firefighters check the area.
[closing] Announcer: Thank you for your calm help.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha un anuncio de seguridad en una estación de autobuses', 'Escucha un anuncio público con salidas, personal de ayuda y nuevas paradas.'),
        (v_listening_id, 'de', 'Höre eine Sicherheitsdurchsage in einem Busbahnhof', 'Höre eine öffentliche Durchsage mit Ausgängen, Hilfspersonal und neuen Haltepunkten.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
