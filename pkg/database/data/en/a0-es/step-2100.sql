-- ============================================================
-- Seed: A0 English Path – STEP 2100 – Dialogue – make simple complaints, for example, 'The food is cold' (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Guest", "text": "Excuse me, my soup is cold.", "es": "Perdone, mi sopa está fría.", "de": "Entschuldigung, meine Suppe ist kalt."}'::jsonb,
        '{"character": "Waiter", "text": "I am sorry. I can bring a hot soup.", "es": "Lo siento. Puedo traerle una sopa caliente.", "de": "Es tut mir leid. Ich kann Ihnen eine heiße Suppe bringen."}'::jsonb,
        '{"character": "Guest", "text": "Thank you. Also, the bread is very hard.", "es": "Gracias. Además, el pan está muy duro.", "de": "Danke. Außerdem ist das Brot sehr hart."}'::jsonb,
        '{"character": "Waiter", "text": "I will bring fresh bread.", "es": "Traeré pan fresco.", "de": "Ich bringe frisches Brot."}'::jsonb,
        '{"character": "Guest", "text": "And my water is not here.", "es": "Y mi agua no está aquí.", "de": "Und mein Wasser ist nicht da."}'::jsonb,
        '{"character": "Waiter", "text": "I will bring it now.", "es": "La traigo ahora.", "de": "Ich bringe es jetzt."}'::jsonb,
        '{"character": "Guest", "text": "Thank you for your help.", "es": "Gracias por su ayuda.", "de": "Danke für Ihre Hilfe."}'::jsonb,
        '{"character": "Waiter", "text": "Of course.", "es": "Claro.", "de": "Natürlich."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clienta dice que su sopa está fría.", "p_de": "Die Gästin sagt, dass ihre Suppe kalt ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero ofrece sopa caliente.", "p_de": "Der Kellner bietet heiße Suppe an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pan está blando y fresco.", "p_de": "Das Brot ist weich und frisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El agua de la clienta todavía no ha llegado.", "p_de": "Das Wasser der Gästin ist noch nicht gekommen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conversación termina con una discusión.", "p_de": "Das Gespräch endet mit einem Streit.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué problema dice primero la clienta?", "p_de": "Welches Problem nennt die Gästin zuerst?", "s": {"type": "multiple_choice", "options": ["My soup is cold", "My bill is wrong", "My table is dirty"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué solución ofrece el camarero primero?", "p_de": "Welche Lösung bietet der Kellner zuerst an?", "s": {"type": "multiple_choice", "options": ["A hot soup", "A free dessert", "A new table"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está el pan?", "p_de": "Wie ist das Brot?", "s": {"type": "multiple_choice", "options": ["Very hard", "Warm and soft", "Too sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué falta en la mesa?", "p_de": "Was fehlt auf dem Tisch?", "s": {"type": "multiple_choice", "options": ["Water", "Coffee", "Salad"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tono tiene la conversación?", "p_de": "Welchen Ton hat das Gespräch?", "s": {"type": "multiple_choice", "options": ["Polite", "Angry", "Funny"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2100 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2100 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2100, 'en', 'dialogue', 'Restauración', '[{"name": "Guest", "gender": "female", "avatarURL": "https://example.com/avatars/guest.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Quejarse con educación al camarero', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Sich höflich beim Kellner beschweren', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));
        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
