-- ============================================================
-- Seed: A0 English Path – STEP 3710 – Reading – understand museum/gallery info (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La galería abre de martes a domingo.", "p_de": "Die Galerie ist von Dienstag bis Sonntag geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La galería abre los lunes.", "p_de": "Die Galerie ist montags geöffnet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La entrada para adultos cuesta £8.", "p_de": "Der Eintritt für Erwachsene kostet £8.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los estudiantes pagan £5.", "p_de": "Studenten zahlen £5.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La audioguía cuesta £5.", "p_de": "Der Audioguide kostet £5.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "No se puede usar flash en las fotos.", "p_de": "Man darf keinen Blitz benutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El bag room está en la segunda planta.", "p_de": "Der Gepäckraum ist im zweiten Stock.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El café cierra a las 5:30 PM.", "p_de": "Das Café schließt um 17:30 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuándo cierra la galería por completo?", "p_de": "Wann ist die Galerie ganz geschlossen?", "s_es": {"type": "multiple_choice", "options": ["On Monday", "On Tuesday", "On Sunday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Montag", "Am Dienstag", "Am Sonntag"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la entrada de adulto?", "p_de": "Wie viel kostet ein Erwachsenenticket?", "s_es": {"type": "multiple_choice", "options": ["£8", "£5", "£2"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£8", "£5", "£2"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la audioguía?", "p_de": "Wie viel kostet der Audioguide?", "s_es": {"type": "multiple_choice", "options": ["£2", "£5", "£8"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£2", "£5", "£8"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de foto no se permite?", "p_de": "Welche Art von Foto ist nicht erlaubt?", "s_es": {"type": "multiple_choice", "options": ["Flash photography", "Outdoor photography", "Phone photography"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fotos mit Blitz", "Außenfotos", "Handyfotos"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el bag room?", "p_de": "Wo ist der Gepäckraum?", "s_es": {"type": "multiple_choice", "options": ["On the ground floor", "Next to the café", "On the roof"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Erdgeschoss", "Neben dem Café", "Auf dem Dach"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta qué hora abre el café?", "p_de": "Bis wann ist das Café geöffnet?", "s_es": {"type": "multiple_choice", "options": ["5:30 PM", "6 PM", "4 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["17:30 Uhr", "18 Uhr", "16 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué días se puede visitar la galería?", "p_de": "An welchen Tagen kann man die Galerie besuchen?", "s_es": {"type": "multiple_choice", "options": ["Tuesday to Sunday", "Monday to Friday", "Every day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dienstag bis Sonntag", "Montag bis Freitag", "Jeden Tag"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el precio de estudiante?", "p_de": "Wie hoch ist der Studentenpreis?", "s_es": {"type": "multiple_choice", "options": ["£5", "£8", "£3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£5", "£8", "£3"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3710 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3710 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3710, 'en', 'reading', 'tourism', $content$City Art Gallery is open from Tuesday to Sunday, 10 AM to 6 PM. It is closed on Monday.

Tickets cost £8 for adults and £5 for students. An audio guide is available for £2.

Please do not use flash photography. The bag room is on the ground floor. The café closes at 5:30 PM.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee información de un museo o galería', 'Lee horarios, precios y normas básicas para visitar una galería.'),
            (v_reading_id, 'de', 'Lies Informationen zu Museum oder Galerie', 'Lies Öffnungszeiten, Preise und einfache Regeln für einen Galeriebesuch.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
