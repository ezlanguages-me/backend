-- ============================================================
-- Seed: A0 English Path - STEP 7810 - Reading - read Q&A session transcript (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El moderador dice que hay tiempo para cuatro preguntas cortas.", "de": "Der Moderator sagt, dass Zeit für vier kurze Fragen ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una pregunta es sobre el número de salas.", "de": "Eine Frage handelt von der Zahl der Räume.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La ponente dice que 50 estudiantes usaron las salas.", "de": "Die Sprecherin sagt, dass 50 Studierende die Räume nutzten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La señal amarilla significaba que la sala estaba ocupada.", "de": "Das gelbe Schild bedeutete, dass der Raum besetzt war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las señales eran tarjetas de papel.", "de": "Die Schilder waren Papierkarten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La transcripción es de un menú de almuerzo.", "de": "Das Transkript stammt aus einem Mittagsmenü.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los estudiantes usaron las salas durante una semana.", "de": "Die Studierenden nutzten die Räume eine Woche lang.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El moderador termina diciendo Thank you everyone.", "de": "Der Moderator beendet mit Thank you everyone.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué pregunta hace el primer miembro del público?", "de": "Welche Frage stellt die erste Person aus dem Publikum?", "s_es": {"type": "multiple_choice", "options": ["How many rooms were in the test?", "What color was the door?", "Where is the café?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["How many rooms were in the test?", "What color was the door?", "Where is the café?"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos estudiantes usaron las salas?", "de": "Wie viele Studierende nutzten die Räume?", "s_es": {"type": "multiple_choice", "options": ["Forty", "Fifteen", "Three hundred"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Forty", "Fifteen", "Three hundred"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significaba la señal amarilla?", "de": "Was bedeutete das gelbe Schild?", "s_es": {"type": "multiple_choice", "options": ["The room was busy", "The room was empty", "The room was closed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The room was busy", "The room was empty", "The room was closed"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué material eran las señales?", "de": "Aus welchem Material waren die Schilder?", "s_es": {"type": "multiple_choice", "options": ["Paper cards", "Glass panels", "Wood boards"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Paper cards", "Glass panels", "Wood boards"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas preguntas cortas hubo?", "de": "Wie viele kurze Fragen gab es?", "s_es": {"type": "multiple_choice", "options": ["Four", "One", "Ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Four", "One", "Ten"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién habla después de cada pregunta?", "de": "Wer spricht nach jeder Frage?", "s_es": {"type": "multiple_choice", "options": ["The speaker", "The bus driver", "The waiter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The speaker", "The bus driver", "The waiter"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué duración se menciona para el uso de las salas?", "de": "Welche Dauer wird für die Nutzung der Räume genannt?", "s_es": {"type": "multiple_choice", "options": ["One week", "One year", "One day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["One week", "One year", "One day"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién cierra la transcripción?", "de": "Wer beendet das Transkript?", "s_es": {"type": "multiple_choice", "options": ["The moderator", "Audience Member 2", "The cleaner"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The moderator", "Audience Member 2", "The cleaner"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7810 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7810 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7810, 'en', 'reading', 'meetings', 'Q&A Session Transcript
Topic: Quiet Study Room Signs\n\nModerator: We have time for four short questions.
Audience Member 1: How many rooms were in the test?
Speaker: Three rooms were in the test.
Audience Member 2: How many students used the rooms?
Speaker: Forty students used them in one week.
Audience Member 3: What did the yellow sign mean?
Speaker: It meant the room was busy.
Audience Member 4: Were the signs paper or plastic?
Speaker: They were paper cards.
Moderator: Thank you everyone.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Leer la transcripción de una sesión de preguntas y respuestas', 'Lee una transcripción breve de un turno de preguntas después de una presentación.'),
        (v_reading_id, 'de', 'Ein Transkript einer Fragerunde lesen', 'Lies ein kurzes Transkript einer Fragerunde nach einer Präsentation.');

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
