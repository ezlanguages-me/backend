-- ============================================================
-- Seed: A0 English Path – STEP 1610 – Reading – understand simple directions, e.g. turn left at the end of the road (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La nota empieza en Green Street Station.", "p_de": "Die Notiz beginnt an der Green Street Station.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Primero debes girar a la izquierda en King Street.", "p_de": "Zuerst musst du links in die King Street abbiegen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Al final de la calle, giras a la izquierda en River Road.", "p_de": "Am Ende der Straße biegst du links in die River Road ein.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que cruzar un puente pequeño.", "p_de": "Man muss über eine kleine Brücke gehen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El museo está a la izquierda del parque.", "p_de": "Das Museum liegt links vom Park.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El museo está junto a la puerta del parque.", "p_de": "Das Museum ist neben dem Parktor.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La taquilla está delante de la puerta azul.", "p_de": "Der Ticketschalter ist vor der blauen Tür.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Pasas por una panadería y un banco pequeño.", "p_de": "Du kommst an einer Bäckerei und einer kleinen Bank vorbei.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Desde dónde empieza la ruta?", "p_de": "Wo beginnt der Weg?", "s": {"type": "multiple_choice", "options": ["Green Street Station", "River Road", "The park gate"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces al salir por la puerta principal?", "p_de": "Was machst du, wenn du aus der Haupttür kommst?", "s": {"type": "multiple_choice", "options": ["Turn right into King Street", "Turn left into King Street", "Cross the bridge"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde giras al final de la calle?", "p_de": "Wo biegst du am Ende der Straße ab?", "s": {"type": "multiple_choice", "options": ["Into River Road", "Into Queen Street", "Into Park Lane"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cruzas antes del museo?", "p_de": "Was überquerst du vor dem Museum?", "s": {"type": "multiple_choice", "options": ["A little bridge", "A tunnel", "A large square"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el museo?", "p_de": "Wo ist das Museum?", "s": {"type": "multiple_choice", "options": ["On the right", "On the left", "Behind the bank"], "answer": 0}}'::jsonb,
        '{"p": "¿Junto a qué está el museo?", "p_de": "Woran liegt das Museum?", "s": {"type": "multiple_choice", "options": ["The park gate", "The bakery", "The station exit"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué color es la puerta de la taquilla?", "p_de": "Welche Farbe hat die Tür am Ticketschalter?", "s": {"type": "multiple_choice", "options": ["Blue", "Green", "Red"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lugares pasas en King Street?", "p_de": "An welchen Orten kommst du in der King Street vorbei?", "s": {"type": "multiple_choice", "options": ["A bakery and a small bank", "A school and a hotel", "A cinema and a hospital"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1610 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1610 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1610, 'en', 'reading', 'Viajes y Transporte', $reading$
From Green Street Station, go out of the main door and turn right into King Street. Walk straight past the bakery and the small bank.

At the end of the road, turn left into River Road. Go over the little bridge and keep walking for two minutes.

The city museum is on the right, next to the park gate. The ticket office is in front of the blue door.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Nota sencilla para llegar al museo');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Einfache Wegnotiz zum Museum');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
