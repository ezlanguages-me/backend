-- ============================================================
-- Seed: A0 English Path – STEP 4030 – Listening – listen to a professional presentation (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La empresa ofrece tres planes de servicio.", "p_de": "Das Unternehmen bietet drei Servicepläne an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El plan básico incluye limpieza y mantenimiento.", "p_de": "Der Basisplan beinhaltet Reinigung und Wartung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El plan premium incluye seguridad las 24 horas.", "p_de": "Der Premium-Plan beinhaltet 24-Stunden-Sicherheit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El plan básico cuesta 200 libras al mes.", "p_de": "Der Basisplan kostet 200 Pfund pro Monat.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El contrato mínimo es de 6 meses.", "p_de": "Der Mindestvertrag beträgt 6 Monate.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede cambiar de plan en cualquier momento sin coste.", "p_de": "Man kann jederzeit kostenlos den Plan wechseln.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay una visita de evaluación gratuita antes de firmar.", "p_de": "Es gibt eine kostenlose Bewertungsbesuch vor der Unterzeichnung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El presentador ofrece contacto por correo electrónico al final.", "p_de": "Der Präsentator bietet am Ende Kontakt per E-Mail an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuántos planes ofrece la empresa?", "p_de": "Wie viele Pläne bietet das Unternehmen an?", "s_es": {"type": "multiple_choice", "options": ["Three", "Two", "Five"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Zwei", "Fünf"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué incluye el plan básico?", "p_de": "Was beinhaltet der Basisplan?", "s_es": {"type": "multiple_choice", "options": ["Cleaning and maintenance", "Security only", "IT support"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Reinigung und Wartung", "Nur Sicherheit", "IT-Support"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plan incluye seguridad 24 horas?", "p_de": "Welcher Plan beinhaltet 24-Stunden-Sicherheit?", "s_es": {"type": "multiple_choice", "options": ["Premium plan", "Basic plan", "Standard plan"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Premium-Plan", "Basisplan", "Standardplan"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el plan básico al mes?", "p_de": "Was kostet der Basisplan pro Monat?", "s_es": {"type": "multiple_choice", "options": ["£150 per month", "£200 per month", "£100 per month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["150 Pfund pro Monat", "200 Pfund pro Monat", "100 Pfund pro Monat"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura el contrato mínimo?", "p_de": "Wie lange ist der Mindestvertrag?", "s_es": {"type": "multiple_choice", "options": ["6 months", "1 month", "12 months"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["6 Monate", "1 Monat", "12 Monate"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se cambia de plan?", "p_de": "Wie wechselt man den Plan?", "s_es": {"type": "multiple_choice", "options": ["With 30 days notice and an admin fee", "At any time for free", "Only once a year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit 30 Tagen Vorankündigung und Bearbeitungsgebühr", "Jederzeit kostenlos", "Nur einmal im Jahr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofrece la empresa antes de firmar?", "p_de": "Was bietet das Unternehmen vor der Unterzeichnung an?", "s_es": {"type": "multiple_choice", "options": ["A free evaluation visit", "A paid trial month", "Nothing"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen kostenlosen Bewertungsbesuch", "Einen bezahlten Probemonat", "Nichts"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata la presentación?", "p_de": "Worum geht es in der Präsentation?", "s_es": {"type": "multiple_choice", "options": ["Professional service plans and pricing", "A tourist tour", "A cooking class"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Professionelle Servicepläne und Preise", "Eine Touristenrundfahrt", "Ein Kochkurs"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4030 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4030 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4030, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Sarah, a business development manager giving a company presentation
## "ProServ Solutions – Our Service Plans"

## THE SCENE: A conference room; potential clients are seated
Sarah presents the company and its three service plans to an audience.

### DIRECTOR'S NOTES
Style:
* Clear, structured, professional presentation with pauses between points.
* Key numbers and plan names spoken slowly.

Pace: Moderate and clear.

Accent: Neutral British accent.

#### TRANSCRIPT
[welcoming] Sarah: Good morning, everyone. Today I would like to tell you about our three service plans.
[clear] Sarah: The Basic Plan covers daily cleaning and monthly maintenance visits. It costs £150 per month.
[informative] Sarah: The Standard Plan adds quarterly equipment checks and a dedicated account manager.
[premium] Sarah: Our Premium Plan includes 24-hour security monitoring as well as all Standard Plan features.
[practical] Sarah: The minimum contract length is 6 months. To change your plan, you need 30 days notice and a small admin fee.
[helpful] Sarah: Before you sign, we offer a free evaluation visit to assess your premises.
[closing] Sarah: After the presentation, please feel free to contact me by email with any questions. Thank you.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha una presentación profesional', 'Escucha una presentación de empresa con planes de servicio, precios y contrato mínimo.'),
            (v_listening_id, 'de', 'Höre eine professionelle Präsentation', 'Höre eine Unternehmenspräsentation mit Serviceplänen, Preisen und Mindestvertrag.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
