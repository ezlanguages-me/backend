-- ============================================================
-- Seed: A0 English Path – STEP 5830 – Speaking – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5830 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5830, 'en', 'speaking', 'Gestión del Estudio y Trámites')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Pregunta por la matrícula del curso', 'Practica cómo pedir información sobre matrícula, documentos y fechas límite.', '{"scenario": "You need to enrol in a course at the student office. Ask for the form, the fee, the deadline, and where to submit it.", "tasks": ["Greet the staff member politely.", "Ask for the enrolment form.", "Ask which documents you must bring.", "Ask how much the fee is.", "Ask when the office closes.", "Ask if you can send a scanned copy by email.", "Say which course you want to join.", "Finish the conversation politely."]}'::jsonb),
        (v_speaking_id, 'de', 'Frag nach der Kursanmeldung', 'Übe, wie man nach Einschreibung, Unterlagen und Fristen fragt.', '{"scenario": "Du musst dich für einen Kurs im Studierendenbüro anmelden. Frage nach dem Formular, der Gebühr, der Frist und der Abgabe.", "tasks": ["Begrüße die Mitarbeitenden höflich.", "Bitte um das Einschreibeformular.", "Frage, welche Unterlagen du mitbringen musst.", "Frage, wie hoch die Gebühr ist.", "Frage, wann das Büro schließt.", "Frage, ob du eine Scan-Kopie per E-Mail senden kannst.", "Sage, welchen Kurs du besuchen möchtest.", "Beende das Gespräch höflich."]}'::jsonb);
END;
$seed$;

