-- ============================================================
-- Seed: A0 English Path – STEP 7320 – Dialogue – have a long casual conversation about cultural topics
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
        '{"character": "Lucia", "text": "I liked the dinner tonight. Your uncle told great stories about the harvest festival.", "es": "Me gustó la cena de esta noche. Tu tío contó historias estupendas sobre la fiesta de la cosecha.", "de": "Das Abendessen heute hat mir gefallen. Dein Onkel hat tolle Geschichten über das Erntefest erzählt."}'::jsonb,
    '{"character": "Elena", "text": "He can talk for hours. Did the festival sound similar to celebrations in your city?", "es": "Puede hablar durante horas. ¿La fiesta te sonó parecida a las celebraciones de tu ciudad?", "de": "Er kann stundenlang reden. Klang das Fest ähnlich wie Feiern in deiner Stadt?"}'::jsonb,
    '{"character": "Lucia", "text": "A little, but in my city the music is louder and people dance in the street.", "es": "Un poco, pero en mi ciudad la música es más fuerte y la gente baila en la calle.", "de": "Ein wenig, aber in meiner Stadt ist die Musik lauter und die Leute tanzen auf der Straße."}'::jsonb,
    '{"character": "Elena", "text": "Here the evening is calmer, and people stay at the table longer.", "es": "Aquí la velada es más tranquila y la gente se queda más tiempo en la mesa.", "de": "Hier ist der Abend ruhiger, und die Leute bleiben länger am Tisch."}'::jsonb,
    '{"character": "Lucia", "text": "I noticed that. I also like how everyone asks real questions and waits for the answer.", "es": "Me di cuenta. También me gusta cómo todo el mundo hace preguntas de verdad y espera la respuesta.", "de": "Das habe ich bemerkt. Mir gefällt auch, wie alle echte Fragen stellen und auf die Antwort warten."}'::jsonb,
    '{"character": "Elena", "text": "My grandmother says conversation is part of hospitality.", "es": "Mi abuela dice que la conversación forma parte de la hospitalidad.", "de": "Meine Großmutter sagt, dass Gespräch ein Teil der Gastfreundschaft ist."}'::jsonb,
    '{"character": "Lucia", "text": "That explains a lot. At first I thought the silence between turns meant I said something wrong.", "es": "Eso explica muchas cosas. Al principio pensé que el silencio entre turnos significaba que yo había dicho algo mal.", "de": "Das erklärt vieles. Am Anfang dachte ich, das Schweigen zwischen den Redezügen bedeute, dass ich etwas Falsches gesagt habe."}'::jsonb,
    '{"character": "Elena", "text": "Not at all. It usually means people are thinking or choosing careful words.", "es": "En absoluto. Normalmente significa que la gente está pensando o eligiendo palabras con cuidado.", "de": "Überhaupt nicht. Meist bedeutet es, dass die Leute nachdenken oder vorsichtige Worte wählen."}'::jsonb,
    '{"character": "Lucia", "text": "I feel more comfortable now. Next time I want to ask your uncle about local poetry.", "es": "Ahora me siento más cómoda. La próxima vez quiero preguntarle a tu tío sobre la poesía local.", "de": "Jetzt fühle ich mich wohler. Nächstes Mal möchte ich deinen Onkel nach lokaler Poesie fragen."}'::jsonb,
    '{"character": "Elena", "text": "He will love that. Bring one poem from your country and we can compare them.", "es": "Le encantará. Trae un poema de tu país y podremos compararlos.", "de": "Das wird ihm gefallen. Bring ein Gedicht aus deinem Land mit, dann können wir sie vergleichen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El tío de Elena contó historias sobre la fiesta de la cosecha.", "de": "Elenas Onkel erzählte Geschichten über das Erntefest.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Lucia dice que en su ciudad la música es más silenciosa.", "de": "Lucia sagt, dass die Musik in ihrer Stadt leiser ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "Elena dice que la conversación forma parte de la hospitalidad.", "de": "Elena sagt, dass Gespräch ein Teil der Gastfreundschaft ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Al principio, Lucia pensó que el silencio significaba que había dicho algo mal.", "de": "Am Anfang dachte Lucia, das Schweigen bedeute, dass sie etwas Falsches gesagt hatte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Elena le propone a Lucia llevar un poema de su país.", "de": "Elena schlägt Lucia vor, ein Gedicht aus ihrem Land mitzubringen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Sobre qué habló el tío durante la cena?", "de": "Worüber sprach der Onkel beim Abendessen?", "s_es": {"type": "multiple_choice", "options": ["The harvest festival", "A football injury", "A hotel booking"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Erntefest", "Eine Fußballverletzung", "Eine Hotelbuchung"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo describe Lucia las fiestas de su ciudad?", "de": "Wie beschreibt Lucia die Feste in ihrer Stadt?", "s_es": {"type": "multiple_choice", "options": ["The music is louder and people dance in the street", "They are shorter and silent", "They happen only in winter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Musik ist lauter und die Leute tanzen auf der Straße", "Sie sind kürzer und still", "Sie finden nur im Winter statt"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué hacen aquí durante más tiempo?", "de": "Was machen die Leute hier länger?", "s_es": {"type": "multiple_choice", "options": ["They stay at the table", "They wash the dishes", "They sing outside"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie bleiben am Tisch", "Sie spülen das Geschirr", "Sie singen draußen"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué malinterpretó Lucia al principio?", "de": "Was hat Lucia am Anfang missverstanden?", "s_es": {"type": "multiple_choice", "options": ["The silence between turns", "The dessert recipe", "The weather forecast"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Schweigen zwischen den Redezügen", "Das Nachtischrezept", "Die Wettervorhersage"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué quiere hacer Lucia la próxima vez?", "de": "Was möchte Lucia beim nächsten Mal tun?", "s_es": {"type": "multiple_choice", "options": ["Ask about local poetry", "Leave early", "Cook the dinner"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach lokaler Poesie fragen", "Früh gehen", "Das Abendessen kochen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7320 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7320 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7320, 'en', 'dialogue', 'social', '[{"name": "Lucia", "gender": "female", "avatarURL": "https://example.com/avatars/lucia.png"}, {"name": "Elena", "gender": "female", "avatarURL": "https://example.com/avatars/elena.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Mantén una conversación larga y casual sobre temas culturales', 'Lee un diálogo entre una invitada y una hermana anfitriona sobre festivales, silencio y hospitalidad.'),
        (v_dialogue_id, 'de', 'Führe ein längeres lockeres Gespräch über kulturelle Themen', 'Lies einen Dialog zwischen einem Gast und einer Gastschwester über Feste, Schweigen und Gastfreundschaft.');

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
