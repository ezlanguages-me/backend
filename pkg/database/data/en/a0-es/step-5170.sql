-- ============================================================
-- Seed: A0 English Path – STEP 5170 – Dialogue – engage in academic discussion (Conferencias, Seminarios y Clases)
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
        '{"character": "Marta", "text": "The report on water use and the lecture on energy connect well together.", "es": "El informe sobre el agua y la clase sobre la energía conectan bien.", "de": "Der Bericht über Wasser und die Vorlesung über Energie passen gut zusammen."}'::jsonb,
        '{"character": "Omar", "text": "Yes, both show that old buildings create hidden waste.", "es": "Sí, ambos muestran que los edificios antiguos crean desperdicio oculto.", "de": "Ja, beide zeigen, dass alte Gebäude versteckte Verschwendung erzeugen."}'::jsonb,
        '{"character": "Marta", "text": "I was surprised by the twelve percent drop after the new sensors.", "es": "Me sorprendió la bajada del doce por ciento tras los sensores nuevos.", "de": "Ich war über den Rückgang von zwölf Prozent nach den neuen Sensoren überrascht."}'::jsonb,
        '{"character": "Omar", "text": "Me too, and the eighteen percent drop in the library was also strong.", "es": "A mí también, y la bajada del dieciocho por ciento en la biblioteca también fue fuerte.", "de": "Mich auch, und der Rückgang von achtzehn Prozent in der Bibliothek war ebenfalls stark."}'::jsonb,
        '{"character": "Marta", "text": "So do you think building repair is more important than student behavior?", "es": "Entonces, ¿crees que la reparación del edificio es más importante que el comportamiento de los estudiantes?", "de": "Denkst du also, dass Gebäudereparaturen wichtiger sind als das Verhalten der Studierenden?"}'::jsonb,
        '{"character": "Omar", "text": "I think both matter, but repairs make the biggest long-term change.", "es": "Creo que ambas cosas importan, pero las reparaciones producen el mayor cambio a largo plazo.", "de": "Ich denke, beides ist wichtig, aber Reparaturen bringen die größte langfristige Veränderung."}'::jsonb,
        '{"character": "Marta", "text": "I agree, although daily actions are faster to start.", "es": "Estoy de acuerdo, aunque las acciones diarias son más rápidas de empezar.", "de": "Ich stimme zu, obwohl tägliche Maßnahmen schneller anfangen können."}'::jsonb,
        '{"character": "Omar", "text": "Maybe our presentation should compare short-term and long-term solutions.", "es": "Quizá nuestra presentación debería comparar soluciones a corto y largo plazo.", "de": "Vielleicht sollte unser Vortrag kurzfristige und langfristige Lösungen vergleichen."}'::jsonb,
        '{"character": "Marta", "text": "Good idea. I can explain the water examples if you explain the energy data.", "es": "Buena idea. Yo puedo explicar los ejemplos del agua si tú explicas los datos de energía.", "de": "Gute Idee. Ich kann die Wasserbeispiele erklären, wenn du die Energiedaten erklärst."}'::jsonb,
        '{"character": "Omar", "text": "Perfect. That will make our discussion balanced.", "es": "Perfecto. Eso hará que nuestra discusión esté equilibrada.", "de": "Perfekt. Das macht unsere Diskussion ausgewogen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Marta dice que el informe y la clase se relacionan bien.", "p_de": "Marta sagt, dass Bericht und Vorlesung gut zusammenhängen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Omar cree que los edificios antiguos no causan ningún desperdicio.", "p_de": "Omar glaubt, dass alte Gebäude keine Verschwendung verursachen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los dos comentan una reducción del doce por ciento y otra del dieciocho por ciento.", "p_de": "Beide erwähnen einen Rückgang von zwölf und von achtzehn Prozent.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Marta piensa que las acciones diarias tardan mucho en empezar.", "p_de": "Marta denkt, dass tägliche Maßnahmen lange brauchen, um zu beginnen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Al final quieren repartir el tema entre agua y energía.", "p_de": "Am Ende wollen sie das Thema in Wasser und Energie aufteilen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué dos textos comparan?", "p_de": "Welche zwei Texte vergleichen sie?", "s": {"type": "multiple_choice", "options": ["A water report and an energy lecture", "A phone script and a hotel bill", "A bus schedule and a menu"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cambio sorprendió a Marta?", "p_de": "Welche Veränderung überraschte Marta?", "s": {"type": "multiple_choice", "options": ["The twelve percent drop after new sensors", "The new conference badge", "The lunch time change"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cree Omar sobre las reparaciones?", "p_de": "Was denkt Omar über Reparaturen?", "s": {"type": "multiple_choice", "options": ["They make the biggest long-term change", "They are never useful", "They are only for gardens"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice Marta sobre las acciones diarias?", "p_de": "Was sagt Marta über tägliche Maßnahmen?", "s": {"type": "multiple_choice", "options": ["They are faster to start", "They are impossible on campus", "They cost more than repairs"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo repartirán la presentación?", "p_de": "Wie teilen sie den Vortrag auf?", "s": {"type": "multiple_choice", "options": ["Marta takes water and Omar takes energy", "Both only discuss parking", "They cancel the presentation"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5170 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5170 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5170, 'en', 'dialogue', 'academic', '[{"name": "Marta", "gender": "female", "avatarURL": "https://example.com/avatars/marta.png"}, {"name": "Omar", "gender": "male", "avatarURL": "https://example.com/avatars/omar.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Discusión académica sobre ahorro de agua y energía', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Akademische Diskussion über Wasser- und Energiesparen', '');

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
