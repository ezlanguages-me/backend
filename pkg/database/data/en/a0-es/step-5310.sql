-- ============================================================
-- Seed: A0 English Path – STEP 5310 – Reading – understand essay feedback (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La introducción del ensayo es clara.", "p_de": "Die Einleitung des Aufsatzes ist klar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El ejemplo de Madrid es un punto fuerte.", "p_de": "Das Beispiel aus Madrid ist eine Stärke.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El párrafo sobre el coste necesita más detalle.", "p_de": "Der Absatz über Kosten braucht mehr Details.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay errores de tiempo verbal en el segundo párrafo.", "p_de": "Im zweiten Absatz gibt es keine Zeitfehler.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Falta el número de página en una cita.", "p_de": "Bei einem Zitat fehlt die Seitenzahl.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conclusión es demasiado larga.", "p_de": "Der Schluss ist zu lang.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La revisión debe entregarse el viernes.", "p_de": "Die Überarbeitung soll am Freitag abgegeben werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay horas de tutoría el miércoles por la tarde.", "p_de": "Es gibt Sprechstunde am Mittwochnachmittag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué parte del ensayo es clara?", "p_de": "Welcher Teil des Aufsatzes ist klar?", "s": {"type": "multiple_choice", "options": ["The introduction", "The citation list", "The conclusion only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ejemplo se valora positivamente?", "p_de": "Welches Beispiel wird positiv bewertet?", "s": {"type": "multiple_choice", "options": ["The example from Madrid", "The example from Berlin station", "The phone call example"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué necesita el párrafo sobre el coste?", "p_de": "Was braucht der Absatz über Kosten?", "s": {"type": "multiple_choice", "options": ["More detail", "A new title only", "No changes at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema hay en el segundo párrafo?", "p_de": "Welches Problem gibt es im zweiten Absatz?", "s": {"type": "multiple_choice", "options": ["Some tense mistakes", "No topic sentence", "No words"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué falta en una cita?", "p_de": "Was fehlt in einem Zitat?", "s": {"type": "multiple_choice", "options": ["A page number", "A room number", "A phone extension"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la conclusión según los comentarios?", "p_de": "Wie ist der Schluss laut Rückmeldung?", "s": {"type": "multiple_choice", "options": ["Too short", "Too long", "Very strong and final"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo hay que revisar el ensayo?", "p_de": "Bis wann soll der Aufsatz überarbeitet werden?", "s": {"type": "multiple_choice", "options": ["By Friday", "By Monday morning", "By next month"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo son las horas de tutoría?", "p_de": "Wann ist die Sprechstunde?", "s": {"type": "multiple_choice", "options": ["Wednesday afternoon", "Tuesday night", "Saturday morning"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5310 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5310 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5310, 'en', 'reading', 'academic', 'Essay feedback. Your introduction is clear and the example from Madrid is strong. The main argument is easy to follow, but the paragraph on cost needs more detail.

There are also some tense mistakes in the second paragraph. One citation is missing a page number, and the conclusion is too short.

Please revise the essay by Friday. If you want extra help, come to office hours on Wednesday afternoon.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Comentarios sobre un ensayo', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Rückmeldung zu einem Aufsatz', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
