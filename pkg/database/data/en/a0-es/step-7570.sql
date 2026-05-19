-- ============================================================
-- Seed: A0 English Path – STEP 7570 – Dialogue – agree on action points after meeting (Reuniones y Presentaciones)
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
        '{"character": "Emma", "text": "We have the meeting notes. Shall we agree on the action points now?", "es": "Ya tenemos las notas de la reunión. ¿Acordamos ahora los puntos de acción?", "de": "Wir haben die Besprechungsnotizen. Sollen wir jetzt die Aktionspunkte festlegen?"}'::jsonb,
        '{"character": "Luis", "text": "Yes. I will send the room link to everyone this afternoon.", "es": "Sí. Enviaré el enlace de la sala a todo el mundo esta tarde.", "de": "Ja. Ich schicke heute Nachmittag allen den Raumlink."}'::jsonb,
        '{"character": "Emma", "text": "Great. I can write the short summary for the sales team.", "es": "Genial. Yo puedo escribir el resumen breve para el equipo de ventas.", "de": "Super. Ich kann die kurze Zusammenfassung für das Vertriebsteam schreiben."}'::jsonb,
        '{"character": "Luis", "text": "Can you also add the new deadline for the draft?", "es": "¿Puedes añadir también el nuevo plazo para el borrador?", "de": "Kannst du auch die neue Frist für den Entwurf hinzufügen?"}'::jsonb,
        '{"character": "Emma", "text": "Yes, the draft deadline is next Tuesday.", "es": "Sí, la fecha límite del borrador es el próximo martes.", "de": "Ja, die Frist für den Entwurf ist nächsten Dienstag."}'::jsonb,
        '{"character": "Luis", "text": "Then I will ask Mia for the final cost figures.", "es": "Entonces le pediré a Mia las cifras finales de costes.", "de": "Dann werde ich Mia nach den endgültigen Kostenzahlen fragen."}'::jsonb,
        '{"character": "Emma", "text": "Good. We still need a reminder for the customer interview.", "es": "Bien. Todavía necesitamos un recordatorio para la entrevista con el cliente.", "de": "Gut. Wir brauchen noch eine Erinnerung für das Kundengespräch."}'::jsonb,
        '{"character": "Luis", "text": "I can send that tomorrow morning.", "es": "Puedo enviarlo mañana por la mañana.", "de": "Das kann ich morgen früh schicken."}'::jsonb,
        '{"character": "Emma", "text": "Perfect. Then we only need to check progress on Monday.", "es": "Perfecto. Entonces solo tenemos que revisar el progreso el lunes.", "de": "Perfekt. Dann müssen wir nur noch am Montag den Fortschritt prüfen."}'::jsonb,
        '{"character": "Luis", "text": "Agreed. Let us keep the action list open until then.", "es": "De acuerdo. Mantengamos abierta la lista de acciones hasta entonces.", "de": "Abgemacht. Lassen wir die Aktionsliste bis dahin offen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Luis enviará el enlace de la sala esta tarde.", "de": "Luis schickt den Raumlink heute Nachmittag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Emma escribirá el resumen breve para el equipo de ventas.", "de": "Emma schreibt die kurze Zusammenfassung für das Vertriebsteam.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La nueva fecha límite del borrador es el próximo viernes.", "de": "Die neue Frist für den Entwurf ist nächsten Freitag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Luis enviará el recordatorio de la entrevista con el cliente mañana por la mañana.", "de": "Luis schickt die Erinnerung an das Kundengespräch morgen früh.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Quieren cerrar la lista de acciones inmediatamente.", "de": "Sie wollen die Aktionsliste sofort schließen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué enviará Luis esta tarde?", "de": "Was wird Luis heute Nachmittag schicken?", "s_es": {"type": "multiple_choice", "options": ["The room link", "The printed agenda", "The lunch order"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Raumlink", "Die gedruckte Agenda", "Die Mittagsbestellung"], "answer": 0}}'::jsonb,
        '{"es": "¿Para qué equipo escribe Emma el resumen?", "de": "Für welches Team schreibt Emma die Zusammenfassung?", "s_es": {"type": "multiple_choice", "options": ["The sales team", "The finance team", "The support team"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Vertriebsteam", "Das Finanzteam", "Das Supportteam"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo es la fecha límite del borrador?", "de": "Wann ist die Frist für den Entwurf?", "s_es": {"type": "multiple_choice", "options": ["Next Tuesday", "Tomorrow morning", "This afternoon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nächsten Dienstag", "Morgen früh", "Heute Nachmittag"], "answer": 0}}'::jsonb,
        '{"es": "¿A quién pedirá Luis las cifras finales de costes?", "de": "Wen wird Luis nach den endgültigen Kostenzahlen fragen?", "s_es": {"type": "multiple_choice", "options": ["Mia", "Emma", "The customer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mia", "Emma", "Den Kunden"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo revisarán el progreso?", "de": "Wann werden sie den Fortschritt prüfen?", "s_es": {"type": "multiple_choice", "options": ["On Monday", "On Friday", "Right now"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Montag", "Am Freitag", "Sofort"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7570 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7570 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7570, 'en', 'dialogue', 'meetings', '[{"name": "Emma", "gender": "female", "avatarURL": "https://example.com/avatars/emma.png"}, {"name": "Luis", "gender": "male", "avatarURL": "https://example.com/avatars/luis.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Acordar puntos de acción después de una reunión', 'Lee un diálogo corto en el que dos compañeros reparten tareas y fijan próximos pasos.'),
        (v_dialogue_id, 'de', 'Aktionspunkte nach einer Besprechung vereinbaren', 'Lies einen kurzen Dialog, in dem zwei Kollegen Aufgaben verteilen und nächste Schritte festlegen.');

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
