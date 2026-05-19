-- ============================================================
-- Seed: A0 English Path – STEP 5250 – Listening – follow a conference presentation (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El proyecto empezó con tres contenedores nuevos en la biblioteca.", "p_de": "Das Projekt begann mit drei neuen Behältern in der Bibliothek.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El reciclaje correcto subió al setenta por ciento después de los carteles.", "p_de": "Richtiges Recycling stieg nach den Postern auf siebzig Prozent.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los voluntarios revisaban los contenedores cada viernes.", "p_de": "Die Freiwilligen kontrollierten die Behälter jeden Freitag.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El error más común eran vasos de plástico en el contenedor de papel.", "p_de": "Der häufigste Fehler waren Plastikbecher im Papierbehälter.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El siguiente paso es reducir los vasos desechables en la cafetería.", "p_de": "Der nächste Schritt ist die Reduzierung von Einwegbechern in der Cafeteria.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El proyecto ya se trasladó a todos los edificios.", "p_de": "Das Projekt wurde bereits auf alle Gebäude ausgeweitet.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ponente espera que el proyecto sirva de modelo para otros edificios.", "p_de": "Die Sprecherin hofft, dass das Projekt ein Modell für andere Gebäude wird.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación es una presentación de conferencia.", "p_de": "Die Aufnahme ist ein Konferenzvortrag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Con qué empezó el proyecto?", "p_de": "Womit begann das Projekt?", "s": {"type": "multiple_choice", "options": ["With three new bins in the library", "With a new phone system", "With longer library hours"], "answer": 0}}'::jsonb,
        '{"p": "¿A cuánto subió el reciclaje correcto?", "p_de": "Auf wie viel stieg richtiges Recycling?", "s": {"type": "multiple_choice", "options": ["Seventy percent", "Seventeen percent", "Forty percent"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo revisaban los contenedores los voluntarios?", "p_de": "Wann prüften die Freiwilligen die Behälter?", "s": {"type": "multiple_choice", "options": ["Every Monday afternoon", "Every Friday morning", "Once a month"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál era el error principal?", "p_de": "Was war der Hauptfehler?", "s": {"type": "multiple_choice", "options": ["Plastic cups in the paper bin", "Books in the bike parking", "Badges in the lunch area"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quiere hacer el proyecto ahora?", "p_de": "Was will das Projekt jetzt tun?", "s": {"type": "multiple_choice", "options": ["Reduce disposable cups in the cafeteria", "Close the library bins", "Stop all volunteer work"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué espera la ponente al final?", "p_de": "Was hofft die Sprecherin am Ende?", "s": {"type": "multiple_choice", "options": ["That other buildings can use the model", "That the project ends next week", "That the posters disappear"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A conference presentation", "A difficult support call", "A seminar sign-in"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo organiza la ponente la información?", "p_de": "Wie organisiert die Sprecherin die Informationen?", "s": {"type": "multiple_choice", "options": ["With actions, results, and next steps", "Only with jokes", "Without any examples"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5250 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5250 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5250, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Conference presenter
## THE SCENE: A short conference presentation on a campus recycling project
A presenter explains a familiar project with actions, results, and next steps.

### DIRECTOR'S NOTES
Style:
* Structured public presentation with clear stage markers.
* The speaker refers to actions, percentages, and future plans.

Pace: Clear conference pace.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a conference presentation on a familiar topic with practical results.

#### TRANSCRIPT
[formal] Our campus recycling project began with three new bins in the library.
[clear] After posters were added, correct recycling rose to seventy percent.
[helpful] Student volunteers checked the bins every Monday afternoon.
[focused] The biggest mistake was plastic cups in the paper bin.
[forward-looking] Our next step is to reduce disposable cups in the cafeteria.
[closing] We hope this small project can become a model for other buildings.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Presentación de conferencia sobre reciclaje', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Konferenzvortrag über Recycling', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
