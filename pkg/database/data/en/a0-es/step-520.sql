-- ============================================================
-- Seed: A0 English Path – STEP 520 – Dialogue – make a simple complaint, for example 'The cooker is broken. Can you replace it?' (Alquileres)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La inquilina vive en el piso 2A.", "p_de": "Die Mieterin wohnt in Wohnung 2A.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La nevera enfría bien.", "p_de": "Der Kühlschrank kühlt gut.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El grifo de la cocina gotea debajo del fregadero.", "p_de": "Der Küchenhahn tropft unter der Spüle.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El propietario puede enviar a un fontanero mañana a las cuatro.", "p_de": "Der Vermieter kann morgen um vier einen Klempner schicken.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El propietario ofrece una nevera pequeña temporal.", "p_de": "Der Vermieter bietet einen kleinen Ersatzkühlschrank an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué aparato no enfría?", "p_de": "Welches Gerät kühlt nicht?", "s": {"type": "multiple_choice", "options": ["La nevera", "La lámpara", "La televisión"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la fuga de agua?", "p_de": "Wo ist das Wasserleck?", "s": {"type": "multiple_choice", "options": ["Debajo del fregadero", "En el dormitorio", "En el balcón"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién va a ir mañana?", "p_de": "Wer kommt morgen?", "s": {"type": "multiple_choice", "options": ["Un fontanero", "Un taxista", "Un vecino"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora puede ir el fontanero?", "p_de": "Um wie viel Uhr kann der Klempner kommen?", "s": {"type": "multiple_choice", "options": ["A las 4 PM", "A las 10 AM", "A las 8 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ofrece el propietario para hoy?", "p_de": "Was bietet der Vermieter für heute an?", "s": {"type": "multiple_choice", "options": ["Una nevera pequeña", "Una mesa nueva", "Un sofá nuevo"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM dialogue WHERE step_order = 520 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 520, 'en', 'dialogue', 'accommodation', '[{"name": "Tenant", "gender": "female", "avatarURL": "https://example.com/avatars/tenant.png"}, {"name": "Landlord", "gender": "male", "avatarURL": "https://example.com/avatars/landlord.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Queja por la nevera y el grifo', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Beschwerde über Kühlschrank und Wasserhahn', '');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 0, 'Tenant', 'Hello, Mr Green. I have a problem in flat 2A.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola, señor Green. Tengo un problema en el piso 2A."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo, Herr Green. Ich habe ein Problem in Wohnung 2A."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 1, 'Landlord', 'What happened?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Qué ha pasado?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Was ist passiert?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 2, 'Tenant', 'The fridge is not cold, and my food is warm.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "La nevera no está fría y mi comida está caliente."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Der Kühlschrank ist nicht kalt, und mein Essen ist warm."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 3, 'Landlord', 'That is not good. Is there any other problem?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Eso no está bien. ¿Hay algún otro problema?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Das ist nicht gut. Gibt es noch ein anderes Problem?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 4, 'Tenant', 'Yes. The kitchen tap leaks under the sink.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. El grifo de la cocina gotea debajo del fregadero."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Der Küchenhahn tropft unter der Spüle."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 5, 'Landlord', 'I can send a plumber tomorrow at four in the afternoon.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Puedo enviar a un fontanero mañana a las cuatro de la tarde."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich kann morgen um vier Uhr nachmittags einen Klempner schicken."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 6, 'Tenant', 'That is fine. I am at home after three. What about the fridge today?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Está bien. Estoy en casa después de las tres. ¿Y la nevera hoy?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Das ist in Ordnung. Ich bin nach drei Uhr zu Hause. Und was ist heute mit dem Kühlschrank?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 7, 'Landlord', 'I can bring a small fridge this evening and text you before I come.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Puedo traer una nevera pequeña esta tarde y mandarte un mensaje antes de ir."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich kann heute Abend einen kleinen Kühlschrank bringen und dir vorher schreiben."}]}]'::jsonb);

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;

