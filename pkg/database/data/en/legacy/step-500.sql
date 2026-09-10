-- ============================================================
-- Seed: A0 English Path – STEP 500 – Reading – make a simple complaint, for example ‘The cooker is broken. Can you replace it?’ (Alquileres)
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
        '{"p": "¿Qué aparato está roto?", "p_de": "Welches Gerät ist kaputt?", "s": {"type": "multiple_choice", "options": ["La televisión", "La cocina", "La lámpara"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué hace la lavadora?", "p_de": "Was macht die Waschmaschine?", "s": {"type": "multiple_choice", "options": ["Se para después de diez minutos", "Hace café", "Se abre sola"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo hace frío en el dormitorio?", "p_de": "Wann ist das Schlafzimmer kalt?", "s": {"type": "multiple_choice", "options": ["Por la noche", "Al mediodía", "Por la tarde"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no puede hacer el inquilino?", "p_de": "Was kann der Mieter nicht tun?", "s": {"type": "multiple_choice", "options": ["Abrir la puerta", "Cocinar la cena", "Lavar los platos"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué pide el inquilino?", "p_de": "Worum bittet der Mieter?", "s": {"type": "multiple_choice", "options": ["Pintar la casa", "Mover la cama", "Arreglar o cambiar la cocina"], "answer": 2}}'::jsonb,
        '{"p": "¿A qué hora puede ir el propietario?", "p_de": "Um wie viel Uhr kann der Vermieter kommen?", "s": {"type": "multiple_choice", "options": ["A las diez de la mañana", "A las seis de la tarde", "A las doce de la noche"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde vive el inquilino?", "p_de": "Wo wohnt der Mieter?", "s": {"type": "multiple_choice", "options": ["En una habitación de hotel", "En el piso 3B", "En casa de Sarah"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué más necesita revisión?", "p_de": "Was muss noch überprüft werden?", "s": {"type": "multiple_choice", "options": ["La piscina y el jardín", "La ventana y el sofá", "La lavadora y la calefacción"], "answer": 2}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 500 AND path_uuid = v_path_id
    );
    DELETE FROM reading WHERE step_order = 500 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 500, 'en', 'reading', 'accommodation',
        'Subject: Problems in flat 3B

Dear Mr Green,

I am writing to tell you about several problems in my flat at number 3B. I moved in last week, and I have already found three issues.

First, the cooker is broken. I cannot cook dinner because it does not turn on. Second, the washing machine does not work correctly. It starts, but it stops after about ten minutes, so my clothes are not clean. Third, the heating in my bedroom is off at night. The room gets very cold, and I cannot sleep well.

Can you fix the washing machine and the heating as soon as possible? Can you also repair or replace the cooker, please?

I am at home after 9 PM tonight, and tomorrow at 10 AM is also convenient for a visit.

Thank you for your help,
Marta'
    ) RETURNING uuid INTO v_reading_id;

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
