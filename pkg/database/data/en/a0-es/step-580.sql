-- ============================================================
-- Seed: A0 English Path – STEP 580 – Reading – express opinions in a limited way (Convivencia - Host Families)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "A Alex le encanta la comida.", "p_de": "Alex liebt das Essen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "A Alex le gusta levantarse a las 6:30.", "p_de": "Alex steht gern um 6:30 Uhr auf.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Alex piensa que la ciudad es increíble.", "p_de": "Alex findet die Stadt fantastisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hace mucho calor todos los días.", "p_de": "Es ist jeden Tag sehr heiß.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El autobús al colegio es fácil.", "p_de": "Der Bus zur Schule ist einfach.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La habitación de Alex es muy ruidosa.", "p_de": "Alexs Zimmer ist sehr laut.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Sarah es amable y ayuda mucho.", "p_de": "Sarah ist freundlich und hilfsbereit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las excursiones del fin de semana son aburridas.", "p_de": "Die Ausflüge am Wochenende sind langweilig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué le encanta a Alex?", "p_de": "Was liebt Alex?", "s": {"type": "multiple_choice", "options": ["La comida", "La piscina", "El despertador"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no le gusta a Alex?", "p_de": "Was mag Alex nicht?", "s": {"type": "multiple_choice", "options": ["Levantarse temprano", "Hablar con Sarah", "Ir en autobús"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo describe Alex la ciudad?", "p_de": "Wie beschreibt Alex die Stadt?", "s": {"type": "multiple_choice", "options": ["Increíble", "Pequeña y triste", "Muy peligrosa"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo describe Alex el tiempo?", "p_de": "Wie beschreibt Alex das Wetter?", "s": {"type": "multiple_choice", "options": ["Un poco frío", "Muy caluroso", "Muy seco"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es el autobús al colegio?", "p_de": "Wie ist der Bus zur Schule?", "s": {"type": "multiple_choice", "options": ["Fácil", "Muy lento", "Siempre lleno"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la habitación de Alex?", "p_de": "Wie ist Alexs Zimmer?", "s": {"type": "multiple_choice", "options": ["Pequeña pero cómoda", "Grande y oscura", "Vacía y fría"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es Sarah?", "p_de": "Wie ist Sarah?", "s": {"type": "multiple_choice", "options": ["Amable y servicial", "Seria y callada", "Impaciente y antipática"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué disfruta Alex los fines de semana?", "p_de": "Was genießt Alex am Wochenende?", "s": {"type": "multiple_choice", "options": ["Excursiones cortas por la ciudad", "Quedarse solo en casa", "Estudiar todo el día"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM reading WHERE step_order = 580 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 580, 'en', 'reading', 'social', 'I like my stay with my host family. Sarah is very kind, and I love the food because she cooks fresh meals every day. I think the city is amazing, especially the river and the old centre.\n\nI don''t like getting up at 6:30 every morning for school. I also find the weather a bit cold, but the bus to school is easy and quick.\n\nMy room is small but comfortable. At the weekend, we take short trips, and I really enjoy them.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Mi estancia con la familia anfitriona');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Mein Aufenthalt bei der Gastfamilie');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
