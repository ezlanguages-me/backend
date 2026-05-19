    -- ============================================================
    -- Seed: A0 English Path – STEP 7300 – Reading – keep up conversations of a casual nature for an extended period of time and discuss abstract and cultural topics (Convivencia)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"es": "La cena del domingo en la casa de la familia anfitriona es larga y relajada.", "de": "Das Sonntagsessen im Haus der Gastfamilie ist lang und entspannt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los abuelos se van antes del postre.", "de": "Die Großeltern gehen vor dem Nachtisch weg.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Lucia dice que en su familia la gente suele hablar al mismo tiempo.", "de": "Lucia sagt, dass in ihrer Familie die Leute oft gleichzeitig sprechen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mateo dice que el silencio siempre significa enfado.", "de": "Mateo sagt, dass Schweigen immer Ärger bedeutet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La familia habla de por qué algunos invitados llevan flores.", "de": "Die Familie spricht darüber, warum manche Gäste Blumen mitbringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después del postre, la conversación termina enseguida.", "de": "Nach dem Nachtisch endet das Gespräch sofort.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Nadie intenta ganar la discusión.", "de": "Niemand versucht, die Diskussion zu gewinnen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Al final de la noche, Lucia se siente más segura.", "de": "Am Ende des Abends fühlt sich Lucia sicherer.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué actividad escolar menciona Mateo?", "de": "Welche Schulaktivität erwähnt Mateo?", "s_es": {"type": "multiple_choice", "options": ["A street art tour", "A football match", "A science fair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Street-Art-Tour", "Ein Fußballspiel", "Eine Wissenschaftsmesse"], "answer": 0}}'::jsonb,
        '{"es": "¿Sobre qué temas hablan más tarde?", "de": "Über welche Themen sprechen sie später?", "s_es": {"type": "multiple_choice", "options": ["Music, humor, and personal space", "Weather, traffic, and homework", "Shopping, rent, and exams"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Musik, Humor und persönlicher Raum", "Wetter, Verkehr und Hausaufgaben", "Einkaufen, Miete und Prüfungen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hacen aquí antes de responder?", "de": "Was machen die Leute hier, bevor sie antworten?", "s_es": {"type": "multiple_choice", "options": ["They wait a little longer", "They change the topic", "They leave the room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie warten etwas länger", "Sie wechseln das Thema", "Sie verlassen den Raum"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué puede significar el silencio?", "de": "Was kann Schweigen bedeuten?", "s_es": {"type": "multiple_choice", "options": ["People are thinking", "The dinner is over", "Nobody understands"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Leute denken nach", "Das Abendessen ist vorbei", "Niemand versteht etwas"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué comentan sobre algunos invitados?", "de": "Was sagen sie über manche Gäste?", "s_es": {"type": "multiple_choice", "options": ["They bring flowers", "They cook dessert", "They arrive with music"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie bringen Blumen mit", "Sie kochen den Nachtisch", "Sie kommen mit Musik"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué contraste hacen sobre la puntualidad?", "de": "Welchen Unterschied machen sie bei der Pünktlichkeit?", "s_es": {"type": "multiple_choice", "options": ["Some arrive exactly on time", "Everyone arrives very early", "Nobody cares about time"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Manche kommen ganz pünktlich", "Alle kommen sehr früh", "Niemand achtet auf die Zeit"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ayuda a mantener viva la conversación?", "de": "Was hilft, das Gespräch am Laufen zu halten?", "s_es": {"type": "multiple_choice", "options": ["Follow-up questions", "Phone alarms", "Formal speeches"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nachfragen", "Handyalarme", "Formelle Reden"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo se siente Lucia al final?", "de": "Wie fühlt sich Lucia am Ende?", "s_es": {"type": "multiple_choice", "options": ["More confident", "More tired", "More confused"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sicherer", "Müder", "Verwirrter"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7300 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 7300 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 7300, 'en', 'reading', 'social', 'Sunday dinner at the host family house is long and relaxed. Lucia asks Mateo about a street art tour at school, and he explains that the murals show the history of the neighborhood. The grandparents join in and compare the tour with festivals from their own town.\n\nLater, the conversation moves to music, humor, and the idea of personal space. Lucia says that in her family people often speak at the same time, but here everyone waits longer before answering. Mateo laughs and says the silence is not cold. It often means people are thinking.\n\nThe family keeps talking after dessert. They discuss why some guests bring flowers, why some people arrive exactly on time, and why others prefer to come a little late. No one tries to win the discussion. They ask follow-up questions and share small stories from daily life.\n\nBy the end of the evening, Lucia feels more confident. She notices that a long casual conversation can include opinions, memories, and cultural habits, as long as everyone listens and stays curious.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una conversación larga y casual sobre convivencia y cultura', 'Lee una cena con familia anfitriona donde se comentan costumbres, festivales y maneras de conversar.'),
            (v_reading_id, 'de', 'Lies ein längeres lockeres Gespräch über Zusammenleben und Kultur', 'Lies eine Szene beim Abendessen in einer Gastfamilie über Gewohnheiten, Feste und Gesprächsstile.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'es', ex->'s_es'),
                (v_ex_id, 'de', ex->>'de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
