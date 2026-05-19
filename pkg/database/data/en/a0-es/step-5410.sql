-- ============================================================
-- Seed: A0 English Path – STEP 5410 – Listening – listen to opening statements (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El panel trata de vivienda estudiantil y transporte.", "p_de": "Das Panel handelt von studentischem Wohnen und Verkehr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Cada ponente tiene dos minutos para su declaración inicial.", "p_de": "Jede Person hat zwei Minuten für ihr Eröffnungsstatement.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La primera ponente vive fuera del campus.", "p_de": "Die erste Sprecherin lebt außerhalb des Campus.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La primera ponente cree que la ubicación es la mayor ventaja.", "p_de": "Die erste Sprecherin denkt, dass die Lage der größte Vorteil ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda ponente valora más el alquiler bajo que el tiempo de viaje corto.", "p_de": "Die zweite Sprecherin bewertet niedrige Miete höher als kurze Fahrzeit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las preguntas del público se hacen antes de las declaraciones iniciales.", "p_de": "Publikumsfragen werden vor den Eröffnungsstatements gestellt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El moderador pide una discusión respetuosa.", "p_de": "Der Moderator bittet um eine respektvolle Diskussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación corresponde al inicio de un panel.", "p_de": "Die Aufnahme gehört zum Beginn eines Panels.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Sobre qué es el panel?", "p_de": "Worüber geht das Panel?", "s": {"type": "multiple_choice", "options": ["Student housing and transport", "Urban gardens and water", "Office phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto tiempo tiene cada ponente al principio?", "p_de": "Wie viel Zeit hat jede Person am Anfang?", "s": {"type": "multiple_choice", "options": ["Two minutes", "Ten minutes", "Thirty seconds"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde vive la primera ponente?", "p_de": "Wo lebt die erste Sprecherin?", "s": {"type": "multiple_choice", "options": ["On campus", "Off campus", "In the library"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué considera más importante la segunda ponente?", "p_de": "Was hält die zweite Sprecherin für wichtiger?", "s": {"type": "multiple_choice", "options": ["Lower rent", "Short travel time", "Poster design"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se harán las preguntas del público?", "p_de": "Wann werden die Publikumsfragen gestellt?", "s": {"type": "multiple_choice", "options": ["After both opening statements", "Before the panel starts", "During the first sentence"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide el moderador sobre la discusión?", "p_de": "Was verlangt der Moderator für die Diskussion?", "s": {"type": "multiple_choice", "options": ["That it stay respectful and focused", "That it move to phone problems", "That nobody takes notes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["Opening statements in a panel", "Peer feedback on slides", "A research methodology lecture"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la posición de la primera ponente?", "p_de": "Was ist die Position der ersten Sprecherin?", "s": {"type": "multiple_choice", "options": ["Location is the biggest advantage", "Rent is the only issue", "Transport does not matter"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5410 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5410 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5410, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Moderator and panelists
## THE SCENE: Opening statements at the start of a panel discussion
A moderator opens a short panel on student housing and invites two speakers to give initial views.

### DIRECTOR'S NOTES
Style:
* Formal panel language with short opening statements.
* Each speaker gives one clear starting position.

Pace: Moderate and controlled.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following the opening stage of a panel discussion and identifying each speaker's position.

#### TRANSCRIPT
[formal] Moderator: Welcome to our panel on student housing and transport.
[organized] Moderator: Each speaker has two minutes for an opening statement.
[clear] Speaker 1: I live on campus, and I think location is the biggest advantage for students.
[measured] Speaker 2: I live off campus, and for me, lower rent is more important than short travel time.
[guiding] Moderator: Thank you. We will take audience questions after both opening statements.
[closing] Moderator: Please keep the discussion respectful and focused on the topic.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Escuchar declaraciones iniciales', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Eröffnungsstatements anhören', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
