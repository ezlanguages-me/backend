-- ============================================================
-- Seed: A0 English Path – STEP 5510 – Reading – understand written arguments (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El texto dice que los proyectos en grupo ayudan a practicar planificación y negociación.", "p_de": "Der Text sagt, dass Gruppenprojekte Planung und Verhandlung üben helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También permiten combinar fortalezas distintas.", "p_de": "Sie erlauben auch, unterschiedliche Stärken zu kombinieren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto piensa que los roles claros no son importantes.", "p_de": "Der Text meint, klare Rollen seien nicht wichtig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las reuniones cortas con el profesor pueden reducir conflictos.", "p_de": "Kurze Treffen mit der Lehrkraft können Konflikte reduzieren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La evaluación entre compañeros puede hacer la nota más justa.", "p_de": "Peer-Bewertung kann die Note fairer machen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conclusión dice que los proyectos en grupo siempre fracasan.", "p_de": "Der Schluss sagt, dass Gruppenprojekte immer scheitern.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Sin un plan, algunos estudiantes pueden sentir que el trabajo no se reparte bien.", "p_de": "Ohne Plan können einige Studierende das Gefühl haben, dass die Arbeit nicht fair verteilt ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto presenta argumentos a favor y una condición importante.", "p_de": "Der Text präsentiert Pro-Argumente und eine wichtige Bedingung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué habilidades ayudan a practicar los proyectos en grupo?", "p_de": "Welche Fähigkeiten helfen Gruppenprojekte zu üben?", "s": {"type": "multiple_choice", "options": ["Planning, negotiation, and shared responsibility", "Driving and parking", "Phone greetings and office calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué combinan los miembros del grupo?", "p_de": "Was kombinieren die Gruppenmitglieder?", "s": {"type": "multiple_choice", "options": ["Different strengths", "Only page numbers", "Only library cards"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace falta para que funcione bien el trabajo en grupo?", "p_de": "Was ist nötig, damit Gruppenarbeit gut funktioniert?", "s": {"type": "multiple_choice", "options": ["Clear roles", "No structure at all", "Only one speaker"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede reducir los conflictos?", "p_de": "Was kann Konflikte verringern?", "s": {"type": "multiple_choice", "options": ["Short teacher meetings", "Longer phone calls", "Closing the classroom"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede hacer la evaluación entre compañeros?", "p_de": "Was kann Peer-Bewertung tun?", "s": {"type": "multiple_choice", "options": ["Make the final grade fairer", "Remove all homework", "Replace the teacher"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa sin un plan?", "p_de": "Was passiert ohne Plan?", "s": {"type": "multiple_choice", "options": ["Some students may feel the work is unequal", "Everyone becomes more focused", "The project ends early"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la conclusión general?", "p_de": "Wie ist die allgemeine Schlussfolgerung?", "s": {"type": "multiple_choice", "options": ["Group projects are useful with strong structure", "Group projects never work", "Group projects need no roles"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A written argument", "A conference programme", "A peer evaluation form"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5510 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5510 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5510, 'en', 'reading', 'academic', 'Written argument. Group projects help students practise planning, negotiation, and shared responsibility. They also allow people to combine different strengths in one task.

However, group work is only effective when roles are clear. The text argues that short teacher meetings can reduce conflict, and peer assessment can make the final grade fairer.

In conclusion, group projects are useful when the structure is strong. Without a plan, students may feel that the work is not shared equally.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Argumentos escritos sobre proyectos en grupo', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Schriftliche Argumente über Gruppenprojekte', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
