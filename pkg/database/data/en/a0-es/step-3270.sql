-- ============================================================
-- Seed: A0 English Path – STEP 3270 – Dialogue – describe an accident
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
        '{"character": "Officer", "text": "Hello. Please tell me what happened.", "es": "Hola. Por favor, dígame qué pasó.", "de": "Hallo. Bitte sagen Sie mir, was passiert ist."}'::jsonb,
        '{"character": "Witness", "text": "A cyclist hit a wet tram rail and fell near Market Square.", "es": "Un ciclista golpeó un carril mojado del tranvía y se cayó cerca de Market Square.", "de": "Ein Radfahrer fuhr auf eine nasse Straßenbahnschiene und stürzte nahe dem Market Square."}'::jsonb,
        '{"character": "Officer", "text": "Did a car touch the cyclist?", "es": "¿Un coche tocó al ciclista?", "de": "Hat ein Auto den Radfahrer berührt?"}'::jsonb,
        '{"character": "Witness", "text": "No, no car hit him.", "es": "No, ningún coche lo golpeó.", "de": "Nein, kein Auto hat ihn angefahren."}'::jsonb,
        '{"character": "Officer", "text": "What injuries did you see?", "es": "¿Qué heridas vio?", "de": "Welche Verletzungen haben Sie gesehen?"}'::jsonb,
        '{"character": "Witness", "text": "His left arm hurt, and he cut his knee.", "es": "Le dolía el brazo izquierdo y se cortó la rodilla.", "de": "Sein linker Arm tat weh und er schnitt sich das Knie auf."}'::jsonb,
        '{"character": "Officer", "text": "Was he wearing a helmet?", "es": "¿Llevaba casco?", "de": "Trug er einen Helm?"}'::jsonb,
        '{"character": "Witness", "text": "Yes, and he stayed awake the whole time.", "es": "Sí, y estuvo despierto todo el tiempo.", "de": "Ja, und er blieb die ganze Zeit wach."}'::jsonb,
        '{"character": "Officer", "text": "Where is he now?", "es": "¿Dónde está ahora?", "de": "Wo ist er jetzt?"}'::jsonb,
        '{"character": "Witness", "text": "He is in the ambulance outside the flower shop.", "es": "Está en la ambulancia que está fuera de la floristería.", "de": "Er ist im Krankenwagen vor dem Blumenladen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El ciclista se cayó cerca de Market Square.", "de": "Der Radfahrer ist nahe dem Market Square gestürzt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Un coche golpeó al ciclista.", "de": "Ein Auto hat den Radfahrer angefahren.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Le dolía el brazo derecho.", "de": "Sein rechter Arm tat weh.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Se cortó la rodilla.", "de": "Er hat sich das Knie aufgeschnitten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El ciclista estuvo despierto todo el tiempo.", "de": "Der Radfahrer blieb die ganze Zeit wach.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Con qué chocó o resbaló el ciclista?", "de": "Worauf traf oder rutschte der Radfahrer?", "s_es": {"type": "multiple_choice", "options": ["A wet tram rail", "A parked bus", "A broken lamp"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf eine nasse Straßenbahnschiene", "Auf einen geparkten Bus", "Auf eine kaputte Lampe"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué brazo le dolía?", "de": "Welcher Arm tat weh?", "s_es": {"type": "multiple_choice", "options": ["His left arm", "His right arm", "Both arms"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sein linker Arm", "Sein rechter Arm", "Beide Arme"], "answer": 0}}'::jsonb,
        '{"es": "¿Llevaba casco?", "de": "Trug er einen Helm?", "s_es": {"type": "multiple_choice", "options": ["Yes", "No", "The witness is not sure"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Die Zeugin ist nicht sicher"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está ahora la ambulancia?", "de": "Wo steht jetzt der Krankenwagen?", "s_es": {"type": "multiple_choice", "options": ["Outside the flower shop", "Near the police car", "At the station"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor dem Blumenladen", "Beim Polizeiwagen", "Am Bahnhof"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién hace las preguntas?", "de": "Wer stellt die Fragen?", "s_es": {"type": "multiple_choice", "options": ["An officer", "A bus driver", "A doctor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Beamter", "Ein Busfahrer", "Ein Arzt"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3270 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3270 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3270 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3270 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3270 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3270 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3270 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3270 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3270 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3270 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3270, 'en', 'dialogue', 'emergency', '[{"name": "Officer", "gender": "male", "avatarURL": "https://example.com/avatars/officer.png"}, {"name": "Witness", "gender": "female", "avatarURL": "https://example.com/avatars/witness.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Describe un accidente de bicicleta', 'Lee un diálogo breve en el que un testigo explica un accidente a un agente.'),
        (v_dialogue_id, 'de', 'Beschreibe einen Fahrradunfall', 'Lies einen kurzen Dialog, in dem ein Zeuge einem Beamten einen Unfall erklärt.');

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
