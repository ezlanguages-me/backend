-- ============================================================
-- Seed: A0 English Path – STEP 7270 – Dialogue – exchange personal emails and discuss content (Comunicación Telefónica y Correspondencia Personal)
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
        '{"character": "Nina", "text": "I read Paula''s email this morning.", "es": "He leído esta mañana el correo de Paula.", "de": "Ich habe heute Morgen Paulas E-Mail gelesen."}'::jsonb,
        '{"character": "Omar", "text": "What did she say?", "es": "¿Qué decía?", "de": "Was hat sie geschrieben?"}'::jsonb,
        '{"character": "Nina", "text": "She starts her new job on Monday and feels a little nervous.", "es": "Empieza su nuevo trabajo el lunes y está un poco nerviosa.", "de": "Sie beginnt am Montag ihren neuen Job und ist etwas nervös."}'::jsonb,
        '{"character": "Omar", "text": "Did she ask anything from you?", "es": "¿Te pidió algo?", "de": "Hat sie dich um etwas gebeten?"}'::jsonb,
        '{"character": "Nina", "text": "Yes, she wants tips about the bus to the city centre.", "es": "Sí, quiere consejos sobre el autobús al centro.", "de": "Ja, sie möchte Tipps für den Bus ins Stadtzentrum."}'::jsonb,
        '{"character": "Omar", "text": "You can tell her to take the number 14 from the station.", "es": "Puedes decirle que coja el número 14 desde la estación.", "de": "Du kannst ihr sagen, dass sie die Nummer 14 vom Bahnhof nehmen soll."}'::jsonb,
        '{"character": "Nina", "text": "Good. She also invited us to coffee next week.", "es": "Bien. También nos invitó a tomar café la semana que viene.", "de": "Gut. Sie hat uns auch nächste Woche auf einen Kaffee eingeladen."}'::jsonb,
        '{"character": "Omar", "text": "Nice. We should answer tonight so she does not wait.", "es": "Qué bien. Deberíamos responder esta noche para que no espere.", "de": "Schön. Wir sollten heute Abend antworten, damit sie nicht warten muss."}'::jsonb,
        '{"character": "Nina", "text": "I will write the main message, and you can add a short note.", "es": "Yo escribiré el mensaje principal y tú puedes añadir una nota corta.", "de": "Ich schreibe die Hauptnachricht, und du kannst eine kurze Notiz hinzufügen."}'::jsonb,
        '{"character": "Omar", "text": "Perfect. Let us keep the email friendly and simple.", "es": "Perfecto. Mantengamos el correo amistoso y sencillo.", "de": "Perfekt. Lassen wir die E-Mail freundlich und einfach bleiben."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Nina lee el correo de Paula por la mañana.", "de": "Nina liest Paulas E-Mail am Morgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Paula empieza su nuevo trabajo el lunes.", "de": "Paula beginnt ihren neuen Job am Montag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Paula se siente totalmente relajada por el trabajo nuevo.", "de": "Paula fühlt sich wegen des neuen Jobs völlig entspannt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Paula pide ayuda con un autobús al centro.", "de": "Paula bittet um Hilfe bei einem Bus ins Stadtzentrum.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Nina y Omar quieren responder esta noche.", "de": "Nina und Omar möchten heute Abend antworten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuándo empieza Paula su trabajo nuevo?", "de": "Wann beginnt Paula ihren neuen Job?", "s_es": {"type": "multiple_choice", "options": ["On Monday", "On Friday", "Next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Montag", "Am Freitag", "Nächsten Monat"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo se siente Paula?", "de": "Wie fühlt sich Paula?", "s_es": {"type": "multiple_choice", "options": ["A little nervous", "Very angry", "Completely bored"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein bisschen nervös", "Sehr wütend", "Völlig gelangweilt"], "answer": 0}}'::jsonb,
        '{"es": "¿Sobre qué quiere consejos Paula?", "de": "Worüber möchte Paula Tipps?", "s_es": {"type": "multiple_choice", "options": ["The bus to the city centre", "A new computer", "A music class"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Bus ins Stadtzentrum", "Einen neuen Computer", "Einen Musikkurs"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué número de autobús propone Omar?", "de": "Welche Busnummer schlägt Omar vor?", "s_es": {"type": "multiple_choice", "options": ["Number 14", "Number 8", "Number 40"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nummer 14", "Nummer 8", "Nummer 40"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tono quieren para el correo de respuesta?", "de": "Welchen Ton möchten sie für die Antwort-E-Mail?", "s_es": {"type": "multiple_choice", "options": ["Friendly and simple", "Formal and cold", "Long and technical"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Freundlich und einfach", "Formell und kühl", "Lang und technisch"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7270 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7270 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7270, 'en', 'dialogue', 'communication', '[{"name": "Nina", "gender": "female", "avatarURL": "https://example.com/avatars/nina.png"}, {"name": "Omar", "gender": "male", "avatarURL": "https://example.com/avatars/omar.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Comenta el contenido de correos personales', 'Lee una conversación entre dos personas que preparan la respuesta a un correo personal.'),
        (v_dialogue_id, 'de', 'Besprich den Inhalt persönlicher E-Mails', 'Lies ein Gespräch zwischen zwei Personen, die eine Antwort auf eine persönliche E-Mail vorbereiten.');

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
