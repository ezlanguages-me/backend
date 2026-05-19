-- ============================================================
-- Seed: A0 English Path – STEP 1650 – Reading – give and understand straightforward directions, provided that these are not lengthy and/or complex (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La ruta empieza en Central Bus Station.", "p_de": "Der Weg beginnt am Central Bus Station.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que caminar por River Street.", "p_de": "Man muss durch die River Street gehen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Pasas por una librería y una comisaría.", "p_de": "Du kommst an einer Buchhandlung und einer Polizeiwache vorbei.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En los semáforos, giras a la izquierda en Hill Avenue.", "p_de": "An der Ampel biegst du links in die Hill Avenue ab.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Debes subir hasta ver la iglesia de St Anne.", "p_de": "Du musst bergauf gehen, bis du die Kirche St Anne siehst.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tomas la primera calle a la izquierda después de la iglesia.", "p_de": "Du nimmst die erste Straße links nach der Kirche.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Oak Hall está en el número 18.", "p_de": "Oak Hall ist an der Hausnummer 18.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La entrada está delante del edificio.", "p_de": "Der Eingang ist an der Vorderseite des Gebäudes.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde empieza la ruta?", "p_de": "Wo beginnt der Weg?", "s": {"type": "multiple_choice", "options": ["At Central Bus Station", "At Oak Hall", "At St Anne''s Church"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué calle caminas primero?", "p_de": "Durch welche Straße gehst du zuerst?", "s": {"type": "multiple_choice", "options": ["Market Street", "Hill Avenue", "Station Road"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué edificios pasas primero?", "p_de": "An welchen Gebäuden gehst du zuerst vorbei?", "s": {"type": "multiple_choice", "options": ["A bookshop and a police station", "A museum and a café", "A bank and a cinema"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces en los semáforos?", "p_de": "Was machst du an der Ampel?", "s": {"type": "multiple_choice", "options": ["Cross the road and turn right", "Turn left and stop", "Go back to the station"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué edificio buscas antes de la última calle?", "p_de": "Welches Gebäude suchst du vor der letzten Straße?", "s": {"type": "multiple_choice", "options": ["St Anne''s Church", "The town hall", "The sports centre"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué calle tomas después de la iglesia?", "p_de": "Welche Straße nimmst du nach der Kirche?", "s": {"type": "multiple_choice", "options": ["The first street on the left", "The second street on the right", "The last street on the left"], "answer": 0}}'::jsonb,
        '{"p": "¿Entre qué tiendas está Oak Hall?", "p_de": "Zwischen welchen Geschäften liegt Oak Hall?", "s": {"type": "multiple_choice", "options": ["The pharmacy and the flower shop", "The bakery and the café", "The bank and the supermarket"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la entrada?", "p_de": "Wo ist der Eingang?", "s": {"type": "multiple_choice", "options": ["At the back", "At the front", "On the roof"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1650 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1650 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1650, 'en', 'reading', 'Viajes y Transporte', $reading$
Directions to Oak Hall: Start at Central Bus Station and walk along Market Street for 300 metres. Pass the bookshop and the police station.

At the traffic lights, cross the road and turn right into Hill Avenue. Walk uphill until you see St Anne's Church.

Take the first street on the left after the church. Oak Hall is at number 18, between the pharmacy and the flower shop. The entrance is at the back.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Direcciones impresas para llegar a Oak Hall');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Gedruckte Wegbeschreibung zu Oak Hall');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
