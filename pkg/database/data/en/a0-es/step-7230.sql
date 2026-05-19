-- ============================================================
-- Seed: A0 English Path – STEP 7230 – Dialogue – discuss personal correspondence (Comunicación Telefónica y Correspondencia Personal)
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
        '{"character": "Clara", "text": "Did you get your grandmother''s letter today?", "es": "¿Has recibido hoy la carta de tu abuela?", "de": "Hast du heute den Brief deiner Großmutter bekommen?"}'::jsonb,
        '{"character": "Ben", "text": "Yes, it arrived this morning with a small photo inside.", "es": "Sí, llegó esta mañana con una foto pequeña dentro.", "de": "Ja, er kam heute Morgen mit einem kleinen Foto darin an."}'::jsonb,
        '{"character": "Clara", "text": "That is nice. Will you answer by hand or by email?", "es": "Qué bien. ¿Vas a responder a mano o por correo electrónico?", "de": "Das ist schön. Wirst du per Hand oder per E-Mail antworten?"}'::jsonb,
        '{"character": "Ben", "text": "By hand. She likes real letters and keeps them in a box.", "es": "A mano. Le gustan las cartas de verdad y las guarda en una caja.", "de": "Per Hand. Sie mag echte Briefe und bewahrt sie in einer Schachtel auf."}'::jsonb,
        '{"character": "Clara", "text": "What will you tell her in your reply?", "es": "¿Qué le vas a contar en tu respuesta?", "de": "Was wirst du ihr in deiner Antwort erzählen?"}'::jsonb,
        '{"character": "Ben", "text": "I will write about my new flat and my Saturday cooking class.", "es": "Voy a escribir sobre mi piso nuevo y mi clase de cocina del sábado.", "de": "Ich werde über meine neue Wohnung und meinen Kochkurs am Samstag schreiben."}'::jsonb,
        '{"character": "Clara", "text": "You should also ask about her garden.", "es": "También deberías preguntar por su jardín.", "de": "Du solltest auch nach ihrem Garten fragen."}'::jsonb,
        '{"character": "Ben", "text": "Good idea. I want to thank her for the birthday money too.", "es": "Buena idea. También quiero darle las gracias por el dinero del cumpleaños.", "de": "Gute Idee. Ich möchte mich auch für das Geburtstagsgeld bedanken."}'::jsonb,
        '{"character": "Clara", "text": "Then your letter will feel warm and personal.", "es": "Entonces tu carta sonará cercana y personal.", "de": "Dann wird dein Brief warm und persönlich wirken."}'::jsonb,
        '{"character": "Ben", "text": "Yes, I will write it tonight after dinner.", "es": "Sí, la escribiré esta noche después de cenar.", "de": "Ja, ich werde ihn heute Abend nach dem Abendessen schreiben."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Ben recibe hoy una carta de su abuela.", "de": "Ben bekommt heute einen Brief von seiner Großmutter.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Dentro de la carta hay una foto pequeña.", "de": "In dem Brief ist ein kleines Foto.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ben quiere responder por correo electrónico.", "de": "Ben möchte per E-Mail antworten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ben hablará de su piso nuevo y de una clase de cocina.", "de": "Ben wird über seine neue Wohnung und einen Kochkurs schreiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Ben escribirá la carta esta noche.", "de": "Ben wird den Brief heute Abend schreiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cómo va a responder Ben?", "de": "Wie wird Ben antworten?", "s_es": {"type": "multiple_choice", "options": ["By hand", "By email", "By text message"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per Hand", "Per E-Mail", "Per SMS"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hay dentro de la carta?", "de": "Was ist in dem Brief?", "s_es": {"type": "multiple_choice", "options": ["A small photo", "A train ticket", "A key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kleines Foto", "Eine Zugfahrkarte", "Ein Schlüssel"], "answer": 0}}'::jsonb,
        '{"es": "¿Sobre qué debería preguntar Ben?", "de": "Wonach sollte Ben fragen?", "s_es": {"type": "multiple_choice", "options": ["Her garden", "Her car", "Her office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihren Garten", "Ihr Auto", "Ihr Büro"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué más quiere dar las gracias Ben?", "de": "Wofür möchte Ben sich außerdem bedanken?", "s_es": {"type": "multiple_choice", "options": ["For the birthday money", "For a new phone", "For the train pass"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für das Geburtstagsgeld", "Für ein neues Telefon", "Für die Zugkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo escribirá Ben la carta?", "de": "Wann wird Ben den Brief schreiben?", "s_es": {"type": "multiple_choice", "options": ["Tonight after dinner", "Tomorrow morning", "At the weekend"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Heute Abend nach dem Abendessen", "Morgen früh", "Am Wochenende"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7230 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7230 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7230, 'en', 'dialogue', 'communication', '[{"name": "Clara", "gender": "female", "avatarURL": "https://example.com/avatars/clara.png"}, {"name": "Ben", "gender": "male", "avatarURL": "https://example.com/avatars/ben.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre correspondencia personal', 'Lee una conversación sobre cómo responder a una carta personal de la familia.'),
        (v_dialogue_id, 'de', 'Sprich über persönliche Korrespondenz', 'Lies ein Gespräch darüber, wie man auf einen persönlichen Familienbrief antwortet.');

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
