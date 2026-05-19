-- ============================================================
-- Seed: A0 English Path – STEP 2570 – Reading – Lee una ficha para indicar el problema
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La ficha pide que señales el lugar del dolor.", "p_de": "Die Karte bittet dich, die Stelle mit dem Schmerz zu zeigen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puedes rodear palabras como head o stomach.", "p_de": "Du kannst Wörter wie head oder stomach einkreisen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No puedes escribir left o right.", "p_de": "Du darfst nicht left oder right schreiben.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ficha incluye síntomas como fever y nausea.", "p_de": "Die Karte enthält Symptome wie fever und nausea.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debes escribir cuándo empezó el problema.", "p_de": "Du sollst schreiben, wann das Problem begonnen hat.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si el dolor es fuerte, debes esperar una hora en silencio.", "p_de": "Wenn der Schmerz stark ist, sollst du eine Stunde still warten.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si no puedes caminar bien, debes pedir ayuda inmediatamente.", "p_de": "Wenn du nicht gut gehen kannst, sollst du sofort um Hilfe bitten.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ficha solo sirve para problemas en los ojos.", "p_de": "Die Karte ist nur für Augenprobleme.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué debes hacer con el lugar del dolor?", "p_de": "Was sollst du mit der Schmerzstelle machen?", "s": {"type": "multiple_choice", "options": ["Point to it", "Hide it", "Wash it"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Point to it", "Hide it", "Wash it"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Point to it", "Hide it", "Wash it"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué palabras puedes rodear?", "p_de": "Welche Wörter kannst du einkreisen?", "s": {"type": "multiple_choice", "options": ["Head, throat, chest, stomach, back, arm, leg", "Monday, Tuesday, Friday", "Tea, coffee, water"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Head, throat, chest, stomach, back, arm, leg", "Monday, Tuesday, Friday", "Tea, coffee, water"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Head, throat, chest, stomach, back, arm, leg", "Monday, Tuesday, Friday", "Tea, coffee, water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué escribes si el dolor está en un solo lado?", "p_de": "Was schreibst du, wenn der Schmerz nur auf einer Seite ist?", "s": {"type": "multiple_choice", "options": ["Left or right", "Morning or night", "Big or small"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Left or right", "Morning or night", "Big or small"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Left or right", "Morning or night", "Big or small"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué síntoma aparece en la lista?", "p_de": "Welches Symptom steht auf der Liste?", "s": {"type": "multiple_choice", "options": ["Nausea", "Ticket", "Umbrella"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Nausea", "Ticket", "Umbrella"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nausea", "Ticket", "Umbrella"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué más debes escribir?", "p_de": "Was musst du außerdem schreiben?", "s": {"type": "multiple_choice", "options": ["When the problem started", "Your hotel number", "Your favorite food"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["When the problem started", "Your hotel number", "Your favorite food"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["When the problem started", "Your hotel number", "Your favorite food"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si el dolor es fuerte?", "p_de": "Was machst du bei starken Schmerzen?", "s": {"type": "multiple_choice", "options": ["Tell the nurse now", "Go home first", "Read a book"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Tell the nurse now", "Go home first", "Read a book"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Tell the nurse now", "Go home first", "Read a book"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si no puedes respirar bien?", "p_de": "Was machst du, wenn du schlecht atmen kannst?", "s": {"type": "multiple_choice", "options": ["Ask for help immediately", "Wait until tomorrow", "Take a bus home"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Ask for help immediately", "Wait until tomorrow", "Take a bus home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ask for help immediately", "Wait until tomorrow", "Take a bus home"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién aparece en la ficha como persona de ayuda?", "p_de": "Wer wird auf der Karte als Hilfsperson genannt?", "s": {"type": "multiple_choice", "options": ["The nurse", "The waiter", "The driver"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The nurse", "The waiter", "The driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The nurse", "The waiter", "The driver"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2570 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2570 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2570, 'en', 'reading', 'health', 'Urgent Care Symptom Card

Please point to the place with pain. Circle one or more words: head, throat, chest, stomach, back, arm, leg. Write left or right if the pain is on one side.

Tick the symptoms you have now: fever, cough, nausea, dizziness. Write when the problem started.

If the pain is strong, tell the nurse now. If you cannot walk or breathe well, ask for help immediately.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee una ficha para indicar el problema', 'Lee una ficha de triaje con instrucciones simples para decir qué te pasa.'),
        (v_reading_id, 'de', 'Lies eine Karte, um das Problem anzugeben', 'Lies eine Triage-Karte mit einfachen Anweisungen, um dein Problem zu beschreiben.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
