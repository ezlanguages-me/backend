-- ============================================================
-- Seed: A0 English Path – STEP 5520 – Listening – follow a structured debate (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El debate trata de crear más plazas de aparcamiento en la universidad.", "p_de": "Die Debatte behandelt mehr Parkplätze an der Universität.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La primera ponente dice que muchos estudiantes trabajan y viven lejos.", "p_de": "Der erste Sprecher sagt, dass viele Studierende arbeiten und weit weg wohnen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda ponente está de acuerdo con más aparcamiento.", "p_de": "Die zweite Sprecherin stimmt mehr Parkplätzen zu.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La segunda ponente teme más tráfico y menos zonas verdes.", "p_de": "Die zweite Sprecherin befürchtet mehr Verkehr und weniger Grünflächen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La primera ponente dice que el transporte público no llega bien a todas las zonas.", "p_de": "Der erste Sprecher sagt, dass der öffentliche Verkehr nicht alle Gebiete gut erreicht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda ponente propone mejorar los autobuses.", "p_de": "Die zweite Sprecherin schlägt vor, die Busse zu verbessern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El moderador resume la discusión con dos argumentos claros.", "p_de": "Der Moderator fasst die Diskussion mit zwei klaren Argumenten zusammen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación es una sesión de feedback sobre un ensayo.", "p_de": "Die Aufnahme ist ein Feedbackgespräch zu einem Aufsatz.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuál es la pregunta central del debate?", "p_de": "Was ist die Kernfrage der Debatte?", "s": {"type": "multiple_choice", "options": ["Whether the university should create more parking spaces", "Whether the library should record lectures", "Whether the cafeteria should close earlier"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué razón da el primer ponente?", "p_de": "Welchen Grund nennt der erste Sprecher?", "s": {"type": "multiple_choice", "options": ["Many students commute from far away", "The posters are too small", "Water costs are lower in summer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema ve la segunda ponente?", "p_de": "Welches Problem sieht die zweite Sprecherin?", "s": {"type": "multiple_choice", "options": ["More traffic and less green space", "Too many quiet rooms", "Too little peer feedback"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué añade el primer ponente sobre el transporte público?", "p_de": "Was fügt der erste Sprecher über den öffentlichen Verkehr hinzu?", "s": {"type": "multiple_choice", "options": ["It does not serve every area well", "It is free for everyone", "It is always faster than cars"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué solución propone la segunda ponente?", "p_de": "Welche Lösung schlägt die zweite Sprecherin vor?", "s": {"type": "multiple_choice", "options": ["Improve buses", "Build more parking first", "Close the campus"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo resume el moderador las posiciones?", "p_de": "Wie fasst der Moderator die Positionen zusammen?", "s": {"type": "multiple_choice", "options": ["Convenience versus sustainability", "Price versus grammar", "Reading versus phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A structured debate", "A conference introduction", "A voicemail instruction"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo están organizadas las intervenciones?", "p_de": "Wie sind die Beiträge organisiert?", "s": {"type": "multiple_choice", "options": ["As a clear debate with responses", "As random jokes only", "As a single long lecture"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5520 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5520 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5520, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Moderator and two debaters
## THE SCENE: A short structured debate in class
A moderator manages a debate on parking spaces on campus.

### DIRECTOR'S NOTES
Style:
* Clear debate structure with opening, response, and closing note.
* The two sides use short arguments with one reason each.

Pace: Controlled and academic.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a structured debate and identifying each side's main point.

#### TRANSCRIPT
[formal] Moderator: Today we debate whether the university should create more parking spaces.
[supportive] Speaker 1: More parking is necessary because many students work and commute from far away.
[critical] Speaker 2: I disagree. More parking will bring more traffic and less space for green areas.
[responding] Speaker 1: But public transport does not serve every area well.
[balanced] Speaker 2: Then the university should improve buses, not build more parking.
[closing] Moderator: Thank you. We have heard a clear argument for convenience and a clear argument for sustainability.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Debate estructurado sobre aparcamiento en el campus', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Strukturierte Debatte über Campus-Parkplätze', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
