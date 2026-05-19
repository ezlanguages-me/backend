-- ============================================================
-- Seed: A0 English Path – STEP 2880 – Dialogue – Habla con el médico sobre opciones de tratamiento
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
        '{"character": "Doctor", "text": "The rash is still mild, so cream is the first option.", "es": "La erupción sigue siendo leve, así que la crema es la primera opción.", "de": "Der Ausschlag ist noch leicht, deshalb ist die Creme die erste Option."}'::jsonb,
        '{"character": "Patient", "text": "How often do I use the cream?", "es": "¿Con qué frecuencia uso la crema?", "de": "Wie oft benutze ich die Creme?"}'::jsonb,
        '{"character": "Doctor", "text": "Twice a day for one week.", "es": "Dos veces al día durante una semana.", "de": "Zweimal am Tag eine Woche lang."}'::jsonb,
        '{"character": "Patient", "text": "And if the itching gets worse?", "es": "¿Y si el picor empeora?", "de": "Und wenn der Juckreiz schlimmer wird?"}'::jsonb,
        '{"character": "Doctor", "text": "Then you can add one allergy tablet a day.", "es": "Entonces puede añadir una pastilla para la alergia al día.", "de": "Dann können Sie eine Allergietablette pro Tag hinzufügen."}'::jsonb,
        '{"character": "Patient", "text": "Do I need a specialist now?", "es": "¿Necesito un especialista ahora?", "de": "Brauche ich jetzt einen Spezialisten?"}'::jsonb,
        '{"character": "Doctor", "text": "Not now. Only if the rash spreads or there is no change after a week.", "es": "Ahora no. Solo si la erupción se extiende o no cambia después de una semana.", "de": "Jetzt nicht. Nur wenn sich der Ausschlag ausbreitet oder sich nach einer Woche nichts ändert."}'::jsonb,
        '{"character": "Patient", "text": "What should I avoid?", "es": "¿Qué debo evitar?", "de": "Was soll ich vermeiden?"}'::jsonb,
        '{"character": "Doctor", "text": "Avoid hot showers and perfumed soap.", "es": "Evite las duchas calientes y el jabón perfumado.", "de": "Vermeiden Sie heiße Duschen und parfümierte Seife."}'::jsonb,
        '{"character": "Patient", "text": "Okay. Cream first, tablet if it gets worse.", "es": "De acuerdo. Primero crema, pastilla si empeora.", "de": "Okay. Zuerst Creme, Tablette wenn es schlimmer wird."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La crema es la primera opción porque la erupción es leve.", "p_de": "Die Creme ist die erste Option, weil der Ausschlag leicht ist.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La crema se usa dos veces al día durante una semana.", "p_de": "Die Creme wird zweimal täglich eine Woche lang benutzt.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El médico dice que hace falta un especialista ahora mismo.", "p_de": "Der Arzt sagt, dass man sofort einen Spezialisten braucht.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que evitar duchas calientes y jabón perfumado.", "p_de": "Man soll heiße Duschen und parfümierte Seife vermeiden.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente resume cream first, tablet if it gets worse.", "p_de": "Der Patient fasst zusammen: erst Creme, dann Tablette, wenn es schlimmer wird.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pregunta hace el paciente sobre la crema?", "p_de": "Welche Frage stellt der Patient über die Creme?", "s": {"type": "multiple_choice", "options": ["How often do I use the cream?", "Where do I buy the cream?", "Why is the cream blue?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["How often do I use the cream?", "Where do I buy the cream?", "Why is the cream blue?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["How often do I use the cream?", "Where do I buy the cream?", "Why is the cream blue?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede añadir si el picor empeora?", "p_de": "Was kann er hinzufügen, wenn der Juckreiz schlimmer wird?", "s": {"type": "multiple_choice", "options": ["One allergy tablet a day", "A second shower", "A bus trip"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["One allergy tablet a day", "A second shower", "A bus trip"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["One allergy tablet a day", "A second shower", "A bus trip"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo hace falta especialista?", "p_de": "Wann braucht man einen Spezialisten?", "s": {"type": "multiple_choice", "options": ["If the rash spreads or there is no change after a week", "Tonight after dinner", "Only in winter"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["If the rash spreads or there is no change after a week", "Tonight after dinner", "Only in winter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["If the rash spreads or there is no change after a week", "Tonight after dinner", "Only in winter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe evitar el paciente?", "p_de": "Was soll der Patient vermeiden?", "s": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Cream and water", "Rest and sleep"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Cream and water", "Rest and sleep"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Cream and water", "Rest and sleep"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué resume el paciente al final?", "p_de": "Was fasst der Patient am Ende zusammen?", "s": {"type": "multiple_choice", "options": ["Cream first, tablet if it gets worse", "Tablets only", "No treatment"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Cream first, tablet if it gets worse", "Tablets only", "No treatment"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Cream first, tablet if it gets worse", "Tablets only", "No treatment"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2880 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2880 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2880, 'en', 'dialogue', 'health', '[{"name": "Doctor", "gender": "female", "avatarURL": "https://example.com/avatars/doctor.png"}, {"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla con el médico sobre opciones de tratamiento', 'Lee un diálogo simple sobre dos alternativas de tratamiento para una erupción leve.'),
        (v_dialogue_id, 'de', 'Sprich mit dem Arzt über Behandlungsoptionen', 'Lies einen einfachen Dialog über zwei Behandlungsalternativen für einen leichten Ausschlag.');

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
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
