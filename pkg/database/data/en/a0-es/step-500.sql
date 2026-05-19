-- ============================================================
-- Seed: A0 English Path – STEP 500 – Reading – make a simple complaint, for example 'The cooker is broken. Can you replace it?' (Alquileres)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El inquilino vive en el piso 3B.", "p_de": "Der Mieter wohnt in Wohnung 3B.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cocina funciona bien.", "p_de": "Der Herd funktioniert gut.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La lavadora se para después de diez minutos.", "p_de": "Die Waschmaschine stoppt nach zehn Minuten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La calefacción está bien por la noche.", "p_de": "Die Heizung ist nachts in Ordnung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El inquilino puede cocinar la cena.", "p_de": "Der Mieter kann das Abendessen kochen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El propietario puede ir mañana a las diez.", "p_de": "Der Vermieter kann morgen um zehn kommen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El inquilino pide un sofá nuevo.", "p_de": "Der Mieter bittet um ein neues Sofa.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El inquilino estará en casa después de las nueve.", "p_de": "Der Mieter ist heute nach neun Uhr zu Hause.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué aparato está roto?", "p_de": "Welches Gerät ist kaputt?", "s": {"type": "multiple_choice", "options": ["La cocina", "La televisión", "La lámpara"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace la lavadora?", "p_de": "Was macht die Waschmaschine?", "s": {"type": "multiple_choice", "options": ["Se para después de diez minutos", "Hace café", "Se abre sola"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo hace frío en el dormitorio?", "p_de": "Wann ist das Schlafzimmer kalt?", "s": {"type": "multiple_choice", "options": ["Por la noche", "Al mediodía", "Por la tarde"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no puede hacer el inquilino?", "p_de": "Was kann der Mieter nicht tun?", "s": {"type": "multiple_choice", "options": ["Cocinar la cena", "Abrir la puerta", "Lavar los platos"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide el inquilino?", "p_de": "Worum bittet der Mieter?", "s": {"type": "multiple_choice", "options": ["Arreglar o cambiar la cocina", "Pintar la casa", "Mover la cama"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora puede ir el propietario?", "p_de": "Um wie viel Uhr kann der Vermieter kommen?", "s": {"type": "multiple_choice", "options": ["A las diez de la mañana", "A las seis de la tarde", "A las doce de la noche"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde vive el inquilino?", "p_de": "Wo wohnt der Mieter?", "s": {"type": "multiple_choice", "options": ["En el piso 3B", "En una habitación de hotel", "En casa de Sarah"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué más necesita revisión?", "p_de": "Was muss noch überprüft werden?", "s": {"type": "multiple_choice", "options": ["La lavadora y la calefacción", "La piscina y el jardín", "La ventana y el sofá"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM reading WHERE step_order = 500 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 500, 'en', 'reading', 'accommodation', 'Subject: Problems in flat 3B\n\nDear Mr Green,\n\nI am writing about some problems in my flat. The cooker is broken, so I can''t cook dinner. The washing machine also doesn''t work. It stops after ten minutes. In addition, the heating in my bedroom is off at night, so the room is very cold.\n\nCan you fix the washing machine and the heating? Can you repair or replace the cooker, please?\n\nI am at home after 9 PM tonight, and tomorrow at 10 AM is also fine for a visit.\n\nThank you,\nMarta')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Correo sobre problemas en el piso');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'E-Mail über Probleme in der Wohnung');

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
