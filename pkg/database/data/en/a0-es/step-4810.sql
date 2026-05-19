-- ============================================================
-- Seed: A0 English Path – STEP 4810 – Listening – handle a professional phone call (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La llamada es sobre una visita técnica para una impresora.", "p_de": "Der Anruf geht um einen Technikbesuch für einen Drucker.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La visita está prevista para mañana a las diez.", "p_de": "Der Besuch ist für morgen um zehn Uhr geplant.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El técnico puede usar la puerta de carga B.", "p_de": "Der Techniker kann Tor B benutzen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta pase de aparcamiento.", "p_de": "Es wird kein Parkausweis benötigt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si hay retraso, la oficina llamará al 555-0184.", "p_de": "Bei Verspätung ruft das Büro 555-0184 an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La confirmación debe enviarse por correo electrónico.", "p_de": "Die Bestätigung soll per E-Mail geschickt werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona que llama es de GreenBox Packaging.", "p_de": "Die Anruferin ist von GreenBox Packaging.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El número de factura es SP-44.", "p_de": "Die Rechnungsnummer ist SP-44.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Quién llama?", "p_de": "Wer ruft an?", "s": {"type": "multiple_choice", "options": ["Marta Lopez from Silver Print", "Daniel Price from East Office", "A student from Room B"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la visita?", "p_de": "Um wie viel Uhr ist der Besuch?", "s": {"type": "multiple_choice", "options": ["At ten o''clock in the morning", "At one o''clock in the afternoon", "At eight o''clock at night"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puerta puede usar el técnico?", "p_de": "Welches Tor kann der Techniker benutzen?", "s": {"type": "multiple_choice", "options": ["Loading door B", "The side gate near the cafe", "Door A on the second floor"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace falta en recepción?", "p_de": "Was wird am Empfang benötigt?", "s": {"type": "multiple_choice", "options": ["A parking pass", "A lab key", "A lunch card"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasará si el técnico llega tarde?", "p_de": "Was passiert, wenn der Techniker zu spät kommt?", "s": {"type": "multiple_choice", "options": ["The office will call 555-0184", "The visit will be cancelled immediately", "A taxi will collect the client"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué correo va la confirmación?", "p_de": "An welche E-Mail geht die Bestätigung?", "s": {"type": "multiple_choice", "options": ["service@silverprint.com", "help@eastoffice.com", "print@room-b.com"], "answer": 0}}'::jsonb,
        '{"p": "¿Sobre qué equipo hablan?", "p_de": "Über welches Gerät sprechen sie?", "s": {"type": "multiple_choice", "options": ["A printer", "A projector", "A coffee machine"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número debe usar la oficina?", "p_de": "Welche Nummer soll das Büro verwenden?", "s": {"type": "multiple_choice", "options": ["Invoice number SP-44", "Desk number 18", "Ticket number 555"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4810 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 4810 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 4810, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Receptionist and client
## THE SCENE: A service call between an office and a client company
A client phones to confirm a printer technician visit and asks about access details for the building.

### DIRECTOR'S NOTES
Style:
* Practical office language with clear repeated details.
* Short questions and confirmations keep the call easy to follow.

Pace: Steady and professional.

Accent: Neutral international accent.

### SAMPLE CONTEXT
Learners practise confirming appointments, building access, and callback details during a work call.

#### TRANSCRIPT
[professional] Receptionist: Good morning, East Office Services.
[clear] Caller: Hello, this is Marta Lopez from Silver Print. I am calling about the printer technician visit tomorrow.
[helpful] Receptionist: Yes, the visit is booked for ten o'clock in the morning.
[practical] Caller: Great. Can the technician use loading door B? We also need a parking pass at reception.
[organized] Receptionist: That is fine. If the technician is late, we will call you on 555-0184.
[friendly] Caller: Thank you. Please send the confirmation to service@silverprint.com and use invoice number SP-44.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Llamada sobre una visita técnica', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Anruf wegen eines Technikbesuchs', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
