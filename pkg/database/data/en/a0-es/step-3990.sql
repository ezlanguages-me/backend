-- ============================================================
-- Seed: A0 English Path – STEP 3990 – Listening – listen to service terms explanation (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El soporte está disponible de 9 AM a 6 PM entre semana.", "p_de": "Der Support ist werktags von 9 Uhr bis 18 Uhr verfügbar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ayuda fuera de horario no cuesta nada extra.", "p_de": "Hilfe außerhalb der Zeiten kostet nichts extra.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que cancelar con al menos 24 horas de antelación.", "p_de": "Man muss mindestens 24 Stunden vorher absagen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se envía una factura al final de cada mes.", "p_de": "Es wird am Ende jedes Monats eine Rechnung geschickt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las piezas de recambio están incluidas siempre.", "p_de": "Ersatzteile sind immer inklusive.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las visitas normales se reservan online o por teléfono.", "p_de": "Normale Besuche werden online oder telefonisch gebucht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las visitas de emergencia empiezan normalmente dentro de dos horas entre semana.", "p_de": "Notfalleinsätze beginnen werktags normalerweise innerhalb von zwei Stunden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El recargo fuera de horario es de 5 libras.", "p_de": "Der Zuschlag außerhalb der Zeiten beträgt 5 Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuál es el horario normal de soporte?", "p_de": "Wie sind die normalen Supportzeiten?", "s_es": {"type": "multiple_choice", "options": ["9 AM to 6 PM on weekdays", "24 hours every day", "Only on Saturday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["9 Uhr bis 18 Uhr werktags", "24 Stunden jeden Tag", "Nur am Samstag"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el recargo fuera de horario?", "p_de": "Wie hoch ist der Zuschlag außerhalb der Zeiten?", "s_es": {"type": "multiple_choice", "options": ["25 pounds", "5 pounds", "60 pounds"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["25 Pfund", "5 Pfund", "60 Pfund"], "answer": 0}}'::jsonb,
        '{"p": "¿Con cuánto tiempo se cancelan visitas reservadas?", "p_de": "Mit wie viel Vorlauf storniert man gebuchte Besuche?", "s_es": {"type": "multiple_choice", "options": ["At least 24 hours", "One hour", "One week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mindestens 24 Stunden", "Eine Stunde", "Eine Woche"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se envía la factura?", "p_de": "Wann wird die Rechnung geschickt?", "s_es": {"type": "multiple_choice", "options": ["At the end of each month", "Every Monday", "After lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Ende jedes Monats", "Jeden Montag", "Nach dem Mittagessen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se cobra por separado?", "p_de": "Was wird separat berechnet?", "s_es": {"type": "multiple_choice", "options": ["Replacement parts", "Basic support", "Phone calls"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ersatzteile", "Basis-Support", "Telefonanrufe"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se reservan las visitas normales?", "p_de": "Wie bucht man normale Besuche?", "s_es": {"type": "multiple_choice", "options": ["Online or by phone", "Only in person", "Only by fax"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Online oder telefonisch", "Nur persönlich", "Nur per Fax"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empiezan normalmente las visitas de emergencia?", "p_de": "Wann beginnen Notfalleinsätze normalerweise?", "s_es": {"type": "multiple_choice", "options": ["Within two hours on weekdays", "The next month", "After midnight on Sunday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Innerhalb von zwei Stunden werktags", "Im nächsten Monat", "Nach Mitternacht am Sonntag"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué explica la persona?", "p_de": "Was erklärt die Person?", "s_es": {"type": "multiple_choice", "options": ["Service terms", "Tourist information", "A concert program"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Servicebedingungen", "Touristeninformation", "Ein Konzertprogramm"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 3990 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 3990 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 3990, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Felix, an account manager explaining service terms
## "Support and Booking Terms"

## THE SCENE: A client asks how the support contract works
Felix explains the standard terms slowly and in clear order.

### DIRECTOR'S NOTES
Style:
* Calm contract explanation with times, fees, and conditions.
* Key terms are repeated for clarity.

Pace: Slow and formal.

Accent: Neutral accent.

#### TRANSCRIPT
[clear] Manager: Our support service is available from 9 AM to 6 PM on weekdays.
[informative] Manager: If you need help after hours, there is a 25-pound surcharge.
[careful] Manager: Please cancel booked visits at least 24 hours in advance.
[practical] Manager: We send one invoice at the end of each month.
[specific] Manager: Replacement parts are charged separately.
[helpful] Manager: You can book normal visits online or by phone.
[final] Manager: Emergency visits usually start within two hours on weekdays.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha la explicación de condiciones de servicio', 'Escucha una explicación con horario de soporte, recargo, cancelación y facturación.'),
            (v_listening_id, 'de', 'Höre eine Erklärung der Servicebedingungen', 'Höre eine Erklärung mit Supportzeiten, Zuschlag, Stornierung und Rechnungsstellung.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
