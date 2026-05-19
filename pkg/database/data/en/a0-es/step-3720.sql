-- ============================================================
-- Seed: A0 English Path – STEP 3720 – Listening – listen to a guided tour (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La visita empieza en la main gate.", "p_de": "Die Führung beginnt am main gate.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La visita termina en el aparcamiento.", "p_de": "Die Führung endet auf dem Parkplatz.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El primer espacio es la old kitchen.", "p_de": "Der erste Raum ist die old kitchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La escalera es ancha y rápida.", "p_de": "Die Treppe ist breit und schnell.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se pueden hacer fotos sin flash.", "p_de": "Man darf ohne Blitz fotografieren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay una parada de quince minutos en el jardín a las 11 AM.", "p_de": "Es gibt um 11 Uhr einen fünfzehnminütigen Halt im Garten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tienda está cerrada después de la visita.", "p_de": "Der Laden ist nach der Führung geschlossen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que quedarse con el grupo.", "p_de": "Man soll bei der Gruppe bleiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Dónde empieza la visita?", "p_de": "Wo beginnt die Führung?", "s_es": {"type": "multiple_choice", "options": ["At the main gate", "At the gift shop", "At the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am main gate", "Im Souvenirladen", "Auf dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde termina la visita?", "p_de": "Wo endet die Führung?", "s_es": {"type": "multiple_choice", "options": ["In the garden", "In the kitchen", "At reception"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Garten", "In der Küche", "Am Empfang"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la primera sala?", "p_de": "Welcher Raum kommt zuerst?", "s_es": {"type": "multiple_choice", "options": ["The old kitchen", "The tower room", "The library"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die old kitchen", "Der Turmraum", "Die Bibliothek"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la escalera?", "p_de": "Wie ist die Treppe?", "s_es": {"type": "multiple_choice", "options": ["Narrow", "Very wide", "Closed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schmal", "Sehr breit", "Geschlossen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no se puede usar al hacer fotos?", "p_de": "Was darf man beim Fotografieren nicht benutzen?", "s_es": {"type": "multiple_choice", "options": ["Flash", "A phone", "A ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blitz", "Ein Handy", "Ein Ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la parada en el jardín?", "p_de": "Wie lange dauert der Halt im Garten?", "s_es": {"type": "multiple_choice", "options": ["Fifteen minutes", "Five minutes", "Thirty minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfzehn Minuten", "Fünf Minuten", "Dreißig Minuten"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la parada en el jardín?", "p_de": "Um wie viel Uhr ist der Halt im Garten?", "s_es": {"type": "multiple_choice", "options": ["11 AM", "10 AM", "12 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["11 Uhr", "10 Uhr", "12 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la gift shop?", "p_de": "Wo ist der Souvenirladen?", "s_es": {"type": "multiple_choice", "options": ["Near the exit", "Inside the garden", "On the roof"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nahe dem Ausgang", "Im Garten", "Auf dem Dach"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3720 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3720 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3720, 'en', 'listening', 'tourism', $transcript$
# AUDIO PROFILE: Thomas, a museum guide leading a small group
## "A Short Tour of Stone Castle"

## THE SCENE: Visitors start a guided tour in an old castle
Thomas explains the route, the rules, and one stop during the visit.

### DIRECTOR'S NOTES
Style:
* Calm guide voice with short instructions and place names.
* Safety and route information are repeated clearly.

Pace: Slow and steady.

Accent: Neutral accent.

#### TRANSCRIPT
[welcoming] Guide: Welcome to Stone Castle. The tour starts at the main gate and finishes in the garden.
[clear] Guide: Please stay with the group.
[informative] Guide: The first room today is the old kitchen.
[careful] Guide: The staircase is narrow, so walk slowly and use the right side.
[polite] Guide: Photos are fine, but please do not use flash.
[friendly] Guide: We stop in the garden for fifteen minutes at 11 AM.
[helpful] Guide: After the tour, the gift shop is open near the exit.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una visita guiada', 'Escucha las indicaciones básicas de un guía en un castillo o museo.'),
            (v_listening_id, 'de', 'Höre eine Führung', 'Höre die grundlegenden Hinweise eines Guides in einem Schloss oder Museum.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
