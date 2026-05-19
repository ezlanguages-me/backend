-- ============================================================
-- Seed: A0 English Path - STEP 7800 - Listening - ask for factual information and understand the answer (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El moderador dice que hay tiempo para dos preguntas factuales.", "de": "Der Moderator sagt, dass Zeit für zwei Sachfragen ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En la prueba hubo tres salas.", "de": "Im Test gab es drei Räume.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Participaron cuarenta profesores.", "de": "Vierzig Lehrkräfte nahmen teil.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La señal roja significaba que la sala estaba llena.", "de": "Das rote Schild bedeutete, dass der Raum voll war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las señales eran tarjetas sencillas de papel.", "de": "Die Schilder waren einfache Papierkarten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mina pregunta por la señal verde.", "de": "Mina fragt nach dem grünen Schild.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Nora dice que las señales costaron mucho.", "de": "Nora sagt, dass die Schilder viel kosteten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El moderador dice que las respuestas son muy claras.", "de": "Der Moderator sagt, dass die Antworten sehr klar sind.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Quién hace la primera pregunta?", "de": "Wer stellt die erste Frage?", "s_es": {"type": "multiple_choice", "options": ["Leo", "Mina", "Nora"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Leo", "Mina", "Nora"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas salas había?", "de": "Wie viele Räume gab es?", "s_es": {"type": "multiple_choice", "options": ["Tres", "Cinco", "Diez"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Fünf", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos estudiantes participaron?", "de": "Wie viele Studierende nahmen teil?", "s_es": {"type": "multiple_choice", "options": ["Cuarenta", "Cuatro", "Catorce"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vierzig", "Vier", "Vierzehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significaba la señal roja?", "de": "Was bedeutete das rote Schild?", "s_es": {"type": "multiple_choice", "options": ["La sala estaba llena", "La sala era nueva", "La sala estaba fría"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Raum war voll", "Der Raum war neu", "Der Raum war kalt"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué eran las señales?", "de": "Was waren die Schilder?", "s_es": {"type": "multiple_choice", "options": ["Tarjetas sencillas de papel", "Puertas metálicas", "Pantallas azules"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einfache Papierkarten", "Metalltüren", "Blaue Bildschirme"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de preguntas había?", "de": "Welche Art von Fragen gab es?", "s_es": {"type": "multiple_choice", "options": ["Preguntas factuales", "Preguntas de música", "Preguntas privadas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sachfragen", "Musikfragen", "Private Fragen"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién pregunta por el coste?", "de": "Wer fragt nach den Kosten?", "s_es": {"type": "multiple_choice", "options": ["Mina", "Leo", "El moderador"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mina", "Leo", "Der Moderator"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo describe el moderador las respuestas?", "de": "Wie beschreibt der Moderator die Antworten?", "s_es": {"type": "multiple_choice", "options": ["Muy claras", "Demasiado largas", "Demasiado ruidosas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sehr klar", "Zu lang", "Zu laut"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 7800 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 7800 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 7800, 'en', 'listening', 'meetings', $transcript$
# AUDIO PROFILE: A moderator, two audience members, and a speaker in a conference Q&A
## "Two Short Questions"

## THE SCENE: A factual Q&A after a short presentation
The moderator opens the floor for brief questions.
Two audience members ask for numbers and simple facts, and the speaker answers directly.

### DIRECTOR'S NOTES
Style:
* Very short Q&A turns focused on factual information only.
* Numbers and key words are repeated clearly so beginners can follow the answers.

Pace: Slow, with a small pause after each question and answer.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how people ask factual questions after a conference talk.
They focus on numbers, meanings, and materials in simple answers.

#### TRANSCRIPT
[moderator] Moderator: We have time for two factual questions.
[curious] Leo: How many rooms were in the test?
[clear] Nora: Three rooms were in the test.
[curious] Leo: And how many students joined?
[steady] Nora: Forty students joined during one week.
[asking] Mina: What did the red sign mean?
[clear] Nora: It meant the room was full.
[asking] Mina: Did the signs cost a lot?
[honest] Nora: No. They were simple paper cards.
[closing] Moderator: Thank you. That is very clear.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Pedir información factual y entender la respuesta', 'Escucha un intercambio breve de preguntas y respuestas con datos simples sobre una presentación.'),
        (v_listening_id, 'de', 'Sachinformationen erfragen und die Antwort verstehen', 'Höre einen kurzen Frage-Antwort-Austausch mit einfachen Fakten zu einer Präsentation.');

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
