-- ============================================================
-- Seed: A0 English Path – STEP 7430 – Speaking – give opinion at a meeting (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7430 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7430, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Da tu opinión en una reunión sencilla', 'Practica una opinión breve, acuerdo o desacuerdo simple y una respuesta cortés en una reunión.', '{"scenario": "Estás en una reunión corta del equipo. El grupo decide la hora de una reunión con visitantes y tú quieres dar una opinión simple y clara.", "tasks": ["Empieza con una frase corta para participar, como I think...", "Di qué hora prefieres para la reunión.", "Expresa acuerdo o desacuerdo con una frase simple.", "Da una razón breve para tu opinión.", "Pregunta a otra persona: What do you think?", "Responde con educación a una opinión diferente.", "Repite la opción final elegida por el grupo.", "Termina con una frase breve y positiva, como That is fine."]}'::jsonb),
        (v_speaking_id, 'de', 'Gib deine Meinung in einem einfachen Meeting', 'Übe eine kurze Meinung, einfaches Zustimmen oder Nichtzustimmen und eine höfliche Antwort in einem Meeting.', '{"scenario": "Du bist in einem kurzen Teammeeting. Die Gruppe entscheidet die Uhrzeit für ein Besuchsmeeting, und du möchtest eine einfache und klare Meinung sagen.", "tasks": ["Beginne mit einem kurzen Satz zum Mitreden, zum Beispiel I think...", "Sag, welche Uhrzeit du für das Meeting bevorzugst.", "Drücke Zustimmung oder Nichtzustimmung mit einem einfachen Satz aus.", "Gib einen kurzen Grund für deine Meinung.", "Frage eine andere Person: What do you think?", "Reagiere höflich auf eine andere Meinung.", "Wiederhole die endgültige Option der Gruppe.", "Beende mit einem kurzen positiven Satz wie That is fine."]}'::jsonb);
END;
$seed$;
