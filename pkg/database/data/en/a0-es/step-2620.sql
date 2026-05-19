-- ============================================================
-- Seed: A0 English Path – STEP 2620 – Listening – Escucha cómo explicar qué te pasa en la farmacia
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente tiene tos fuerte y dolor de garganta.", "p_de": "Der Kunde hat starken Husten und Halsschmerzen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tiene un poco de fiebre desde ayer.", "p_de": "Er hat seit gestern ein wenig Fieber.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dice que tiene una alergia fuerte.", "p_de": "Er sagt, dass er eine starke Allergie hat.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El farmacéutico recomienda un jarabe para la noche.", "p_de": "Der Apotheker empfiehlt einen Sirup für die Nacht.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También recomienda caramelos para la garganta.", "p_de": "Er empfiehlt auch Bonbons für den Hals.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si la fiebre sube, dice que no hace falta médico.", "p_de": "Wenn das Fieber steigt, sagt er, dass kein Arzt nötig ist.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente necesita algo para esta noche.", "p_de": "Der Kunde braucht etwas für heute Abend.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El farmacéutico dice que tome el jarabe antes de hacer deporte.", "p_de": "Der Apotheker sagt, er soll den Sirup vor dem Sport nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué problemas tiene el cliente?", "p_de": "Welche Probleme hat der Kunde?", "s": {"type": "multiple_choice", "options": ["A bad cough and a sore throat", "A broken arm and a rash", "A toothache and back pain"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A bad cough and a sore throat", "A broken arm and a rash", "A toothache and back pain"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A bad cough and a sore throat", "A broken arm and a rash", "A toothache and back pain"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde cuándo tiene fiebre?", "p_de": "Seit wann hat er Fieber?", "s": {"type": "multiple_choice", "options": ["Since yesterday", "Since last month", "Since this morning only"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Since yesterday", "Since last month", "Since this morning only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Since yesterday", "Since last month", "Since this morning only"], "answer": 0}}'::jsonb,
        '{"p": "¿Tiene alergia?", "p_de": "Hat er eine Allergie?", "s": {"type": "multiple_choice", "options": ["No", "Yes, a strong one", "He does not know"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["No", "Yes, a strong one", "He does not know"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["No", "Yes, a strong one", "He does not know"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recomienda el farmacéutico para la noche?", "p_de": "Was empfiehlt der Apotheker für die Nacht?", "s": {"type": "multiple_choice", "options": ["Cough syrup", "An X-ray", "A bus ticket"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Cough syrup", "An X-ray", "A bus ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Cough syrup", "An X-ray", "A bus ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué más puede ayudar?", "p_de": "Was kann noch helfen?", "s": {"type": "multiple_choice", "options": ["Throat sweets", "Cold water only", "Running fast"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Throat sweets", "Cold water only", "Running fast"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Throat sweets", "Cold water only", "Running fast"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer si la fiebre sube?", "p_de": "Was soll er tun, wenn das Fieber steigt?", "s": {"type": "multiple_choice", "options": ["See a doctor", "Eat ice cream", "Stay outside"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["See a doctor", "Eat ice cream", "Stay outside"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["See a doctor", "Eat ice cream", "Stay outside"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debe tomar el jarabe?", "p_de": "Wann soll er den Sirup nehmen?", "s": {"type": "multiple_choice", "options": ["After food this evening", "Before breakfast tomorrow", "At work"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["After food this evening", "Before breakfast tomorrow", "At work"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["After food this evening", "Before breakfast tomorrow", "At work"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde ocurre la conversación?", "p_de": "Wo findet das Gespräch statt?", "s": {"type": "multiple_choice", "options": ["At a pharmacy", "At a hotel", "At a train station"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["At a pharmacy", "At a hotel", "At a train station"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["At a pharmacy", "At a hotel", "At a train station"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2620 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2620 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2620, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: Omar, a pharmacist helping a customer with simple symptoms
## "What Is Wrong?"

## THE SCENE: A quiet pharmacy counter in the evening
A customer explains a cough and sore throat in simple English. The pharmacist asks a few short questions and gives a basic recommendation.

### DIRECTOR'S NOTES
Style:
* Very clear symptom words and short question-answer turns.
* Practical pharmacy language with one simple warning.

Pace: Slow and careful.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how to explain what is wrong at a chemist''s and understand simple advice about what to take.

#### TRANSCRIPT
[welcoming] Pharmacist: Hello. How can I help you?
[patient] Customer: I have a bad cough and a sore throat.
[checking] Pharmacist: Do you have a fever?
[patient] Customer: Yes, a little, since yesterday.
[checking] Pharmacist: Do you have any allergy?
[patient] Customer: No.
[helpful] Pharmacist: Okay. This cough syrup is good at night, and these throat sweets can help.
[warning] Pharmacist: If the fever gets high, you should see a doctor.
[patient] Customer: Thank you. I need something for tonight.
[pharmacist] Pharmacist: Then take the syrup after food this evening.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha cómo explicar qué te pasa en la farmacia', 'Escucha a un cliente que describe sus síntomas con frases muy simples en una farmacia.'),
        (v_listening_id, 'de', 'Höre, wie man in der Apotheke erklärt, was los ist', 'Höre einen Kunden, der seine Symptome mit sehr einfachen Sätzen in einer Apotheke beschreibt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
