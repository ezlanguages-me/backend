-- ============================================================
-- Seed: A0 English Path – STEP 4980 – Reading – read lecture notes (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Los adultos suelen necesitar entre siete y nueve horas de sueño.", "p_de": "Erwachsene brauchen normalerweise sieben bis neun Stunden Schlaf.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dormir bien ayuda al cerebro a guardar información nueva.", "p_de": "Guter Schlaf hilft dem Gehirn, neue Informationen zu speichern.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pantalla brillante del teléfono puede adelantar el sueño.", "p_de": "Helles Handylicht kann den Schlaf früher beginnen lassen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una siesta corta de unos veinte minutos puede ayudar a la atención.", "p_de": "Ein kurzer Schlaf von etwa zwanzig Minuten kann der Aufmerksamkeit helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las siestas largas pueden hacer que los estudiantes se sientan lentos.", "p_de": "Lange Nickerchen können Studierende träge machen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El café por la noche mejora la calidad del sueño.", "p_de": "Kaffee am Abend verbessert die Schlafqualität.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Repasar el mismo día ayuda a la memoria antes de dormir.", "p_de": "Eine Wiederholung am selben Tag hilft dem Gedächtnis vor dem Schlafen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los apuntes son sobre ejercicio y comida.", "p_de": "Die Notizen handeln von Sport und Essen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuántas horas de sueño suelen necesitar los adultos?", "p_de": "Wie viele Schlafstunden brauchen Erwachsene normalerweise?", "s": {"type": "multiple_choice", "options": ["Seven to nine hours", "Three to four hours", "Ten to twelve hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ayuda a hacer el sueño con la información nueva?", "p_de": "Was hilft Schlaf mit neuer Information zu tun?", "s": {"type": "multiple_choice", "options": ["Store it in the brain", "Delete it immediately", "Turn it into music"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede retrasar el sueño?", "p_de": "Was kann den Schlaf verzögern?", "s": {"type": "multiple_choice", "options": ["A bright phone screen", "A short walk", "A glass of water"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la siesta útil en los apuntes?", "p_de": "Wie lange dauert das nützliche Nickerchen in den Notizen?", "s": {"type": "multiple_choice", "options": ["About twenty minutes", "About two hours", "About five minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema tienen las siestas largas?", "p_de": "Welches Problem haben lange Nickerchen?", "s": {"type": "multiple_choice", "options": ["They can make students feel slow", "They remove all stress", "They improve night sleep every time"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo no se recomienda el café?", "p_de": "Wann wird Kaffee nicht empfohlen?", "s": {"type": "multiple_choice", "options": ["Late in the evening", "At breakfast", "After lunch only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ayuda antes de dormir?", "p_de": "Was hilft vor dem Schlafen?", "s": {"type": "multiple_choice", "options": ["A short review on the same day", "A loud conversation", "A long online game"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tratan los apuntes?", "p_de": "Worum geht es in den Notizen?", "s": {"type": "multiple_choice", "options": ["Sleep and memory", "Hotel safety rules", "Phone messages at work"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4980 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 4980 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 4980, 'en', 'reading', 'academic', 'Lecture notes: Sleep and Memory. Adults usually need seven to nine hours of sleep. Good sleep helps the brain store new information after study.

The notes say that bright phone screens before bed can delay sleep. A short nap of about twenty minutes may help attention, but long naps can make students feel slow.

The lecturer also notes that coffee late in the evening can reduce sleep quality. One final point says that a short review on the same day helps memory before sleep.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Apuntes de clase sobre sueño y memoria', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Vorlesungsnotizen über Schlaf und Gedächtnis', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
