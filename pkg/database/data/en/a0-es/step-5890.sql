-- ============================================================
-- Seed: A0 English Path – STEP 5890 – Listening – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La sala de apoyo está en la primera planta.", "de": "Der Unterstützungsraum ist im ersten Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Está junto al mostrador de la biblioteca.", "de": "Er ist neben dem Bibliotheksschalter.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El estudiante pregunta por una reunión de matemáticas.", "de": "Der Student fragt nach einem Mathe-Treffen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se puede reservar en línea o en la oficina de estudiantes.", "de": "Man kann online oder im Studierendenbüro buchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La ayuda sin cita es el martes.", "de": "Die offene Sprechstunde ist am Dienstag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La ayuda sin cita es el miércoles de 2 PM a 4 PM.", "de": "Die offene Hilfe ist am Mittwoch von 14 bis 16 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay que llevar el ordenador portátil.", "de": "Man muss den Laptop mitbringen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Si falta a un taller, debe escribir ese mismo día.", "de": "Wenn man einen Workshop verpasst, soll man am selben Tag schreiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿En qué planta está la sala de apoyo?", "de": "In welchem Stock ist der Unterstützungsraum?", "s_es": {"type": "multiple_choice", "options": ["First floor", "Ground floor", "Second floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Erster Stock", "Erdgeschoss", "Zweiter Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está situada la sala?", "de": "Wo ist der Raum?", "s_es": {"type": "multiple_choice", "options": ["Next to the library desk", "Next to the café", "At the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neben dem Bibliotheksschalter", "Neben dem Café", "Am Parkplatz"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo se puede reservar la reunión de matemáticas?", "de": "Wie kann man das Mathe-Treffen buchen?", "s_es": {"type": "multiple_choice", "options": ["Online or at the student office", "Only by phone", "Only by post"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Online oder im Studierendenbüro", "Nur per Telefon", "Nur per Post"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué días hay ayuda sin cita?", "de": "Wann gibt es offene Hilfe?", "s_es": {"type": "multiple_choice", "options": ["Wednesday from 2 PM to 4 PM", "Monday morning", "Friday evening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mittwoch von 14 bis 16 Uhr", "Montagmorgen", "Freitagabend"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe llevar el estudiante?", "de": "Was soll der Student mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Notebook and course notes", "Only a pen", "Only his ID"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Heft und Kursnotizen", "Nur einen Stift", "Nur seinen Ausweis"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pasa si falta a un taller?", "de": "Was passiert, wenn man einen Workshop verpasst?", "s_es": {"type": "multiple_choice", "options": ["Email the team the same day", "Wait until next week", "Nothing"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dem Team am selben Tag schreiben", "Bis nächste Woche warten", "Nichts"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué recomienda la coordinadora si quiere asiento?", "de": "Was empfiehlt die Koordinatorin, wenn man einen Platz will?", "s_es": {"type": "multiple_choice", "options": ["Come early", "Arrive at midnight", "Bring food"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Früh kommen", "Um Mitternacht kommen", "Essen mitbringen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de ayuda se menciona además de escribir?", "de": "Welche Hilfe wird außer Schreiben noch genannt?", "s_es": {"type": "multiple_choice", "options": ["Maths", "Driving", "Gardening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mathe", "Fahren", "Gartenarbeit"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5890 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5890 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5890, 'en', 'listening', 'Gestión del Estudio y Trámites', $transcript$
# AUDIO PROFILE: Rachel, an academic support coordinator
## "Help When You Need It"

## THE SCENE: A short briefing for new students
Students learn where to get help with writing, maths, and study planning.
Rachel gives clear instructions and repeats the booking times.

### DIRECTOR'S NOTES
Style:
* Professional but friendly voice with clear signposting.
* Short explanations and repeated room names are important.

Pace: Slow to medium, with a clear pause before each service.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear how to find academic support, book a meeting, and attend drop-in help.
The audio practises times, locations, and simple support vocabulary.

#### TRANSCRIPT
[welcoming] Coordinator: Welcome. If you need help with writing, go to the study support room.
[clear] Coordinator: It is on the first floor, next to the library desk.
[helpful] Student: Can I book a maths meeting too?
[clear] Coordinator: Yes. Book a short appointment online or at the student office.
[practical] Coordinator: Drop-in help is available on Wednesday from 2 PM to 4 PM.
[checking] Student: Do I need to bring my notebook?
[helpful] Coordinator: Yes, bring your notebook and your course notes.
[clear] Coordinator: If you miss a workshop, email the team the same day.
[closing] Coordinator: Please come early if you want a seat.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha el informe de apoyo académico', 'Escucha a una coordinadora que explica el apoyo académico disponible en la universidad.'),
        (v_listening_id, 'de', 'Höre die Info zu akademischer Unterstützung', 'Höre eine Koordinatorin, die die akademische Unterstützung an der Universität erklärt.');

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

