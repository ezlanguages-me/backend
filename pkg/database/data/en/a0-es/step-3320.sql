-- ============================================================
-- Seed: A0 English Path – STEP 3320 – Listening – give a report of an emergency incident / describe circumstances of a theft to the police
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La mochila fue robada fuera de West Street Café.", "de": "Der Rucksack wurde vor dem West Street Café gestohlen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El robo ocurrió por la mañana.", "de": "Der Diebstahl passierte am Morgen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "En la mochila había un portátil del trabajo, un cuaderno rojo y unas llaves.", "de": "Im Rucksack waren ein Arbeitslaptop, ein rotes Notizbuch und Schlüssel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El ladrón era un hombre alto.", "de": "Der Dieb war ein großer Mann.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La sospechosa llevaba un abrigo gris.", "de": "Die Verdächtige trug einen grauen Mantel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La sospechosa corrió hacia el río.", "de": "Die Verdächtige rannte in Richtung Fluss.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El encargado del café también la vio.", "de": "Der Café-Manager hat sie ebenfalls gesehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Rosa irá a South Police Desk dentro de diez minutos.", "de": "Rosa wird in zehn Minuten zum South Police Desk gehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué robaron?", "de": "Was wurde gestohlen?", "s_es": {"type": "multiple_choice", "options": ["A backpack", "A bicycle", "A phone"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Rucksack", "Ein Fahrrad", "Ein Telefon"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora fue aproximadamente el robo?", "de": "Um wie viel Uhr war der Diebstahl ungefähr?", "s_es": {"type": "multiple_choice", "options": ["6:15", "5:50", "7:30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["6:15", "5:50", "7:30"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué color era el cuaderno?", "de": "Welche Farbe hatte das Notizbuch?", "s_es": {"type": "multiple_choice", "options": ["Red", "Blue", "Black"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rot", "Blau", "Schwarz"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién más vio a la sospechosa?", "de": "Wer hat die Verdächtige noch gesehen?", "s_es": {"type": "multiple_choice", "options": ["The café manager", "A bus driver", "A tourist"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Café-Manager", "Ein Busfahrer", "Ein Tourist"], "answer": 0}}'::jsonb,
        '{"es": "¿Hacia dónde corrió la sospechosa?", "de": "Wohin rannte die Verdächtige?", "s_es": {"type": "multiple_choice", "options": ["Towards the river", "Towards the station", "Towards the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Richtung Fluss", "In Richtung Bahnhof", "In Richtung Parkplatz"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe llevar Rosa a la comisaría?", "de": "Was soll Rosa zur Polizeistelle mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Her ID", "Her bus ticket", "Her passport photo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihren Ausweis", "Ihr Busticket", "Ihr Passfoto"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo llegará Rosa?", "de": "Wann wird Rosa ankommen?", "s_es": {"type": "multiple_choice", "options": ["In ten minutes", "In one hour", "Tomorrow morning"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In zehn Minuten", "In einer Stunde", "Morgen früh"], "answer": 0}}'::jsonb,
        '{"es": "¿A dónde debe ir Rosa?", "de": "Wohin soll Rosa gehen?", "s_es": {"type": "multiple_choice", "options": ["South Police Desk", "West Street Café", "River Bridge"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zum South Police Desk", "Zum West Street Café", "Zur Flussbrücke"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3320 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3320 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3320 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3320 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3320 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3320 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3320 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3320 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3320 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3320 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 3320, 'en', 'listening', 'emergency', $transcript$
# AUDIO PROFILE: Rosa, reporting a theft to a police officer
## "My Backpack Was Stolen"

## THE SCENE: Outside a café in the early evening
Rosa tells an officer where the theft happened, what was in the bag, and who saw the suspect.

### DIRECTOR'S NOTES
Style:
* Short police interview with clear questions and direct answers.
* Time, place, and bag contents are easy to hear and repeat.

Pace: Slow and careful.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise describing the circumstances of a theft to the police.

#### TRANSCRIPT
[professional] Officer: Please tell me what happened.
[upset but clear] Rosa: My backpack was stolen outside West Street Café at about 6:15 this evening.
[checking] Officer: What was in the bag?
[steady] Rosa: My work laptop, a red notebook, and my keys.
[direct] Officer: Did you see the thief?
[careful] Rosa: Yes. A tall woman in a grey coat took it and ran towards the river.
[helpful] Officer: Did anyone else see her?
[remembering] Rosa: Yes, the café manager saw her and wrote down the time.
[clear] Officer: Please come to South Police Desk with your ID.
[ready] Rosa: I can be there in ten minutes.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha una denuncia de robo a la policía', 'Escucha cómo una persona explica un robo, los objetos perdidos y la dirección del sospechoso.'),
        (v_listening_id, 'de', 'Höre eine Diebstahlmeldung bei der Polizei', 'Höre, wie eine Person einen Diebstahl, die verlorenen Gegenstände und die Laufrichtung des Verdächtigen beschreibt.');

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
