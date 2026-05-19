-- ============================================================
-- Seed: A0 English Path – STEP 7400 – Listening – express opinions in simple terms, for example, 'I do not agree', provided that the question or issue has been put clearly and simply (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La reunión con visitantes es el jueves.", "de": "Das Besuchsmeeting ist am Donnerstag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ana dice primero que las 11 es una buena hora.", "de": "Ana sagt zuerst, dass 11 Uhr eine gute Zeit ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ben no está de acuerdo al principio.", "de": "Ben ist am Anfang nicht einverstanden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La entrega llega a las 10.", "de": "Die Lieferung kommt um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Al final la reunión es a las 11.", "de": "Am Ende ist das Meeting um 11 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La reunión es en la sala C.", "de": "Das Meeting ist in Raum C.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ana lleva la lista de visitantes.", "de": "Ana bringt die Besucherliste mit.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ben va a imprimir las tarjetas con nombres.", "de": "Ben wird die Namenskarten drucken.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué hora propone Ana primero?", "de": "Welche Uhrzeit schlägt Ana zuerst vor?", "s_es": {"type": "multiple_choice", "options": ["10 o clock", "11 o clock", "12 o clock"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 Uhr", "11 Uhr", "12 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué frase usa Ben para mostrar desacuerdo?", "de": "Welchen Satz benutzt Ben, um nicht zuzustimmen?", "s_es": {"type": "multiple_choice", "options": ["I do not agree", "I am late", "I am hungry"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["I do not agree", "I am late", "I am hungry"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué Ben prefiere las 11?", "de": "Warum bevorzugt Ben 11 Uhr?", "s_es": {"type": "multiple_choice", "options": ["The delivery comes at 10", "The room is closed at 11", "Ana is busy at 11"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Lieferung kommt um 10 Uhr", "Der Raum ist um 11 geschlossen", "Ana ist um 11 beschäftigt"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde será la reunión final?", "de": "Wo ist das endgültige Meeting?", "s_es": {"type": "multiple_choice", "options": ["Room C", "Room A", "Room F"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum C", "Raum A", "Raum F"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién lleva la lista de visitantes?", "de": "Wer bringt die Besucherliste mit?", "s_es": {"type": "multiple_choice", "options": ["Ben", "Ana", "The chair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ben", "Ana", "Die Leitung"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién imprime las tarjetas con nombres?", "de": "Wer druckt die Namenskarten?", "s_es": {"type": "multiple_choice", "options": ["Ana", "Ben", "The visitor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ana", "Ben", "Der Besucher"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué día es la reunión?", "de": "An welchem Tag ist das Meeting?", "s_es": {"type": "multiple_choice", "options": ["Thursday", "Tuesday", "Friday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Donnerstag", "Dienstag", "Freitag"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué decide el equipo?", "de": "Was entscheidet das Team?", "s_es": {"type": "multiple_choice", "options": ["A meeting time", "A lunch menu", "A new laptop"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Meetingzeit", "Ein Mittagsmenü", "Einen neuen Laptop"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7400 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7400 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7400, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Ana, Ben and a team chair in a short planning meeting
## "Choosing the Meeting Time"

## THE SCENE: A small office team needs one clear time for a visitor meeting
The question is simple: should the meeting be at ten or at eleven?
The speakers give short opinions and react politely.

### DIRECTOR'S NOTES
Style:
* Short, clear meeting language with simple opinions.
* The disagreement is polite and easy to follow.

Pace: Slow and steady, with clear pauses after each idea.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear simple ways to agree, disagree, and explain one reason in a meeting.
The audio models useful phrases for practical decisions.

#### TRANSCRIPT
[clear] Chair: We need a time for the visitor meeting on Thursday.
[calm] Ana: I think 10 o clock is good.
[firm] Ben: I do not agree. 11 o clock is better for me.
[interested] Chair: Why is 11 better?
[practical] Ben: The delivery comes at 10.
[thinking] Ana: That is true. 11 is fine for me.
[positive] Chair: Good. So the meeting is at 11 in Room C.
[helpful] Ben: Great. I can bring the visitor list.
[ready] Ana: And I can print the name cards.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha opiniones sencillas en una reunión', 'Escucha a un equipo que elige una hora para una reunión y expresa acuerdo o desacuerdo con frases simples.'),
        (v_listening_id, 'de', 'Höre einfache Meinungen in einem Meeting', 'Höre ein Team, das eine Uhrzeit für ein Meeting wählt und mit einfachen Sätzen zustimmt oder nicht zustimmt.');

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
