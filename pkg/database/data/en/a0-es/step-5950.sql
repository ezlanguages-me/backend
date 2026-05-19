-- ============================================================
-- Seed: A0 English Path – STEP 5950 – Listening – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El gimnasio está en la tercera planta.", "de": "Der Fitnessraum ist im dritten Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El gimnasio abre a las 6 AM.", "de": "Der Fitnessraum öffnet um 6 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La piscina está en la segunda planta.", "de": "Der Pool ist im zweiten Stock.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La piscina abre a las 8 AM.", "de": "Der Pool öffnet um 8 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se pueden pedir toallas en recepción.", "de": "Man kann an der Rezeption Handtücher bekommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El salón está en la planta baja.", "de": "Die Lounge ist im Erdgeschoss.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las bebidas calientes son gratis todo el día.", "de": "Heiße Getränke sind den ganzen Tag kostenlos.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La lavandería está junto al ascensor.", "de": "Der Waschraum ist neben dem Aufzug.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿En qué planta está el gimnasio?", "de": "In welchem Stock ist der Fitnessraum?", "s_es": {"type": "multiple_choice", "options": ["Third floor", "First floor", "Ground floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dritter Stock", "Erster Stock", "Erdgeschoss"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora abre la piscina?", "de": "Wann öffnet der Pool?", "s_es": {"type": "multiple_choice", "options": ["8 AM", "6 AM", "10 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8 Uhr", "6 Uhr", "10 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se pueden pedir toallas?", "de": "Wo kann man Handtücher anfragen?", "s_es": {"type": "multiple_choice", "options": ["Reception", "Gym", "Laundry room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rezeption", "Fitnessraum", "Waschraum"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el salón?", "de": "Wo ist die Lounge?", "s_es": {"type": "multiple_choice", "options": ["Ground floor", "Third floor", "First floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Erdgeschoss", "Dritter Stock", "Erster Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo son gratis las bebidas calientes?", "de": "Wann sind heiße Getränke kostenlos?", "s_es": {"type": "multiple_choice", "options": ["4 PM to 6 PM", "8 AM to 10 AM", "6 AM to 8 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["16 bis 18 Uhr", "8 bis 10 Uhr", "6 bis 8 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué está junto al ascensor?", "de": "Was steht neben dem Aufzug?", "s_es": {"type": "multiple_choice", "options": ["Laundry room", "Pool", "Restaurant"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Waschraum", "Pool", "Restaurant"], "answer": 0}}'::jsonb,
        '{"es": "¿La guía menciona el gimnasio primero?", "de": "Nennt die Führung zuerst den Fitnessraum?", "s_es": {"type": "multiple_choice", "options": ["Yes", "No", "Only later"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur später"], "answer": 0}}'::jsonb,
        '{"es": "¿El huésped pregunta por las toallas?", "de": "Fragt der Gast nach Handtüchern?", "s_es": {"type": "multiple_choice", "options": ["Yes", "No", "Maybe"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Vielleicht"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5950 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5950 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5950, 'en', 'listening', 'Alojamiento', $transcript$
# AUDIO PROFILE: Sophie, a hotel facilities guide
## "Tour of the Hotel"

## THE SCENE: A short walk through the hotel
A guest is shown the gym, pool, lounge, and laundry room.
Sophie gives clear directions and repeats the opening hours.

### DIRECTOR'S NOTES
Style:
* Cheerful but controlled hotel-tour voice.
* Numbers, floors, and times are repeated clearly.

Pace: Slow to medium, with short pauses before directions.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear a simple tour of a hotel and basic explanations of facilities.
The audio focuses on places, opening times, and guest services.

#### TRANSCRIPT
[welcoming] Staff: This way to the gym. It is on the third floor.
[clear] Staff: The gym opens at 6 AM.
[practical] Guest: And where is the pool?
[clear] Staff: The pool is on the first floor and opens at 8 AM.
[helpful] Guest: Can I get towels here?
[clear] Staff: Yes. Ask reception for extra towels.
[practical] Guest: Is there a place to sit and have a drink?
[clear] Staff: Yes. The lounge is on the ground floor, and hot drinks are free from 4 PM to 6 PM.
[closing] Staff: The laundry room is next to the lift.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha el recorrido por las instalaciones del hotel', 'Escucha a una empleada que enseña la piscina, el gimnasio y el salón del hotel.'),
        (v_listening_id, 'de', 'Höre den Rundgang durch die Hoteleinrichtungen', 'Höre eine Mitarbeiterin, die Pool, Fitnessraum und Lounge des Hotels zeigt.');

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

