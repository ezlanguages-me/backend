-- ============================================================
-- Seed: A0 English Path – STEP 4950 – Listening – follow a seminar presentation (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La presentación trata de una encuesta sobre bicicletas.", "p_de": "Die Präsentation handelt von einer Fahrradumfrage.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La encuesta incluye a sesenta estudiantes.", "p_de": "Die Umfrage umfasst sechzig Studierende.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Solo diez estudiantes usan la bicicleta dos veces por semana.", "p_de": "Nur zehn Studierende fahren zweimal pro Woche Fahrrad.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La salud y el bajo coste son razones importantes.", "p_de": "Gesundheit und geringe Kosten sind wichtige Gründe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lluvia es el mayor problema.", "p_de": "Regen ist das größte Problem.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Nadie menciona el aparcamiento cerca de la biblioteca.", "p_de": "Niemand erwähnt Parkplätze nahe der Bibliothek.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El grupo propone más espacios cubiertos para bicicletas.", "p_de": "Die Gruppe schlägt mehr überdachte Fahrradplätze vor.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La charla es sobre precios de hoteles.", "p_de": "Der Vortrag geht um Hotelpreise.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué presenta la estudiante?", "p_de": "Was präsentiert die Studentin?", "s": {"type": "multiple_choice", "options": ["The results of a bicycle survey", "A hotel reservation plan", "A bus driver interview"], "answer": 0}}'::jsonb,
        '{"p": "¿A cuántos estudiantes preguntaron?", "p_de": "Wie viele Studierende wurden gefragt?", "s": {"type": "multiple_choice", "options": ["60 students", "40 students", "16 students"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos van en bici al menos dos veces por semana?", "p_de": "Wie viele fahren mindestens zweimal pro Woche mit dem Fahrrad?", "s": {"type": "multiple_choice", "options": ["40 students", "20 students", "60 students"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué usan la bicicleta muchos estudiantes?", "p_de": "Warum benutzen viele Studierende das Fahrrad?", "s": {"type": "multiple_choice", "options": ["For health and low cost", "For free coffee and music", "For library discounts"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el mayor problema?", "p_de": "Was ist das größte Problem?", "s": {"type": "multiple_choice", "options": ["Rain", "Exam dates", "Room size"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otro problema aparece?", "p_de": "Welches andere Problem kommt vor?", "s": {"type": "multiple_choice", "options": ["Unsafe parking near the library", "No lunch in the cafeteria", "Expensive notebooks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recomienda el grupo?", "p_de": "Was empfiehlt die Gruppe?", "s": {"type": "multiple_choice", "options": ["More covered bike spaces", "Fewer seminar rooms", "Longer lunch breaks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für eine Audioaufnahme ist das?", "s": {"type": "multiple_choice", "options": ["A short seminar presentation", "A voicemail to a supplier", "A train station announcement"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4950 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 4950 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 4950, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Student presenter
## THE SCENE: A short seminar presentation with survey results
A student presents simple results from a campus survey about bicycle use and explains the main patterns.

### DIRECTOR'S NOTES
Style:
* Clear classroom presentation with simple signposting.
* Numbers and problems are repeated to support note-taking.

Pace: Moderate and steady.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a short seminar talk that includes results, comparisons, and one recommendation.

#### TRANSCRIPT
[clear] Today I will present the results of our bicycle survey.
[organized] We asked sixty students about their travel to campus.
[informative] Forty students said they ride a bicycle at least twice a week.
[practical] The main reasons were health and low cost.
[concerned] The biggest problem was rain, and many students also mentioned unsafe parking near the library.
[concluding] Our group suggests more covered bike spaces on campus.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Presentación de seminario sobre hábitos de transporte', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Seminarpräsentation über Verkehrsgewohnheiten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
