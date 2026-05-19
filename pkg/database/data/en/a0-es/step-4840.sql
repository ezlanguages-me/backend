-- ============================================================
-- Seed: A0 English Path – STEP 4840 – Reading – understand voicemail instructions (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Primero debes decir tu nombre y tu empresa despacio.", "p_de": "Zuerst sollst du deinen Namen und deine Firma langsam nennen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si la llamada es importante, debes repetir la información básica dos veces.", "p_de": "Wenn der Anruf wichtig ist, sollst du die Grundinformation zweimal wiederholen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debes explicar el motivo con una historia larga.", "p_de": "Du sollst den Grund mit einer langen Geschichte erklären.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El número de teléfono debe darse en grupos pequeños.", "p_de": "Die Telefonnummer soll in kleinen Gruppen genannt werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta repetir el número al final.", "p_de": "Man muss die Nummer am Ende nicht wiederholen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si quieres respuesta por correo, debes deletrear la dirección.", "p_de": "Wenn du eine Antwort per E-Mail möchtest, sollst du die Adresse buchstabieren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debes decir cuál es el mejor momento para devolver la llamada.", "p_de": "Du sollst sagen, wann der beste Rückrufzeitpunkt ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mensaje puede durar más de un minuto.", "p_de": "Die Nachricht kann länger als eine Minute dauern.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué debes decir primero?", "p_de": "Was sollst du zuerst sagen?", "s": {"type": "multiple_choice", "options": ["Your name and company", "Your salary and office number", "Your travel plans"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo debes explicar el motivo de la llamada?", "p_de": "Wie sollst du den Grund des Anrufs erklären?", "s": {"type": "multiple_choice", "options": ["In one short sentence", "In three long paragraphs", "Only by spelling it"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo debes decir el número de teléfono?", "p_de": "Wie sollst du die Telefonnummer sagen?", "s": {"type": "multiple_choice", "options": ["In small groups of numbers", "Only once and very fast", "As one long number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si quieres respuesta por correo electrónico?", "p_de": "Was machst du, wenn du eine Antwort per E-Mail möchtest?", "s": {"type": "multiple_choice", "options": ["Spell the address clearly", "Leave the office address only", "Ask for a paper letter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué detalle de tiempo debes mencionar?", "p_de": "Welches Zeitdetail sollst du erwähnen?", "s": {"type": "multiple_choice", "options": ["The best time to call back", "The time of your lunch break only", "The date of next month''s meeting"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debes indicar si algo es urgente?", "p_de": "Wann sollst du sagen, ob etwas dringend ist?", "s": {"type": "multiple_choice", "options": ["When the matter is urgent today", "Only on Fridays", "Never in voicemail"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué longitud debe tener el mensaje?", "p_de": "Wie lang soll die Nachricht sein?", "s": {"type": "multiple_choice", "options": ["Under thirty seconds", "About two minutes", "Exactly five seconds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué información puede repetirse dos veces?", "p_de": "Welche Information kann zweimal wiederholt werden?", "s": {"type": "multiple_choice", "options": ["Your name and company", "The weather report", "The office menu"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4840 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 4840 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 4840, 'en', 'reading', 'professional', 'Office voicemail checklist. First, say your name and company slowly. If the call is important, say both pieces of information twice.

Next, explain the reason for the call in one short sentence. Give your phone number in small groups of numbers and repeat it at the end of the message.

If you want a reply by email, spell the address clearly. Mention the best time to call back and say if the matter is urgent today. Keep the full message under thirty seconds.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Instrucciones para dejar un buzón de voz', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Anweisungen für eine Voicemail', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
