-- ============================================================
-- Seed: A0 English Path – STEP 6240 – Reading – lee una descripción de un evento social (Convivencia)
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
        '{"es": "El evento es un picnic comunitario.","de": "The event is a community picnic.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La actividad será el sábado por la mañana.","de": "The activity will be on Saturday morning.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La gente debe llevar una silla de oficina.","de": "People must bring an office chair.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Habrá música y juegos sencillos.","de": "There will be music and simple games.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Si llueve, el evento se moverá al salón común.","de": "If it rains, the event will move to the common room.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El picnic es en un parque.","de": "Das Picknick ist in einem Park.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se puede llevar algo para compartir.","de": "Man kann etwas zum Teilen mitbringen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El aviso menciona música.","de": "Der Hinweis erwähnt Musik.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué tipo de evento se anuncia?","de": "¿Qué tipo de evento se anuncia?","s_es": {"type": "multiple_choice","options": ["A community picnic","A job interview","A train trip"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un picnic comunitario","Una entrevista de trabajo","Un viaje en tren"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuándo será el evento?","de": "¿Cuándo será el evento?","s_es": {"type": "multiple_choice","options": ["Saturday morning","Friday night","Monday afternoon"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["El sábado por la mañana","El viernes por la noche","El lunes por la tarde"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué deben llevar los asistentes para sentarse?","de": "¿Qué deben llevar los asistentes para sentarse?","s_es": {"type": "multiple_choice","options": ["A blanket or mat","A laptop","A helmet"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una manta o esterilla","Un portátil","Un casco"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué habrá además de comida?","de": "¿Qué habrá además de comida?","s_es": {"type": "multiple_choice","options": ["Music and games","Homework and tests","Shopping and cleaning"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Música y juegos","Deberes y exámenes","Compras y limpieza"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué pasará si llueve?","de": "¿Qué pasará si llueve?","s_es": {"type": "multiple_choice","options": ["It moves indoors","It ends immediately","Nothing changes"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Se mueve al interior","Termina enseguida","No cambia nada"],"answer": 0}}'::jsonb,
        '{"es": "¿Dónde será el picnic?","de": "¿Dónde será el picnic?","s_es": {"type": "multiple_choice","options": ["At the park","At the airport","At the bank"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["En el parque","En el aeropuerto","En el banco"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué deben llevar para compartir?","de": "¿Qué deben llevar para compartir?","s_es": {"type": "multiple_choice","options": ["A snack","A school report","A train ticket"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un snack","Un informe escolar","Un billete de tren"],"answer": 0}}'::jsonb,
        '{"es": "¿Quién puede asistir?","de": "¿Quién puede asistir?","s_es": {"type": "multiple_choice","options": ["Neighbours and friends","Only children","Only teachers"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Vecinos y amigos","Solo niños","Solo profesores"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 6240 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 6240 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6240, 'en', 'reading', 'Convivencia', 'Community Picnic at Willow Park this Saturday morning. Bring a blanket or mat, and feel free to bring a snack to share. We will have music, simple games, and a place to sit in the shade. If it rains, we will move to the common room in the sports centre. Please confirm by Thursday so we can plan drinks and tables.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'lee una descripción de un evento social', 'Lee un aviso breve con los detalles principales de una actividad social en el barrio.'),
        (v_reading_id, 'de', 'lies eine Beschreibung einer sozialen Veranstaltung', 'Lies einen kurzen Hinweis mit den wichtigsten Details zu einer sozialen Aktivität im Viertel.');

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
