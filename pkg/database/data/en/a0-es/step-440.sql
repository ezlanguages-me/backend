-- ============================================================
-- Seed: A0 English Path – STEP 440 – Dialogue – make a complaint about simple matters, for example 'The light in my room doesn't work.' (Alojamiento)
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
                '{"p": "La huésped está en la habitación 402.", "p_de": "Die Gästin ist in Zimmer 402.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La luz funciona bien.", "p_de": "Das Licht funktioniert gut.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ducha está rota.", "p_de": "Die Dusche ist kaputt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay una toalla en el baño.", "p_de": "Es gibt ein Handtuch im Badezimmer.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La recepción puede enviar toallas ahora.", "p_de": "Die Rezeption kann jetzt Handtücher schicken.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El técnico puede venir en unos veinte minutos.", "p_de": "Der Techniker kann in etwa zwanzig Minuten kommen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué problema dice primero la huésped?", "p_de": "Welches Problem nennt die Gästin zuerst?", "s": {"type": "multiple_choice", "options": ["La luz no funciona", "El desayuno es frío", "No hay aparcamiento"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué falta en el baño?", "p_de": "Was fehlt im Bad?", "s": {"type": "multiple_choice", "options": ["Una toalla", "Una cama", "Una llave"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede enviar la recepción de inmediato?", "p_de": "Was kann die Rezeption sofort schicken?", "s": {"type": "multiple_choice", "options": ["Toallas", "Un taxi", "Un desayuno"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo puede venir el técnico?", "p_de": "Wann kann der Techniker kommen?", "s": {"type": "multiple_choice", "options": ["En unos veinte minutos", "Mañana", "En dos horas"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace la huésped al final?", "p_de": "Welche Frage stellt die Gästin am Ende?", "s": {"type": "multiple_choice", "options": ["Si necesita otra habitación", "Si hay piscina", "Si puede desayunar"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué decide hacer primero la recepción?", "p_de": "Was möchte die Rezeption zuerst tun?", "s": {"type": "multiple_choice", "options": ["Revisar la habitación", "Cambiar el contrato", "Cerrar el baño"], "answer": 0}}'::jsonb
            ];
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM exercise WHERE target_uuid IN (
                SELECT uuid FROM dialogue WHERE step_order = 440 AND path_uuid = v_path_id
            );
            DELETE FROM dialogue WHERE step_order = 440 AND path_uuid = v_path_id;

            INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
            VALUES (v_path_id, 440, 'en', 'dialogue', 'accommodation', '[
    {
        "name": "Guest",
        "gender": "female",
        "avatarURL": "https://example.com/avatars/guest.png"
    },
    {
        "name": "Receptionist",
        "gender": "male",
        "avatarURL": "https://example.com/avatars/receptionist.png"
    }
]'::jsonb)
            RETURNING uuid INTO v_dialogue_id;

            INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
            VALUES (v_dialogue_id, 'es', 'Problemas específicos en la habitación', '');

            INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
            VALUES (v_dialogue_id, 'de', 'Spezifische Probleme im Zimmer', '');


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 0, 'Guest', 'Good morning. I am in room 402. The light in my room does not work.')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "Buenos días. Estoy en la habitación 402. La luz de mi habitación no funciona."}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Guten Morgen. Ich bin in Zimmer 402. Das Licht in meinem Zimmer funktioniert nicht."}]}]'::jsonb
);


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 1, 'Receptionist', 'I am sorry. We will send maintenance right away.')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "Lo siento. Enviaremos mantenimiento enseguida."}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Es tut mir leid. Wir schicken sofort den Hausdienst."}]}]'::jsonb
);


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 2, 'Guest', 'The shower is broken, and there is no towel in the bathroom.')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "La ducha está rota y no hay toalla en el baño."}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Die Dusche ist kaputt, und im Bad gibt es kein Handtuch."}]}]'::jsonb
);


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 3, 'Receptionist', 'Thank you for telling me. I can send towels now.')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "Gracias por decírmelo. Puedo enviar toallas ahora mismo."}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Danke, dass Sie es sagen. Ich kann jetzt Handtücher schicken."}]}]'::jsonb
);


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 4, 'Guest', 'When can someone fix the shower?')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "¿Cuándo puede alguien arreglar la ducha?"}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Wann kann jemand die Dusche reparieren?"}]}]'::jsonb
);


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 5, 'Receptionist', 'A technician can come in about twenty minutes.')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "Un técnico puede venir en unos veinte minutos."}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Ein Techniker kann in etwa zwanzig Minuten kommen."}]}]'::jsonb
);


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 6, 'Guest', 'Do I need a new room?')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "¿Necesito una habitación nueva?"}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Brauche ich ein neues Zimmer?"}]}]'::jsonb
);


INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
VALUES (v_dialogue_id, 7, 'Receptionist', 'Not now. Let us check the room first.')
RETURNING uuid INTO v_line_uuid;

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'es',
    '[{"translations": [{"languageCode": "es", "translation": "Ahora no. Vamos a revisar la habitación primero."}]}]'::jsonb
);

INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
VALUES (
    v_line_uuid,
    'de',
    '[{"translations": [{"languageCode": "de", "translation": "Jetzt noch nicht. Lassen Sie uns zuerst das Zimmer prüfen."}]}]'::jsonb
);


    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
