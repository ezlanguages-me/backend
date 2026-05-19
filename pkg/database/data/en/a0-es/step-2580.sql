-- ============================================================
-- Seed: A0 English Path – STEP 2580 – Listening – Escucha cómo indicar dónde te duele
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La enfermera pregunta dónde duele.", "p_de": "Die Krankenschwester fragt, wo es weh tut.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente señala el estómago en el lado derecho.", "p_de": "Der Patient zeigt auf den Magen auf der rechten Seite.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El problema empezó anoche.", "p_de": "Das Problem begann letzte Nacht.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente tiene un poco de fiebre.", "p_de": "Der Patient hat ein wenig Fieber.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente dice que tiene tos y no náuseas.", "p_de": "Der Patient sagt, dass er Husten und keine Übelkeit hat.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La enfermera pregunta si el paciente puede caminar.", "p_de": "Die Krankenschwester fragt, ob der Patient gehen kann.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente dice que puede caminar despacio.", "p_de": "Der Patient sagt, dass er langsam gehen kann.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El dolor está en la cabeza.", "p_de": "Der Schmerz ist im Kopf.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde duele?", "p_de": "Wo tut es weh?", "s": {"type": "multiple_choice", "options": ["In the stomach, on the right side", "In the left arm", "In the throat"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["In the stomach, on the right side", "In the left arm", "In the throat"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In the stomach, on the right side", "In the left arm", "In the throat"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empezó?", "p_de": "Wann hat es angefangen?", "s": {"type": "multiple_choice", "options": ["This morning", "Last week", "Yesterday night"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["This morning", "Last week", "Yesterday night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["This morning", "Last week", "Yesterday night"], "answer": 0}}'::jsonb,
        '{"p": "¿Tiene fiebre?", "p_de": "Hat der Patient Fieber?", "s": {"type": "multiple_choice", "options": ["Yes, a little", "No, not at all", "Only at night"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Yes, a little", "No, not at all", "Only at night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Yes, a little", "No, not at all", "Only at night"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué síntoma tiene además del dolor?", "p_de": "Welches Symptom hat der Patient zusätzlich?", "s": {"type": "multiple_choice", "options": ["Nausea", "A cough", "A rash"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Nausea", "A cough", "A rash"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nausea", "A cough", "A rash"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué síntoma no tiene?", "p_de": "Welches Symptom hat der Patient nicht?", "s": {"type": "multiple_choice", "options": ["A cough", "Nausea", "Pain"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A cough", "Nausea", "Pain"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A cough", "Nausea", "Pain"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace la enfermera al final?", "p_de": "Welche Frage stellt die Krankenschwester am Ende?", "s": {"type": "multiple_choice", "options": ["Can you walk?", "Can you drive?", "Can you eat?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Can you walk?", "Can you drive?", "Can you eat?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Can you walk?", "Can you drive?", "Can you eat?"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo puede caminar el paciente?", "p_de": "Wie kann der Patient gehen?", "s": {"type": "multiple_choice", "options": ["Slowly", "Very fast", "Not at all"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Slowly", "Very fast", "Not at all"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Slowly", "Very fast", "Not at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién hace las preguntas?", "p_de": "Wer stellt die Fragen?", "s": {"type": "multiple_choice", "options": ["The nurse", "The dentist", "The taxi driver"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The nurse", "The dentist", "The taxi driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The nurse", "The dentist", "The taxi driver"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2580 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2580 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2580, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: Sofia, a triage nurse speaking with a patient at urgent care
## "Where Does It Hurt?"

## THE SCENE: The nurse desk in urgent care
A nurse asks short questions while the patient points to the painful place. The patient uses very simple words and body language.

### DIRECTOR'S NOTES
Style:
* Short triage questions with careful repetition.
* Clear symptom words and simple follow-up questions.

Pace: Slow and supportive.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how to say where a health problem is and how a nurse may check the basic details.

#### TRANSCRIPT
[nurse] Nurse: Hello. Where does it hurt?
[patient] Patient: Here, in my stomach. On the right side.
[nurse] Nurse: Okay. Did it start today?
[patient] Patient: Yes, this morning.
[nurse] Nurse: Do you have a fever?
[patient] Patient: Yes, a little.
[nurse] Nurse: Do you have nausea or a cough?
[patient] Patient: Nausea, yes. Cough, no.
[nurse] Nurse: Can you walk?
[patient] Patient: Yes, but slowly.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha cómo indicar dónde te duele', 'Escucha a una enfermera que hace preguntas muy básicas sobre el dolor y los síntomas.'),
        (v_listening_id, 'de', 'Höre, wie man zeigt, wo es weh tut', 'Höre eine Krankenschwester, die sehr einfache Fragen zu Schmerzen und Symptomen stellt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
