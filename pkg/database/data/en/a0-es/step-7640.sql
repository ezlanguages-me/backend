-- ============================================================
-- Seed: A0 English Path – STEP 7640 – Speaking – counter an argument in a discussion (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7640 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7640, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Responde a un argumento en una discusión', 'Practica cómo reconocer la idea de otra persona y contestar con una postura diferente de forma clara y respetuosa.', '{"scenario": "En una reunión, otra persona quiere lanzar una nueva herramienta para todo el equipo de inmediato. Tú piensas que primero hace falta una fase pequeña de prueba.", "tasks": ["Empieza resumiendo la idea de la otra persona con una frase breve.", "Muestra una pequeña parte de acuerdo antes de responder.", "Expón tu contraargumento principal con claridad.", "Da una razón práctica relacionada con tiempo, errores o soporte.", "Añade un ejemplo corto de un problema que podría aparecer.", "Propón una alternativa concreta, por ejemplo una prueba limitada.", "Invita al grupo a comparar riesgo y beneficio.", "Termina reafirmando tu posición con una frase firme y educada."]}'::jsonb),
        (v_speaking_id, 'de', 'Auf ein Argument in einer Diskussion antworten', 'Übe, wie du die Idee einer anderen Person aufgreifst und klar sowie respektvoll mit einer anderen Position antwortest.', '{"scenario": "In einer Besprechung möchte eine andere Person ein neues Tool sofort für das ganze Team einführen. Du findest, dass zuerst eine kleine Testphase nötig ist.", "tasks": ["Beginne damit, die Idee der anderen Person kurz zusammenzufassen.", "Zeige erst etwas Zustimmung, bevor du antwortest.", "Nenne dein Hauptgegenargument klar.", "Gib einen praktischen Grund zu Zeit, Fehlern oder Support.", "Füge ein kurzes Beispiel für ein mögliches Problem hinzu.", "Schlage eine konkrete Alternative vor, zum Beispiel einen begrenzten Test.", "Lade die Gruppe ein, Risiko und Nutzen zu vergleichen.", "Beende mit einer höflichen, aber klaren Bestätigung deiner Position."]}'::jsonb);
END;
$seed$;
