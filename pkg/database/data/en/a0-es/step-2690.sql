-- ============================================================
-- Seed: A0 English Path – STEP 2690 – Reading – Lee instrucciones de un medicamento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que tomar una tableta dos veces al día después de comer.", "p_de": "Man soll zweimal am Tag nach dem Essen eine Tablette nehmen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pastilla se toma con agua.", "p_de": "Die Tablette wird mit Wasser genommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede tomar con alcohol.", "p_de": "Man kann sie mit Alkohol nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Puedes parar cuando te sientas mejor.", "p_de": "Du kannst aufhören, wenn du dich besser fühlst.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La caja debe guardarse por debajo de 25 grados.", "p_de": "Die Packung soll unter 25 Grad aufbewahrt werden.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si olvidas una dosis, debes tomar dos juntas.", "p_de": "Wenn du eine Dosis vergisst, sollst du zwei zusammen nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El tratamiento dura siete días.", "p_de": "Die Behandlung dauert sieben Tage.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que la medicina se toma antes de dormir solamente.", "p_de": "Im Text steht, dass das Medikament nur vor dem Schlafen genommen wird.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuántas veces al día tomas la tableta?", "p_de": "Wie oft am Tag nimmst du die Tablette?", "s": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Three times an hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Three times an hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Three times an hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo la tomas?", "p_de": "Wann nimmst du sie?", "s": {"type": "multiple_choice", "options": ["After food", "Before driving", "Only at night"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["After food", "Before driving", "Only at night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["After food", "Before driving", "Only at night"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué la tomas?", "p_de": "Womit nimmst du sie?", "s": {"type": "multiple_choice", "options": ["With water", "With coffee", "With juice and sugar"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["With water", "With coffee", "With juice and sugar"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["With water", "With coffee", "With juice and sugar"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debes beber con esta medicina?", "p_de": "Was sollst du mit diesem Medikament nicht trinken?", "s": {"type": "multiple_choice", "options": ["Alcohol", "Water", "Tea"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Alcohol", "Water", "Tea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Alcohol", "Water", "Tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces aunque te sientas mejor?", "p_de": "Was machst du auch dann, wenn du dich besser fühlst?", "s": {"type": "multiple_choice", "options": ["Finish all the tablets", "Stop on day two", "Give the box away"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Finish all the tablets", "Stop on day two", "Give the box away"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Finish all the tablets", "Stop on day two", "Give the box away"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde guardas la caja?", "p_de": "Wo bewahrst du die Packung auf?", "s": {"type": "multiple_choice", "options": ["Below 25°C", "In hot sun", "In the car all day"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Below 25°C", "In hot sun", "In the car all day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Below 25°C", "In hot sun", "In the car all day"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si olvidas una dosis?", "p_de": "Was machst du, wenn du eine Dosis vergisst?", "s": {"type": "multiple_choice", "options": ["Take it when you remember", "Take two together", "Never take it again"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Take it when you remember", "Take two together", "Never take it again"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Take it when you remember", "Take two together", "Never take it again"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos días dura el tratamiento?", "p_de": "Wie viele Tage dauert die Behandlung?", "s": {"type": "multiple_choice", "options": ["Seven days", "One day", "Thirty days"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Seven days", "One day", "Thirty days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seven days", "One day", "Thirty days"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2690 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2690 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2690, 'en', 'reading', 'health', 'Medicine Instructions

Take one tablet twice a day after food for seven days. Swallow the tablet with water.

Do not take the medicine with alcohol. Finish all the tablets, even if you feel better. Keep the box below 25°C.

If you miss one dose, take it when you remember, but do not take two tablets together.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee instrucciones de un medicamento', 'Lee una hoja simple con las instrucciones básicas de una medicina.'),
        (v_reading_id, 'de', 'Lies Anweisungen zu einem Medikament', 'Lies ein einfaches Blatt mit den Grundanweisungen zu einem Medikament.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
