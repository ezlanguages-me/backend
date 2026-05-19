-- ============================================================
-- Seed: A0 English Path – STEP 3220 – Listening – call emergency services
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La persona que llama pide a los bomberos.", "de": "Die anrufende Person bittet um die Feuerwehr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El fuego está en el dormitorio.", "de": "Das Feuer ist im Schlafzimmer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La dirección es Flat 6, 24 Oak Road.", "de": "Die Adresse ist Flat 6, 24 Oak Road.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El hermano está fuera y tiene tos.", "de": "Der Bruder ist draußen und hustet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La puerta principal del edificio está cerrada.", "de": "Die Haupttür des Gebäudes ist geschlossen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Están esperando al lado de la parada de autobús.", "de": "Sie warten an der Bushaltestelle.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El operador envía bomberos y una ambulancia.", "de": "Der Operator schickt Feuerwehr und einen Krankenwagen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La persona que llama no da ningún número de teléfono.", "de": "Die anrufende Person gibt keine Telefonnummer an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué servicio necesita la persona que llama?", "de": "Welchen Dienst braucht die anrufende Person?", "s_es": {"type": "multiple_choice", "options": ["Fire service", "Police", "Roadside assistance"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Feuerwehr", "Polizei", "Pannenhilfe"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué piso o vivienda está el problema?", "de": "In welcher Wohnung ist das Problem?", "s_es": {"type": "multiple_choice", "options": ["Flat 6", "Flat 3", "Flat 9"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wohnung 6", "Wohnung 3", "Wohnung 9"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué edificio está cerca de la dirección?", "de": "Welches Gebäude ist in der Nähe der Adresse?", "s_es": {"type": "multiple_choice", "options": ["The post office", "The library", "The school"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Postamt", "Die Bibliothek", "Die Schule"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién está tosiendo?", "de": "Wer hustet?", "s_es": {"type": "multiple_choice", "options": ["Her brother", "Her neighbour", "The operator"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihr Bruder", "Ihr Nachbar", "Der Operator"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué color es la puerta principal?", "de": "Welche Farbe hat die Haustür?", "s_es": {"type": "multiple_choice", "options": ["Red", "Blue", "Black"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rot", "Blau", "Schwarz"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde espera la persona que llama?", "de": "Wo wartet die anrufende Person?", "s_es": {"type": "multiple_choice", "options": ["By the bus stop", "Inside the lift", "At the post office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An der Bushaltestelle", "Im Aufzug", "Am Postamt"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ayuda adicional viene además de los bomberos?", "de": "Welche zusätzliche Hilfe kommt außer der Feuerwehr?", "s_es": {"type": "multiple_choice", "options": ["An ambulance", "A taxi", "A mechanic"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Krankenwagen", "Ein Taxi", "Ein Mechaniker"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué instrucción da el operador?", "de": "Welche Anweisung gibt der Operator?", "s_es": {"type": "multiple_choice", "options": ["Stay outside", "Open the windows", "Go back upstairs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Draußen bleiben", "Die Fenster öffnen", "Wieder nach oben gehen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3220 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3220 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3220 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3220 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3220 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3220 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3220 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3220 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3220 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3220 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3220, 'en', 'listening', 'emergency', $transcript$
# AUDIO PROFILE: Nina, a calm caller outside her flat
## "Fire Service, Please"

## THE SCENE: A small kitchen fire in a block of flats
Nina calls emergency services after smoke starts in her kitchen.
She gives the address, says who is with her, and listens carefully to the operator.

### DIRECTOR'S NOTES
Style:
* Clear emergency call with short questions and short answers.
* The address, the service, and the safety instructions are repeated for beginner learners.

Pace: Slow, calm, and careful.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise asking for emergency help, saying the address, and understanding what to do next.

#### TRANSCRIPT
[quickly] Operator: Emergency. Which service do you need?
[worried] Caller: Fire service, please. There is smoke and a small fire in my kitchen.
[clear] Operator: What is the address?
[careful] Caller: Flat 6, 24 Oak Road, near the post office.
[checking] Operator: Is anyone still inside?
[steady] Caller: No. My brother is outside with me, but he is coughing.
[practical] Operator: Is the building door open?
[helpful] Caller: Yes, the red front door is open, and we are waiting by the bus stop.
[reassuring] Operator: Stay outside. Firefighters and an ambulance are on the way.
[calmer] Caller: Thank you. My phone number is 07700 451 300.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una llamada a emergencias por un incendio en una cocina', 'Escucha cómo una persona llama a emergencias, da la dirección y sigue instrucciones simples.'),
        (v_listening_id, 'de', 'Höre einen Notruf wegen eines Küchenbrands', 'Höre, wie jemand den Notruf wählt, die Adresse nennt und einfachen Anweisungen folgt.');

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
