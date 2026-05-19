-- ============================================================
-- Seed: A0 English Path – STEP 3080 – Listening – get basic driving directions
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El conductor quiere ir al aparcamiento de Green Beach.", "de": "Der Fahrer möchte zum Parkplatz von Green Beach fahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Debe seguir recto durante dos millas.", "de": "Er soll zwei Meilen geradeaus fahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En la primera rotonda debe tomar la tercera salida.", "de": "Am ersten Kreisverkehr soll er die dritte Ausfahrt nehmen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Debe girar a la izquierda en los semáforos.", "de": "Er soll an der Ampel links abbiegen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El aparcamiento está a la izquierda del supermercado.", "de": "Der Parkplatz ist links vom Supermarkt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El aparcamiento está después del supermercado grande.", "de": "Der Parkplatz ist nach dem großen Supermarkt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Si llega al túnel, ha ido demasiado lejos.", "de": "Wenn er den Tunnel erreicht, ist er zu weit gefahren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las indicaciones las da un conductor de autobús.", "de": "Die Wegbeschreibung gibt ein Busfahrer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Adónde quiere ir el conductor?", "de": "Wohin möchte der Fahrer fahren?", "s_es": {"type": "multiple_choice", "options": ["To Green Beach car park", "To the museum", "To the airport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zum Parkplatz von Green Beach", "Zum Museum", "Zum Flughafen"], "answer": 0}}'::jsonb,
        '{"es": "¿Desde dónde sale?", "de": "Von wo fährt er los?", "s_es": {"type": "multiple_choice", "options": ["From the petrol station", "From the museum", "From the tunnel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von der Tankstelle", "Vom Museum", "Vom Tunnel"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué salida toma en la primera rotonda?", "de": "Welche Ausfahrt nimmt er im ersten Kreisverkehr?", "s_es": {"type": "multiple_choice", "options": ["The second exit", "The first exit", "The fourth exit"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die zweite Ausfahrt", "Die erste Ausfahrt", "Die vierte Ausfahrt"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace después del puente pequeño?", "de": "Was macht er nach der kleinen Brücke?", "s_es": {"type": "multiple_choice", "options": ["He turns left at the traffic lights", "He stops at a hotel", "He turns right at the school"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er biegt an der Ampel links ab", "Er hält an einem Hotel", "Er biegt an der Schule rechts ab"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué señales debe seguir?", "de": "Welchen Schildern soll er folgen?", "s_es": {"type": "multiple_choice", "options": ["The signs to Green Beach", "The signs to the station", "The signs to the hospital"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Schildern nach Green Beach", "Den Schildern zum Bahnhof", "Den Schildern zum Krankenhaus"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el aparcamiento?", "de": "Wo ist der Parkplatz?", "s_es": {"type": "multiple_choice", "options": ["On the right, after the big supermarket", "On the left, before the bridge", "Under the tunnel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rechts, nach dem großen Supermarkt", "Links, vor der Brücke", "Unter dem Tunnel"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significa llegar al túnel?", "de": "Was bedeutet es, wenn er den Tunnel erreicht?", "s_es": {"type": "multiple_choice", "options": ["He has gone too far", "He is at the beach", "He must buy petrol"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er ist zu weit gefahren", "Er ist am Strand", "Er muss Benzin kaufen"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién da las indicaciones?", "de": "Wer gibt die Wegbeschreibung?", "s_es": {"type": "multiple_choice", "options": ["A petrol station worker", "A police officer", "A teacher"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Mitarbeiter der Tankstelle", "Ein Polizist", "Ein Lehrer"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3080 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 3080 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3080, 'en', 'listening', 'transport', $transcript$
# AUDIO PROFILE: Sam, a petrol station worker
## "Drive to Green Beach Car Park"

## THE SCENE: A driver asks for help at a petrol station
The driver needs simple directions to a beach car park.
Sam gives short road instructions with one warning at the end.

### DIRECTOR'S NOTES
Style:
* Very short driving directions with clear landmarks.
* Repetition of left, right, roundabout, and too far.

Pace: Slow and steady.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise basic driving directions from one place to another.
The recording focuses on road landmarks and a simple correction point.

#### TRANSCRIPT
[polite] Driver: Excuse me, how do I drive to Green Beach car park?
[helpful] Worker: Leave the petrol station and go straight for two miles.
[clear] Worker: At the first roundabout, take the second exit.
[steady] Worker: Drive over the small bridge and turn left at the traffic lights.
[clear] Worker: Follow the signs to Green Beach.
[informative] Worker: The car park is on the right, after the big supermarket.
[warning] Worker: If you reach the tunnel, you have gone too far.
[grateful] Driver: Great, thank you.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha indicaciones básicas para ir en coche', 'Escucha una ruta sencilla hasta un aparcamiento de playa con rotonda, puente, semáforos y referencia final.'),
        (v_listening_id, 'de', 'Höre einfache Wegbeschreibungen zum Fahren', 'Höre eine einfache Route zu einem Strandparkplatz mit Kreisverkehr, Brücke, Ampel und letzter Orientierung.');

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
