-- ============================================================
-- Seed: A0 English Path – STEP 2660 – Listening – Escucha los consejos del médico
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El médico dice que el paciente tiene una infección en el pecho.", "p_de": "Der Arzt sagt, dass der Patient eine Brustinfektion hat.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dice que es muy grave.", "p_de": "Er sagt, dass sie sehr ernst ist.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente debe descansar en casa dos días.", "p_de": "Der Patient soll zwei Tage zu Hause ruhen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe beber agua caliente y té.", "p_de": "Er soll warmes Wasser und Tee trinken.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La medicina se toma dos veces al día después de comer.", "p_de": "Das Medikament wird zweimal täglich nach dem Essen genommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puede hacer deporte esta semana.", "p_de": "Er kann diese Woche Sport machen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si respira peor, debe llamar a la clínica.", "p_de": "Wenn er schlechter atmet, soll er die Klinik anrufen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si el lunes sigue con fiebre, debe volver.", "p_de": "Wenn er am Montag noch Fieber hat, soll er zurückkommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué problema tiene el paciente?", "p_de": "Welches Problem hat der Patient?", "s": {"type": "multiple_choice", "options": ["A chest infection", "A broken leg", "A tooth problem"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A chest infection", "A broken leg", "A tooth problem"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A chest infection", "A broken leg", "A tooth problem"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto tiempo debe descansar?", "p_de": "Wie lange soll er ruhen?", "s": {"type": "multiple_choice", "options": ["For two days", "For one hour", "For two weeks"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["For two days", "For one hour", "For two weeks"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["For two days", "For one hour", "For two weeks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe beber?", "p_de": "Was soll er trinken?", "s": {"type": "multiple_choice", "options": ["Warm water and tea", "Only cola", "Cold milk"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Warm water and tea", "Only cola", "Cold milk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Warm water and tea", "Only cola", "Cold milk"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas veces al día toma la medicina?", "p_de": "Wie oft am Tag nimmt er das Medikament?", "s": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Every hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Every hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Every hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debe hacer esta semana?", "p_de": "Was soll er diese Woche nicht tun?", "s": {"type": "multiple_choice", "options": ["Do sport", "Sleep", "Talk"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Do sport", "Sleep", "Talk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Do sport", "Sleep", "Talk"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace si respira peor?", "p_de": "Was macht er, wenn er schlechter atmet?", "s": {"type": "multiple_choice", "options": ["Call the clinic", "Take a train", "Buy shoes"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Call the clinic", "Take a train", "Buy shoes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Call the clinic", "Take a train", "Buy shoes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué día aparece en la conversación?", "p_de": "Welcher Tag erscheint im Gespräch?", "s": {"type": "multiple_choice", "options": ["Monday", "Saturday", "Thursday"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Monday", "Saturday", "Thursday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Monday", "Saturday", "Thursday"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué repite el paciente al final?", "p_de": "Was wiederholt der Patient am Ende?", "s": {"type": "multiple_choice", "options": ["The main advice", "His address", "The price"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The main advice", "His address", "The price"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The main advice", "His address", "The price"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2660 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2660 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2660, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: Dr Singh giving simple advice after a consultation
## "What You Should Do Now"

## THE SCENE: The end of a routine doctor visit
The doctor explains the main advice slowly: rest, fluids, medicine, and when to call again.

### DIRECTOR'S NOTES
Style:
* Clear medical advice in short steps.
* The order is important: rest, drink, take medicine, avoid exercise, call if worse.

Pace: Slow and calm.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear the main points of a doctor''s advice and practise understanding practical follow-up instructions from a consultation.

#### TRANSCRIPT
[doctor] Doctor: You have a chest infection, but it is not serious.
[doctor] Doctor: Please rest at home for two days.
[doctor] Doctor: Drink warm water and tea.
[doctor] Doctor: Take this medicine twice a day after food.
[doctor] Doctor: Do not do sport this week.
[doctor] Doctor: If your breathing gets worse, call the clinic.
[doctor] Doctor: If you still have a fever on Monday, come back.
[patient] Patient: Okay. Rest, warm drinks, medicine twice a day, and no sport.
[doctor] Doctor: Yes, exactly.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha los consejos del médico', 'Escucha al médico explicar los puntos principales del tratamiento y del descanso.'),
        (v_listening_id, 'de', 'Höre die Ratschläge des Arztes', 'Höre, wie der Arzt die wichtigsten Punkte zu Behandlung und Ruhe erklärt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
