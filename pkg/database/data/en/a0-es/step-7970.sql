-- ============================================================
-- Seed: A0 English Path – STEP 7970 – Dialogue – practice predictable Q&A exchange (Reuniones y Presentaciones)
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
        '{"character": "Attendee", "text": "What is your main topic?", "es": "¿Cuál es tu tema principal?", "de": "Was ist dein Hauptthema?"}'::jsonb,
        '{"character": "Presenter", "text": "My main topic is easy meeting plans.", "es": "Mi tema principal son los planes fáciles para reuniones.", "de": "Mein Hauptthema sind einfache Meetingpläne."}'::jsonb,
        '{"character": "Attendee", "text": "How long is the talk?", "es": "¿Cuánto dura la charla?", "de": "Wie lang ist der Vortrag?"}'::jsonb,
        '{"character": "Presenter", "text": "It is six minutes.", "es": "Dura seis minutos.", "de": "Er dauert sechs Minuten."}'::jsonb,
        '{"character": "Attendee", "text": "Who is it for?", "es": "¿Para quién es?", "de": "Für wen ist er?"}'::jsonb,
        '{"character": "Presenter", "text": "It is for new team members.", "es": "Es para nuevos miembros del equipo.", "de": "Er ist für neue Teammitglieder."}'::jsonb,
        '{"character": "Attendee", "text": "Where can I get the notes?", "es": "¿Dónde puedo conseguir las notas?", "de": "Wo kann ich die Notizen bekommen?"}'::jsonb,
        '{"character": "Presenter", "text": "You can get them by email.", "es": "Puedes conseguirlas por correo electrónico.", "de": "Du kannst sie per E-Mail bekommen."}'::jsonb,
        '{"character": "Attendee", "text": "When is the next session?", "es": "¿Cuándo es la próxima sesión?", "de": "Wann ist die nächste Sitzung?"}'::jsonb,
        '{"character": "Presenter", "text": "It is tomorrow at nine.", "es": "Es mañana a las nueve.", "de": "Sie ist morgen um neun."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El tema principal son planes fáciles para reuniones.", "de": "Das Hauptthema sind einfache Meetingpläne.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla dura seis minutos.", "de": "Der Vortrag dauert sechs Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La charla es para visitantes del hotel.", "de": "Der Vortrag ist für Hotelgäste.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las notas se consiguen por correo electrónico.", "de": "Die Notizen bekommt man per E-Mail.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La próxima sesión es hoy a las nueve.", "de": "Die nächste Sitzung ist heute um neun.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Cuál es el tema principal?", "de": "Was ist das Hauptthema?", "s_es": {"type": "multiple_choice", "options": ["Easy meeting plans", "Train station maps", "Office music"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einfache Meetingpläne", "Bahnhofspläne", "Büromusik"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dura la charla?", "de": "Wie lange dauert der Vortrag?", "s_es": {"type": "multiple_choice", "options": ["Six minutes", "Two hours", "Thirty minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs Minuten", "Zwei Stunden", "Dreißig Minuten"], "answer": 0}}'::jsonb,
        '{"es": "¿Para quién es la charla?", "de": "Für wen ist der Vortrag?", "s_es": {"type": "multiple_choice", "options": ["For new team members", "For taxi drivers", "For cooks"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für neue Teammitglieder", "Für Taxifahrer", "Für Köche"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo se consiguen las notas?", "de": "Wie bekommt man die Notizen?", "s_es": {"type": "multiple_choice", "options": ["By email", "By bus", "By train"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per E-Mail", "Mit dem Bus", "Mit dem Zug"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo es la próxima sesión?", "de": "Wann ist die nächste Sitzung?", "s_es": {"type": "multiple_choice", "options": ["Tomorrow at nine", "Today at five", "Next week at one"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morgen um neun", "Heute um fünf", "Nächste Woche um eins"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7970 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7970 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7970, 'en', 'dialogue', 'meetings', '[{"name": "Attendee", "gender": "female", "avatarURL": "https://example.com/avatars/attendee.png"}, {"name": "Presenter", "gender": "male", "avatarURL": "https://example.com/avatars/presenter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Practica un intercambio previsible de preguntas y respuestas', 'Lee una breve ronda de preguntas entre una asistente y una presentadora después de una charla.'),
        (v_dialogue_id, 'de', 'Übe einen vorhersehbaren Frage-Antwort-Austausch', 'Lies eine kurze Fragerunde zwischen einer Teilnehmerin und einer Präsentierenden nach einem Vortrag.');

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
