-- ============================================================
-- Seed: A0 English Path – STEP 480 – Dialogue – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
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
        '{"p": "La habitación está disponible desde el 15 de septiembre.", "p_de": "Das Zimmer ist ab dem 15. September frei.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El alquiler es de 650 euros al mes.", "p_de": "Die Miete beträgt 650 Euro pro Monat.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El depósito es de 150 euros.", "p_de": "Die Kaution beträgt 150 Euro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gas e internet están incluidos.", "p_de": "Gas und Internet sind inklusive.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se permiten invitados para dormir.", "p_de": "Übernachtungsgäste sind erlaubt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuánto cuesta la habitación al mes?", "p_de": "Wie viel kostet das Zimmer pro Monat?", "s": {"type": "multiple_choice", "options": ["480 euros", "150 euros", "520 euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué muebles tiene la habitación?", "p_de": "Welche Möbel hat das Zimmer?", "s": {"type": "multiple_choice", "options": ["Un escritorio y un armario", "Solo una cama", "Una televisión y un sofá"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué gasto no está incluido?", "p_de": "Welche Kosten sind nicht inklusive?", "s": {"type": "multiple_choice", "options": ["El agua", "El gas", "Internet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué espacio es compartido?", "p_de": "Welcher Raum wird geteilt?", "s": {"type": "multiple_choice", "options": ["La cocina y el salón", "El dormitorio", "El balcón privado"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es una regla de la casa?", "p_de": "Welche Regel gibt es im Haus?", "s": {"type": "multiple_choice", "options": ["No hay invitados para dormir", "No se puede usar la cocina", "No se puede estudiar"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 480 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 480 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 480, 'en', 'dialogue', 'accommodation', '[{"name": "Tenant", "gender": "female", "avatarURL": "https://example.com/avatars/tenant.png"}, {"name": "Landlord", "gender": "male", "avatarURL": "https://example.com/avatars/landlord.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Visita a una habitación amueblada', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Besichtigung eines möblierten Zimmers', '');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 0, 'Landlord', 'Hello. This room is available from the fifteenth of September.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. Esta habitación está disponible desde el quince de septiembre."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Dieses Zimmer ist ab dem fünfzehnten September frei."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 1, 'Tenant', 'How much is it per month?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Cuánto cuesta al mes?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Wie viel kostet es pro Monat?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 2, 'Landlord', 'It is 480 euros per month, and the deposit is 150 euros.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Cuesta 480 euros al mes y el depósito es de 150 euros."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Es kostet 480 Euro pro Monat, und die Kaution beträgt 150 Euro."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 3, 'Tenant', 'Are the bills included?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Están incluidos los gastos?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Sind die Nebenkosten inbegriffen?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 4, 'Landlord', 'Gas and internet are included, but water is separate.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "El gas e internet están incluidos, pero el agua va aparte."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Gas und Internet sind inklusive, aber Wasser extra."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 5, 'Tenant', 'Is the room furnished?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿La habitación está amueblada?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ist das Zimmer möbliert?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 6, 'Landlord', 'Yes. It has a bed, a desk, and a wardrobe. The kitchen and living room are shared.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. Tiene cama, escritorio y armario. La cocina y el salón son compartidos."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Es hat ein Bett, einen Schreibtisch und einen Kleiderschrank. Küche und Wohnzimmer werden geteilt."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 7, 'Tenant', 'Are there any house rules?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Hay normas de la casa?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Gibt es Hausregeln?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 8, 'Landlord', 'Yes. No overnight guests, and please clean the shared kitchen every evening. The minimum stay is two months.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. No se permiten invitados para dormir y por favor limpia la cocina compartida cada tarde. La estancia mínima es de dos meses."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Keine Übernachtungsgäste, und bitte putzen Sie jeden Abend die Gemeinschaftsküche. Die Mindestmietdauer beträgt zwei Monate."}]}]'::jsonb);

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;

