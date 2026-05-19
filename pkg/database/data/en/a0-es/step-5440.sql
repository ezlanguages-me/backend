-- ============================================================
-- Seed: A0 English Path – STEP 5440 – Reading – understand discussion norms (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que levantar la mano o hacer una señal antes de hablar.", "p_de": "Man soll die Hand heben oder ein klares Zeichen geben, bevor man spricht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Cada turno debe durar aproximadamente un minuto.", "p_de": "Jeder Beitrag soll ungefähr eine Minute dauern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Cuando no estás de acuerdo, debes atacar a la persona anterior.", "p_de": "Wenn man nicht einverstanden ist, soll man die vorige Person angreifen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los móviles deben estar en silencio.", "p_de": "Handys sollen lautlos sein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se pueden escribir notas cortas para preguntas posteriores.", "p_de": "Man kann kurze Notizen für spätere Fragen machen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El moderador nunca puede cerrar un tema.", "p_de": "Der Moderator darf nie ein Thema schließen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que intentar incluir voces más calladas.", "p_de": "Man soll versuchen, leisere Stimmen einzubeziehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Es importante escuchar por completo antes de responder.", "p_de": "Es ist wichtig, vor der Antwort vollständig zuzuhören.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué haces antes de hablar?", "p_de": "Was macht man vor dem Sprechen?", "s": {"type": "multiple_choice", "options": ["Raise your hand or give a clear signal", "Stand up and leave the room", "Call the office desk"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto debe durar un turno?", "p_de": "Wie lange soll ein Beitrag dauern?", "s": {"type": "multiple_choice", "options": ["About one minute", "About ten minutes", "About thirty minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo debes expresar desacuerdo?", "p_de": "Wie soll man Widerspruch ausdrücken?", "s": {"type": "multiple_choice", "options": ["Politely and about the idea", "Loudly and personally", "Only in writing after class"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa con los teléfonos?", "p_de": "Was geschieht mit den Telefonen?", "s": {"type": "multiple_choice", "options": ["They should stay silent", "They should ring loudly", "They are used for every answer"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirven las notas cortas?", "p_de": "Wofür dienen kurze Notizen?", "s": {"type": "multiple_choice", "options": ["For later questions", "For changing the room number", "For printing badges"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede hacer el moderador?", "p_de": "Was darf der Moderator tun?", "s": {"type": "multiple_choice", "options": ["Close one topic before the next", "Cancel all opinions", "Leave without speaking"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién hay que incluir?", "p_de": "Wen soll man einbeziehen?", "s": {"type": "multiple_choice", "options": ["Quieter voices", "Only the moderator", "Only the first speaker"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes hacer antes de responder?", "p_de": "Was soll man vor der Antwort tun?", "s": {"type": "multiple_choice", "options": ["Listen fully", "Interrupt immediately", "Check your phone"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5440 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5440 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5440, 'en', 'reading', 'academic', 'Discussion norms. Raise your hand or give a clear signal before speaking. Keep each turn to about one minute so more people can join.

When you disagree, say so politely and refer to the previous speaker''s idea, not to the person. Keep phones silent and write short notes if you want to ask something later.

The moderator may close one topic before moving to the next. Try to include quieter voices and listen fully before you respond.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Normas para una discusión académica', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Regeln für eine akademische Diskussion', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
