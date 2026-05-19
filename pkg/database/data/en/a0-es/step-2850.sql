-- ============================================================
-- Seed: A0 English Path – STEP 2850 – Reading – Lee opciones de tratamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La opción A es una crema contra el picor dos veces al día durante siete días.", "p_de": "Option A ist eine Creme gegen Juckreiz zweimal täglich für sieben Tage.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La opción A es buena si la erupción es pequeña y el picor es leve.", "p_de": "Option A ist gut, wenn der Ausschlag klein ist und der Juckreiz leicht ist.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La opción B es una inyección cada hora.", "p_de": "Option B ist eine Spritze jede Stunde.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La opción B es una pastilla para la alergia una vez al día.", "p_de": "Option B ist eine Allergietablette einmal am Tag.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si la erupción se extiende, hay que volver.", "p_de": "Wenn sich der Ausschlag ausbreitet, soll man zurückkommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si no cambia después de una semana, el médico puede enviarte a un especialista de piel.", "p_de": "Wenn sich nach einer Woche nichts ändert, kann der Arzt dich zu einem Hautspezialisten schicken.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto recomienda duchas muy calientes y jabón perfumado.", "p_de": "Der Text empfiehlt sehr heiße Duschen und parfümierte Seife.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las dos opciones son para una fractura de pierna.", "p_de": "Beide Optionen sind für einen Beinbruch.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué es la opción A?", "p_de": "Was ist Option A?", "s": {"type": "multiple_choice", "options": ["Anti-itch cream twice a day", "A taxi to the hospital", "A strong injection"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Anti-itch cream twice a day", "A taxi to the hospital", "A strong injection"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Anti-itch cream twice a day", "A taxi to the hospital", "A strong injection"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la opción A?", "p_de": "Wie lange dauert Option A?", "s": {"type": "multiple_choice", "options": ["Seven days", "One hour", "Thirty days"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Seven days", "One hour", "Thirty days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seven days", "One hour", "Thirty days"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se usa la opción B?", "p_de": "Wann benutzt man Option B?", "s": {"type": "multiple_choice", "options": ["If the itching is strong or the rash covers more skin", "Only for a cold", "Only after sport"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["If the itching is strong or the rash covers more skin", "Only for a cold", "Only after sport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["If the itching is strong or the rash covers more skin", "Only for a cold", "Only after sport"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas pastillas al día tiene la opción B?", "p_de": "Wie viele Tabletten pro Tag hat Option B?", "s": {"type": "multiple_choice", "options": ["One a day", "Three an hour", "Two before lunch"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["One a day", "Three an hour", "Two before lunch"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["One a day", "Three an hour", "Two before lunch"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si la erupción se extiende?", "p_de": "Was machst du, wenn sich der Ausschlag ausbreitet?", "s": {"type": "multiple_choice", "options": ["Come back", "Take a train", "Buy soap"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Come back", "Take a train", "Buy soap"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Come back", "Take a train", "Buy soap"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede hacer el médico si no hay cambio?", "p_de": "Was kann der Arzt tun, wenn es keine Veränderung gibt?", "s": {"type": "multiple_choice", "options": ["Send you to a skin specialist", "Give you a hotel key", "Stop all treatment"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Send you to a skin specialist", "Give you a hotel key", "Stop all treatment"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Send you to a skin specialist", "Give you a hotel key", "Stop all treatment"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes evitar?", "p_de": "Was sollst du vermeiden?", "s": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Cold water and rice", "Books and music"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Cold water and rice", "Books and music"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hot showers and perfumed soap", "Cold water and rice", "Books and music"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué trata el texto?", "p_de": "Worum geht es im Text?", "s": {"type": "multiple_choice", "options": ["Treatment options for a rash", "A train accident", "A dinner menu"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Treatment options for a rash", "A train accident", "A dinner menu"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Treatment options for a rash", "A train accident", "A dinner menu"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2850 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2850 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2850, 'en', 'reading', 'health', 'Treatment Options for a Mild Rash

Option A: Use the anti-itch cream twice a day for seven days. This is good if the rash is small and the itching is light.

Option B: Take one allergy tablet a day if the itching is strong or if the rash covers more skin.

If the rash spreads or there is no change after one week, come back. The doctor may send you to a skin specialist. Avoid hot showers and perfumed soap.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee opciones de tratamiento', 'Lee una nota breve del médico con dos alternativas de tratamiento para una erupción leve.'),
        (v_reading_id, 'de', 'Lies Behandlungsoptionen', 'Lies eine kurze ärztliche Notiz mit zwei Behandlungsalternativen für einen leichten Ausschlag.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
