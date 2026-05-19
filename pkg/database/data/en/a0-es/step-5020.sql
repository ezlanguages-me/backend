-- ============================================================
-- Seed: A0 English Path – STEP 5020 – Dialogue – discuss lecture content (Conferencias, Seminarios y Clases)
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
        '{"character": "Sara", "text": "Did you understand the point about short review sessions?", "es": "¿Entendiste la idea sobre las sesiones cortas de repaso?", "de": "Hast du den Punkt über kurze Wiederholungseinheiten verstanden?"}'::jsonb,
        '{"character": "Leo", "text": "Yes. The lecturer said ten to fifteen minutes is enough for one round.", "es": "Sí. El profesor dijo que diez o quince minutos bastan para una ronda.", "de": "Ja. Der Dozent sagte, dass zehn bis fünfzehn Minuten für eine Runde reichen."}'::jsonb,
        '{"character": "Sara", "text": "I wrote that reviewing on the same day is very important.", "es": "Yo apunté que repasar el mismo día es muy importante.", "de": "Ich habe notiert, dass die Wiederholung am selben Tag sehr wichtig ist."}'::jsonb,
        '{"character": "Leo", "text": "Me too. I also noted that simple self-test questions are better than only reading again.", "es": "Yo también. También apunté que hacerse preguntas simples es mejor que solo volver a leer.", "de": "Ich auch. Ich habe auch notiert, dass einfache Selbsttests besser sind als nur noch einmal zu lesen."}'::jsonb,
        '{"character": "Sara", "text": "Did you hear the example about the class study after one week?", "es": "¿Oíste el ejemplo del estudio de clase después de una semana?", "de": "Hast du das Beispiel über die Klassenstudie nach einer Woche gehört?"}'::jsonb,
        '{"character": "Leo", "text": "Yes. Students with short review sessions remembered more.", "es": "Sí. Los estudiantes con sesiones cortas recordaron más.", "de": "Ja. Studierende mit kurzen Wiederholungseinheiten erinnerten mehr."}'::jsonb,
        '{"character": "Sara", "text": "I missed the part about the margin notes.", "es": "Me perdí la parte sobre las notas en el margen.", "de": "Ich habe den Teil über Randnotizen verpasst."}'::jsonb,
        '{"character": "Leo", "text": "The lecturer said two or three key words can help you find ideas quickly.", "es": "El profesor dijo que dos o tres palabras clave ayudan a encontrar ideas rápido.", "de": "Der Dozent sagte, dass zwei oder drei Schlüsselwörter helfen, Ideen schnell zu finden."}'::jsonb,
        '{"character": "Sara", "text": "Great, thanks. Now my notes make more sense.", "es": "Genial, gracias. Ahora mis apuntes tienen más sentido.", "de": "Super, danke. Jetzt machen meine Notizen mehr Sinn."}'::jsonb,
        '{"character": "Leo", "text": "No problem. We can compare them again before the quiz.", "es": "No hay problema. Podemos volver a compararlos antes del test.", "de": "Kein Problem. Wir können sie vor dem Quiz noch einmal vergleichen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Sara y Leo hablan de las ideas principales de la clase.", "p_de": "Sara und Leo sprechen über die Hauptideen der Vorlesung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Leo dice que una ronda de repaso dura diez o quince horas.", "p_de": "Leo sagt, dass eine Wiederholungsrunde zehn oder fünfzehn Stunden dauert.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Sara anotó que repasar el mismo día es importante.", "p_de": "Sara hat notiert, dass die Wiederholung am selben Tag wichtig ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Leo cree que solo releer es mejor que hacerse preguntas.", "p_de": "Leo glaubt, dass nur Lesen besser ist als Fragen an sich selbst.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Al final quieren comparar otra vez los apuntes antes del test.", "p_de": "Am Ende wollen sie die Notizen vor dem Test noch einmal vergleichen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto tiempo dijo el profesor para una ronda de repaso?", "p_de": "Wie lange sagte der Dozent für eine Wiederholungsrunde?", "s": {"type": "multiple_choice", "options": ["Ten to fifteen minutes", "One full hour", "Five seconds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué escribió Sara?", "p_de": "Was schrieb Sara auf?", "s": {"type": "multiple_choice", "options": ["Reviewing on the same day is important", "Coffee is free in the library", "The exam is tomorrow"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué es mejor que solo volver a leer?", "p_de": "Was ist besser als nur noch einmal zu lesen?", "s": {"type": "multiple_choice", "options": ["Simple self-test questions", "Long phone calls", "Watching videos all night"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué parte se perdió Sara?", "p_de": "Welchen Teil hat Sara verpasst?", "s": {"type": "multiple_choice", "options": ["The margin notes part", "The lunch menu", "The room number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué harán antes del quiz?", "p_de": "Was machen sie vor dem Quiz?", "s": {"type": "multiple_choice", "options": ["Compare their notes again", "Call the conference desk", "Print visitor badges"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5020 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5020 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5020, 'en', 'dialogue', 'academic', '[{"name": "Sara", "gender": "female", "avatarURL": "https://example.com/avatars/sara.png"}, {"name": "Leo", "gender": "male", "avatarURL": "https://example.com/avatars/leo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Hablar sobre el contenido de una clase', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Über den Inhalt einer Vorlesung sprechen', '');

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
