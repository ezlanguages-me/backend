-- ============================================================
-- Seed: A0 English Path – STEP 4990 – Listening – follow a lecture (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clase trata de cómo el sueño ayuda a la memoria.", "p_de": "Die Vorlesung handelt davon, wie Schlaf dem Gedächtnis hilft.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dormir bien da tiempo al cerebro para organizar la información nueva.", "p_de": "Guter Schlaf gibt dem Gehirn Zeit, neue Informationen zu ordnen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La luz azul del teléfono puede retrasar el sueño.", "p_de": "Blaues Licht vom Handy kann den Schlaf verzögern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clase dice que no sirve repasar antes de dormir.", "p_de": "Die Vorlesung sagt, dass Wiederholen vor dem Schlafen nicht hilft.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una siesta de veinte minutos puede ayudar a la concentración.", "p_de": "Ein Nickerchen von zwanzig Minuten kann der Konzentration helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Una siesta larga puede hacerte sentir más lento.", "p_de": "Ein langes Nickerchen kann dich träger machen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conclusión recomienda estudiar toda la noche.", "p_de": "Die Schlussfolgerung empfiehlt, die ganze Nacht zu lernen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La grabación es una explicación académica corta.", "p_de": "Die Aufnahme ist eine kurze akademische Erklärung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuál es el tema principal?", "p_de": "Was ist das Hauptthema?", "s": {"type": "multiple_choice", "options": ["How sleep supports memory", "How to print a report", "How to register for a conference"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el cerebro durante un buen sueño?", "p_de": "Was macht das Gehirn bei gutem Schlaf?", "s": {"type": "multiple_choice", "options": ["It organizes new information", "It forgets all new ideas", "It becomes faster than a computer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede retrasar el sueño?", "p_de": "Was kann den Schlaf verzögern?", "s": {"type": "multiple_choice", "options": ["Blue light from phones", "A short review session", "A quiet library"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es útil repasar los apuntes?", "p_de": "Wann ist es nützlich, Notizen zu wiederholen?", "s": {"type": "multiple_choice", "options": ["On the same day before bed", "Only one month later", "Only during breakfast"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de siesta puede ayudar?", "p_de": "Welche Art von Nickerchen kann helfen?", "s": {"type": "multiple_choice", "options": ["A twenty-minute nap", "A four-hour nap", "No nap at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema tiene la siesta larga?", "p_de": "Welches Problem hat ein langes Nickerchen?", "s": {"type": "multiple_choice", "options": ["It can make you feel slow", "It removes all tiredness forever", "It replaces night sleep completely"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recomienda la conclusión?", "p_de": "Was empfiehlt der Schluss?", "s": {"type": "multiple_choice", "options": ["Regular sleep and short review sessions", "Late-night cramming every day", "More blue light at night"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio escuchas?", "p_de": "Was für ein Audio hörst du?", "s": {"type": "multiple_choice", "options": ["A lecture excerpt", "A difficult phone call", "A travel announcement"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4990 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 4990 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 4990, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: University lecturer
## THE SCENE: A short lecture excerpt in a study skills class
A lecturer explains how sleep, light, and review time affect learning and memory.

### DIRECTOR'S NOTES
Style:
* Clear classroom explanation with simple examples.
* Key advice is signposted with calm repetition.

Pace: Measured lecture pace.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a short lecture and identifying main points, examples, and recommendations.

#### TRANSCRIPT
[clear] In today's lecture, we look at how sleep supports memory after study.
[explaining] When you sleep well, your brain has time to organize new information.
[practical] Blue light from phones can delay sleep, so many students study late and rest badly.
[informative] A short review of your notes on the same day is often useful before bed.
[cautious] A twenty-minute nap can help concentration, but a long nap can make you feel slow.
[concluding] So, regular sleep and short review sessions are better than late-night cramming.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Fragmento de clase sobre hábitos de estudio', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Vorlesungsausschnitt über Lerngewohnheiten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
