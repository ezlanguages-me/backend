-- ============================================================
-- Seed: A0 English Path - STEP 7770 - Dialogue - give feedback on a presentation (Meetings)
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
        '{"character": "Maya", "text": "Your talk about the cup return points was very clear.", "es": "Tu charla sobre los puntos de devolución de vasos fue muy clara.", "de": "Dein Vortrag über die Becherrückgabestellen war sehr klar."}'::jsonb,
        '{"character": "Leo", "text": "Thanks. I used short notes.", "es": "Gracias. Usé notas cortas.", "de": "Danke. Ich habe kurze Notizen benutzt."}'::jsonb,
        '{"character": "Maya", "text": "The map with the four blue dots helped me.", "es": "El mapa con los cuatro puntos azules me ayudó.", "de": "Die Karte mit den vier blauen Punkten hat mir geholfen."}'::jsonb,
        '{"character": "Leo", "text": "Good. I wanted the audience to find the return points fast.", "es": "Bien. Quería que el público encontrara rápido los puntos de devolución.", "de": "Gut. Ich wollte, dass das Publikum die Rückgabestellen schnell findet."}'::jsonb,
        '{"character": "Maya", "text": "The part about one euro was easy to understand.", "es": "La parte sobre un euro fue fácil de entender.", "de": "Der Teil über einen Euro war leicht zu verstehen."}'::jsonb,
        '{"character": "Leo", "text": "I am glad. I repeated that fact two times.", "es": "Me alegro. Repetí ese dato dos veces.", "de": "Das freut mich. Ich habe diese Information zwei Mal wiederholt."}'::jsonb,
        '{"character": "Maya", "text": "Maybe speak a little slower on the number 300.", "es": "Quizá habla un poco más despacio con el número 300.", "de": "Vielleicht sprich beim Wert 300 etwas langsamer."}'::jsonb,
        '{"character": "Leo", "text": "Yes, that number was important.", "es": "Sí, ese número era importante.", "de": "Ja, diese Zahl war wichtig."}'::jsonb,
        '{"character": "Maya", "text": "Overall, the ending about less trash was strong.", "es": "En general, el final sobre menos basura fue fuerte.", "de": "Insgesamt war der Schluss über weniger Müll stark."}'::jsonb,
        '{"character": "Leo", "text": "Thanks, that feedback helps me.", "es": "Gracias, esa retroalimentación me ayuda.", "de": "Danke, dieses Feedback hilft mir."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Maya dice que la presentación fue muy clara.", "de": "Maya sagt, dass die Präsentation sehr klar war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leo usó notas largas.", "de": "Leo benutzte lange Notizen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El mapa tenía cuatro puntos azules.", "de": "Die Karte hatte vier blaue Punkte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Leo repitió el dato de un euro dos veces.", "de": "Leo wiederholte die Information über einen Euro zwei Mal.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Maya piensa que el final sobre menos basura fue fuerte.", "de": "Maya findet den Schluss über weniger Müll stark.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué ayudó a Maya?", "de": "Was half Maya?", "s_es": {"type": "multiple_choice", "options": ["El mapa con los cuatro puntos azules", "Un poema largo", "Un billete rojo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Karte mit den vier blauen Punkten", "Ein langes Gedicht", "Eine rote Fahrkarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué quería Leo que encontrara el público?", "de": "Was wollte Leo, dass das Publikum findet?", "s_es": {"type": "multiple_choice", "options": ["Los puntos de devolución", "El aparcamiento", "La recepción del hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Rückgabestellen", "Den Parkplatz", "Die Hotelrezeption"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dato era fácil de entender?", "de": "Welche Information war leicht zu verstehen?", "s_es": {"type": "multiple_choice", "options": ["Un euro", "Diez autobuses", "Una hora de tren"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Euro", "Zehn Busse", "Eine Zugzeit"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué número debería decir Leo más despacio?", "de": "Welche Zahl sollte Leo langsamer sagen?", "s_es": {"type": "multiple_choice", "options": ["300", "4", "1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["300", "4", "1"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo fue el final según Maya?", "de": "Wie war der Schluss laut Maya?", "s_es": {"type": "multiple_choice", "options": ["Fuerte", "Aburrido", "Confuso"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Stark", "Langweilig", "Verwirrend"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7770 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7770 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7770, 'en', 'dialogue', 'meetings', '[{"name": "Maya", "gender": "female", "avatarURL": "https://example.com/avatars/maya.png"}, {"name": "Leo", "gender": "male", "avatarURL": "https://example.com/avatars/leo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Dar retroalimentación sobre una presentación', 'Lee una conversación breve con comentarios sobre una presentación de conferencia.'),
        (v_dialogue_id, 'de', 'Feedback zu einer Präsentation geben', 'Lies ein kurzes Gespräch mit Rückmeldungen zu einer Konferenzpräsentation.');

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
