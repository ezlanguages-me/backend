-- ============================================================
-- Seed: A0 English Path – STEP 5190 – Reading – understand research methodology section (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El estudio siguió a cuarenta estudiantes de primer año durante cuatro semanas.", "p_de": "Die Studie begleitete vierzig Erstsemester vier Wochen lang.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los participantes venían de dos grupos: ciencias y humanidades.", "p_de": "Die Teilnehmenden kamen aus zwei Gruppen: Naturwissenschaften und Geisteswissenschaften.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cuestionario se hizo en la semana cuatro.", "p_de": "Der Fragebogen wurde in Woche vier durchgeführt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hubo seis entrevistas de seguimiento en la semana cuatro.", "p_de": "Es gab sechs Folgeinterviews in Woche vier.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Cada estudiante registró el tiempo diario de lectura.", "p_de": "Jede Person notierte die tägliche Lesezeit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los nombres reales se mantuvieron en el análisis final.", "p_de": "Die echten Namen blieben in der Endanalyse.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una limitación es que el registro dependía de lo que decía el estudiante.", "p_de": "Eine Grenze ist, dass das Protokoll von den Angaben der Studierenden abhing.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto dice que la combinación de métodos dio una visión más completa.", "p_de": "Der Text sagt, dass die Kombination der Methoden ein vollständigeres Bild gab.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuántos estudiantes participaron?", "p_de": "Wie viele Studierende nahmen teil?", "s": {"type": "multiple_choice", "options": ["Forty first-year students", "Six students", "One hundred teachers"], "answer": 0}}'::jsonb,
        '{"p": "¿Durante cuánto tiempo siguió el estudio a los participantes?", "p_de": "Wie lange begleitete die Studie die Teilnehmenden?", "s": {"type": "multiple_choice", "options": ["Four weeks", "Two days", "One semester"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué dos grupos procedían los estudiantes?", "p_de": "Aus welchen zwei Gruppen kamen die Studierenden?", "s": {"type": "multiple_choice", "options": ["Science and humanities", "Sports and music", "Nursing and law only"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se hizo el cuestionario?", "p_de": "Wann wurde der Fragebogen gemacht?", "s": {"type": "multiple_choice", "options": ["In week one", "In week four only", "After the final exam"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas entrevistas de seguimiento hubo?", "p_de": "Wie viele Folgeinterviews gab es?", "s": {"type": "multiple_choice", "options": ["Six interviews", "Forty interviews", "Two interviews"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué registró cada estudiante cada día?", "p_de": "Was notierte jede Person täglich?", "s": {"type": "multiple_choice", "options": ["Reading time", "Bus tickets", "Phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo protegieron los nombres?", "p_de": "Wie wurden die Namen geschützt?", "s": {"type": "multiple_choice", "options": ["They used anonymous codes", "They published the addresses", "They deleted the interviews"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué limitación menciona la metodología?", "p_de": "Welche Grenze nennt die Methodik?", "s": {"type": "multiple_choice", "options": ["The logs depended on self-report", "There were too many interviews", "The students never read"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5190 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5190 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5190, 'en', 'reading', 'academic', 'Methodology section. This study followed forty first-year students for four weeks. The participants came from two subject groups: science and humanities.

Researchers used a short questionnaire in week one and six follow-up interviews in week four. Each student also recorded daily reading time in a simple log. Names were replaced by anonymous codes before analysis.

The method section notes one limit: the reading logs depended on self-report, so some answers may not be exact. Even so, the combination of survey, interviews, and logs gave a fuller picture of student reading habits.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Sección metodológica sobre hábitos de lectura', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Methodenteil über Lesegewohnheiten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
