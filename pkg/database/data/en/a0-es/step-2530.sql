-- ============================================================
-- Seed: A0 English Path – STEP 2530 – Reading – Lee cómo pedir una cita médica
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Para una cita médica del mismo día debes hablar en el mostrador 1 antes de las 11.", "p_de": "Für einen Arzttermin am selben Tag musst du vor 11 Uhr am Schalter 1 sprechen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La primera cita libre hoy es con Dr Green a las 10:40.", "p_de": "Der erste freie Termin heute ist bei Dr Green um 10:40.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Solo necesitas llevar dinero en efectivo.", "p_de": "Du musst nur Bargeld mitbringen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las citas con el dentista son todos los días.", "p_de": "Zahnarzttermine sind jeden Tag.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las citas de enfermería están en el mostrador 2.", "p_de": "Pflegetermine sind an Schalter 2.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En el mostrador 2 también hacen vacunas.", "p_de": "An Schalter 2 gibt es auch Impfungen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si tienes dolor fuerte debes avisar en recepción inmediatamente.", "p_de": "Wenn du starke Schmerzen hast, musst du sofort an der Rezeption Bescheid sagen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las citas médicas del mismo día se piden en el mostrador 3.", "p_de": "Arzttermine am selben Tag werden an Schalter 3 gebucht.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿En qué mostrador pides una cita médica del mismo día?", "p_de": "An welchem Schalter buchst du einen Arzttermin am selben Tag?", "s": {"type": "multiple_choice", "options": ["Desk 1", "Desk 2", "Desk 3"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Desk 1", "Desk 2", "Desk 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Desk 1", "Desk 2", "Desk 3"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la primera cita libre de hoy?", "p_de": "Welcher ist der erste freie Termin heute?", "s": {"type": "multiple_choice", "options": ["Dr Green at 10:40", "Dr Brown at 11:40", "Dr Green at 9:15"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Dr Green at 10:40", "Dr Brown at 11:40", "Dr Green at 9:15"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dr Green at 10:40", "Dr Brown at 11:40", "Dr Green at 9:15"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes llevar?", "p_de": "Was musst du mitbringen?", "s": {"type": "multiple_choice", "options": ["ID and health card", "Only cash", "A bus ticket"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["ID and health card", "Only cash", "A bus ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["ID and health card", "Only cash", "A bus ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo hay citas con el dentista?", "p_de": "Wann gibt es Zahnarzttermine?", "s": {"type": "multiple_choice", "options": ["On Tuesdays and Thursdays", "Every day", "Only on Monday"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["On Tuesdays and Thursdays", "Every day", "Only on Monday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["On Tuesdays and Thursdays", "Every day", "Only on Monday"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se hace en las citas de enfermería?", "p_de": "Was macht man bei Pflegeterminen?", "s": {"type": "multiple_choice", "options": ["Blood pressure checks and vaccines", "X-rays and surgery", "Eye tests only"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Blood pressure checks and vaccines", "X-rays and surgery", "Eye tests only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blood pressure checks and vaccines", "X-rays and surgery", "Eye tests only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué haces si tienes problemas para respirar?", "p_de": "Was machst du bei Atemproblemen?", "s": {"type": "multiple_choice", "options": ["Tell reception immediately", "Wait outside for an hour", "Go to Desk 2 tomorrow"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Tell reception immediately", "Wait outside for an hour", "Go to Desk 2 tomorrow"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Tell reception immediately", "Wait outside for an hour", "Go to Desk 2 tomorrow"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de cita se puede pedir antes de las 11?", "p_de": "Welche Art Termin kann man vor 11 Uhr buchen?", "s": {"type": "multiple_choice", "options": ["A same-day doctor appointment", "A driving lesson", "A hotel room"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A same-day doctor appointment", "A driving lesson", "A hotel room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A same-day doctor appointment", "A driving lesson", "A hotel room"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién es el médico con la primera hora libre?", "p_de": "Wer ist der Arzt mit dem ersten freien Termin?", "s": {"type": "multiple_choice", "options": ["Dr Green", "Dr White", "Dr Taylor"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Dr Green", "Dr White", "Dr Taylor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dr Green", "Dr White", "Dr Taylor"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2530 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2530 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2530, 'en', 'reading', 'health', 'City Health Centre

To book a same-day doctor appointment, speak to Reception Desk 1 before 11 AM. The first free doctor today is Dr Green at 10:40. Bring your ID and your health card.

Dentist appointments are on Tuesdays and Thursdays only. Nurse appointments for blood pressure checks and vaccines are at Desk 2.

If you have strong pain or trouble breathing, tell reception immediately.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee cómo pedir una cita médica', 'Lee un aviso breve de un centro de salud para pedir una cita médica y entender la respuesta escrita.'),
        (v_reading_id, 'de', 'Lies, wie man einen Arzttermin vereinbart', 'Lies einen kurzen Aushang eines Gesundheitszentrums, um einen Arzttermin zu vereinbaren und die schriftliche Antwort zu verstehen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
