-- ============================================================
-- Seed: A0 English Path – STEP 5490 – Listening – listen to contrasting opinions (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La primera estudiante apoya las grabaciones para repasar ideas difíciles.", "p_de": "Die erste Studentin unterstützt Aufzeichnungen zum Wiederholen schwieriger Ideen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda estudiante está totalmente de acuerdo con ella.", "p_de": "Die zweite Studentin ist völlig mit ihr einverstanden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La primera estudiante dice que las grabaciones ayudan a enfermos o a quienes viven lejos.", "p_de": "Die erste Studentin sagt, dass Aufzeichnungen Kranken oder weit entfernt Wohnenden helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda estudiante piensa que la discusión en el aula sigue siendo importante.", "p_de": "Die zweite Studentin denkt, dass die Diskussion im Raum weiterhin wichtig ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Al final las dos aceptan la idea de vídeos resumen cortos.", "p_de": "Am Ende akzeptieren beide die Idee kurzer Zusammenfassungsvideos.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conversación trata de ampliar la cafetería.", "p_de": "Das Gespräch handelt von der Erweiterung der Cafeteria.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las dos voces presentan opiniones contrastadas.", "p_de": "Beide Stimmen zeigen gegensätzliche Meinungen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación termina con una opción intermedia.", "p_de": "Die Aufnahme endet mit einer Zwischenlösung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué apoya las grabaciones la primera estudiante?", "p_de": "Warum unterstützt die erste Studentin Aufzeichnungen?", "s": {"type": "multiple_choice", "options": ["To review difficult ideas later", "To avoid reading articles", "To shorten lunch breaks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema ve la segunda estudiante?", "p_de": "Welches Problem sieht die zweite Studentin?", "s": {"type": "multiple_choice", "options": ["Some students may stop coming to class", "The quiet room is too small", "The bins are in the wrong place"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién ayudan también las grabaciones?", "p_de": "Wem helfen Aufzeichnungen außerdem?", "s": {"type": "multiple_choice", "options": ["Students who are sick or live far away", "Only the moderator", "Only people in the cafe"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sigue siendo importante según la segunda estudiante?", "p_de": "Was bleibt laut der zweiten Studentin wichtig?", "s": {"type": "multiple_choice", "options": ["Discussion in the room", "Phone calls after class", "Daily parking reports"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué idea intermedia aparece?", "p_de": "Welche Zwischenlösung erscheint?", "s": {"type": "multiple_choice", "options": ["Short summary videos", "No teaching at all", "Longer office voicemails"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo termina el diálogo?", "p_de": "Wie endet der Dialog?", "s": {"type": "multiple_choice", "options": ["With agreement on a middle option", "With an argument about prices", "With a conference schedule"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["Contrasting opinions", "Essay feedback", "Methodology instructions"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué muestran las dos voces?", "p_de": "Was zeigen die beiden Stimmen?", "s": {"type": "multiple_choice", "options": ["A difference of opinion", "Exactly the same position", "A phone emergency"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5490 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5490 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5490, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Two students with different views
## THE SCENE: A short exchange of contrasting opinions
Two students give different opinions about recording lectures.

### DIRECTOR'S NOTES
Style:
* Clear opposition between one supportive and one critical view.
* Each speaker gives one main reason and one concern.

Pace: Natural and balanced.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise identifying contrasting opinions and the reasons behind them.

#### TRANSCRIPT
[supportive] Student 1: I support lecture recordings because I can review difficult ideas later.
[cautious] Student 2: I do not agree. Some students may stop coming to class.
[practical] Student 1: Recordings also help students who are sick or live far away.
[critical] Student 2: That is true, but discussion in the room is still important.
[balanced] Student 1: Maybe short summary videos could work.
[closing] Student 2: Yes, that could be a better middle option.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Opiniones opuestas sobre grabar clases', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Gegensätzliche Meinungen zum Aufzeichnen von Vorlesungen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
