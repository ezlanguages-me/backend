-- ============================================================
-- Seed: A0 English Path – STEP 3330 – Dialogue – give details of vehicle breakdown to authorities
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
        '{"character": "Operator", "text": "Roadside assistance. What is the problem?", "es": "Asistencia en carretera. ¿Cuál es el problema?", "de": "Pannenhilfe. Was ist das Problem?"}'::jsonb,
        '{"character": "Driver", "text": "My car stopped on the A6 near exit 14.", "es": "Mi coche se paró en la A6 cerca de la salida 14.", "de": "Mein Auto ist auf der A6 nahe Ausfahrt 14 stehen geblieben."}'::jsonb,
        '{"character": "Operator", "text": "Are you in a safe place?", "es": "¿Está en un lugar seguro?", "de": "Sind Sie an einem sicheren Ort?"}'::jsonb,
        '{"character": "Driver", "text": "Yes. The car is on the hard shoulder, and we are behind the barrier.", "es": "Sí. El coche está en el arcén y nosotros estamos detrás de la barrera.", "de": "Ja. Das Auto steht auf dem Seitenstreifen und wir sind hinter der Leitplanke."}'::jsonb,
        '{"character": "Operator", "text": "How many people are with you?", "es": "¿Cuántas personas están con usted?", "de": "Wie viele Personen sind bei Ihnen?"}'::jsonb,
        '{"character": "Driver", "text": "Two adults and one child.", "es": "Dos adultos y un niño.", "de": "Zwei Erwachsene und ein Kind."}'::jsonb,
        '{"character": "Operator", "text": "What is wrong with the car?", "es": "¿Qué le pasa al coche?", "de": "Was stimmt mit dem Auto nicht?"}'::jsonb,
        '{"character": "Driver", "text": "The engine will not start, and the battery light is on.", "es": "El motor no arranca y la luz de la batería está encendida.", "de": "Der Motor startet nicht und die Batterieleuchte ist an."}'::jsonb,
        '{"character": "Operator", "text": "A patrol car will reach you in twenty minutes.", "es": "Un vehículo de asistencia llegará en veinte minutos.", "de": "Ein Pannenfahrzeug erreicht Sie in zwanzig Minuten."}'::jsonb,
        '{"character": "Driver", "text": "Thank you. I will keep my phone on.", "es": "Gracias. Mantendré el teléfono encendido.", "de": "Danke. Ich lasse mein Telefon an."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El coche se paró en la A6 cerca de la salida 14.", "de": "Das Auto blieb auf der A6 nahe Ausfahrt 14 stehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El coche está en el carril central.", "de": "Das Auto steht auf der mittleren Spur.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La familia está detrás de la barrera de seguridad.", "de": "Die Familie ist hinter der Leitplanke.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay dos adultos y un niño.", "de": "Es sind zwei Erwachsene und ein Kind dabei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El motor arranca con normalidad.", "de": "Der Motor startet normal.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué servicio responde a la llamada?", "de": "Welcher Dienst beantwortet den Anruf?", "s_es": {"type": "multiple_choice", "options": ["Roadside assistance", "Fire service", "Taxi office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Pannenhilfe", "Feuerwehr", "Taxizentrale"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el coche exactamente?", "de": "Wo steht das Auto genau?", "s_es": {"type": "multiple_choice", "options": ["On the hard shoulder", "In the tunnel", "At a petrol station"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Seitenstreifen", "Im Tunnel", "An einer Tankstelle"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué luz está encendida?", "de": "Welche Leuchte ist an?", "s_es": {"type": "multiple_choice", "options": ["The battery light", "The fuel light", "The door light"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Batterieleuchte", "Die Tankleuchte", "Die Türleuchte"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo llegará el vehículo de asistencia?", "de": "Wann kommt das Pannenfahrzeug?", "s_es": {"type": "multiple_choice", "options": ["In twenty minutes", "In five minutes", "In one hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In zwanzig Minuten", "In fünf Minuten", "In einer Stunde"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hará el conductor mientras espera?", "de": "Was macht der Fahrer während des Wartens?", "s_es": {"type": "multiple_choice", "options": ["Keep his phone on", "Walk to the next town", "Try to drive again"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sein Telefon anlassen", "In die nächste Stadt laufen", "Noch einmal losfahren"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3330 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3330 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3330 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3330 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3330 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3330 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3330 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3330 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3330 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3330 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3330, 'en', 'dialogue', 'emergency', '[{"name": "Operator", "gender": "female", "avatarURL": "https://example.com/avatars/operator.png"}, {"name": "Driver", "gender": "male", "avatarURL": "https://example.com/avatars/driver.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Da detalles de una avería del coche a las autoridades', 'Lee un diálogo sencillo con asistencia en carretera sobre ubicación, personas y avería.'),
        (v_dialogue_id, 'de', 'Gib Behörden Details zu einer Fahrzeugpanne', 'Lies einen einfachen Dialog mit der Pannenhilfe über Ort, Personen und den Defekt.');

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
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
