-- ============================================================
-- Seed: A0 English Path - STEP 7790 - Reading - read audience questions (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La lista es para Session 5.", "de": "Die Liste ist für Session 5.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una pregunta trata sobre lo que significaba la señal roja.", "de": "Eine Frage handelt davon, was das rote Schild bedeutete.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El público pregunta por billetes de tren.", "de": "Das Publikum fragt nach Zugtickets.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Una pregunta es si las señales costaron mucho.", "de": "Eine Frage lautet, ob die Schilder viel kosteten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una pregunta es cuántos estudiantes participaron en el estudio.", "de": "Eine Frage lautet, wie viele Studierende an der Studie teilnahmen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El público pregunta dónde se colocaron las señales.", "de": "Das Publikum fragt, wo die Schilder angebracht wurden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una pregunta es si las escuelas pueden usar la misma idea.", "de": "Eine Frage lautet, ob Schulen dieselbe Idee nutzen können.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Todas las preguntas son sobre cocina.", "de": "Alle Fragen handeln vom Kochen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre el número de salas?", "de": "Welche Frage handelt von der Zahl der Räume?", "s_es": {"type": "multiple_choice", "options": ["How many rooms were in the test?", "Where did you put the signs?", "Did library staff like the system?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["How many rooms were in the test?", "Where did you put the signs?", "Did library staff like the system?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre la señal roja?", "de": "Welche Frage handelt vom roten Schild?", "s_es": {"type": "multiple_choice", "options": ["What did the red sign mean?", "Can schools use the same idea?", "How many students joined the study?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["What did the red sign mean?", "Can schools use the same idea?", "How many students joined the study?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre el coste?", "de": "Welche Frage handelt von den Kosten?", "s_es": {"type": "multiple_choice", "options": ["Did the signs cost a lot?", "Did library staff like the system?", "Where did you put the signs?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Did the signs cost a lot?", "Did library staff like the system?", "Where did you put the signs?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre el número de estudiantes?", "de": "Welche Frage handelt von der Zahl der Studierenden?", "s_es": {"type": "multiple_choice", "options": ["How many students joined the study?", "Did you use paper or plastic cards?", "What did the red sign mean?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["How many students joined the study?", "Did you use paper or plastic cards?", "What did the red sign mean?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre el lugar de las señales?", "de": "Welche Frage handelt vom Ort der Schilder?", "s_es": {"type": "multiple_choice", "options": ["Where did you put the signs?", "Did the signs cost a lot?", "Can schools use the same idea?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Where did you put the signs?", "Did the signs cost a lot?", "Can schools use the same idea?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre el personal de la biblioteca?", "de": "Welche Frage handelt vom Bibliothekspersonal?", "s_es": {"type": "multiple_choice", "options": ["Did library staff like the system?", "How many rooms were in the test?", "Did you use paper or plastic cards?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Did library staff like the system?", "How many rooms were in the test?", "Did you use paper or plastic cards?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre el uso en escuelas?", "de": "Welche Frage handelt vom Einsatz in Schulen?", "s_es": {"type": "multiple_choice", "options": ["Can schools use the same idea?", "What did the red sign mean?", "Did the signs cost a lot?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Can schools use the same idea?", "What did the red sign mean?", "Did the signs cost a lot?"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta es sobre el material de las tarjetas?", "de": "Welche Frage handelt vom Material der Karten?", "s_es": {"type": "multiple_choice", "options": ["Did you use paper or plastic cards?", "How many students joined the study?", "Where did you put the signs?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Did you use paper or plastic cards?", "How many students joined the study?", "Where did you put the signs?"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7790 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7790 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7790, 'en', 'reading', 'meetings', 'Audience Questions - Session 5
Topic: Quiet Study Room Signs\n\nModerator note:
Please choose four short factual questions.\n\nAudience questions:
1. How many rooms were in the test?
2. What did the red sign mean?
3. Did the signs cost a lot?
4. How many students joined the study?
5. Where did you put the signs?
6. Did library staff like the system?
7. Can schools use the same idea?
8. Did you use paper or plastic cards?')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Leer preguntas del público', 'Lee una lista breve de preguntas del público después de una presentación de conferencia.'),
        (v_reading_id, 'de', 'Fragen aus dem Publikum lesen', 'Lies eine kurze Liste von Publikumsfragen nach einer Konferenzpräsentation.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
