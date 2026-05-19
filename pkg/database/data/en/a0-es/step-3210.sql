-- ============================================================
-- Seed: A0 English Path – STEP 3210 – Reading – understand an emergency
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Si alguien huele gas o ve humo espeso, debe salir del bloque B inmediatamente.", "de": "Wenn jemand Gas riecht oder dichten Rauch sieht, muss er Block B sofort verlassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El aviso dice que los vecinos deben usar el ascensor para bajar rápido.", "de": "Im Hinweis steht, dass die Bewohner den Aufzug benutzen sollen, um schnell nach unten zu kommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El punto de encuentro está en el aparcamiento frente a la panadería.", "de": "Der Treffpunkt ist auf dem Parkplatz gegenüber der Bäckerei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La persona que llama debe decir 18 River Street, Block B, second floor.", "de": "Die anrufende Person soll 18 River Street, Block B, second floor sagen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se puede volver al piso para coger el abrigo o la mascota.", "de": "Man darf noch einmal in die Wohnung zurückgehen, um den Mantel oder das Haustier zu holen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Si alguien está herido, hay que quedarse con esa persona cerca de la puerta azul.", "de": "Wenn jemand verletzt ist, soll man bei dieser Person in der Nähe des blauen Tors bleiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El botiquín está en el segundo piso junto al ascensor.", "de": "Der Erste-Hilfe-Kasten ist im zweiten Stock neben dem Aufzug.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Después de llamar, hay que decir al portero nocturno el número del piso.", "de": "Nach dem Anruf muss man dem Nachtportier die Wohnungsnummer sagen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué bloque deben dejar los residentes?", "de": "Welchen Block sollen die Bewohner verlassen?", "s_es": {"type": "multiple_choice", "options": ["Block B", "Block A", "Block C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Block B", "Block A", "Block C"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué escaleras deben usar?", "de": "Welche Treppe sollen sie benutzen?", "s_es": {"type": "multiple_choice", "options": ["The stairs next to Flat 2", "The stairs behind the bakery", "The stairs near the lift"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Treppe neben Wohnung 2", "Die Treppe hinter der Bäckerei", "Die Treppe beim Aufzug"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde esperan fuera del edificio?", "de": "Wo warten sie draußen?", "s_es": {"type": "multiple_choice", "options": ["In the car park opposite the bakery", "Inside the lobby", "On the roof"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Parkplatz gegenüber der Bäckerei", "In der Eingangshalle", "Auf dem Dach"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué número llaman?", "de": "Welche Nummer rufen sie an?", "s_es": {"type": "multiple_choice", "options": ["112", "999", "118"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["112", "999", "118"], "answer": 0}}'::jsonb,
        '{"es": "¿A quién ayudan al salir?", "de": "Wem helfen sie auf dem Weg nach draußen?", "s_es": {"type": "multiple_choice", "options": ["Children and older neighbours", "Only the porter", "Only pets"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kindern und älteren Nachbarn", "Nur dem Portier", "Nur Haustieren"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el botiquín?", "de": "Wo ist der Erste-Hilfe-Kasten?", "s_es": {"type": "multiple_choice", "options": ["At the security desk on the ground floor", "In Flat 2", "By the blue gate"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Sicherheitsdesk im Erdgeschoss", "In Wohnung 2", "Am blauen Tor"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué color es la puerta donde espera una persona herida?", "de": "Welche Farbe hat das Tor, an dem eine verletzte Person wartet?", "s_es": {"type": "multiple_choice", "options": ["Blue", "Red", "Green"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blau", "Rot", "Grün"], "answer": 0}}'::jsonb,
        '{"es": "¿A quién dicen el número del piso después de llamar?", "de": "Wem sagen sie nach dem Anruf die Wohnungsnummer?", "s_es": {"type": "multiple_choice", "options": ["The night porter", "The bakery worker", "The taxi driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dem Nachtportier", "Der Bäckereimitarbeiterin", "Dem Taxifahrer"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3210 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3210 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3210 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3210 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3210 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3210 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3210 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3210 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3210 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3210 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3210, 'en', 'reading', 'emergency', $content$
Emergency Notice for Residents. If you smell gas or see thick smoke, leave Block B immediately. Do not use the lift. Use the stairs next to Flat 2 and go to the car park opposite the bakery.

Call 112 and say: 18 River Street, Block B, second floor. Help children and older neighbours on your way out. Do not go back for bags, coats, or pets.

If someone is hurt, stay with that person near the blue gate. The building manager, Ms Lane, keeps a first aid kit at the security desk on the ground floor.

After the emergency call, tell the night porter your flat number and wait outside for the fire crew.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Comprende un aviso de emergencia en un edificio', 'Lee un aviso de emergencia con instrucciones claras para salir del edificio y pedir ayuda.'),
        (v_reading_id, 'de', 'Verstehe einen Notfallhinweis in einem Gebäude', 'Lies einen Notfallhinweis mit klaren Anweisungen, um das Gebäude zu verlassen und Hilfe zu holen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
