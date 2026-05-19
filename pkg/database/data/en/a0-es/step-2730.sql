-- ============================================================
-- Seed: A0 English Path – STEP 2730 – Reading – Lee instrucciones de seguimiento después de una operación
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Debes descansar en casa 48 horas.", "p_de": "Du sollst 48 Stunden zu Hause ruhen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que mantener el vendaje seco y limpio.", "p_de": "Der Verband soll trocken und sauber bleiben.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puedes conducir hoy sin problema.", "p_de": "Du kannst heute ohne Problem fahren.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Puedes llevar bolsas pesadas hoy.", "p_de": "Du kannst heute schwere Taschen tragen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Esta noche puedes comer comida ligera.", "p_de": "Heute Abend darfst du leichte Kost essen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debes volver el próximo miércoles para quitar los puntos.", "p_de": "Du sollst nächsten Mittwoch zurückkommen, um die Fäden entfernen zu lassen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debes llamar al hospital si tienes sangrado, fiebre o dolor fuerte.", "p_de": "Du sollst das Krankenhaus anrufen, wenn du Blutung, Fieber oder starke Schmerzen hast.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que debes correr mañana por la mañana.", "p_de": "Im Text steht, dass du morgen früh laufen sollst.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto tiempo debes descansar?", "p_de": "Wie lange sollst du ruhen?", "s": {"type": "multiple_choice", "options": ["For 48 hours", "For 48 days", "For one hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["For 48 hours", "For 48 days", "For one hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["For 48 hours", "For 48 days", "For one hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo debe estar el vendaje?", "p_de": "Wie soll der Verband sein?", "s": {"type": "multiple_choice", "options": ["Dry and clean", "Wet and hot", "Open and loose"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Dry and clean", "Wet and hot", "Open and loose"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dry and clean", "Wet and hot", "Open and loose"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debes hacer hoy?", "p_de": "Was sollst du heute nicht tun?", "s": {"type": "multiple_choice", "options": ["Drive or carry heavy bags", "Drink water", "Sleep at home"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Drive or carry heavy bags", "Drink water", "Sleep at home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drive or carry heavy bags", "Drink water", "Sleep at home"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes comer esta noche?", "p_de": "Was darfst du heute Abend essen?", "s": {"type": "multiple_choice", "options": ["Light food", "Only ice cream", "Nothing at all"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Light food", "Only ice cream", "Nothing at all"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Light food", "Only ice cream", "Nothing at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo vuelves para los puntos?", "p_de": "Wann kommst du für die Fäden zurück?", "s": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow morning", "Next month"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow morning", "Next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow morning", "Next month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes hacer si tienes sangrado?", "p_de": "Was sollst du bei Blutung tun?", "s": {"type": "multiple_choice", "options": ["Call the hospital", "Go shopping", "Wait one week"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Call the hospital", "Go shopping", "Wait one week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Call the hospital", "Go shopping", "Wait one week"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otra señal de alarma aparece?", "p_de": "Welches weitere Warnzeichen erscheint?", "s": {"type": "multiple_choice", "options": ["Strong pain", "A cheap ticket", "A broken chair"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Strong pain", "A cheap ticket", "A broken chair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Strong pain", "A cheap ticket", "A broken chair"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de texto se trata?", "p_de": "Welche Art Text ist das?", "s": {"type": "multiple_choice", "options": ["Simple follow-up instructions", "A hotel menu", "A train timetable"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Simple follow-up instructions", "A hotel menu", "A train timetable"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Simple follow-up instructions", "A hotel menu", "A train timetable"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2730 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2730 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2730, 'en', 'reading', 'health', 'After Your Small Operation

Rest at home for 48 hours. Keep the bandage dry and clean. Do not drive or carry heavy bags today.

You may eat light food this evening. Come back next Wednesday to remove the stitches.

Call the hospital if you have bleeding, fever, or strong pain.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee instrucciones de seguimiento después de una operación', 'Lee una nota simple de alta con instrucciones de cuidado después de una pequeña operación.'),
        (v_reading_id, 'de', 'Lies Nachsorgeanweisungen nach einer Operation', 'Lies eine einfache Entlassungsnotiz mit Pflegeanweisungen nach einer kleinen Operation.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
