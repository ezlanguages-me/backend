-- ============================================================
-- Seed: A0 English Path – STEP 6340 – Reading – lee sobre costumbres culturales (Convivencia)
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
        '{"es": "El texto dice que en esa cultura se saluda con un apretón de manos.","de": "The text says people in that culture greet with a handshake.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Quitarse los zapatos al entrar puede ser importante.","de": "Taking off shoes when entering may be important.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Llegar cinco minutos tarde siempre se considera perfecto.","de": "Arriving five minutes late is always perfect.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Llevar un regalo pequeño puede ser una buena idea.","de": "Bringing a small gift can be a good idea.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Hablar muy alto en público se describe como ideal.","de": "Speaking very loudly in public is described as ideal.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "En algunas culturas se saluda con una sonrisa.","de": "In einigen Kulturen begrüßt man sich mit einem Lächeln.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "A veces conviene preguntar antes de servir comida.","de": "Manchmal ist es gut, vor dem Servieren von Essen zu fragen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Las costumbres pueden cambiar según el lugar.","de": "Gepflogenheiten können je nach Ort unterschiedlich sein.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué saludo se menciona?","de": "¿Qué saludo se menciona?","s_es": {"type": "multiple_choice","options": ["A handshake","A wave from far away","A silent nod only"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un apretón de manos","Un saludo desde lejos","Solo un gesto en silencio"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué hábito se comenta al entrar en casa?","de": "¿Qué hábito se comenta al entrar en casa?","s_es": {"type": "multiple_choice","options": ["Shoes may be removed","Shoes must stay on","Shoes are never mentioned"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Los zapatos se pueden quitar","Los zapatos deben quedarse puestos","No se mencionan los zapatos"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué se recomienda si visitas a alguien?","de": "¿Qué se recomienda si visitas a alguien?","s_es": {"type": "multiple_choice","options": ["A small gift","A car","A phone charger"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un pequeño regalo","Un coche","Un cargador de móvil"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué actitud en público puede molestar?","de": "¿Qué actitud en público puede molestar?","s_es": {"type": "multiple_choice","options": ["Speaking very loudly","Sitting quietly","Smiling politely"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Hablar muy alto","Sentarse en silencio","Sonreír educadamente"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué se debe preguntar antes de una comida?","de": "¿Qué se debe preguntar antes de una comida?","s_es": {"type": "multiple_choice","options": ["Ask before meal times","Ignore the meal","Leave immediately"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Preguntar antes de la comida","Ignorar la comida","Irse enseguida"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué ocurre con la puntualidad?","de": "¿Qué ocurre con la puntualidad?","s_es": {"type": "multiple_choice","options": ["It can matter","It never matters","It is always ignored"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Puede importar","Nunca importa","Siempre se ignora"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué se considera educado en la mesa?","de": "¿Qué se considera educado en la mesa?","s_es": {"type": "multiple_choice","options": ["Follow the host''s habits","Argue loudly","Eat standing up"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Seguir los hábitos del anfitrión","Discutir en voz alta","Comer de pie"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué deben hacer los viajeros?","de": "¿Qué deben hacer los viajeros?","s_es": {"type": "multiple_choice","options": ["Watch carefully","Run away","Speak only loudly"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Mirar con atención","Salir corriendo","Hablar solo muy alto"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 6340 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 6340 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6340, 'en', 'reading', 'Convivencia', 'In some places, people greet each other with a handshake, while in others a smile or a small bow is more common. When you visit a home, it may be polite to take off your shoes and bring a small gift.

Meal times can be different too. In some countries, people eat earlier or later than you expect. It is useful to ask before serving food and to follow the host''s habits. Speaking very loudly in public may be normal in one place but rude in another.

When you travel, watch carefully, listen politely, and ask simple questions if you are not sure.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'lee sobre costumbres culturales', 'Lee un texto breve sobre algunas costumbres que pueden variar entre países y hogares.'),
        (v_reading_id, 'de', 'lies über kulturelle Gepflogenheiten', 'Lies einen kurzen Text über einige Gepflogenheiten, die zwischen Ländern und Haushalten variieren können.');

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
