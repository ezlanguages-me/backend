-- ============================================================
-- Seed: A0 English Path – STEP 2890 – Speaking – Habla para preguntar por alternativas de tratamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2890 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2890, 'en', 'speaking', 'health')RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES
        (v_speaking_id, 'es', 'Alternativas de tratamiento', '{"scenario": "Estás con el médico y quieres entender las dos opciones de tratamiento para una erupción leve o un problema parecido de piel.", "tasks": ["Pregunta cuál es la primera opción de tratamiento.", "Pregunta con qué frecuencia debes usar la crema o tomar la medicina.", "Pregunta cuándo debes pasar a la segunda opción.", "Pregunta qué señales indican que debes volver a la clínica.", "Pregunta si necesitas un especialista o todavía no.", "Pregunta qué cosas debes evitar en casa.", "Di qué opción prefieres o cuál entiendes mejor.", "Termina repitiendo el plan principal con tus palabras."]}'::jsonb), (v_speaking_id, 'de', 'Nach Behandlungsalternativen', '{"scenario": "Du bist beim Arzt und möchtest die zwei Behandlungsoptionen für einen leichten Ausschlag oder ein ähnliches Hautproblem verstehen.", "tasks": ["Frage, welche Behandlungsoption die erste ist.", "Frage, wie oft du die Creme benutzen oder das Medikament nehmen sollst.", "Frage, wann du zur zweiten Option wechseln sollst.", "Frage, welche Zeichen zeigen, dass du in die Klinik zurückkommen musst.", "Frage, ob du einen Spezialisten brauchst oder noch nicht.", "Frage, welche Dinge du zu Hause vermeiden sollst.", "Sage, welche Option du bevorzugst oder besser verstehst.", "Beende das Gespräch damit, den Hauptplan mit deinen eigenen Worten zu wiederholen."]}'::jsonb);
END;
$seed$;
