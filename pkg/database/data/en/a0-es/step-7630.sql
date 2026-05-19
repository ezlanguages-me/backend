-- ============================================================
-- Seed: A0 English Path – STEP 7630 – Dialogue – argue a position in a discussion (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Nadia", "text": "I think we should start with a small pilot, not a full launch.", "es": "Creo que deberíamos empezar con una prueba pequeña, no con un lanzamiento completo.", "de": "Ich denke, wir sollten mit einem kleinen Piloten beginnen, nicht mit einem vollständigen Start."}'::jsonb,
        '{"character": "Erik", "text": "Why do you prefer a pilot?", "es": "¿Por qué prefieres una prueba piloto?", "de": "Warum bevorzugst du einen Piloten?"}'::jsonb,
        '{"character": "Nadia", "text": "It lets us test the booking form with one team and fix errors early.", "es": "Nos permite probar el formulario de reserva con un equipo y corregir errores pronto.", "de": "Damit können wir das Buchungsformular mit einem Team testen und Fehler früh beheben."}'::jsonb,
        '{"character": "Erik", "text": "But a full launch gives faster feedback from more people.", "es": "Pero un lanzamiento completo da comentarios más rápidos de más personas.", "de": "Aber ein vollständiger Start gibt schneller Rückmeldung von mehr Leuten."}'::jsonb,
        '{"character": "Nadia", "text": "That is true, yet a wide launch also creates more support requests at once.", "es": "Eso es cierto, pero un lanzamiento amplio también crea más solicitudes de ayuda al mismo tiempo.", "de": "Das stimmt, doch ein breiter Start erzeugt auch mehr Supportanfragen auf einmal."}'::jsonb,
        '{"character": "Erik", "text": "So your main concern is support capacity?", "es": "Entonces, ¿tu principal preocupación es la capacidad de soporte?", "de": "Ist also deine Hauptsorge die Supportkapazität?"}'::jsonb,
        '{"character": "Nadia", "text": "Yes, and the help desk is already busy next week.", "es": "Sí, y la mesa de ayuda ya está ocupada la semana que viene.", "de": "Ja, und der Helpdesk ist nächste Woche schon ausgelastet."}'::jsonb,
        '{"character": "Erik", "text": "I understand. Would a two week pilot be enough?", "es": "Entiendo. ¿Bastaría una prueba piloto de dos semanas?", "de": "Verstehe. Würde ein zweiwöchiger Pilot ausreichen?"}'::jsonb,
        '{"character": "Nadia", "text": "Yes, after two weeks we can review the data and decide.", "es": "Sí, después de dos semanas podemos revisar los datos y decidir.", "de": "Ja, nach zwei Wochen können wir die Daten prüfen und entscheiden."}'::jsonb,
        '{"character": "Erik", "text": "All right. I can support that plan.", "es": "De acuerdo. Puedo apoyar ese plan.", "de": "In Ordnung. Ich kann diesen Plan unterstützen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Nadia defiende empezar con una prueba pequeña.", "de": "Nadia vertritt den Standpunkt, mit einem kleinen Piloten zu beginnen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Erik dice que un lanzamiento completo trae comentarios de menos personas.", "de": "Erik sagt, ein vollständiger Start bringe Rückmeldung von weniger Leuten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Nadia teme muchas solicitudes de ayuda al mismo tiempo.", "de": "Nadia befürchtet viele Supportanfragen gleichzeitig.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mesa de ayuda está libre la semana que viene.", "de": "Der Helpdesk ist nächste Woche frei.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Al final Erik acepta el plan de dos semanas.", "de": "Am Ende akzeptiert Erik den Zwei Wochen Plan.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué posición defiende Nadia?", "de": "Welche Position vertritt Nadia?", "s_es": {"type": "multiple_choice", "options": ["Start with a small pilot", "Launch to everyone immediately", "Stop the project"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einem kleinen Piloten starten", "Sofort für alle starten", "Das Projekt stoppen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué quiere probar Nadia con un solo equipo?", "de": "Was möchte Nadia mit nur einem Team testen?", "s_es": {"type": "multiple_choice", "options": ["The booking form", "The travel budget", "The office printer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Buchungsformular", "Das Reisebudget", "Den Bürodrucker"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ventaja ve Erik en el lanzamiento completo?", "de": "Welchen Vorteil sieht Erik im vollständigen Start?", "s_es": {"type": "multiple_choice", "options": ["Faster feedback from more people", "Lower office rent", "Shorter meetings"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schnellere Rückmeldung von mehr Leuten", "Niedrigere Büromiete", "Kürzere Treffen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la preocupación principal de Nadia?", "de": "Was ist Nadias Hauptsorge?", "s_es": {"type": "multiple_choice", "options": ["Support capacity", "Lunch seating", "Slide design"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Supportkapazität", "Sitzplätze beim Mittagessen", "Foliendesign"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo revisarán los datos?", "de": "Wann werden sie die Daten prüfen?", "s_es": {"type": "multiple_choice", "options": ["After two weeks", "After one day", "Next month only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach zwei Wochen", "Nach einem Tag", "Erst nächsten Monat"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7630 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7630 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7630, 'en', 'dialogue', 'meetings', '[{"name": "Nadia", "gender": "female", "avatarURL": "https://example.com/avatars/nadia.png"}, {"name": "Erik", "gender": "male", "avatarURL": "https://example.com/avatars/erik.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Defiende una postura en una discusión', 'Sigue un diálogo donde una persona argumenta a favor de una prueba piloto y responde a objeciones.'),
        (v_dialogue_id, 'de', 'Vertrete eine Position in einer Diskussion', 'Folge einem Dialog, in dem eine Person für einen Piloten argumentiert und auf Einwände reagiert.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
