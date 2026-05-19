-- ============================================================
-- Seed: A0 English Path – STEP 5120 – Listening – follow academic debate (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El tema del debate son los exámenes en línea.", "p_de": "Das Thema der Debatte sind Online-Prüfungen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El primer ponente dice que ahorran tiempo de viaje.", "p_de": "Der erste Sprecher sagt, dass sie Reisezeit sparen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda ponente cree que los problemas técnicos no importan.", "p_de": "Die zweite Sprecherin glaubt, dass technische Probleme nicht wichtig sind.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El primer ponente dice que ayudan a estudiantes que viven lejos del campus.", "p_de": "Der erste Sprecher sagt, dass sie Studierenden mit langem Weg helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda ponente prefiere exámenes presenciales por la justicia y la supervisión.", "p_de": "Die zweite Sprecherin bevorzugt Präsenzprüfungen wegen Fairness und Aufsicht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El moderador dice que la encuesta se abre mañana.", "p_de": "Der Moderator sagt, dass die Umfrage morgen öffnet.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La grabación presenta opiniones contrastadas.", "p_de": "Die Aufnahme zeigt gegensätzliche Meinungen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El debate trata de horarios de biblioteca.", "p_de": "Die Debatte handelt von Bibliothekszeiten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Sobre qué tema debaten?", "p_de": "Worüber debattieren sie?", "s": {"type": "multiple_choice", "options": ["Online exams at university", "A bicycle survey", "Conference room prices"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ventaja menciona el primer ponente?", "p_de": "Welchen Vorteil nennt der erste Sprecher?", "s": {"type": "multiple_choice", "options": ["They save travel time", "They make lunch cheaper", "They improve phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema menciona la segunda ponente?", "p_de": "Welches Problem nennt die zweite Sprecherin?", "s": {"type": "multiple_choice", "options": ["Technical problems", "Too much rain", "No books in the library"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién ayudan los exámenes en línea según el primer ponente?", "p_de": "Wem helfen Online-Prüfungen laut dem ersten Sprecher?", "s": {"type": "multiple_choice", "options": ["Students far from campus", "Only teachers in offices", "Only hotel guests"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué prefiere la segunda ponente los exámenes presenciales?", "p_de": "Warum bevorzugt die zweite Sprecherin Präsenzprüfungen?", "s": {"type": "multiple_choice", "options": ["For fairness and supervision", "For free coffee", "For shorter weekends"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué anuncia el moderador al final?", "p_de": "Was kündigt der Moderator am Ende an?", "s": {"type": "multiple_choice", "options": ["A class survey next month", "A new printer delivery today", "A train strike tomorrow"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["An academic debate", "A voicemail message", "A work complaint"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo organiza el moderador el debate?", "p_de": "Wie organisiert der Moderator die Debatte?", "s": {"type": "multiple_choice", "options": ["With simple opening and closing remarks", "By asking for invoice numbers", "By reading a phone protocol"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5120 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5120 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5120, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Moderator and two speakers
## THE SCENE: A short academic debate
Two speakers present different opinions about online exams in a class debate.

### DIRECTOR'S NOTES
Style:
* Clear contrast between two positions.
* The moderator frames the points in simple debate language.

Pace: Moderate with short turns.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following contrasting arguments, advantages, problems, and a moderated ending.

#### TRANSCRIPT
[formal] Moderator: Today we discuss online exams at university.
[supportive] Speaker 1: Online exams are flexible and save travel time for many students.
[cautious] Speaker 2: But they also bring technical problems and make cheating harder to control.
[practical] Speaker 1: They are useful for students who live far from campus.
[critical] Speaker 2: In-person exams are better for fairness and clear supervision.
[closing] Moderator: Thank you. The class survey on this question will open next month.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Debate académico sobre exámenes en línea', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Akademische Debatte über Online-Prüfungen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
