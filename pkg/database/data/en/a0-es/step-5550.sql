-- ============================================================
-- Seed: A0 English Path – STEP 5550 – Reading – read a summary of viewpoints (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Una postura dice que los seminarios en línea son flexibles y útiles para quienes se desplazan.", "p_de": "Eine Position sagt, dass Online-Seminare flexibel und für Pendelnde nützlich sind.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Otra postura dice que los seminarios presenciales generan mejor discusión.", "p_de": "Eine andere Position sagt, dass Präsenzseminare bessere Diskussion erzeugen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tercera postura rechaza cualquier modelo mixto.", "p_de": "Die dritte Position lehnt jedes Mischmodell ab.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El resumen dice que los seminarios con tareas prácticas deberían seguir presenciales.", "p_de": "Die Zusammenfassung sagt, dass Seminare mit praktischen Aufgaben in Präsenz bleiben sollten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También menciona que la tecnología inestable puede ser un problema en línea.", "p_de": "Es wird auch erwähnt, dass instabile Technik online ein Problem sein kann.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La línea final dice que todos los estudiantes prefieren solo lo presencial.", "p_de": "Die letzte Zeile sagt, dass alle Studierenden nur Präsenz bevorzugen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Muchos estudiantes prefieren un modelo mixto.", "p_de": "Viele Studierende bevorzugen ein Mischmodell.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El resumen combina varias perspectivas sobre el mismo tema.", "p_de": "Die Zusammenfassung verbindet mehrere Perspektiven zum selben Thema.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué ventaja da la primera postura a lo online?", "p_de": "Welchen Vorteil nennt die erste Position für Online-Formate?", "s": {"type": "multiple_choice", "options": ["Flexibility for commuters", "More green space on campus", "Better phone reception"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué destaca la segunda postura de lo presencial?", "p_de": "Was hebt die zweite Position am Präsenzformat hervor?", "s": {"type": "multiple_choice", "options": ["Better discussion and attention", "Lower rent prices", "More recycling bins"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué apoya la tercera postura?", "p_de": "Was unterstützt die dritte Position?", "s": {"type": "multiple_choice", "options": ["A mixed model", "Only online classes", "Only recorded lectures"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de seminarios deberían seguir presenciales según el resumen?", "p_de": "Welche Seminare sollten laut Zusammenfassung in Präsenz bleiben?", "s": {"type": "multiple_choice", "options": ["Those with labs or practical tasks", "All seminars after lunch", "Only seminars in Hall B"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema aparece en lo online?", "p_de": "Welches Problem tritt online auf?", "s": {"type": "multiple_choice", "options": ["Unstable technology", "No students at all", "Too many textbooks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué prefieren muchos estudiantes al final?", "p_de": "Was bevorzugen viele Studierende am Ende?", "s": {"type": "multiple_choice", "options": ["A mixed model", "Only in-person seminars", "Only online seminars"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué combina ese modelo mixto?", "p_de": "Was verbindet dieses Mischmodell?", "s": {"type": "multiple_choice", "options": ["Flexibility and direct contact", "Parking and rent", "Phones and invoices"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A summary of viewpoints", "A methodology section", "A conference opening statement"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5550 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5550 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5550, 'en', 'reading', 'academic', 'Summary of viewpoints. One view says online seminars are flexible and helpful for commuters. A second view says in-person seminars create better discussion and stronger attention.

A third view supports a mixed model. In this view, seminars with labs or practical tasks should stay face to face, but other sessions can be online. The summary also notes that online formats can fail when technology is unstable.

The final line says many students prefer a mixed model because it combines flexibility with direct contact.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Resumen de puntos de vista sobre seminarios', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Zusammenfassung von Sichtweisen zu Seminaren', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
