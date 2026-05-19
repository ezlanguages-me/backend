-- ============================================================
-- Seed: A0 English Path – STEP 3880 – Reading – understand delivery instructions (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Hay que usar Gate C al llegar.", "p_de": "Man soll bei der Ankunft Gate C benutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que llamar a seguridad al 555-0201.", "p_de": "Man soll die Sicherheit unter 555-0201 anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La descarga es en Bay 3.", "p_de": "Die Entladung ist an Bay 3.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se descarga entre 9 AM y 4 PM.", "p_de": "Entladen wird zwischen 9 Uhr und 16 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cajas frágiles van en la balda superior de la Section B.", "p_de": "Empfindliche Kartons kommen ins obere Regal in Section B.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cajas pesadas van en la balda superior.", "p_de": "Schwere Kartons kommen ins obere Regal.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que llevar la delivery note a la oficina para una firma.", "p_de": "Man soll den Lieferschein zur Unterschrift ins Büro bringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se aceptan entregas los sábados.", "p_de": "Samstags werden Lieferungen angenommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué puerta se usa?", "p_de": "Welches Tor benutzt man?", "s_es": {"type": "multiple_choice", "options": ["Gate C", "Gate A", "Gate B"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gate C", "Gate A", "Gate B"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué número se llama?", "p_de": "Welche Nummer ruft man an?", "s_es": {"type": "multiple_choice", "options": ["555-0201", "555-2010", "555-0210"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["555-0201", "555-2010", "555-0210"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se descarga?", "p_de": "Wo wird entladen?", "s_es": {"type": "multiple_choice", "options": ["At Bay 4", "At reception", "On the roof"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An Bay 4", "Am Empfang", "Auf dem Dach"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde van las cajas frágiles?", "p_de": "Wohin kommen empfindliche Kartons?", "s_es": {"type": "multiple_choice", "options": ["On the top shelf in Section B", "On the floor by the wall", "In the office kitchen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ins obere Regal in Section B", "Auf den Boden an der Wand", "In die Büroküche"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde van las cajas pesadas?", "p_de": "Wohin kommen schwere Kartons?", "s_es": {"type": "multiple_choice", "options": ["On the floor near the wall", "On the top shelf", "At Gate C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf den Boden an der Wand", "Ins obere Regal", "Zu Gate C"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se lleva a la oficina después de descargar?", "p_de": "Was bringt man nach dem Entladen ins Büro?", "s_es": {"type": "multiple_choice", "options": ["The delivery note", "The fragile boxes", "The visitor badge"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Lieferschein", "Die empfindlichen Kartons", "Den Besucherausweis"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué día no se aceptan entregas?", "p_de": "An welchem Tag werden keine Lieferungen angenommen?", "s_es": {"type": "multiple_choice", "options": ["Saturday", "Monday", "Thursday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Samstag", "Montag", "Donnerstag"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué deben llevar los conductores dentro del almacén?", "p_de": "Was müssen Fahrer im Lager tragen?", "s_es": {"type": "multiple_choice", "options": ["A visitor badge", "A hotel key", "A blue tie"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Besucherausweis", "Einen Hotelschlüssel", "Eine blaue Krawatte"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3880 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3880 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3880, 'en', 'reading', 'professional', $content$Delivery Instructions for North Tech Warehouse. Use Gate C and call security on 555-0201 when you arrive. Unload at Bay 4 between 9 AM and 4 PM.

Fragile boxes go on the top shelf in Section B. Heavy boxes stay on the floor near the wall. After unloading, take the delivery note to the office for a signature.

No deliveries are accepted on Saturday. Drivers must wear a visitor badge inside the warehouse.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee instrucciones de entrega', 'Lee un aviso con puerta, horario, descarga y normas para conductores.'),
            (v_reading_id, 'de', 'Lies Lieferanweisungen', 'Lies einen Hinweis mit Tor, Zeiten, Entladung und Regeln für Fahrer.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
