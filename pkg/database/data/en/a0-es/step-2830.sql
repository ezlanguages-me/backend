-- ============================================================
-- Seed: A0 English Path – STEP 2830 – Dialogue – Pregunta por productos sin receta
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
        '{"character": "Customer", "text": "Hello. I need something for sneezing and itchy eyes.", "es": "Hola. Necesito algo para los estornudos y los ojos que pican.", "de": "Hallo. Ich brauche etwas gegen Niesen und juckende Augen."}'::jsonb,
        '{"character": "Pharmacist", "text": "These allergy tablets can help.", "es": "Estas pastillas para la alergia pueden ayudar.", "de": "Diese Allergietabletten können helfen."}'::jsonb,
        '{"character": "Customer", "text": "How many do I take?", "es": "¿Cuántas tomo?", "de": "Wie viele nehme ich?"}'::jsonb,
        '{"character": "Pharmacist", "text": "One tablet a day.", "es": "Una pastilla al día.", "de": "Eine Tablette pro Tag."}'::jsonb,
        '{"character": "Customer", "text": "Can my daughter take them too? She is eleven.", "es": "¿Puede tomarlas también mi hija? Tiene once años.", "de": "Kann meine Tochter sie auch nehmen? Sie ist elf."}'::jsonb,
        '{"character": "Pharmacist", "text": "No, sorry. They are for people over twelve.", "es": "No, lo siento. Son para personas mayores de doce años.", "de": "Nein, sorry. Sie sind für Personen über zwölf Jahre."}'::jsonb,
        '{"character": "Customer", "text": "Do you have eye drops too?", "es": "¿También tiene gotas para los ojos?", "de": "Haben Sie auch Augentropfen?"}'::jsonb,
        '{"character": "Pharmacist", "text": "Yes, these eye drops are good for itchy eyes.", "es": "Sí, estas gotas son buenas para los ojos que pican.", "de": "Ja, diese Tropfen sind gut gegen juckende Augen."}'::jsonb,
        '{"character": "Customer", "text": "Great. I will take both.", "es": "Genial. Me llevo las dos cosas.", "de": "Super. Ich nehme beides."}'::jsonb,
        '{"character": "Pharmacist", "text": "No problem. I will put them here for you.", "es": "No hay problema. Se lo pongo aquí.", "de": "Kein Problem. Ich lege sie hier für Sie hin."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente necesita algo para estornudos y ojos que pican.", "p_de": "Der Kunde braucht etwas gegen Niesen und juckende Augen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La farmacéutica recomienda allergy tablets.", "p_de": "Die Apothekerin empfiehlt allergy tablets.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que tomar una tableta cada hora.", "p_de": "Man soll jede Stunde eine Tablette nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La hija tiene once años y no puede tomar esas tabletas.", "p_de": "Die Tochter ist elf Jahre alt und kann diese Tabletten nicht nehmen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La farmacéutica también ofrece gotas para los ojos.", "p_de": "Die Apothekerin bietet auch Augentropfen an.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuántas tabletas al día se toman?", "p_de": "Wie viele Tabletten pro Tag nimmt man?", "s": {"type": "multiple_choice", "options": ["One tablet a day", "Two every hour", "Three before bed"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["One tablet a day", "Two every hour", "Three before bed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["One tablet a day", "Two every hour", "Three before bed"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué edad tiene la hija?", "p_de": "Wie alt ist die Tochter?", "s": {"type": "multiple_choice", "options": ["Eleven", "Twelve", "Fifteen"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Eleven", "Twelve", "Fifteen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eleven", "Twelve", "Fifteen"], "answer": 0}}'::jsonb,
        '{"p": "¿Para quién son las tabletas?", "p_de": "Für wen sind die Tabletten?", "s": {"type": "multiple_choice", "options": ["For people over twelve", "For babies", "For everyone under ten"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["For people over twelve", "For babies", "For everyone under ten"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["For people over twelve", "For babies", "For everyone under ten"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otro producto ofrece la farmacéutica?", "p_de": "Welches weitere Produkt bietet die Apothekerin an?", "s": {"type": "multiple_choice", "options": ["Eye drops", "Pain gel", "Cough syrup"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Eye drops", "Pain gel", "Cough syrup"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eye drops", "Pain gel", "Cough syrup"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué decide tomar el cliente al final?", "p_de": "Was entscheidet der Kunde am Ende zu nehmen?", "s": {"type": "multiple_choice", "options": ["Both products", "Only the tablets", "Nothing"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Both products", "Only the tablets", "Nothing"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Both products", "Only the tablets", "Nothing"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2830 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2830 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2830, 'en', 'dialogue', 'health', '[{"name": "Customer", "gender": "neutral", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Pharmacist", "gender": "female", "avatarURL": "https://example.com/avatars/pharmacist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pregunta por productos sin receta', 'Lee un diálogo simple en el que un cliente pregunta por productos de farmacia sin receta.'),
        (v_dialogue_id, 'de', 'Frage nach rezeptfreien Produkten', 'Lies einen einfachen Dialog, in dem ein Kunde nach rezeptfreien Apothekenprodukten fragt.');

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
