-- ============================================================
-- Seed: A0 English Path – STEP 5820 – Listening – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La asesora pide escribir en mayúsculas.", "de": "Die Beraterin bittet darum, in Großbuchstaben zu schreiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hace falta el número de estudiante.", "de": "Die Studentennummer wird benötigt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "No hace falta foto de pasaporte.", "de": "Es ist kein Passfoto nötig.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La tasa es de quince libras.", "de": "Die Gebühr beträgt fünfzehn Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se puede enviar una copia escaneada antes del viernes a las 3 PM.", "de": "Man kann vor Freitag um 15 Uhr eine Scan-Kopie schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La oficina de estudiantes está en la primera planta.", "de": "Das Studierendenbüro ist im ersten Stock.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La oficina abre hasta las 4 PM.", "de": "Das Büro ist bis 16 Uhr geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El estudiante pregunta si puede enviar el formulario por email.", "de": "Der Student fragt, ob er das Formular per E-Mail schicken kann.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cómo debe escribirse el formulario?", "de": "Wie soll das Formular ausgefüllt werden?", "s_es": {"type": "multiple_choice", "options": ["In capital letters", "In pencil only", "On lined paper only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Großbuchstaben", "Nur mit Bleistift", "Nur auf liniertem Papier"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué documento pide la asesora?", "de": "Welches Dokument verlangt die Beraterin?", "s_es": {"type": "multiple_choice", "options": ["Proof of address", "A train ticket", "A library book"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Adressnachweis", "Ein Zugticket", "Ein Bibliotheksbuch"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la matrícula?", "de": "Wie viel kostet die Einschreibung?", "s_es": {"type": "multiple_choice", "options": ["Fifteen pounds", "Five pounds", "Twenty pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fünfzehn Pfund", "Fünf Pfund", "Zwanzig Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la fecha límite para el correo?", "de": "Welche Frist gilt für die E-Mail?", "s_es": {"type": "multiple_choice", "options": ["Before Friday at 3 PM", "Before Thursday at noon", "Before Monday at 5 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor Freitag um 15 Uhr", "Vor Donnerstagmittag", "Vor Montag um 17 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está la oficina de estudiantes?", "de": "Wo ist das Studierendenbüro?", "s_es": {"type": "multiple_choice", "options": ["On the ground floor", "On the top floor", "Next to the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Erdgeschoss", "Im obersten Stock", "Neben dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pregunta hace el estudiante?", "de": "Welche Frage stellt der Student?", "s_es": {"type": "multiple_choice", "options": ["If he can email the form", "If he can buy a bus pass", "If he can borrow a bike"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ob er das Formular per E-Mail senden kann", "Ob er eine Fahrkarte kaufen kann", "Ob er ein Fahrrad leihen kann"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hora de cierre se menciona?", "de": "Welche Schließzeit wird genannt?", "s_es": {"type": "multiple_choice", "options": ["4 PM", "2 PM", "6 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["16 Uhr", "14 Uhr", "18 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué día debe enviar la copia escaneada?", "de": "Bis wann soll die Scan-Kopie geschickt werden?", "s_es": {"type": "multiple_choice", "options": ["Before Friday", "Before Tuesday", "Before Sunday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor Freitag", "Vor Dienstag", "Vor Sonntag"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 5820 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 5820 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 5820, 'en', 'listening', 'Gestión del Estudio y Trámites', $transcript$
# AUDIO PROFILE: Maya, a college enrolment adviser
## "How to Enrol Today"

## THE SCENE: A student desk in a busy enrolment office
A new student wants to join an evening course and needs simple instructions.
Maya speaks clearly, repeats the important dates, and lists the documents slowly.

### DIRECTOR'S NOTES
Style:
* Calm office voice with clear repetition of numbers and deadlines.
* The adviser pauses before each important instruction.

Pace: Slow, with short pauses after dates and times.

Accent: Neutral British accent.

### SAMPLE CONTEXT
Learners hear how to complete a college enrolment and where to send the form.
The audio practises documents, deadlines, and basic office language.

#### TRANSCRIPT
[helpful] Adviser: Good morning. To enrol, please fill in the form in capital letters.
[clear] Adviser: Write your full name, student number, and course code.
[practical] Adviser: Please bring one ID card, one passport photo, and proof of address.
[checking] Student: Do I need to pay today?
[clear] Adviser: Yes. The registration fee is fifteen pounds.
[helpful] Student: Can I send the form by email?
[clear] Adviser: Yes. You can email a scanned copy before Friday at 3 PM.
[practical] Student: And where is the student office?
[clear] Adviser: It is on the ground floor, open from 9 AM to 4 PM.
[closing] Adviser: If you have questions, come back before 4 PM.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'Escucha las instrucciones de matrícula', 'Escucha a una asesora que explica cómo matricularse y qué documentos llevar.'),
        (v_listening_id, 'de', 'Höre die Einschreibeanweisungen', 'Höre eine Beraterin, die erklärt, wie man sich einschreibt und welche Unterlagen man mitbringen muss.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
