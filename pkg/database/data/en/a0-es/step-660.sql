-- ============================================================
-- Seed: A0 English Path – STEP 660 – Reading – understand basic hotel rules and signs, for example 'Dining-room' (Alojamiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La recepción está abierta 24 horas.", "p_de": "Die Rezeption ist 24 Stunden geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La piscina cierra a las 6 PM.", "p_de": "Der Pool schließt um 18 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se puede fumar en las habitaciones.", "p_de": "In den Zimmern darf man rauchen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "En el comedor se sirve el desayuno.", "p_de": "Im Speisesaal wird Frühstück serviert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gimnasio abre a las 6 AM.", "p_de": "Das Fitnessstudio öffnet um 6 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lavandería está en la azotea.", "p_de": "Der Waschraum ist auf dem Dach.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La salida de emergencia debe estar libre.", "p_de": "Der Notausgang muss frei bleiben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se permiten botellas de cristal en la piscina.", "p_de": "Glasflaschen sind am Pool erlaubt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde vas para desayunar?", "p_de": "Wohin gehst du zum Frühstück?", "s": {"type": "multiple_choice", "options": ["Al comedor", "Al gimnasio", "A la salida de emergencia"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde puedes pedir ayuda a medianoche?", "p_de": "Wo kannst du um Mitternacht Hilfe bekommen?", "s": {"type": "multiple_choice", "options": ["En recepción", "En la piscina", "En la lavandería"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no está permitido en las habitaciones?", "p_de": "Was ist in den Zimmern nicht erlaubt?", "s": {"type": "multiple_choice", "options": ["Fumar", "Dormir", "Leer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puerta debe estar libre?", "p_de": "Welche Tür muss frei bleiben?", "s": {"type": "multiple_choice", "options": ["La salida de emergencia", "La puerta del gimnasio", "La puerta del comedor"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora abre el gimnasio?", "p_de": "Um wie viel Uhr öffnet das Fitnessstudio?", "s": {"type": "multiple_choice", "options": ["A las 6 AM", "A las 9 AM", "A las 12 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la lavandería?", "p_de": "Wo ist der Waschraum?", "s": {"type": "multiple_choice", "options": ["En el nivel -1", "En recepción", "En el jardín"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no se puede llevar a la piscina?", "p_de": "Was darf man nicht zum Pool mitnehmen?", "s": {"type": "multiple_choice", "options": ["Botellas de cristal", "Toallas", "Chanclas"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto tiempo está abierta la recepción?", "p_de": "Wie lange ist die Rezeption geöffnet?", "s": {"type": "multiple_choice", "options": ["24 horas", "12 horas", "Solo por la mañana"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM reading WHERE step_order = 660 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 660, 'en', 'reading', 'accommodation', 'Hotel Blue Bay\n\nRECEPTION - Open 24 hours.\nDINING ROOM - Breakfast 7:00-10:00.\nPOOL AREA - Open 8:00-20:00. No glass bottles.\nGYM - Open 6:00-22:00.\nNO SMOKING - No smoking in rooms.\nEMERGENCY EXIT - Keep this door clear.\nLAUNDRY ROOM - Level -1.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Carteles del hotel');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Hotelschilder');

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
