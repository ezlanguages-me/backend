-- ============================================================
-- Seed: A0 English Path – STEP 1680 – Speaking – give and understand straightforward directions (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1680 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1680, 'en', 'speaking', 'Viajes y Transporte')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Describe una ruta con varios pasos', '', '{"scenario": "Un visitante te pide cómo ir desde la estación de tren hasta una sala de conciertos. Debes explicar una ruta con varios pasos, pero sin hacerla demasiado complicada.", "tasks": ["Di cuál es el punto de salida.", "Explica cuál es la primera calle o parada.", "Añade una instrucción para cruzar o girar.", "Menciona un edificio o monumento como referencia.", "Indica si hay que cambiar de autobús o seguir a pie.", "Di dónde debe bajarse o dónde termina la caminata.", "Resume la última parte de la ruta.", "Cierra con una frase para comprobar que todo está claro."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Beschreibe einen Weg mit mehreren Schritten', '', '{"scenario": "Ein Besucher fragt dich nach dem Weg vom Bahnhof zu einer Konzerthalle. Du sollst einen Weg mit mehreren Schritten erklären, aber ohne ihn zu kompliziert zu machen.", "tasks": ["Sage, wo der Weg beginnt.", "Erkläre die erste Straße oder Haltestelle.", "Füge eine Anweisung zum Überqueren oder Abbiegen hinzu.", "Nenne ein Gebäude oder Denkmal als Orientierungspunkt.", "Sage, ob man umsteigen oder zu Fuß weitergehen muss.", "Erkläre, wo man aussteigt oder wo der Fußweg endet.", "Fasse den letzten Teil des Weges zusammen.", "Beende mit einer Frage, ob alles klar ist."]}'::jsonb);
END;
$seed$;
