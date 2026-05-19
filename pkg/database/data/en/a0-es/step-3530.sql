-- ============================================================
-- Seed: A0 English Path – STEP 3530 – Dialogue – ask about job requirements (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Applicant", "text": "Good morning. I have a question about the office assistant job.", "es": "Buenos días. Tengo una pregunta sobre el puesto de office assistant.", "de": "Guten Morgen. Ich habe eine Frage zur Stelle als office assistant."}'::jsonb,
    '{"character": "Manager", "text": "Of course. What would you like to know?", "es": "Claro. ¿Qué le gustaría saber?", "de": "Natürlich. Was möchten Sie wissen?"}'::jsonb,
    '{"character": "Applicant", "text": "Do you need computer experience?", "es": "¿Necesitan experiencia con ordenador?", "de": "Brauchen Sie Computererfahrung?"}'::jsonb,
    '{"character": "Manager", "text": "Yes, basic email and spreadsheets are important.", "es": "Sí, son importantes el email básico y las hojas de cálculo.", "de": "Ja, grundlegende E-Mails und Tabellen sind wichtig."}'::jsonb,
    '{"character": "Applicant", "text": "Do I speak to customers too?", "es": "¿También hablo con clientes?", "de": "Spreche ich auch mit Kunden?"}'::jsonb,
    '{"character": "Manager", "text": "Yes, sometimes at reception and on the phone.", "es": "Sí, a veces en recepción y por teléfono.", "de": "Ja, manchmal am Empfang und am Telefon."}'::jsonb,
    '{"character": "Applicant", "text": "What hours are the shifts?", "es": "¿Qué horario tienen los turnos?", "de": "Wie sind die Arbeitszeiten?"}'::jsonb,
    '{"character": "Manager", "text": "They are from 9 AM to 5 PM, Monday to Friday.", "es": "Son de 9 AM a 5 PM, de lunes a viernes.", "de": "Sie sind von 9 Uhr bis 17 Uhr, Montag bis Freitag."}'::jsonb,
    '{"character": "Applicant", "text": "Do you offer training at the start?", "es": "¿Ofrecen formación al principio?", "de": "Bieten Sie zu Beginn eine Einarbeitung an?"}'::jsonb,
    '{"character": "Manager", "text": "Yes, we give two days of training before you begin.", "es": "Sí, damos dos días de formación antes de empezar.", "de": "Ja, wir geben zwei Tage Einarbeitung, bevor Sie anfangen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La conversación es sobre un puesto de office assistant.", "p_de": "Das Gespräch geht um eine Stelle als office assistant.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El manager pide experiencia avanzada en programación.", "p_de": "Der Manager verlangt fortgeschrittene Programmiererfahrung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "A veces el puesto incluye hablar con clientes.", "p_de": "Die Stelle beinhaltet manchmal Gespräche mit Kunden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El horario es de 9 AM a 5 PM, de lunes a viernes.", "p_de": "Die Arbeitszeit ist von 9 Uhr bis 17 Uhr, Montag bis Freitag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "No hay formación al principio.", "p_de": "Es gibt keine Einarbeitung am Anfang.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Qué experiencia pregunta la candidata?", "p_de": "Welche Erfahrung fragt die Bewerberin?", "s_es": {"type": "multiple_choice", "options": ["Computer experience", "Driving experience", "Hotel experience"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Computererfahrung", "Fahrerfahrung", "Hotelerfahrung"], "answer": 0}}'::jsonb,
    '{"p": "¿Dónde habla con clientes?", "p_de": "Wo spricht sie mit Kunden?", "s_es": {"type": "multiple_choice", "options": ["At reception and on the phone", "Only in the warehouse", "Only by email"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Empfang und am Telefon", "Nur im Lager", "Nur per E-Mail"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuál es el horario?", "p_de": "Wie sind die Arbeitszeiten?", "s_es": {"type": "multiple_choice", "options": ["9 AM to 5 PM", "7 AM to 12 PM", "10 AM to 6 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["9 Uhr bis 17 Uhr", "7 Uhr bis 12 Uhr", "10 Uhr bis 18 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuánta formación ofrecen?", "p_de": "Wie viel Einarbeitung bieten sie an?", "s_es": {"type": "multiple_choice", "options": ["Two days", "One week", "No training"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Tage", "Eine Woche", "Keine Einarbeitung"], "answer": 0}}'::jsonb,
    '{"p": "¿Quién hace las preguntas sobre el puesto?", "p_de": "Wer stellt die Fragen zur Stelle?", "s_es": {"type": "multiple_choice", "options": ["The applicant", "The manager", "The customer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Bewerberin", "Der Manager", "Der Kunde"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM dialogue
        WHERE step_order = 3530 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue'
    );
    DELETE FROM dialogue WHERE step_order = 3530 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3530, 'en', 'dialogue', 'professional', '[{"name": "Applicant", "gender": "female", "avatarURL": "https://example.com/avatars/applicant.png"}, {"name": "Manager", "gender": "male", "avatarURL": "https://example.com/avatars/manager.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pregunta por los requisitos de un trabajo', 'Practica preguntas simples sobre habilidades, horario y formación para un puesto de oficina.'),
        (v_dialogue_id, 'de', 'Frage nach den Anforderungen einer Stelle', 'Übe einfache Fragen zu Fähigkeiten, Arbeitszeit und Einarbeitung für eine Bürostelle.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
