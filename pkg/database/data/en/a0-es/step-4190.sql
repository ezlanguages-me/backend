-- ============================================================
-- Seed: A0 English Path – STEP 4190 – Listening – listen to client instructions (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El cliente se llama señor Park.", "p_de": "Der Kunde heißt Herr Park.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente quiere que se limpie la planta baja solamente.", "p_de": "Der Kunde möchte, dass nur das Erdgeschoss gereinigt wird.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las plantas segunda y tercera deben limpiarse los lunes y miércoles.", "p_de": "Der zweite und dritte Stock soll montags und mittwochs gereinigt werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala de servidores requiere un producto especial.", "p_de": "Der Serverraum erfordert ein Spezialprodukt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pide que el servicio empiece a las 7 AM.", "p_de": "Der Kunde bittet darum, dass der Dienst um 7 Uhr beginnt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las llaves del edificio se recogen en recepción.", "p_de": "Die Schlüssel für das Gebäude werden an der Rezeption abgeholt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pide un informe mensual de las visitas.", "p_de": "Der Kunde bittet um einen monatlichen Bericht der Besuche.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona de contacto para emergencias es María.", "p_de": "Die Ansprechperson für Notfälle ist María.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cómo se llama el cliente?", "p_de": "Wie heißt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["Mr Park", "Ms Reeves", "Mr Davies"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Herr Park", "Frau Reeves", "Herr Davies"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plantas deben limpiarse los lunes y miércoles?", "p_de": "Welche Stockwerke sollen montags und mittwochs gereinigt werden?", "s_es": {"type": "multiple_choice", "options": ["Second and third floors", "Ground and first floor", "All floors"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweiter und dritter Stock", "Erdgeschoss und erster Stock", "Alle Stockwerke"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué necesita la sala de servidores?", "p_de": "Was braucht der Serverraum?", "s_es": {"type": "multiple_choice", "options": ["A specialist cleaning product", "No cleaning at all", "Daily cleaning"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Spezialreinigungsprodukt", "Keine Reinigung", "Tägliche Reinigung"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora debe empezar el servicio?", "p_de": "Um wie viel Uhr soll der Dienst beginnen?", "s_es": {"type": "multiple_choice", "options": ["6 AM", "7 AM", "8 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["6 Uhr", "7 Uhr", "8 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se recogen las llaves?", "p_de": "Wo werden die Schlüssel abgeholt?", "s_es": {"type": "multiple_choice", "options": ["At reception", "At the security desk", "From Mr Park directly"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An der Rezeption", "Am Sicherheitsschalter", "Von Herrn Park direkt"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué frecuencia se pide el informe de visitas?", "p_de": "Wie oft wird der Besuchsbericht erbeten?", "s_es": {"type": "multiple_choice", "options": ["Monthly", "Weekly", "Daily"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Monatlich", "Wöchentlich", "Täglich"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién es el contacto de emergencias?", "p_de": "Wer ist der Notfallkontakt?", "s_es": {"type": "multiple_choice", "options": ["Mr Park himself", "Maria at reception", "The building manager"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Herr Park selbst", "Maria an der Rezeption", "Der Gebäudeverwalter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se practica en esta escucha?", "p_de": "Was wird in diesem Hörtext geübt?", "s_es": {"type": "multiple_choice", "options": ["Listening to client instructions", "Watching a product demo", "Attending a job interview"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kundenanweisungen zuhören", "Eine Produktdemonstration verfolgen", "Ein Vorstellungsgespräch besuchen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4190 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4190 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4190, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Mr Park, a client giving detailed service instructions
## "Cleaning Service Instructions – Site Walkthrough"

## THE SCENE: Mr Park walks the cleaning team through his building
Mr Park gives floor-by-floor instructions for the cleaning contract.

### DIRECTOR'S NOTES
Style:
* Practical, direct instructions with clear floor numbers and times.
* Key details (floor, day, product, time) stated without ambiguity.

Pace: Moderate; pauses between floors.

Accent: Neutral accent.

#### TRANSCRIPT
[welcoming] Mr Park: Good morning. Thank you for coming. Let me explain what we need.
[floor plan] Mr Park: We need the ground floor cleaned every day from Monday to Friday, starting at 6 AM.
[upper floors] Mr Park: The second and third floors should be cleaned on Mondays and Wednesdays only.
[server room] Mr Park: The server room needs a specialist anti-static cleaning product. Please do not use regular products there.
[keys] Mr Park: You will collect the keys from reception each morning. Please return them before 9 AM.
[reporting] Mr Park: I would like a monthly report listing all visits, times, and any issues found.
[emergency] Mr Park: For any emergency, please call me directly on my mobile. My number is on the contract.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha instrucciones de un cliente', 'Escucha instrucciones detalladas de limpieza por planta con horarios, productos especiales y requisitos de informe.'),
            (v_listening_id, 'de', 'Höre Kundenanweisungen', 'Höre detaillierte Reinigungsanweisungen nach Stockwerk mit Zeiten, Spezialprodukten und Berichtsanforderungen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
