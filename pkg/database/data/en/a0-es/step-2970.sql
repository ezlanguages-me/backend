-- ============================================================
-- Seed: A0 English Path – STEP 2970 – Dialogue – find out train times
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
        '{"character": "Clerk", "text": "Good afternoon. Where are you going?", "es": "Buenas tardes. ¿A dónde va?", "de": "Guten Tag. Wohin fahren Sie?"}'::jsonb,
        '{"character": "Visitor", "text": "To Seaview, please. What time is the next train?", "es": "A Seaview, por favor. ¿A qué hora sale el próximo tren?", "de": "Nach Seaview, bitte. Wann fährt der nächste Zug?"}'::jsonb,
        '{"character": "Clerk", "text": "The next train is at 3:30 from platform 5.", "es": "El próximo tren sale a las 3:30 desde el andén 5.", "de": "Der nächste Zug fährt um 3:30 von Bahnsteig 5."}'::jsonb,
        '{"character": "Visitor", "text": "Is there a faster train later?", "es": "¿Hay un tren más rápido más tarde?", "de": "Gibt es später einen schnelleren Zug?"}'::jsonb,
        '{"character": "Clerk", "text": "Yes. There is a fast train at 4:00.", "es": "Sí. Hay un tren rápido a las 4:00.", "de": "Ja. Es gibt um 4:00 einen Schnellzug."}'::jsonb,
        '{"character": "Visitor", "text": "How long does the fast train take?", "es": "¿Cuánto tarda el tren rápido?", "de": "Wie lange braucht der Schnellzug?"}'::jsonb,
        '{"character": "Clerk", "text": "It takes forty minutes.", "es": "Tarda cuarenta minutos.", "de": "Er braucht vierzig Minuten."}'::jsonb,
        '{"character": "Visitor", "text": "Great. Does it stop at Hill Park?", "es": "Muy bien. ¿Para en Hill Park?", "de": "Super. Hält er in Hill Park?"}'::jsonb,
        '{"character": "Clerk", "text": "No, only the local train stops there.", "es": "No, solo el tren local para allí.", "de": "Nein, nur der Regionalzug hält dort."}'::jsonb,
        '{"character": "Visitor", "text": "Thank you. I will take the fast train.", "es": "Gracias. Tomaré el tren rápido.", "de": "Danke. Ich nehme den Schnellzug."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El próximo tren a Seaview sale a las 3:30.", "de": "Der nächste Zug nach Seaview fährt um 3:30 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay un tren rápido a las 4:00.", "de": "Es gibt um 4:00 einen Schnellzug.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tren rápido tarda cincuenta minutos.", "de": "Der Schnellzug braucht fünfzig Minuten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El tren rápido para en Hill Park.", "de": "Der Schnellzug hält in Hill Park.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El visitante va a tomar el tren rápido.", "de": "Der Besucher nimmt den Schnellzug.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿A dónde quiere ir el visitante?", "de": "Wohin möchte der Besucher fahren?", "s_es": {"type": "multiple_choice", "options": ["Seaview", "Greenhill", "Airport Central"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seaview", "Greenhill", "Airport Central"], "answer": 0}}'::jsonb,
        '{"es": "¿Desde qué andén sale el próximo tren?", "de": "Von welchem Bahnsteig fährt der nächste Zug?", "s_es": {"type": "multiple_choice", "options": ["Andén 5", "Andén 3", "Andén 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bahnsteig 5", "Bahnsteig 3", "Bahnsteig 1"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tren para en Hill Park?", "de": "Welcher Zug hält in Hill Park?", "s_es": {"type": "multiple_choice", "options": ["El tren local", "El tren rápido", "Ninguno"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Regionalzug", "Der Schnellzug", "Keiner"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tarda el tren rápido?", "de": "Wie lange braucht der Schnellzug?", "s_es": {"type": "multiple_choice", "options": ["Cuarenta minutos", "Veinte minutos", "Una hora"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vierzig Minuten", "Zwanzig Minuten", "Eine Stunde"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora sale el tren rápido?", "de": "Um wie viel Uhr fährt der Schnellzug?", "s_es": {"type": "multiple_choice", "options": ["A las 4:00", "A las 3:30", "A las 5:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 4:00 Uhr", "Um 3:30 Uhr", "Um 5:00 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2970 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2970 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2970, 'en', 'dialogue', 'transport', '[{"name": "Clerk", "gender": "female", "avatarURL": "https://example.com/avatars/clerk.png"}, {"name": "Visitor", "gender": "male", "avatarURL": "https://example.com/avatars/visitor.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pregunta por el próximo tren en una taquilla', 'Lee un diálogo breve para preguntar por el próximo tren, la duración y las paradas.'),
        (v_dialogue_id, 'de', 'Frage am Schalter nach dem nächsten Zug', 'Lies einen kurzen Dialog über den nächsten Zug, die Fahrtdauer und Halte.');

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
