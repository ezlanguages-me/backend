-- ============================================================
-- Seed: A0 English Path – STEP 2860 – Listening – Escucha opciones de tratamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La erupción es leve y empiezan con una crema.", "p_de": "Der Ausschlag ist leicht und man beginnt mit einer Creme.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La crema se pone dos veces al día durante una semana.", "p_de": "Die Creme wird zweimal am Tag eine Woche lang aufgetragen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las pastillas se toman siempre desde el primer minuto.", "p_de": "Die Tabletten werden immer vom ersten Moment an genommen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La pastilla para la alergia es una al día si el picor empeora.", "p_de": "Die Allergietablette ist eine pro Tag, wenn der Juckreiz schlimmer wird.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si la erupción se extiende, hay que volver a la clínica.", "p_de": "Wenn sich der Ausschlag ausbreitet, soll man in die Klinik zurückkommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si no hay cambios después de una semana, quizá envíen al paciente a un especialista.", "p_de": "Wenn es nach einer Woche keine Veränderung gibt, wird der Patient vielleicht zu einem Spezialisten geschickt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El médico recomienda duchas calientes y jabón perfumado.", "p_de": "Der Arzt empfiehlt heiße Duschen und parfümierte Seife.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente resume cream first, tablets if it gets worse.", "p_de": "Der Patient fasst zusammen: erst Creme, dann Tabletten, wenn es schlimmer wird.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Con qué tratamiento empiezan?", "p_de": "Mit welcher Behandlung beginnen sie?", "s": {"type": "multiple_choice", "options": ["With a cream", "With surgery", "With a bus trip"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["With a cream", "With surgery", "With a bus trip"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["With a cream", "With surgery", "With a bus trip"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas veces al día se usa la crema?", "p_de": "Wie oft am Tag benutzt man die Creme?", "s": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Every hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Every hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Every hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se toma la pastilla?", "p_de": "Wann nimmt man die Tablette?", "s": {"type": "multiple_choice", "options": ["If the itching gets strong", "Only in winter", "Before breakfast every ten minutes"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["If the itching gets strong", "Only in winter", "Before breakfast every ten minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["If the itching gets strong", "Only in winter", "Before breakfast every ten minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa si la erupción se extiende?", "p_de": "Was passiert, wenn sich der Ausschlag ausbreitet?", "s": {"type": "multiple_choice", "options": ["Come back to the clinic", "Go to the cinema", "Take two showers"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Come back to the clinic", "Go to the cinema", "Take two showers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Come back to the clinic", "Go to the cinema", "Take two showers"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede hacer el médico después de una semana sin cambios?", "p_de": "Was kann der Arzt nach einer Woche ohne Veränderung tun?", "s": {"type": "multiple_choice", "options": ["Send the patient to a skin specialist", "Give a train ticket", "Sell soap"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Send the patient to a skin specialist", "Give a train ticket", "Sell soap"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Send the patient to a skin specialist", "Give a train ticket", "Sell soap"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe evitar el paciente?", "p_de": "Was soll der Patient vermeiden?", "s": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Water and rest", "Cream and tablets"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Water and rest", "Cream and tablets"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Water and rest", "Cream and tablets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué resume el paciente?", "p_de": "Was fasst der Patient zusammen?", "s": {"type": "multiple_choice", "options": ["Cream first, tablets if it gets worse", "Tablets only forever", "No treatment at all"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Cream first, tablets if it gets worse", "Tablets only forever", "No treatment at all"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Cream first, tablets if it gets worse", "Tablets only forever", "No treatment at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién explica las opciones?", "p_de": "Wer erklärt die Optionen?", "s": {"type": "multiple_choice", "options": ["The doctor", "The waiter", "The driver"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The doctor", "The waiter", "The driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The doctor", "The waiter", "The driver"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2860 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2860 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2860, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: A doctor explaining two treatment options for a mild rash
## "Cream First or Tablets?"

## THE SCENE: The end of a short skin consultation
The doctor explains two simple options and says when a specialist may be needed.

### DIRECTOR'S NOTES
Style:
* Short comparison language: option A, option B, if, then.
* The difference between light and strong symptoms is clear.

Pace: Slow and explanatory.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear simple treatment alternatives and the reasons for choosing one option or another.

#### TRANSCRIPT
[doctor] Doctor: The rash is mild, so we can start with a cream.
[doctor] Doctor: Put the cream on the skin twice a day for one week.
[doctor] Doctor: If the itching gets strong, you can also take one allergy tablet a day.
[doctor] Doctor: If the rash spreads, come back to the clinic.
[doctor] Doctor: If there is no change after one week, I may send you to a skin specialist.
[doctor] Doctor: Please avoid hot showers and perfumed soap.
[patient] Patient: Okay. Cream first, tablets if it gets worse.
[doctor] Doctor: Yes, exactly.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha opciones de tratamiento', 'Escucha al médico explicar dos opciones simples de tratamiento para una erupción leve.'),
        (v_listening_id, 'de', 'Höre Behandlungsoptionen', 'Höre, wie der Arzt zwei einfache Behandlungsoptionen für einen leichten Ausschlag erklärt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
