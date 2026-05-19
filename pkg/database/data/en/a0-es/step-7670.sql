-- ============================================================
-- Seed: A0 English Path – STEP 7670 – Dialogue – participate in extended discussion (Reuniones y Presentaciones)
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
        '{"character": "Olivia", "text": "We still need to decide how the monthly review meeting should run.", "es": "Todavía tenemos que decidir cómo debe funcionar la reunión mensual de revisión.", "de": "Wir müssen noch entscheiden, wie das monatliche Review Treffen ablaufen soll."}'::jsonb,
        '{"character": "Sam", "text": "I want a shorter meeting with reports sent before the session.", "es": "Quiero una reunión más corta con informes enviados antes de la sesión.", "de": "Ich möchte ein kürzeres Treffen mit Berichten, die vor der Sitzung geschickt werden."}'::jsonb,
        '{"character": "Petra", "text": "I agree on the reports, but we also need time for open questions.", "es": "Estoy de acuerdo con los informes, pero también necesitamos tiempo para preguntas abiertas.", "de": "Ich stimme den Berichten zu, aber wir brauchen auch Zeit für offene Fragen."}'::jsonb,
        '{"character": "Olivia", "text": "What if we keep the meeting to forty minutes and reserve the last ten for questions?", "es": "¿Y si dejamos la reunión en cuarenta minutos y reservamos los últimos diez para preguntas?", "de": "Was wäre, wenn wir das Treffen auf vierzig Minuten begrenzen und die letzten zehn für Fragen reservieren?"}'::jsonb,
        '{"character": "Sam", "text": "That works for me, as long as each team speaks for no more than five minutes.", "es": "Eso me sirve, siempre que cada equipo hable no más de cinco minutos.", "de": "Das passt für mich, solange jedes Team nicht länger als fünf Minuten spricht."}'::jsonb,
        '{"character": "Petra", "text": "Five minutes is fine for updates, but the support team sometimes needs a little more time.", "es": "Cinco minutos está bien para las actualizaciones, pero el equipo de soporte a veces necesita un poco más de tiempo.", "de": "Fünf Minuten sind gut für Updates, aber das Supportteam braucht manchmal etwas mehr Zeit."}'::jsonb,
        '{"character": "Olivia", "text": "Then we can give support seven minutes and ask other teams to stay brief.", "es": "Entonces podemos dar siete minutos a soporte y pedir a los otros equipos que sean breves.", "de": "Dann können wir dem Support sieben Minuten geben und die anderen Teams bitten, kurz zu bleiben."}'::jsonb,
        '{"character": "Sam", "text": "I can accept that if the chair keeps the order clear.", "es": "Puedo aceptar eso si la persona que dirige mantiene claro el orden.", "de": "Ich kann das akzeptieren, wenn die Leitung die Reihenfolge klar hält."}'::jsonb,
        '{"character": "Petra", "text": "We should also end with one list of actions, not separate notes.", "es": "También deberíamos terminar con una sola lista de acciones, no con notas separadas.", "de": "Wir sollten auch mit einer einzigen Aktionsliste enden, nicht mit getrennten Notizen."}'::jsonb,
        '{"character": "Olivia", "text": "Good point. I can share the action list on screen before we close.", "es": "Buen punto. Puedo compartir la lista de acciones en pantalla antes de terminar.", "de": "Guter Punkt. Ich kann die Aktionsliste vor dem Abschluss am Bildschirm teilen."}'::jsonb,
        '{"character": "Sam", "text": "In that case, the new format sounds balanced.", "es": "En ese caso, el formato nuevo suena equilibrado.", "de": "In diesem Fall klingt das neue Format ausgewogen."}'::jsonb,
        '{"character": "Petra", "text": "Yes, let us try it for the next two monthly reviews.", "es": "Sí, probémoslo en las dos próximas revisiones mensuales.", "de": "Ja, probieren wir es in den nächsten zwei monatlichen Reviews aus."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Sam quiere una reunión más corta con informes enviados antes.", "de": "Sam möchte ein kürzeres Treffen mit vorher gesendeten Berichten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Petra no quiere tiempo para preguntas abiertas.", "de": "Petra möchte keine Zeit für offene Fragen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Olivia propone una reunión de cuarenta minutos con diez minutos finales para preguntas.", "de": "Olivia schlägt ein vierzigminütiges Treffen mit zehn Minuten für Fragen am Ende vor.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El equipo de soporte puede tener siete minutos.", "de": "Das Supportteam kann sieben Minuten bekommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Deciden usar el nuevo formato durante un año completo.", "de": "Sie entscheiden sich dafür, das neue Format ein ganzes Jahr lang zu nutzen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué quiere Sam antes de la sesión?", "de": "Was möchte Sam vor der Sitzung?", "s_es": {"type": "multiple_choice", "options": ["Reports sent in advance", "A printed contract", "A client lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vorab geschickte Berichte", "Einen gedruckten Vertrag", "Ein Kundenmittagessen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tiempo reserva Olivia para preguntas?", "de": "Wie viel Zeit reserviert Olivia für Fragen?", "s_es": {"type": "multiple_choice", "options": ["Ten minutes", "Five minutes", "Twenty minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zehn Minuten", "Fünf Minuten", "Zwanzig Minuten"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tiempo quiere Sam para cada equipo?", "de": "Wie viel Zeit möchte Sam pro Team?", "s_es": {"type": "multiple_choice", "options": ["No more than five minutes", "At least fifteen minutes", "Exactly one minute"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nicht mehr als fünf Minuten", "Mindestens fünfzehn Minuten", "Genau eine Minute"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué propone Petra al final de la reunión?", "de": "Was schlägt Petra für das Ende des Treffens vor?", "s_es": {"type": "multiple_choice", "options": ["One list of actions", "Separate notes for each person", "A second meeting on the same day"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Liste von Aktionen", "Getrennte Notizen für jede Person", "Ein zweites Treffen am selben Tag"], "answer": 0}}'::jsonb,
        '{"es": "¿Durante cuánto tiempo probarán el nuevo formato?", "de": "Wie lange werden sie das neue Format testen?", "s_es": {"type": "multiple_choice", "options": ["For the next two monthly reviews", "For one full year", "Only this afternoon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für die nächsten zwei monatlichen Reviews", "Für ein ganzes Jahr", "Nur heute Nachmittag"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7670 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7670 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7670, 'en', 'dialogue', 'meetings', '[{"name": "Olivia", "gender": "female", "avatarURL": "https://example.com/avatars/olivia.png"}, {"name": "Sam", "gender": "male", "avatarURL": "https://example.com/avatars/sam.png"}, {"name": "Petra", "gender": "female", "avatarURL": "https://example.com/avatars/petra.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Participa en una discusión más larga', 'Sigue una discusión con tres personas que negocian formato, tiempos y cierre de una reunión mensual.'),
        (v_dialogue_id, 'de', 'Nimm an einer längeren Diskussion teil', 'Folge einer Diskussion mit drei Personen, die Format, Zeiten und Abschluss eines Monatstreffens aushandeln.');

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
