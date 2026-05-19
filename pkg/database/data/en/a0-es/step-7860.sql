-- ============================================================
-- Seed: A0 English Path – STEP 7860 – Listening – follow wrap-up of a conference session (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El moderador da las gracias a Mia.", "de": "Der Moderator dankt Mia.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La idea principal es la planificación simple para reuniones cortas.", "de": "Die Hauptidee ist einfache Planung für kurze Treffen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mia muestra cinco pasos.", "de": "Mia zeigt fünf Schritte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El público pregunta sobre la duración de la reunión y los folletos.", "de": "Das Publikum fragt nach der Treffendauer und den Handzetteln.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mia va a imprimir libros mañana.", "de": "Mia wird morgen Bücher drucken.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La siguiente sesión empieza en diez minutos.", "de": "Die nächste Sitzung beginnt in zehn Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mia se queda cerca de la puerta para una pregunta más.", "de": "Mia bleibt für eine weitere Frage nahe der Tür.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El grupo es poco amable.", "de": "Die Gruppe ist unfreundlich.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿A quién da las gracias el moderador?", "de": "Wem dankt der Moderator?", "s_es": {"type": "multiple_choice", "options": ["Mia", "Ana", "Laura"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mia", "Ana", "Laura"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la idea principal de la sesión?", "de": "Was ist die Hauptidee der Sitzung?", "s_es": {"type": "multiple_choice", "options": ["Simple planning for short meetings", "How to cook for a team", "Long travel reports"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einfache Planung für kurze Treffen", "Wie man für ein Team kocht", "Lange Reiseberichte"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos pasos muestra Mia?", "de": "Wie viele Schritte zeigt Mia?", "s_es": {"type": "multiple_choice", "options": ["Three", "Five", "Eight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Fünf", "Acht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué va primero en la lista del moderador?", "de": "Was kommt zuerst in der Liste des Moderators?", "s_es": {"type": "multiple_choice", "options": ["Plan", "Speak", "Send notes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Planen", "Sprechen", "Notizen senden"], "answer": 0}}'::jsonb,
        '{"es": "¿Sobre qué pregunta el público?", "de": "Worüber fragt das Publikum?", "s_es": {"type": "multiple_choice", "options": ["Meeting length and handouts", "Taxi prices and hotels", "Lunch and music"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Treffendauer und Handzettel", "Taxipreise und Hotels", "Mittagessen und Musik"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué va a enviar Mia hoy?", "de": "Was wird Mia heute schicken?", "s_es": {"type": "multiple_choice", "options": ["The slides", "A cake", "New chairs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Folien", "Einen Kuchen", "Neue Stühle"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo empieza la siguiente sesión?", "de": "Wann beginnt die nächste Sitzung?", "s_es": {"type": "multiple_choice", "options": ["In ten minutes", "Tomorrow morning", "After lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In zehn Minuten", "Morgen früh", "Nach dem Mittagessen"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se queda Mia para una pregunta más?", "de": "Wo bleibt Mia für eine weitere Frage?", "s_es": {"type": "multiple_choice", "options": ["Near the door", "In the car park", "At the cafe"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nahe der Tür", "Auf dem Parkplatz", "Im Café"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7860 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7860 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7860, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: Session chair and presenter after a conference talk
## "Session Wrap-Up at the Conference"

## THE SCENE: At the front of a small conference room after the last question
The chair thanks the presenter and repeats the key points from the session.
They mention the audience questions and the plan for the next session.

### DIRECTOR''S NOTES
Style:
* Short wrap-up between a chair and a presenter.
* Key facts are repeated slowly for beginner learners.

Pace: Slow and clear.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear simple language for ending a conference session, repeating the main point, and naming a next step.

#### TRANSCRIPT
[calm] Chair: Thank you for your session, Mia.
[warm] Mia: Thank you. The group was very kind.
[checking] Chair: Your main point was simple planning for short meetings.
[agreeing] Mia: Yes, and I showed three easy steps.
[practical] Chair: First plan, then speak, then send notes.
[clear] Mia: That is right.
[observing] Chair: The audience asked about meeting length and handouts.
[positive] Mia: Yes, and I will email the slides today.
[closing] Chair: Good. The next session starts in ten minutes.
[ready] Mia: Great. I can stay near the door for one more question.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Sigue el cierre de una sesión de conferencia', 'Escucha cómo un moderador y una ponente repasan una sesión, las preguntas del público y el siguiente paso.'),
        (v_listening_id, 'de', 'Verfolge den Abschluss einer Konferenzsitzung', 'Höre, wie ein Moderator und eine Sprecherin eine Sitzung, die Publikumsfragen und den nächsten Schritt zusammenfassen.');

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
