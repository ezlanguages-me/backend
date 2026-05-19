-- ============================================================
-- Seed: A0 English Path – STEP 540 – Reading – understand, and ask questions about, house rules/conventions, such as the time of meals (Convivencia)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El desayuno es a las 7:30.", "p_de": "Das Frühstück ist um 7:30 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cena es a las 8:30.", "p_de": "Das Abendessen ist um 20:30 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay silencio después de las 10 de la noche.", "p_de": "Nach 22 Uhr ist Ruhezeit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Alex puede usar la cocina toda la noche.", "p_de": "Alex kann die Küche die ganze Nacht benutzen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El día de la colada es el miércoles.", "p_de": "Der Waschtag ist Mittwoch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los amigos pueden dormir en casa sin pedir permiso.", "p_de": "Freunde können ohne Erlaubnis übernachten.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Alex debe limpiar la cocina después de usarla.", "p_de": "Alex soll die Küche nach der Benutzung sauber machen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La puerta principal se queda abierta por la noche.", "p_de": "Die Haustür bleibt nachts offen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿A qué hora es la comida?", "p_de": "Um wie viel Uhr ist das Mittagessen?", "s": {"type": "multiple_choice", "options": ["A la 1 PM", "A las 11 AM", "A las 4 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empiezan las horas de silencio?", "p_de": "Wann beginnt die Ruhezeit?", "s": {"type": "multiple_choice", "options": ["A las 10 PM", "A las 8 PM", "A medianoche"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer Alex después de usar la cocina?", "p_de": "Was soll Alex nach der Benutzung der Küche tun?", "s": {"type": "multiple_choice", "options": ["Limpiarla", "Cerrar las cortinas", "Apagar la nevera"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué día es la colada?", "p_de": "An welchem Tag ist Waschtag?", "s": {"type": "multiple_choice", "options": ["El miércoles", "El lunes", "El sábado"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer Alex antes de invitar a un amigo?", "p_de": "Was soll Alex tun, bevor er einen Freund einlädt?", "s": {"type": "multiple_choice", "options": ["Preguntar a Sarah", "Comprar comida", "Abrir la ventana"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer Alex si llega tarde a cenar?", "p_de": "Was soll Alex tun, wenn er zu spät zum Abendessen kommt?", "s": {"type": "multiple_choice", "options": ["Mandar un mensaje", "Ir al gimnasio", "Esperar fuera"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede preparar Alex en la cocina antes de las 9?", "p_de": "Was kann Alex vor 21 Uhr in der Küche zubereiten?", "s": {"type": "multiple_choice", "options": ["Té o un snack", "Una fiesta", "Una barbacoa grande"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es el desayuno?", "p_de": "Um wie viel Uhr ist das Frühstück?", "s": {"type": "multiple_choice", "options": ["A las 7:30 AM", "A las 9:30 AM", "A las 6 AM"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM reading WHERE step_order = 540 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 540, 'en', 'reading', 'social', 'Hello Alex,\n\nWelcome to our home. Here are our house rules. Breakfast is at 7:30 AM, lunch is at 1 PM, and dinner is at 7 PM. If you are late for dinner, please send a message.\n\nYou can use the kitchen until 9 PM. Please clean the kitchen after you use it. Laundry day is Wednesday.\n\nQuiet hours start at 10 PM. The front door is locked at 10 PM too. If you want to invite a friend, please ask Sarah first.\n\nThank you,\nSarah')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Normas de la casa');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Hausregeln');

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
