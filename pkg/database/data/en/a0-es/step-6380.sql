-- ============================================================
-- Seed: A0 English Path – STEP 6380 – Reading – lee un acuerdo de compañeros de piso (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El acuerdo habla de limpiar la cocina cada semana.","de": "The agreement mentions cleaning the kitchen every week.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Las visitas pueden quedarse toda la noche sin avisar.","de": "Guests can stay overnight without telling anyone.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hay horas de silencio por la noche.","de": "There are quiet hours at night.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La comida compartida debe tener una etiqueta con el nombre.","de": "Shared food should have a name label.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hay que pagar facturas a tiempo.","de": "Bills must be paid on time.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Las facturas compartidas se pagan a tiempo.","de": "Gemeinsame Rechnungen werden pünktlich bezahlt.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La comida compartida debe llevar nombre.","de": "Gemeinsam genutztes Essen soll einen Namen tragen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hay que avisar antes de invitados que duermen.","de": "Übernachtungsgäste müssen vorher angekündigt werden.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué tarea se menciona en la cocina?","de": "¿Qué tarea se menciona en la cocina?","s_es": {"type": "multiple_choice","options": ["Cleaning the kitchen","Buying a car","Painting the school"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Limpiar la cocina","Comprar un coche","Pintar la escuela"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué regla hay sobre las visitas?","de": "¿Qué regla hay sobre las visitas?","s_es": {"type": "multiple_choice","options": ["Guests need to be told","Guests live there forever","Guests cannot speak"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Hay que avisar a las visitas","Las visitas viven allí para siempre","Las visitas no pueden hablar"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuándo hay silencio?","de": "¿Cuándo hay silencio?","s_es": {"type": "multiple_choice","options": ["At night","At breakfast","At lunchtime"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Por la noche","En el desayuno","A la hora de comer"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué debe llevar la comida compartida?","de": "¿Qué debe llevar la comida compartida?","s_es": {"type": "multiple_choice","options": ["A name label","A phone number","A bus ticket"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una etiqueta con el nombre","Un número de teléfono","Un billete de autobús"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué se debe hacer con las facturas?","de": "¿Qué se debe hacer con las facturas?","s_es": {"type": "multiple_choice","options": ["Pay them on time","Pay them next month","Ignore them"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Pagarlas a tiempo","Pagarlas el mes que viene","Ignorarlas"],"answer": 0}}'::jsonb,
        '{"es": "¿Quién comparte la casa?","de": "¿Quién comparte la casa?","s_es": {"type": "multiple_choice","options": ["Housemates","Tourists","Teachers"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Compañeros de piso","Turistas","Profesores"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué espacio común aparece?","de": "¿Qué espacio común aparece?","s_es": {"type": "multiple_choice","options": ["The kitchen and bills","A football team","A train line"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["La cocina y las facturas","Un equipo de fútbol","Una línea de tren"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué ayuda a evitar problemas?","de": "¿Qué ayuda a evitar problemas?","s_es": {"type": "multiple_choice","options": ["Clear rules","More noise","No labels"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Normas claras","Más ruido","Sin etiquetas"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 6380 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 6380 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6380, 'en', 'reading', 'Convivencia', 'Housemate Agreement

1. Clean the kitchen once a week and wipe the table after cooking.
2. Tell everyone before inviting overnight guests.
3. Keep quiet after 10 PM on weekdays.
4. Label any shared food with your name and the date.
5. Pay shared bills on time and speak early if something changes.
6. Put rubbish and recycling in the correct bins.
7. If you use the last milk, write it on the shopping list.
8. Be respectful in common areas so everyone feels at home.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'lee un acuerdo de compañeros de piso', 'Lee un acuerdo sencillo sobre cómo compartir una casa con otras personas.'),
        (v_reading_id, 'de', 'lies eine Hausgemeinschaftsvereinbarung', 'Lies eine einfache Vereinbarung darüber, wie man sich eine Wohnung mit anderen teilt.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
