-- ============================================================
-- Seed: A0 English Path – STEP 5010 – Listening – take notes during a lecture (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La primera idea es revisar los apuntes el mismo día si es posible.", "p_de": "Die erste Idee ist, Notizen am selben Tag zu wiederholen, wenn möglich.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda idea recomienda una sesión muy larga.", "p_de": "Die zweite Idee empfiehlt eine sehr lange Sitzung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tercera idea dice que es mejor hacerse preguntas simples.", "p_de": "Die dritte Idee sagt, dass einfache Fragen besser sind.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En un estudio de clase, las sesiones cortas ayudaron después de una semana.", "p_de": "In einer Klassenstudie halfen kurze Sitzungen nach einer Woche.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Muchos estudiantes escriben palabras clave en el margen.", "p_de": "Viele Studierende schreiben Schlüsselwörter an den Rand.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las palabras clave sirven para encontrar ideas importantes rápidamente.", "p_de": "Die Schlüsselwörter helfen, wichtige Ideen schnell zu finden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conclusión dice que estos hábitos hacen peores los apuntes.", "p_de": "Der Schluss sagt, dass diese Gewohnheiten Notizen schlechter machen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La grabación está pensada para practicar la toma de notas.", "p_de": "Die Aufnahme dient zum Üben des Mitschreibens.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué debes hacer primero?", "p_de": "Was soll man zuerst tun?", "s": {"type": "multiple_choice", "options": ["Review new notes on the same day", "Throw the notes away", "Wait until the exam day"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto deben durar las sesiones según la segunda idea?", "p_de": "Wie lang sollen die Sitzungen laut der zweiten Idee sein?", "s": {"type": "multiple_choice", "options": ["Ten to fifteen minutes", "Two full hours", "One minute only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recomienda la tercera idea?", "p_de": "Was empfiehlt die dritte Idee?", "s": {"type": "multiple_choice", "options": ["Test yourself with simple questions", "Copy every sentence three times", "Study only with music"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasó en el estudio de clase?", "p_de": "Was geschah in der Klassenstudie?", "s": {"type": "multiple_choice", "options": ["Short review sessions helped after one week", "Long sessions removed all errors", "Nobody remembered anything"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde escriben muchos estudiantes palabras clave?", "p_de": "Wo schreiben viele Studierende Schlüsselwörter?", "s": {"type": "multiple_choice", "options": ["In the margin", "On the classroom wall", "On their phone case"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirven esas palabras?", "p_de": "Wofür sind diese Wörter nützlich?", "s": {"type": "multiple_choice", "options": ["To find important ideas quickly", "To change the lecture topic", "To open the door"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hábitos hacen más útiles los apuntes y la revisión?", "p_de": "Welche Gewohnheiten machen Notizen und Wiederholung nützlicher?", "s": {"type": "multiple_choice", "options": ["Simple regular review habits", "Very late-night study only", "No questions during study"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A note-taking lecture", "A voicemail from an office", "A hotel complaint"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5010 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5010 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5010, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Lecturer giving signposted points
## THE SCENE: A lecture with clearly numbered ideas
A lecturer gives three key points about effective review habits and signals what students should note down.

### DIRECTOR'S NOTES
Style:
* Clear lecture markers such as first, second, and finally.
* The content is designed for basic note-taking practice.

Pace: Slightly slow for note-taking.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise catching key points, short examples, and signposting language while taking notes.

#### TRANSCRIPT
[organized] First, review new notes on the same day if possible.
[clear] Second, use short sessions of ten to fifteen minutes, not one very long session.
[practical] Third, test yourself with simple questions instead of only reading again.
[informative] In one class study, students who used short review sessions remembered more after one week.
[helpful] Many students also write two or three key words in the margin to find important ideas quickly.
[concluding] These simple habits make note-taking and revision more useful.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Tomar notas durante una clase', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Während einer Vorlesung Notizen machen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
