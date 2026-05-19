    -- ============================================================
    -- Seed: A0 English Path – STEP 9740 – Dialogue – understand jokes, colloquial asides and cultural allusions (Conferencias, Seminarios y Clases)
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
            '{"character": "Speaker A", "text": "Did you get the joke in that British comedy scene?", "es": "¿Entendiste la broma en esa escena de la comedia británica?", "de": "Hast du den Witz in dieser britischen Comedy-Szene verstanden?"}'::jsonb,
        '{"character": "Student", "text": "Yes. It played with the word “right” as “correct” and also as a tag question.", "es": "Sí. Jugaba con la palabra “right” como “correcto” y también como coletilla final.", "de": "Ja. Es spielte mit dem Wort „right“ als „richtig“ und zugleich als Bestätigungsfrage."}'::jsonb,
        '{"character": "Speaker A", "text": "I noticed our friend needed a moment before laughing.", "es": "Noté que nuestra amiga necesitó un momento antes de reírse.", "de": "Ich habe bemerkt, dass unsere Freundin einen Moment brauchte, bevor sie lachte."}'::jsonb,
        '{"character": "Student", "text": "She explained that the same joke would not translate directly into other languages.", "es": "Explicó que la misma broma no se traduciría directamente a otras lenguas.", "de": "Sie erklärte, dass sich derselbe Witz nicht direkt in andere Sprachen übersetzen ließe."}'::jsonb,
        '{"character": "Speaker A", "text": "So catching it felt like real progress in understanding colloquial English.", "es": "Entonces captarlo fue como un verdadero avance en la comprensión del inglés coloquial.", "de": "Es zu verstehen fühlte sich also wie ein echter Fortschritt beim Verstehen von umgangssprachlichem Englisch an."}'::jsonb,
        '{"character": "Student", "text": "Definitely. I wrote the phrase down so I can remember the pattern.", "es": "Desde luego. Apunté la frase para recordar el patrón.", "de": "Auf jeden Fall. Ich habe den Ausdruck notiert, damit ich mir das Muster merke."}'::jsonb,
        '{"character": "Speaker A", "text": "Humour seems to teach nuance very quickly.", "es": "Parece que el humor enseña los matices muy deprisa.", "de": "Humor scheint Nuancen sehr schnell zu vermitteln."}'::jsonb,
        '{"character": "Student", "text": "Yes. Understanding humour in a second language is a sign of true fluency.", "es": "Sí. Entender el humor en una segunda lengua es señal de verdadera fluidez.", "de": "Ja. Humor in einer zweiten Sprache zu verstehen, ist ein Zeichen echter Sprachbeherrschung."}'::jsonb
        ];
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a foreign student catches a dry humour joke in a British TV comedy.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a foreign student catches a dry humour joke in a British TV comedy.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: Student explains that the joke relies on a double meaning of the word ''right'' — correct versus a tag question.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Student explains that the joke relies on a double meaning of the word ''right'' — correct versus a tag question.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that a friend explains that the same joke would not translate directly into other languages.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that a friend explains that the same joke would not translate directly into other languages.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that the student writes down the phrase as an example of British colloquial English.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that the student writes down the phrase as an example of British colloquial English.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a foreign student catches a dry humour joke in a British TV comedy", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Student", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the joke relies on a double meaning of the word ''right'' — correct versus a tag question", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["a friend explains that the same joke would not translate directly into other languages", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the student writes down the phrase as an example of British colloquial English", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9740 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9740 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9740 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9740 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9740 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9740 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9740 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9740 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9740,'en','dialogue','social','[{"name": "Speaker A", "gender": "neutral", "avatarURL": "https://example.com/avatars/speaker-a.png"}, {"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;

        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','understand jokes, colloquial asides and cultural allusions','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','understand jokes, colloquial asides and cultural allusions','Lies den Dialog und beantworte die Fragen.');

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
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END;
    $seed$;
