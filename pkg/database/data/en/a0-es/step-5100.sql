-- ============================================================
-- Seed: A0 English Path – STEP 5100 – Dialogue – ask questions, for example for reasons, clarification etc (Conferencias, Seminarios y Clases)
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
        '{"character": "Student", "text": "Thank you for the talk. Why did you choose only twenty-five families?", "es": "Gracias por la charla. ¿Por qué eligió solo a veinticinco familias?", "de": "Danke für den Vortrag. Warum haben Sie nur fünfundzwanzig Familien gewählt?"}'::jsonb,
        '{"character": "Presenter", "text": "Because those families used the garden every week, so they gave regular information.", "es": "Porque esas familias usaban el huerto cada semana y daban información regular.", "de": "Weil diese Familien den Garten jede Woche nutzten und deshalb regelmäßig Informationen gaben."}'::jsonb,
        '{"character": "Student", "text": "I see. What do you mean by social ties in your slides?", "es": "Ya veo. ¿Qué quiere decir con social ties en sus diapositivas?", "de": "Verstehe. Was meinen Sie mit social ties auf Ihren Folien?"}'::jsonb,
        '{"character": "Presenter", "text": "I mean friendly contact and shared activities between neighbors.", "es": "Quiero decir contacto amistoso y actividades compartidas entre vecinos.", "de": "Ich meine freundlichen Kontakt und gemeinsame Aktivitäten zwischen Nachbarn."}'::jsonb,
        '{"character": "Student", "text": "Did you compare the project with a garden in another area?", "es": "¿Comparó el proyecto con un huerto de otra zona?", "de": "Haben Sie das Projekt mit einem Garten in einem anderen Gebiet verglichen?"}'::jsonb,
        '{"character": "Presenter", "text": "Not yet. That is the next step of the research.", "es": "Todavía no. Ese es el siguiente paso de la investigación.", "de": "Noch nicht. Das ist der nächste Schritt der Forschung."}'::jsonb,
        '{"character": "Student", "text": "And why did you use rain barrels instead of city water?", "es": "¿Y por qué usaron barriles de lluvia en lugar de agua de la red?", "de": "Und warum haben Sie Regentonnen statt Stadtwasser benutzt?"}'::jsonb,
        '{"character": "Presenter", "text": "Because they reduce cost and fit the environmental goal of the project.", "es": "Porque reducen el coste y encajan con el objetivo ambiental del proyecto.", "de": "Weil sie die Kosten senken und zum Umweltziel des Projekts passen."}'::jsonb,
        '{"character": "Student", "text": "That makes sense. Thank you for clarifying.", "es": "Eso tiene sentido. Gracias por aclararlo.", "de": "Das ergibt Sinn. Danke für die Erklärung."}'::jsonb,
        '{"character": "Presenter", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La estudiante pregunta por qué el estudio usa solo veinticinco familias.", "p_de": "Die Studentin fragt, warum die Studie nur fünfundzwanzig Familien nutzt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El ponente dice que esas familias usaban el huerto cada semana.", "p_de": "Der Referent sagt, dass diese Familien den Garten jede Woche nutzten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Social ties significa precios del alquiler.", "p_de": "Social ties bedeutet Mietpreise.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Comparar con otro huerto será el siguiente paso.", "p_de": "Der Vergleich mit einem anderen Garten ist der nächste Schritt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los barriles de lluvia ayudan a reducir el coste.", "p_de": "Regentonnen helfen, die Kosten zu senken.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué eligieron a esas veinticinco familias?", "p_de": "Warum wählten sie diese fünfundzwanzig Familien?", "s": {"type": "multiple_choice", "options": ["Because they used the garden every week", "Because they worked at the library", "Because they owned the parking area"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa social ties?", "p_de": "Was bedeutet social ties?", "s": {"type": "multiple_choice", "options": ["Friendly contact and shared activities", "Phone numbers and addresses", "Ticket prices and dates"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué será el siguiente paso?", "p_de": "Was wird der nächste Schritt sein?", "s": {"type": "multiple_choice", "options": ["Comparing with another garden", "Closing the project", "Removing all plants"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué usaron barriles de lluvia?", "p_de": "Warum benutzten sie Regentonnen?", "s": {"type": "multiple_choice", "options": ["To reduce cost and support the environmental goal", "To make the project more expensive", "To transport vegetables faster"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo termina la conversación?", "p_de": "Wie endet das Gespräch?", "s": {"type": "multiple_choice", "options": ["With thanks for the clarification", "With a complaint to the office", "With a new phone number"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5100 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5100 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5100, 'en', 'dialogue', 'academic', '[{"name": "Student", "gender": "female", "avatarURL": "https://example.com/avatars/student.png"}, {"name": "Presenter", "gender": "male", "avatarURL": "https://example.com/avatars/presenter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Preguntar por razones y detalles tras una charla', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Nach Gründen und Details nach einem Vortrag fragen', '');

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
