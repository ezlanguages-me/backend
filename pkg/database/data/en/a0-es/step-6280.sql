-- ============================================================
-- Seed: A0 English Path – STEP 6280 – Reading – lee una carta de agradecimiento (Convivencia)
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
        '{"es": "La carta agradece la cena.","de": "The letter thanks the reader for dinner.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La familia disfrutó del postre.","de": "The family enjoyed the dessert.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La persona no menciona el transporte.","de": "The person does not mention transport.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El remitente dice que se sintió bienvenido.","de": "The sender says they felt welcome.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Invitan a la otra persona a visitar su casa pronto.","de": "They invite the other person to visit their home soon.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "La carta tiene un tono amable.","de": "Der Brief hat einen freundlichen Ton.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "El remitente agradece la invitación.","de": "Der Absender bedankt sich für die Einladung.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se menciona una visita futura.","de": "Ein zukünftiger Besuch wird erwähnt.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Qué agradece la carta?","de": "¿Qué agradece la carta?","s_es": {"type": "multiple_choice","options": ["Dinner","A bus ride","A school exam"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["La cena","Un viaje en autobús","Un examen escolar"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué les gustó especialmente?","de": "¿Qué les gustó especialmente?","s_es": {"type": "multiple_choice","options": ["The dessert","The chairs","The homework"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["El postre","Las sillas","Los deberes"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué dice sobre la bienvenida?","de": "¿Qué dice sobre la bienvenida?","s_es": {"type": "multiple_choice","options": ["They felt welcome","They felt lost","They felt late"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Se sintieron bienvenidos","Se sintieron perdidos","Se sintieron tarde"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué regalo se menciona?","de": "¿Qué regalo se menciona?","s_es": {"type": "multiple_choice","options": ["A small plant","A ticket","A map"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una planta pequeña","Un billete","Un mapa"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué esperan hacer pronto?","de": "¿Qué esperan hacer pronto?","s_es": {"type": "multiple_choice","options": ["Visit their home soon","Move away","Start work"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Visitar su casa pronto","Mudarse lejos","Empezar a trabajar"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de mensaje es?","de": "¿Qué tipo de mensaje es?","s_es": {"type": "multiple_choice","options": ["A thank-you letter","A complaint email","A shopping list"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una carta de agradecimiento","Un correo de queja","Una lista de la compra"],"answer": 0}}'::jsonb,
        '{"es": "¿Cómo se siente quien escribe?","de": "¿Cómo se siente quien escribe?","s_es": {"type": "multiple_choice","options": ["Grateful","Angry","Bored"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Agradecido","Enfadado","Aburrido"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el tono?","de": "¿Cuál es el tono?","s_es": {"type": "multiple_choice","options": ["Warm and polite","Cold and strict","Funny and noisy"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Cálido y educado","Frío y estricto","Divertido y ruidoso"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 6280 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 6280 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6280, 'en', 'reading', 'Convivencia', 'Dear Sam, thank you very much for the lovely dinner last night. We felt very welcome, and the dessert was wonderful. We also enjoyed the music and the easy conversation. Thank you for showing us the bus stop and for giving us the small plant. Please come to our house soon so we can return the favour.

Best wishes,
Lina')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'lee una carta de agradecimiento', 'Lee una carta sencilla en la que alguien da las gracias después de una visita social.'),
        (v_reading_id, 'de', 'lies einen Dankesbrief', 'Lies einen einfachen Brief, in dem sich jemand nach einem sozialen Besuch bedankt.');

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
