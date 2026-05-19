-- ============================================================
-- Seed: A0 English Path – STEP 2540 – Listening – Escucha cómo pedir una cita médica
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El paciente necesita una cita médica para hoy.", "p_de": "Der Patient braucht heute einen Arzttermin.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La siguiente cita libre hoy es a las 4:15 con Dr Lee.", "p_de": "Der nächste freie Termin heute ist um 4:15 bei Dr Lee.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La otra cita es hoy a las 9.", "p_de": "Der andere Termin ist heute um 9 Uhr.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente acepta la cita de hoy.", "p_de": "Der Patient nimmt den heutigen Termin an.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La recepcionista pide el nombre y el número de teléfono.", "p_de": "Die Rezeptionistin fragt nach Name und Telefonnummer.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente debe traer su pasaporte y una maleta.", "p_de": "Der Patient soll seinen Pass und einen Koffer mitbringen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente debe llegar diez minutos antes.", "p_de": "Der Patient soll zehn Minuten früher kommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente dice que debe estar allí a las 4:05.", "p_de": "Der Patient sagt, dass er um 4:05 dort sein muss.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A qué hora es la siguiente cita libre hoy?", "p_de": "Um wie viel Uhr ist der nächste freie Termin heute?", "s": {"type": "multiple_choice", "options": ["At 4:15", "At 3:15", "At 9 AM"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["At 4:15", "At 3:15", "At 9 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["At 4:15", "At 3:15", "At 9 AM"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué médico es la cita?", "p_de": "Bei welchem Arzt ist der Termin?", "s": {"type": "multiple_choice", "options": ["Dr Lee", "Dr Green", "Dr Brown"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Dr Lee", "Dr Green", "Dr Brown"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dr Lee", "Dr Green", "Dr Brown"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la otra hora disponible?", "p_de": "Welche andere Uhrzeit ist frei?", "s": {"type": "multiple_choice", "options": ["Tomorrow at 9 AM", "Today at 9 AM", "Tomorrow at 5 PM"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Tomorrow at 9 AM", "Today at 9 AM", "Tomorrow at 5 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Tomorrow at 9 AM", "Today at 9 AM", "Tomorrow at 5 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué datos pide la recepcionista?", "p_de": "Welche Daten fragt die Rezeptionistin?", "s": {"type": "multiple_choice", "options": ["Name and phone number", "Passport and address", "Age and job"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Name and phone number", "Passport and address", "Age and job"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Name and phone number", "Passport and address", "Age and job"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe traer el paciente?", "p_de": "Was muss der Patient mitbringen?", "s": {"type": "multiple_choice", "options": ["Health card", "Train ticket", "Umbrella"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Health card", "Train ticket", "Umbrella"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Health card", "Train ticket", "Umbrella"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debe llegar?", "p_de": "Wann soll er ankommen?", "s": {"type": "multiple_choice", "options": ["Ten minutes early", "Exactly on time", "One hour early"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Ten minutes early", "Exactly on time", "One hour early"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ten minutes early", "Exactly on time", "One hour early"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hora repite el paciente al final?", "p_de": "Welche Uhrzeit wiederholt der Patient am Ende?", "s": {"type": "multiple_choice", "options": ["4:05", "4:15", "3:45"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["4:05", "4:15", "3:45"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["4:05", "4:15", "3:45"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de ayuda pide el paciente?", "p_de": "Welche Hilfe verlangt der Patient?", "s": {"type": "multiple_choice", "options": ["A doctor appointment", "A taxi", "A dentist bill"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A doctor appointment", "A taxi", "A dentist bill"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A doctor appointment", "A taxi", "A dentist bill"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 2540 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 2540 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 2540, 'en', 'listening', 'health', $transcript$
# AUDIO PROFILE: Maya, a clinic receptionist speaking face to face with a patient
## "A Doctor Appointment for Today"

## THE SCENE: The front desk of a busy health centre in the morning
A patient arrives without an appointment and asks for a doctor. Maya checks the screen, offers two times, and explains what the patient must bring.

### DIRECTOR'S NOTES
Style:
* Calm, practical receptionist language with short answers.
* Important details like time, doctor, and arrival instructions are repeated clearly.

Pace: Slow and polite, with extra clarity for numbers and times.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear how to ask for a face-to-face medical appointment and how the receptionist replies with time, doctor, and simple instructions.

#### TRANSCRIPT
[polite] Receptionist: Good morning. How can I help you?
[clear] Patient: Hello. I need a doctor appointment today, please.
[checking] Receptionist: Let me look. The next free appointment today is at 4:15 with Dr Lee.
[helpful] Receptionist: If that is not good, there is another one tomorrow at 9 AM.
[deciding] Patient: Today at 4:15 is good.
[practical] Receptionist: Fine. What is your name and phone number?
[careful] Patient: I am Luis Torres. My phone number is 555-0184.
[clear] Receptionist: Thank you. Please bring your health card and arrive ten minutes early.
[confirming] Patient: So I need to be here at 4:05.
[warm] Receptionist: Yes, that is right.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha cómo pedir una cita médica', 'Escucha a una recepcionista que ofrece una cita médica y da instrucciones simples.'),
        (v_listening_id, 'de', 'Höre, wie man einen Arzttermin vereinbart', 'Höre eine Rezeptionistin, die einen Arzttermin anbietet und einfache Anweisungen gibt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
