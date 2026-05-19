-- ============================================================
-- Seed: A0 English Path – STEP 7520 – Listening – follow a project proposal presentation (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Paula presenta una propuesta de proyecto.", "de": "Paula präsentiert einen Projektvorschlag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La idea está cerca de la sala C.", "de": "Die Idee ist nahe bei Raum C.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La propuesta incluye una pizarra blanca.", "de": "Der Vorschlag enthält ein Whiteboard.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coste es de unos 90 euros.", "de": "Die Kosten liegen bei etwa 90 Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La instalación será el próximo martes por la mañana.", "de": "Die Installation ist nächsten Dienstagmorgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Sam dice que no le gusta la idea.", "de": "Sam sagt, dass ihm die Idee nicht gefällt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Paula puede enviar el plan corto hoy.", "de": "Paula kann den kurzen Plan heute senden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La propuesta trata de una nueva cafetera.", "de": "Der Vorschlag handelt von einer neuen Kaffeemaschine.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué presenta Paula?", "de": "Was präsentiert Paula?", "s_es": {"type": "multiple_choice", "options": ["A simple project proposal", "A lunch menu", "A travel ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen einfachen Projektvorschlag", "Ein Mittagsmenü", "Ein Reiseticket"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde estará la pared de reunión?", "de": "Wo wird die Meetingwand sein?", "s_es": {"type": "multiple_choice", "options": ["Near Room C", "In the kitchen", "At reception"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nahe bei Raum C", "In der Küche", "Am Empfang"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué objeto está en la propuesta?", "de": "Welcher Gegenstand ist im Vorschlag?", "s_es": {"type": "multiple_choice", "options": ["A whiteboard", "A sofa", "A printer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Whiteboard", "Ein Sofa", "Ein Drucker"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto costará?", "de": "Wie viel wird es kosten?", "s_es": {"type": "multiple_choice", "options": ["About 90 euros", "About 190 euros", "About 40 euros"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Etwa 90 Euro", "Etwa 190 Euro", "Etwa 40 Euro"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo pueden instalarlo?", "de": "Wann können sie es installieren?", "s_es": {"type": "multiple_choice", "options": ["Next Tuesday morning", "Next Monday night", "This evening"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nächsten Dienstagmorgen", "Nächsten Montagabend", "Heute Abend"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién pregunta por el coste?", "de": "Wer fragt nach den Kosten?", "s_es": {"type": "multiple_choice", "options": ["Sam", "Paula", "Nina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sam", "Paula", "Nina"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién dice que la idea es útil?", "de": "Wer sagt, dass die Idee nützlich ist?", "s_es": {"type": "multiple_choice", "options": ["Nina", "Sam", "Paula"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nina", "Sam", "Paula"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué enviará Paula hoy?", "de": "Was wird Paula heute senden?", "s_es": {"type": "multiple_choice", "options": ["The short plan", "The final bill", "The lunch order"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den kurzen Plan", "Die Endrechnung", "Die Mittagsbestellung"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7520 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7520 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7520, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Paula, Sam and Nina during a short proposal presentation
## "A Meeting Wall Near Room C"

## THE SCENE: One colleague presents a simple project idea to the team
The proposal is short and practical.
Other team members ask about cost and timing and give one reaction.

### DIRECTOR'S NOTES
Style:
* Clear presentation language with short supporting questions.
* The proposal stays concrete and easy to imagine.

Pace: Slow and structured, like a simple presentation in a team meeting.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear a short project proposal with basic arguments, cost, and schedule.
The audio is useful for following presentation structure in meetings.

#### TRANSCRIPT
[steady] Paula: I want to present a simple project proposal.
[clear] Paula: The idea is a small meeting wall near Room C.
[explaining] Paula: It will have a whiteboard, pins, and a weekly plan.
[curious] Sam: How much will it cost?
[practical] Paula: About 90 euros.
[curious] Sam: When can we install it?
[organised] Paula: Next Tuesday morning.
[positive] Nina: I like the idea. It is simple and useful.
[closing] Paula: Thank you. I can send the short plan today.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha la presentación de una propuesta de proyecto', 'Escucha una presentación breve con idea, materiales, coste y fecha para un pequeño proyecto.'),
        (v_listening_id, 'de', 'Höre eine Präsentation zu einem Projektvorschlag', 'Höre eine kurze Präsentation mit Idee, Material, Kosten und Termin für ein kleines Projekt.');

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
