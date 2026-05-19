-- ============================================================
-- Seed: A0 English Path – STEP 3660 – Listening – listen to hotel facilities description (Alojamiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El gimnasio está en el Level 1.", "p_de": "Das Fitnessstudio ist auf Level 1.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gimnasio abre de 6 AM a 10 PM.", "p_de": "Das Fitnessstudio ist von 6 Uhr bis 22 Uhr geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La piscina está dentro del edificio.", "p_de": "Der Pool ist im Gebäude.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La piscina abre de 8 AM a 8 PM.", "p_de": "Der Pool ist von 8 Uhr bis 20 Uhr geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El desayuno termina a las 10:30 AM.", "p_de": "Das Frühstück endet um 10:30 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lavandería solo devuelve la ropa al día siguiente.", "p_de": "Die Wäscherei gibt die Kleidung nur am nächsten Tag zurück.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El rooftop bar está cerrado los lunes.", "p_de": "Die Dachbar ist montags geschlossen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La childrens room está lejos del lobby.", "p_de": "Das Kinderzimmer ist weit von der Lobby entfernt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde está el gimnasio?", "p_de": "Wo ist das Fitnessstudio?", "s_es": {"type": "multiple_choice", "options": ["On Level 1", "On the roof", "Next to the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf Level 1", "Auf dem Dach", "Neben dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo abre la piscina?", "p_de": "Wann öffnet der Pool?", "s_es": {"type": "multiple_choice", "options": ["At 8 AM", "At 6 AM", "At 10:30 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 8 Uhr", "Um 6 Uhr", "Um 10:30 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se sirve el desayuno?", "p_de": "Wo wird das Frühstück serviert?", "s_es": {"type": "multiple_choice", "options": ["In the dining room", "At the pool bar", "In the lobby"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Speisesaal", "An der Poolbar", "In der Lobby"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa si dejas la ropa antes de las 9 AM?", "p_de": "Was passiert, wenn du die Wäsche vor 9 Uhr abgibst?", "s_es": {"type": "multiple_choice", "options": ["You get it back the same day", "You pay double", "You collect it at the airport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Du bekommst sie am selben Tag zurück", "Du zahlst doppelt", "Du holst sie am Flughafen ab"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bar está cerrado los lunes?", "p_de": "Welche Bar ist montags geschlossen?", "s_es": {"type": "multiple_choice", "options": ["The rooftop bar", "The beach bar", "The coffee bar"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Dachbar", "Die Strandbar", "Die Kaffeebar"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sala está junto al lobby?", "p_de": "Welcher Raum ist neben der Lobby?", "s_es": {"type": "multiple_choice", "options": ["The childrens room", "The gym", "The laundry room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Kinderzimmer", "Das Fitnessstudio", "Der Waschraum"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta qué hora abre el gimnasio?", "p_de": "Bis wann ist das Fitnessstudio geöffnet?", "s_es": {"type": "multiple_choice", "options": ["10 PM", "8 PM", "9 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["22 Uhr", "20 Uhr", "9 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la piscina?", "p_de": "Wo ist der Pool?", "s_es": {"type": "multiple_choice", "options": ["Outside", "On Level 1", "In the basement"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Draußen", "Auf Level 1", "Im Keller"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM listening WHERE step_order = 3660 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening'
        );
        DELETE FROM listening WHERE step_order = 3660 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3660, 'en', 'listening', 'accommodation', $transcript$
# AUDIO PROFILE: Sara, a receptionist giving practical hotel information
## "Facilities at the Grand Palm"

## THE SCENE: A guest asks what the hotel offers
Sara describes the main areas and their opening times.

### DIRECTOR'S NOTES
Style:
* Clear list-style explanation with repeated places and times.
* Simple sentences for hotel services and locations.

Pace: Slow and organised.

Accent: Neutral accent.

#### TRANSCRIPT
[friendly] Receptionist: Here is some information about the hotel.
[clear] Receptionist: The gym is on Level 1 and opens from 6 AM to 10 PM.
[informative] Receptionist: The pool is outside and is open from 8 AM to 8 PM.
[helpful] Receptionist: Breakfast is in the dining room from 7 AM to 10:30 AM.
[practical] Receptionist: If you leave laundry before 9 AM, you get it back the same day.
[clear] Receptionist: The rooftop bar is closed on Monday.
[warm] Receptionist: The children's room is next to the lobby.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una descripción de las instalaciones del hotel', 'Escucha información sobre gimnasio, piscina, desayuno, lavandería y otras zonas del hotel.'),
            (v_listening_id, 'de', 'Höre eine Beschreibung der Hoteleinrichtungen', 'Höre Informationen zu Fitnessraum, Pool, Frühstück, Wäscherei und anderen Hotelbereichen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
