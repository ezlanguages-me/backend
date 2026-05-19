-- ============================================================
-- Seed: A0 English Path – STEP 4240 – Dialogue – discuss a work project (Servicios Laborales)
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
        '{"character": "Manager", "text": "Good morning. Can we go over the office refurbishment project?", "es": "Buenos días. ¿Podemos repasar el proyecto de reforma de la oficina?", "de": "Guten Morgen. Können wir das Bürorenovierungsprojekt durchgehen?"}'::jsonb,
    '{"character": "Employee", "text": "Of course. We are on track. The first phase is nearly complete.", "es": "Por supuesto. Vamos bien. La primera fase está casi terminada.", "de": "Natürlich. Wir liegen im Plan. Die erste Phase ist fast abgeschlossen."}'::jsonb,
    '{"character": "Manager", "text": "Good. When do you expect to finish phase two?", "es": "Bien. ¿Cuándo espera terminar la fase dos?", "de": "Gut. Wann rechnen Sie damit, Phase zwei abzuschließen?"}'::jsonb,
    '{"character": "Employee", "text": "We expect to finish phase two by the end of next week.", "es": "Esperamos terminar la fase dos a finales de la próxima semana.", "de": "Wir rechnen damit, Phase zwei bis Ende nächster Woche abzuschließen."}'::jsonb,
    '{"character": "Manager", "text": "Are there any problems we should know about?", "es": "¿Hay algún problema que debamos saber?", "de": "Gibt es Probleme, die wir wissen sollten?"}'::jsonb,
    '{"character": "Employee", "text": "The delivery of new furniture was delayed by two days, but it arrives tomorrow.", "es": "La entrega del mobiliario nuevo se retrasó dos días, pero llega mañana.", "de": "Die Lieferung der neuen Möbel hat sich zwei Tage verzögert, aber sie kommt morgen an."}'::jsonb,
    '{"character": "Manager", "text": "That is fine. What about the budget?", "es": "Está bien. ¿Y el presupuesto?", "de": "Das ist in Ordnung. Was ist mit dem Budget?"}'::jsonb,
    '{"character": "Employee", "text": "We are within budget. I will send you a full update by email this afternoon.", "es": "Estamos dentro del presupuesto. Le enviaré una actualización completa por correo esta tarde.", "de": "Wir liegen im Budget. Ich schicke Ihnen heute Nachmittag eine vollständige Aktualisierung per E-Mail."}'::jsonb,
    '{"character": "Manager", "text": "Perfect. Thank you for the update.", "es": "Perfecto. Gracias por la actualización.", "de": "Perfekt. Danke für die Aktualisierung."}'::jsonb,
    '{"character": "Employee", "text": "No problem. I will keep you informed of any changes.", "es": "De nada. Le mantendré informado de cualquier cambio.", "de": "Kein Problem. Ich halte Sie über alle Änderungen auf dem Laufenden."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La primera fase del proyecto está casi terminada.", "p_de": "Die erste Phase des Projekts ist fast abgeschlossen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La fase dos terminará dentro de dos semanas.", "p_de": "Phase zwei wird in zwei Wochen abgeschlossen sein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El mobiliario llega mañana.", "p_de": "Die Möbel kommen morgen an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El proyecto se ha excedido del presupuesto.", "p_de": "Das Projekt hat das Budget überschritten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El empleado enviará una actualización por correo electrónico esta tarde.", "p_de": "Der Mitarbeiter schickt heute Nachmittag eine Aktualisierung per E-Mail.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Sobre qué proyecto hablan?", "p_de": "Über welches Projekt sprechen sie?", "s_es": {"type": "multiple_choice", "options": ["Office refurbishment", "Staff training", "IT upgrade"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bürorenovierung", "Mitarbeiterschulung", "IT-Upgrade"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo se espera terminar la fase dos?", "p_de": "Wann wird Phase zwei erwartet fertig zu sein?", "s_es": {"type": "multiple_choice", "options": ["By end of next week", "By end of next month", "Tomorrow"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis Ende nächster Woche", "Bis Ende nächsten Monats", "Morgen"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuánto se retrasó la entrega del mobiliario?", "p_de": "Um wie viele Tage hat sich die Möbellieferung verzögert?", "s_es": {"type": "multiple_choice", "options": ["Two days", "One week", "Three days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Tage", "Eine Woche", "Drei Tage"], "answer": 0}}'::jsonb,
    '{"p": "¿Cómo está el presupuesto?", "p_de": "Wie ist der Stand des Budgets?", "s_es": {"type": "multiple_choice", "options": ["Within budget", "Over budget", "Under budget by 10%"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Budget", "Über Budget", "10% unter Budget"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué enviará el empleado esta tarde?", "p_de": "Was wird der Mitarbeiter heute Nachmittag schicken?", "s_es": {"type": "multiple_choice", "options": ["A full update by email", "The invoice", "A new project plan"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine vollständige Aktualisierung per E-Mail", "Die Rechnung", "Einen neuen Projektplan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4240 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4240 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4240, 'en', 'dialogue', 'professional', '[{"name": "Manager", "gender": "female", "avatarURL": "https://example.com/avatars/manager.png"}, {"name": "Employee", "gender": "male", "avatarURL": "https://example.com/avatars/employee.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre un proyecto de trabajo', 'Practica una conversación de seguimiento de proyecto con fases, retraso, presupuesto y actualización.'),
        (v_dialogue_id, 'de', 'Besprich ein Arbeitsprojekt', 'Übe ein Projektfortschrittsgespräch mit Phasen, Verzögerung, Budget und Aktualisierung.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
