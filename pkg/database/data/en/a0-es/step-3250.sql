-- ============================================================
-- Seed: A0 English Path – STEP 3250 – Reading – read safety instructions
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hay que caminar despacio en todas las zonas mojadas.", "de": "Man soll in allen nassen Bereichen langsam gehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los niños menores de diez años pueden estar solos en la piscina.", "de": "Kinder unter zehn Jahren dürfen allein im Schwimmbad sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las bolsas se dejan en las taquillas grises.", "de": "Taschen werden in den grauen Schließfächern gelassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se permiten botellas de cristal dentro del edificio.", "de": "Glasflaschen sind im Gebäude erlaubt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay que ducharse antes de entrar en la piscina.", "de": "Man muss duschen, bevor man ins Becken geht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Un silbato largo significa que hay que salir del agua.", "de": "Ein langer Pfiff bedeutet, dass man das Wasser verlassen muss.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La sala de primeros auxilios está al lado de recepción.", "de": "Der Erste-Hilfe-Raum ist neben der Rezeption.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay un teléfono junto a la entrada para llamar al 112.", "de": "Neben dem Eingang gibt es ein Telefon, um 112 anzurufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde dejan las bolsas los clientes?", "de": "Wo lassen die Gäste ihre Taschen?", "s_es": {"type": "multiple_choice", "options": ["In the grey lockers", "By the pool door", "Under the red wall"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In den grauen Schließfächern", "An der Beckentür", "Unter der roten Wand"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hacen antes de entrar en la piscina?", "de": "Was machen sie, bevor sie ins Becken gehen?", "s_es": {"type": "multiple_choice", "options": ["Take a shower", "Buy a drink", "Put on shoes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Duschen", "Ein Getränk kaufen", "Schuhe anziehen"], "answer": 0}}'::jsonb,
        '{"es": "¿Con quién hablas si te encuentras mal?", "de": "Mit wem sprichst du, wenn dir schlecht ist?", "s_es": {"type": "multiple_choice", "options": ["The lifeguard", "The cashier", "The driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit der Bademeisterin oder dem Bademeister", "Mit der Kassiererin", "Mit dem Fahrer"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde espera la gente después del silbato?", "de": "Wo wartet man nach dem Pfiff?", "s_es": {"type": "multiple_choice", "options": ["By the red wall", "In the lockers", "At the cafe"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An der roten Wand", "Bei den Schließfächern", "Im Café"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo vuelven al agua?", "de": "Wann gehen sie wieder ins Wasser?", "s_es": {"type": "multiple_choice", "options": ["When staff speak again", "After five minutes", "When the music starts"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wenn das Personal wieder etwas sagt", "Nach fünf Minuten", "Wenn die Musik beginnt"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está la sala de primeros auxilios?", "de": "Wo ist der Erste-Hilfe-Raum?", "s_es": {"type": "multiple_choice", "options": ["Next to reception", "Behind the cafe", "Upstairs"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neben der Rezeption", "Hinter dem Café", "Oben"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué número llaman en una emergencia?", "de": "Welche Nummer rufen sie in einem Notfall an?", "s_es": {"type": "multiple_choice", "options": ["112", "110", "999"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["112", "110", "999"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué pasa con las botellas de cristal?", "de": "Was ist mit Glasflaschen?", "s_es": {"type": "multiple_choice", "options": ["They stay outside the building", "They go in the lockers", "They are allowed by the pool"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie bleiben außerhalb des Gebäudes", "Sie kommen in die Schließfächer", "Sie sind am Becken erlaubt"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3250 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3250 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3250 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3250 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3250 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3250 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3250 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3250 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3250 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3250 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3250, 'en', 'reading', 'emergency', $content$
City Pool Safety Instructions. Walk slowly in all wet areas. Running is dangerous. Children under ten stay with an adult at all times.

Leave bags in the grey lockers and keep glass bottles outside the building. Take a shower before you enter the pool. If you feel ill, speak to the lifeguard at once.

When you hear one long whistle, leave the water immediately and stand by the red wall. Do not return to the pool until staff speak again.

The first aid room is next to reception. In an emergency, tell a staff member or call 112 from the phone by the entrance.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee instrucciones de seguridad en una piscina', 'Lee normas simples de seguridad, silbatos y primeros auxilios en una piscina pública.'),
        (v_reading_id, 'de', 'Lies Sicherheitsanweisungen in einem Schwimmbad', 'Lies einfache Sicherheitsregeln, Pfeifsignale und Hinweise zur Ersten Hilfe in einem öffentlichen Schwimmbad.');

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
