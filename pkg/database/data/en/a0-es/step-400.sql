-- ============================================================
-- Seed: A0 English Path – STEP 400 – Dialogue – make simple complaints, for example 'The water is cold' (Alojamiento)
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
        '{"p": "El huésped está en la habitación 208.", "p_de": "Der Gast ist in Zimmer 208.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tarjeta llave abre la puerta sin problema.", "p_de": "Die Schlüsselkarte öffnet die Tür ohne Problem.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La caja fuerte tampoco se abre.", "p_de": "Der Safe geht auch nicht auf.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La recepcionista hace una tarjeta nueva.", "p_de": "Die Rezeptionistin macht eine neue Karte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Seguridad puede ayudar con la caja fuerte en diez minutos.", "p_de": "Der Sicherheitsdienst kann in zehn Minuten mit dem Safe helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué problema dice primero el huésped?", "p_de": "Welches Problem nennt der Gast zuerst?", "s": {"type": "multiple_choice", "options": ["La tarjeta llave no abre la puerta", "La ducha está rota", "No hay desayuno"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otro problema tiene el huésped?", "p_de": "Welches weitere Problem hat der Gast?", "s": {"type": "multiple_choice", "options": ["La caja fuerte no se abre", "La ventana está abierta", "La cama es pequeña"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace la recepcionista primero?", "p_de": "Was macht die Rezeptionistin zuerst?", "s": {"type": "multiple_choice", "options": ["Hace una tarjeta nueva", "Llama a un taxi", "Cierra la recepción"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién va a abrir la caja fuerte?", "p_de": "Wer wird den Safe öffnen?", "s": {"type": "multiple_choice", "options": ["Seguridad", "El cocinero", "Otro huésped"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde puede esperar el huésped?", "p_de": "Wo kann der Gast warten?", "s": {"type": "multiple_choice", "options": ["En el lobby", "En el restaurante", "En el ascensor"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 400 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 400 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 400, 'en', 'dialogue', 'accommodation', '[{"name": "Guest", "gender": "male", "avatarURL": "https://example.com/avatars/guest.png"}, {"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Problemas con la tarjeta y la caja fuerte', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Probleme mit Karte und Safe', '');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 0, 'Guest', 'Hello. I am in room 208. My key card does not open the door.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. Estoy en la habitación 208. Mi tarjeta llave no abre la puerta."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Ich bin in Zimmer 208. Meine Schlüsselkarte öffnet die Tür nicht."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 1, 'Receptionist', 'I am sorry. I can make a new card right now.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Lo siento. Puedo hacer una tarjeta nueva ahora mismo."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Es tut mir leid. Ich kann sofort eine neue Karte machen."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 2, 'Guest', 'Thank you. The safe in my room does not open either.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Gracias. La caja fuerte de mi habitación tampoco se abre."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Danke. Der Safe in meinem Zimmer geht auch nicht auf."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 3, 'Receptionist', 'I understand. Security can help with the safe.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Entiendo. Seguridad puede ayudar con la caja fuerte."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich verstehe. Der Sicherheitsdienst kann mit dem Safe helfen."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 4, 'Guest', 'How long does that take? I need my passport from the safe.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Cuánto tarda eso? Necesito mi pasaporte de la caja fuerte."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Wie lange dauert das? Ich brauche meinen Pass aus dem Safe."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 5, 'Receptionist', 'About ten minutes. Please try this new card first.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Unos diez minutos. Pruebe primero esta tarjeta nueva."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ungefähr zehn Minuten. Probieren Sie zuerst diese neue Karte."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 6, 'Guest', 'The new card works. Thank you. Where can I wait?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "La tarjeta nueva funciona. Gracias. ¿Dónde puedo esperar?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Die neue Karte funktioniert. Danke. Wo kann ich warten?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 7, 'Receptionist', 'You can wait in the lobby. Security will come to room 208 in ten minutes.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Puede esperar en el vestíbulo. Seguridad irá a la habitación 208 en diez minutos."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Sie können in der Lobby warten. Der Sicherheitsdienst kommt in zehn Minuten zu Zimmer 208."}]}]'::jsonb);

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;

