-- ============================================================
-- Seed: A0 English Path – STEP 7530 – Dialogue – discuss a project proposal (Reuniones y Presentaciones)
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
        '{"character": "Rita", "text": "Did you read the proposal for the visitor corner?", "es": "¿Leíste la propuesta para el rincón de visitantes?", "de": "Hast du den Vorschlag für die Besucherecke gelesen?"}'::jsonb,
        '{"character": "Jon", "text": "Yes. I like the small table idea.", "es": "Sí. Me gusta la idea de la mesa pequeña.", "de": "Ja. Ich mag die Idee mit dem kleinen Tisch."}'::jsonb,
        '{"character": "Rita", "text": "I am not sure about the plant.", "es": "No estoy segura de la planta.", "de": "Ich bin mir bei der Pflanze nicht sicher."}'::jsonb,
        '{"character": "Jon", "text": "Why not?", "es": "¿Por qué no?", "de": "Warum nicht?"}'::jsonb,
        '{"character": "Rita", "text": "The room is dark.", "es": "La sala es oscura.", "de": "Der Raum ist dunkel."}'::jsonb,
        '{"character": "Jon", "text": "Good point. Then we can choose a lamp instead.", "es": "Buen punto. Entonces podemos elegir una lámpara en su lugar.", "de": "Guter Punkt. Dann können wir stattdessen eine Lampe wählen."}'::jsonb,
        '{"character": "Rita", "text": "I agree. The two chairs are enough.", "es": "Estoy de acuerdo. Dos sillas son suficientes.", "de": "Ich stimme zu. Die zwei Stühle reichen aus."}'::jsonb,
        '{"character": "Jon", "text": "Should we keep the budget at 120 euros?", "es": "¿Mantenemos el presupuesto en 120 euros?", "de": "Sollen wir das Budget bei 120 Euro lassen?"}'::jsonb,
        '{"character": "Rita", "text": "Yes, that price is fine.", "es": "Sí, ese precio está bien.", "de": "Ja, dieser Preis ist in Ordnung."}'::jsonb,
        '{"character": "Jon", "text": "Great. I will tell the team tomorrow.", "es": "Genial. Se lo diré al equipo mañana.", "de": "Super. Ich sage es morgen dem Team."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hablan de la propuesta para un rincón de visitantes.", "de": "Sie sprechen über den Vorschlag für eine Besucherecke.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "A Jon le gusta la idea de la mesa pequeña.", "de": "Jon gefällt die Idee mit dem kleinen Tisch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Rita no está segura de la planta.", "de": "Rita ist sich bei der Pflanze nicht sicher.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La sala es oscura.", "de": "Der Raum ist dunkel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mantienen el presupuesto en 120 euros.", "de": "Sie behalten das Budget bei 120 Euro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué idea le gusta a Jon?", "de": "Welche Idee gefällt Jon?", "s_es": {"type": "multiple_choice", "options": ["The small table idea", "The big screen idea", "The visitor bag idea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Idee mit dem kleinen Tisch", "Die Idee mit dem großen Bildschirm", "Die Idee mit der Besuchertasche"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué no está segura Rita?", "de": "Wobei ist Rita sich nicht sicher?", "s_es": {"type": "multiple_choice", "options": ["The plant", "The map", "The clock"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bei der Pflanze", "Bei der Karte", "Bei der Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué no quiere Rita la planta?", "de": "Warum möchte Rita die Pflanze nicht?", "s_es": {"type": "multiple_choice", "options": ["Because the room is dark", "Because the room is noisy", "Because the room is small"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil der Raum dunkel ist", "Weil der Raum laut ist", "Weil der Raum klein ist"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pueden elegir en su lugar?", "de": "Was können sie stattdessen wählen?", "s_es": {"type": "multiple_choice", "options": ["A lamp", "A printer", "A sofa"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Lampe", "Einen Drucker", "Ein Sofa"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién hablará con el equipo mañana?", "de": "Wer spricht morgen mit dem Team?", "s_es": {"type": "multiple_choice", "options": ["Jon", "Rita", "The manager"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Jon", "Rita", "Der Manager"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7530 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7530 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7530, 'en', 'dialogue', 'meetings', '[{"name": "Rita", "gender": "female", "avatarURL": "https://example.com/avatars/rita.png"}, {"name": "Jon", "gender": "male", "avatarURL": "https://example.com/avatars/jon.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre una propuesta de proyecto', 'Lee un diálogo corto donde dos compañeros comentan y ajustan una propuesta de proyecto.'),
        (v_dialogue_id, 'de', 'Besprich einen Projektvorschlag', 'Lies einen kurzen Dialog, in dem zwei Kollegen einen Projektvorschlag besprechen und anpassen.');

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
