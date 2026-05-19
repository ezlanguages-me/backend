-- ============================================================
-- Seed: A0 English Path – STEP 2780 – Listening – Escucha información sobre servicios de salud
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El paciente es nuevo en el centro.", "p_de": "Der Patient ist neu im Zentrum.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empleada menciona GP appointments, nurse clinic y urgent care.", "p_de": "Die Mitarbeiterin nennt GP appointments, nurse clinic und urgent care.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Urgent care es solo para comprar medicinas.", "p_de": "Urgent care ist nur zum Kaufen von Medikamenten.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ayuda de intérprete es gratis, pero hay que reservarla antes.", "p_de": "Die Dolmetscherhilfe ist kostenlos, aber man muss sie vorher buchen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para registrarte necesitas ID, dirección y tarjeta sanitaria.", "p_de": "Zur Anmeldung brauchst du ID, Adresse und Gesundheitskarte.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El niño puede ir solo a la clínica de enfermería.", "p_de": "Das Kind kann allein in die Pflegeklinik gehen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente pregunta por los servicios del centro.", "p_de": "Der Patient fragt nach den Diensten des Zentrums.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empleada dice que urgent care es para respirar mejor, fiebre o dolor fuerte.", "p_de": "Die Mitarbeiterin sagt, urgent care sei bei Atemproblemen, Fieber oder starken Schmerzen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pregunta hace primero el paciente?", "p_de": "Was fragt der Patient zuerst?", "s": {"type": "multiple_choice", "options": ["What services do you have?", "How much is the taxi?", "Where is the hotel?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["What services do you have?", "How much is the taxi?", "Where is the hotel?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["What services do you have?", "How much is the taxi?", "Where is the hotel?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicios menciona la empleada?", "p_de": "Welche Dienste nennt die Mitarbeiterin?", "s": {"type": "multiple_choice", "options": ["GP appointments, a nurse clinic, and urgent care", "Only dentistry", "Only sports classes"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["GP appointments, a nurse clinic, and urgent care", "Only dentistry", "Only sports classes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["GP appointments, a nurse clinic, and urgent care", "Only dentistry", "Only sports classes"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué es urgent care?", "p_de": "Wofür ist urgent care?", "s": {"type": "multiple_choice", "options": ["Strong pain, fever, or breathing problems", "Buying lunch", "A train ticket"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Strong pain, fever, or breathing problems", "Buying lunch", "A train ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Strong pain, fever, or breathing problems", "Buying lunch", "A train ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la ayuda de intérprete?", "p_de": "Wie ist die Dolmetscherhilfe?", "s": {"type": "multiple_choice", "options": ["Free if you book it first", "Only for children", "Very expensive"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Free if you book it first", "Only for children", "Very expensive"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Free if you book it first", "Only for children", "Very expensive"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace falta para registrarse?", "p_de": "Was braucht man zur Anmeldung?", "s": {"type": "multiple_choice", "options": ["ID, address, and health card", "Only a passport photo", "Only cash"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["ID, address, and health card", "Only a passport photo", "Only cash"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["ID, address, and health card", "Only a passport photo", "Only cash"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace sobre su hijo?", "p_de": "Welche Frage stellt der Patient über sein Kind?", "s": {"type": "multiple_choice", "options": ["Can my child use the nurse clinic?", "Can my child drive here?", "Can my child buy coffee?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Can my child use the nurse clinic?", "Can my child drive here?", "Can my child buy coffee?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Can my child use the nurse clinic?", "Can my child drive here?", "Can my child buy coffee?"], "answer": 0}}'::jsonb,
        '{"p": "¿Con quién puede usar el niño la clínica de enfermería?", "p_de": "Mit wem kann das Kind die Pflegeklinik nutzen?", "s": {"type": "multiple_choice", "options": ["With a parent or guardian", "With a taxi driver", "With nobody"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["With a parent or guardian", "With a taxi driver", "With nobody"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["With a parent or guardian", "With a taxi driver", "With nobody"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde ocurre la conversación?", "p_de": "Wo findet das Gespräch statt?", "s": {"type": "multiple_choice", "options": ["At the information desk", "At the cinema", "At a bakery"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["At the information desk", "At the cinema", "At a bakery"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["At the information desk", "At the cinema", "At a bakery"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2780 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2780 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2780, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: A health-centre clerk explaining services at the front desk
## "What Services Do You Need?"

## THE SCENE: The information desk in a community health centre
A new patient asks what services are available and what documents are needed to register.

### DIRECTOR'S NOTES
Style:
* Clear service-desk language with practical nouns and verbs.
* Documents and entitlement information are repeated carefully.

Pace: Slow and informative.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how to ask about health services, registration, interpreter support, and who can use urgent care.

#### TRANSCRIPT
[clerk] Clerk: Hello. How can I help you today?
[patient] Patient: I am new here. What services do you have?
[clerk] Clerk: We have GP appointments, a nurse clinic, and urgent care.
[clerk] Clerk: Urgent care is for strong pain, fever, or breathing problems.
[patient] Patient: Do you have interpreter help?
[clerk] Clerk: Yes. It is free, but please book it first.
[patient] Patient: What do I need to register?
[clerk] Clerk: Bring ID, your address, and your health card.
[patient] Patient: Can my child use the nurse clinic?
[clerk] Clerk: Yes, with a parent or guardian.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha información sobre servicios de salud', 'Escucha a una empleada que explica servicios, documentos y derecho a intérprete.'),
        (v_listening_id, 'de', 'Höre Informationen über Gesundheitsdienste', 'Höre einer Mitarbeiterin zu, die Dienste, Dokumente und den Anspruch auf einen Dolmetscher erklärt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
