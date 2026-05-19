-- ============================================================
-- Seed: A0 English Path – STEP 560 – Dialogue – understand, and ask questions about, house rules/conventions, such as the time of meals (Convivencia)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Alex puede ducharse rápido entre las 6:30 y las 7:00.", "p_de": "Alex kann zwischen 6:30 und 7:00 schnell duschen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede entrar con zapatos en toda la casa.", "p_de": "Man kann im ganzen Haus Schuhe tragen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Alex debe llevar la llave azul cuando sale.", "p_de": "Alex soll den blauen Schlüssel mitnehmen, wenn er ausgeht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala de estudio está libre después de las 7 PM.", "p_de": "Der Lernraum ist nach 19 Uhr frei.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuándo puede usar Alex el baño por la mañana?", "p_de": "Wann kann Alex morgens das Bad benutzen?", "s": {"type": "multiple_choice", "options": ["De 6:30 a 7:00", "De 8:00 a 9:00", "A medianoche"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe dejar Alex en la entrada?", "p_de": "Was soll Alex am Eingang ausziehen?", "s": {"type": "multiple_choice", "options": ["Los zapatos", "La chaqueta", "La mochila"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué color es la llave?", "p_de": "Welche Farbe hat der Schlüssel?", "s": {"type": "multiple_choice", "options": ["Azul", "Rojo", "Verde"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde puede estudiar Alex después de cenar?", "p_de": "Wo kann Alex nach dem Abendessen lernen?", "s": {"type": "multiple_choice", "options": ["En la sala de estudio", "En el baño", "En la puerta"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM dialogue WHERE step_order = 560 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 560, 'en', 'dialogue', 'social', '[{"name": "Alex", "gender": "male", "avatarURL": "https://example.com/avatars/alex.png"}, {"name": "Sarah", "gender": "female", "avatarURL": "https://example.com/avatars/sarah.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Preguntas sobre otras normas de la casa', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Fragen zu anderen Hausregeln', '');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 0, 'Alex', 'Sarah, can I ask about the bathroom and the key?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sarah, ¿puedo preguntar por el baño y la llave?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Sarah, kann ich nach dem Bad und dem Schlüssel fragen?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 1, 'Sarah', 'Of course. In the morning you can take a quick shower from six thirty to seven.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Claro. Por la mañana puedes darte una ducha rápida de seis y media a siete."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Natürlich. Morgens kannst du von halb sieben bis sieben kurz duschen."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 2, 'Alex', 'And after seven forty five?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Y después de las siete y cuarenta y cinco?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Und nach sieben Uhr fünfundvierzig?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 3, 'Sarah', 'Then the bathroom is free for a longer shower.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Entonces el baño está libre para una ducha más larga."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Dann ist das Bad für eine längere Dusche frei."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 4, 'Alex', 'Should I leave my shoes at the door?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Debo dejar los zapatos en la puerta?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Soll ich meine Schuhe an der Tür ausziehen?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 5, 'Sarah', 'Yes, please. We use slippers inside the house.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí, por favor. Usamos zapatillas dentro de la casa."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja, bitte. Wir tragen Hausschuhe im Haus."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 6, 'Alex', 'Do I take a key when I go out?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Me llevo una llave cuando salgo?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Nehme ich einen Schlüssel mit, wenn ich ausgehe?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 7, 'Sarah', 'Yes. Please take the blue key and lock the door quietly.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. Por favor, llévate la llave azul y cierra la puerta sin hacer ruido."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Bitte nimm den blauen Schlüssel mit und schließe die Tür leise."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 8, 'Alex', 'Where can I study in the evening?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Dónde puedo estudiar por la tarde?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Wo kann ich abends lernen?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 9, 'Sarah', 'The study room is free after seven in the evening.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "La sala de estudio está libre después de las siete de la tarde."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Der Lernraum ist nach sieben Uhr abends frei."}]}]'::jsonb);

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;

