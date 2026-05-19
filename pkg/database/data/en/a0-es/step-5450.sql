-- ============================================================
-- Seed: A0 English Path – STEP 5450 – Listening – follow a group discussion (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La sala silenciosa de la biblioteca es buena para lecturas largas.", "p_de": "Der stille Raum der Bibliothek ist gut für langes Lesen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cafetería es demasiado silenciosa para escribir.", "p_de": "Das Café ist zum Schreiben zu leise.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Estudiar en casa es más barato, pero allí se pierde concentración.", "p_de": "Zu Hause zu lernen ist billiger, aber dort verliert man Konzentration.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El laboratorio permanece abierto hasta las ocho.", "p_de": "Das Labor bleibt bis acht Uhr geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Al final todos prefieren la cafetería.", "p_de": "Am Ende bevorzugen alle das Café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La biblioteca queda como mejor lugar para estudiar en serio.", "p_de": "Die Bibliothek bleibt als bester Ort für ernsthaftes Lernen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La grabación es una discusión de grupo pequeña.", "p_de": "Die Aufnahme ist eine kleine Gruppendiskussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Nadie menciona más de un lugar de estudio.", "p_de": "Niemand erwähnt mehr als einen Lernort.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué lugar es mejor para lecturas largas según el primer estudiante?", "p_de": "Welcher Ort ist laut dem ersten Studierenden am besten für langes Lesen?", "s": {"type": "multiple_choice", "options": ["The library quiet room", "The cafe", "The bus stop"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué no le gusta el café al segundo estudiante para escribir?", "p_de": "Warum gefällt dem zweiten Studierenden das Café zum Schreiben nicht?", "s": {"type": "multiple_choice", "options": ["It is too noisy", "It is too expensive", "It closes at noon"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema tiene estudiar en casa?", "p_de": "Welches Problem hat das Lernen zu Hause?", "s": {"type": "multiple_choice", "options": ["It is hard to focus", "There are no chairs", "The books are too heavy"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta qué hora está abierto el laboratorio?", "p_de": "Bis wann ist das Labor geöffnet?", "s": {"type": "multiple_choice", "options": ["Until eight", "Until six", "All night"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué conclusión comparten al final?", "p_de": "Welche Schlussfolgerung teilen sie am Ende?", "s": {"type": "multiple_choice", "options": ["The library is best for serious study", "Home is always best", "The cafe should be closed"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de audio es?", "p_de": "Was für ein Audio ist das?", "s": {"type": "multiple_choice", "options": ["A group discussion", "An opening statement", "A voicemail instruction"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos lugares mencionan?", "p_de": "Wie viele Orte werden erwähnt?", "s": {"type": "multiple_choice", "options": ["Several study places", "Only one place", "No place at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se construye la conclusión?", "p_de": "Wie entsteht die Schlussfolgerung?", "s": {"type": "multiple_choice", "options": ["Through several short opinions", "Through one long lecture", "Through a phone call"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5450 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5450 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5450, 'en', 'listening', 'academic', $transcript$
# AUDIO PROFILE: Three students in discussion
## THE SCENE: A small group discussion about study spaces
Students compare the library, cafe, and home as places to study.

### DIRECTOR'S NOTES
Style:
* Natural discussion with short opinions and responses.
* One conclusion emerges slowly through the group exchange.

Pace: Natural and clear.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise following a group discussion, contrasting views, and a simple shared conclusion.

#### TRANSCRIPT
[thoughtful] Student 1: The library quiet room is best for long reading tasks.
[relaxed] Student 2: I like the cafe, but it is too noisy when I need to write.
[practical] Student 3: Home is cheaper, but I lose focus there.
[clear] Student 1: The lab is useful too, because it stays open until eight.
[agreeing] Student 2: True, but the library still has the best quiet space.
[closing] Student 3: So we all agree that the library is the best place for serious study.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Seguir una discusión en grupo', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Einer Gruppendiskussion folgen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
