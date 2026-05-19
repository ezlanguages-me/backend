-- ============================================================
-- Seed: A0 English Path – STEP 2260 – Dialogue – make a complaint about straightforward matters, for example, the service or the bill (Restauración)
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
        '{"character": "Guest", "text": "Excuse me, I ordered fish, not chicken.", "es": "Perdone, pedí pescado, no pollo.", "de": "Entschuldigung, ich habe Fisch bestellt, nicht Hähnchen."}'::jsonb,
        '{"character": "Waiter", "text": "I am sorry. Let me change it.", "es": "Lo siento. Déjeme cambiarlo.", "de": "Es tut mir leid. Ich ändere das."}'::jsonb,
        '{"character": "Guest", "text": "Thank you. Also, my drink is missing.", "es": "Gracias. Además, falta mi bebida.", "de": "Danke. Außerdem fehlt mein Getränk."}'::jsonb,
        '{"character": "Waiter", "text": "I will bring it now.", "es": "La traigo ahora.", "de": "Ich bringe es jetzt."}'::jsonb,
        '{"character": "Guest", "text": "And this bill has a dessert I did not order.", "es": "Y esta cuenta tiene un postre que no pedí.", "de": "Und auf dieser Rechnung steht ein Dessert, das ich nicht bestellt habe."}'::jsonb,
        '{"character": "Waiter", "text": "I see it. I will correct the bill.", "es": "Lo veo. Corregiré la cuenta.", "de": "Ich sehe es. Ich werde die Rechnung korrigieren."}'::jsonb,
        '{"character": "Guest", "text": "Thanks. How long will the fish take?", "es": "Gracias. ¿Cuánto tardará el pescado?", "de": "Danke. Wie lange dauert der Fisch?"}'::jsonb,
        '{"character": "Waiter", "text": "About five minutes.", "es": "Unos cinco minutos.", "de": "Etwa fünf Minuten."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente pidió pescado.", "p_de": "Der Gast bestellte Fisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero trajo pescado correcto desde el principio.", "p_de": "Der Kellner brachte von Anfang an den richtigen Fisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Falta la bebida del cliente.", "p_de": "Das Getränk des Gastes fehlt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cuenta tiene un postre extra.", "p_de": "Die Rechnung hat ein zusätzliches Dessert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero dice que el pescado tardará una hora.", "p_de": "Der Kellner sagt, der Fisch dauert eine Stunde.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué plato llegó por error?", "p_de": "Welches Gericht kam irrtümlich?", "s": {"type": "multiple_choice", "options": ["Chicken", "Fish", "Soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué falta además del plato correcto?", "p_de": "Was fehlt außer dem richtigen Gericht?", "s": {"type": "multiple_choice", "options": ["The drink", "The bread", "The chair"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué error hay en la cuenta?", "p_de": "Welcher Fehler ist auf der Rechnung?", "s": {"type": "multiple_choice", "options": ["A dessert the guest did not order", "No tax", "Wrong date only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace el camarero con la cuenta?", "p_de": "Was macht der Kellner mit der Rechnung?", "s": {"type": "multiple_choice", "options": ["He corrects it", "He tears it up", "He hides it"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto tardará el pescado?", "p_de": "Wie lange dauert der Fisch?", "s": {"type": "multiple_choice", "options": ["About five minutes", "About one hour", "Right now on the table"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2260 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2260 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2260, 'en', 'dialogue', 'Restauración', '[{"name": "Guest", "gender": "male", "avatarURL": "https://example.com/avatars/guest-m.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Quejarse por un pedido incorrecto y por la cuenta', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Sich über eine falsche Bestellung und die Rechnung beschweren', '');

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
