-- ============================================================
-- Seed: A0 English Path – STEP 4270 – Listening – listen to technical instructions (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El técnico se llama David.", "p_de": "Der Techniker heißt David.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "David explica cómo instalar el sistema de climatización.", "p_de": "David erklärt, wie man die Klimaanlage installiert.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El primer paso es apagar el suministro eléctrico principal.", "p_de": "Der erste Schritt ist, die Hauptstromversorgung abzuschalten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los filtros deben limpiarse con agua y jabón.", "p_de": "Die Filter müssen mit Wasser und Seife gereinigt werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El nivel del refrigerante debe comprobarse con un manómetro.", "p_de": "Der Kältemittelstand muss mit einem Druckmesser überprüft werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "David recomienda hacer el mantenimiento cada tres meses.", "p_de": "David empfiehlt, die Wartung alle drei Monate durchzuführen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que anotar la fecha de cada mantenimiento en el registro.", "p_de": "Das Datum jeder Wartung muss im Protokoll notiert werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "David ofrece dejar un manual escrito de instrucciones.", "p_de": "David bietet an, ein schriftliches Anleitungshandbuch zu hinterlassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué explica David?", "p_de": "Was erklärt David?", "s_es": {"type": "multiple_choice", "options": ["How to carry out maintenance", "How to install the system", "How to order spare parts"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wie man die Wartung durchführt", "Wie man das System installiert", "Wie man Ersatzteile bestellt"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el primer paso del mantenimiento?", "p_de": "Was ist der erste Schritt der Wartung?", "s_es": {"type": "multiple_choice", "options": ["Switch off the main power supply", "Remove the filters", "Check the refrigerant"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hauptstromversorgung abschalten", "Filter entfernen", "Kältemittel prüfen"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué se limpian los filtros?", "p_de": "Womit werden die Filter gereinigt?", "s_es": {"type": "multiple_choice", "options": ["With compressed air", "With soap and water", "With a damp cloth"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Druckluft", "Mit Seife und Wasser", "Mit einem feuchten Tuch"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué se comprueba el refrigerante?", "p_de": "Womit wird das Kältemittel überprüft?", "s_es": {"type": "multiple_choice", "options": ["A pressure gauge", "A thermometer", "A voltmeter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einem Druckmesser", "Einem Thermometer", "Einem Voltmesser"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué frecuencia recomienda David hacer el mantenimiento?", "p_de": "Wie oft empfiehlt David, die Wartung durchzuführen?", "s_es": {"type": "multiple_choice", "options": ["Twice a year", "Every three months", "Once a year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweimal im Jahr", "Alle drei Monate", "Einmal im Jahr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay que anotar en el registro?", "p_de": "Was muss im Protokoll notiert werden?", "s_es": {"type": "multiple_choice", "options": ["The date of each maintenance", "The technician''s signature", "The model number"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Datum jeder Wartung", "Die Unterschrift des Technikers", "Die Modellnummer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofrece dejar David?", "p_de": "Was bietet David anzulassen an?", "s_es": {"type": "multiple_choice", "options": ["A written instruction manual", "A spare part kit", "An invoice"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein schriftliches Anleitungshandbuch", "Ein Ersatzteilset", "Eine Rechnung"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se practica en esta escucha?", "p_de": "Was wird in diesem Hörtext geübt?", "s_es": {"type": "multiple_choice", "options": ["Listening to technical maintenance instructions", "Watching a product demonstration", "Booking a service appointment"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Technischen Wartungsanweisungen zuhören", "Eine Produktdemonstration verfolgen", "Einen Servicetermin buchen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4270 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4270 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4270, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: David, a certified technician, giving maintenance instructions
## "Air Conditioning Maintenance – Step-by-Step Instructions"

## THE SCENE: A technician explains the maintenance procedure to an office manager
David walks through each step methodically.

### DIRECTOR'S NOTES
Style:
* Technical but accessible; numbered steps spoken clearly.
* Pauses between steps to allow note-taking.

Pace: Slow and deliberate.

Accent: Neutral accent.

#### TRANSCRIPT
[introducing] David: Good morning. I will now explain the maintenance procedure for the AC-12 system.
[step one] David: First, always switch off the main power supply before you start any work.
[step two] David: Remove the filters and clean them with compressed air. Do not use water.
[step three] David: Check the refrigerant level using a pressure gauge. It should read between 8 and 10 bar.
[step four] David: Inspect all visible connections for any signs of wear or leaks.
[frequency] David: I recommend carrying out this maintenance twice a year.
[record] David: After each visit, note the date and any findings in the maintenance log.
[offer] David: I will leave a written instruction manual here for your records.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha instrucciones técnicas de mantenimiento', 'Escucha las instrucciones paso a paso de un técnico para el mantenimiento de un sistema de climatización.'),
            (v_listening_id, 'de', 'Höre technische Wartungsanweisungen', 'Höre Schritt-für-Schritt-Anweisungen eines Technikers für die Wartung einer Klimaanlage.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
