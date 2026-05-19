-- ============================================================
-- Seed: A0 English Path – STEP 2720 – Speaking – Habla sobre instrucciones de un medicamento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2720 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2720, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla sobre instrucciones de un medicamento', 'Practica cómo preguntar por la dosis, el horario y las advertencias de una medicina.', '{"scenario": "Tienes una caja de pastillas nueva y quieres confirmar exactamente cómo debes tomarla.", "tasks": ["Pregunta cuántas pastillas tomas cada vez.", "Pregunta si la tomas por la mañana, por la noche o a otra hora.", "Pregunta si debes tomarla con comida o sin comida.", "Pregunta si debes tomarla con agua.", "Pregunta qué bebidas o actividades debes evitar.", "Pregunta cuántos días dura el tratamiento.", "Pregunta qué hacer si olvidas una dosis.", "Termina repitiendo las instrucciones principales."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich über Anweisungen zu einem Medikament', 'Übe, wie du nach Dosis, Uhrzeit und Warnungen eines Medikaments fragst.', '{"scenario": "Du hast eine neue Tablettenschachtel und möchtest genau bestätigen, wie du sie nehmen sollst.", "tasks": ["Frage, wie viele Tabletten du jedes Mal nimmst.", "Frage, ob du sie morgens, abends oder zu einer anderen Zeit nimmst.", "Frage, ob du sie mit Essen oder ohne Essen nehmen sollst.", "Frage, ob du sie mit Wasser nehmen sollst.", "Frage, welche Getränke oder Aktivitäten du vermeiden sollst.", "Frage, wie viele Tage die Behandlung dauert.", "Frage, was du tun sollst, wenn du eine Dosis vergisst.", "Beende das Gespräch damit, die wichtigsten Anweisungen zu wiederholen."]}'::jsonb);
END;
$seed$;
