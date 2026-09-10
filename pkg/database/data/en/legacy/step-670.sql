-- ============================================================
-- Seed: A0 English Path – STEP 670 – Reading – understand basic hotel information, for example, times when meals are served (Alojamiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El check-in es desde las 2 PM.", "p_de": "Der Check-in ist ab 14 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El check-out puede hacerse a las 2 PM.", "p_de": "Der Check-out ist noch um 14 Uhr möglich.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La comida es de 12 PM a 2 PM.", "p_de": "Das Mittagessen ist von 12 bis 14 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cena es de 6 PM a 8 PM.", "p_de": "Das Abendessen ist von 18 bis 20 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La piscina está abierta de 8 AM a 8 PM.", "p_de": "Der Pool ist von 8 bis 20 Uhr geöffnet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gimnasio cierra a las 11 PM.", "p_de": "Das Fitnessstudio schließt um 23 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Puedes pedir toallas limpias en recepción.", "p_de": "Saubere Handtücher bekommt man an der Rezeption.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El desayuno empieza a las 6 AM.", "p_de": "Das Frühstück beginnt um 6 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Hasta qué hora es el check-out?", "p_de": "Bis wann ist Check-out?", "s": {"type": "multiple_choice", "options": ["Antes de las 11 AM", "Antes de las 2 PM", "Antes de las 5 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es el desayuno?", "p_de": "Wann ist das Frühstück?", "s": {"type": "multiple_choice", "options": ["De 6 AM a 8 AM", "De 7 AM a 10 AM", "De 9 AM a 12 PM"], "answer": 1}}'::jsonb,
        '{"p": "¿Cuándo es la comida?", "p_de": "Wann ist das Mittagessen?", "s": {"type": "multiple_choice", "options": ["De 10 AM a 12 PM", "De 3 PM a 5 PM", "De 12 PM a 2 PM"], "answer": 2}}'::jsonb,
        '{"p": "¿Cuándo es la cena?", "p_de": "Wann ist das Abendessen?", "s": {"type": "multiple_choice", "options": ["De 7 PM a 9 PM", "De 5 PM a 7 PM", "De 8 PM a 10 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde pides toallas limpias?", "p_de": "Wo bekommst du saubere Handtücher?", "s": {"type": "multiple_choice", "options": ["En el gimnasio", "En recepción", "En la piscina"], "answer": 1}}'::jsonb,
        '{"p": "¿Cuándo está abierta la piscina?", "p_de": "Wann ist der Pool geöffnet?", "s": {"type": "multiple_choice", "options": ["De 6 AM a 6 PM", "De 10 AM a 10 PM", "De 8 AM a 8 PM"], "answer": 2}}'::jsonb,
        '{"p": "¿Cuándo está abierto el gimnasio?", "p_de": "Wann ist das Fitnessstudio geöffnet?", "s": {"type": "multiple_choice", "options": ["De 6 AM a 10 PM", "De 8 AM a 8 PM", "De 12 PM a 6 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo puede hacer check-in un huésped?", "p_de": "Wann kann ein Gast einchecken?", "s": {"type": "multiple_choice", "options": ["Antes de las 11 AM", "Después de las 2 PM", "Solo por la mañana"], "answer": 1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 670 AND path_uuid = v_path_id
    );
    DELETE FROM reading WHERE step_order = 670 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (
        v_path_id,
        670,
        'en',
        'reading',
        'accommodation',
        $reading_670$
Welcome to the Green Hotel.

This information card gives the most important details for new guests. Check-in begins at 2 PM, so rooms are not ready before that time. Check-out is before 11 AM on the day of departure. Breakfast is served in the dining room from 7 AM to 10 AM. Lunch is available from 12 PM to 2 PM, and dinner is served from 7 PM to 9 PM. The pool is open every day from 8 AM to 8 PM. The gym opens early at 6 AM and closes at 10 PM. If you need clean towels, please ask at reception. Reception staff can also answer questions about meal times, taxi bookings, and local buses. Guests should carry their room card because it opens the front door after 11 PM. On busy weekends, the dining room can be full, so arriving a little early for meals is a good idea. A printed timetable is available next to the lift.
$reading_670$
    )RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Información del hotel y horarios');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Hotelinformationen und Essenszeiten');

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
