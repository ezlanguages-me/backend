-- ============================================================
-- Seed: A0 English Path – STEP 3970 – Speaking – resolve a work service issue (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3970 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3970, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Resuelve una incidencia de servicio', 'Practica una respuesta oral para disculparte, explicar el problema y ofrecer una solución clara.', '{"scenario": "Un cliente está molesto por un servicio o una entrega. Quieres practicar cómo responder con calma, dar una solución y cerrar la conversación de forma profesional.", "tasks": ["Saluda al cliente y reconoce el problema.", "Pide disculpas de forma clara y profesional.", "Resume qué ha pasado con tus propias palabras.", "Explica la solución inmediata que puedes ofrecer.", "Di cuándo llegará la ayuda, el técnico o la reposición.", "Añade qué pasará con documentos como factura o informe.", "Pregunta si el cliente necesita algo más para hoy.", "Termina con una despedida profesional y tranquilizadora."]}'::jsonb),
        (v_item_id, 'de', 'Löse ein Serviceproblem', 'Übe eine mündliche Antwort, um dich zu entschuldigen, das Problem zu erklären und eine klare Lösung anzubieten.', '{"scenario": "Ein Kunde ist wegen eines Service- oder Lieferproblems verärgert. Du möchtest üben, wie man ruhig antwortet, eine Lösung anbietet und das Gespräch professionell beendet.", "tasks": ["Begrüße den Kunden und erkenne das Problem an.", "Entschuldige dich klar und professionell.", "Fasse zusammen, was passiert ist.", "Erkläre die sofortige Lösung, die du anbieten kannst.", "Sag, wann Hilfe, Techniker oder Ersatz eintreffen.", "Ergänze, was mit Dokumenten wie Rechnung oder Bericht passiert.", "Frage, ob der Kunde heute noch etwas braucht.", "Beende das Gespräch mit einer professionellen und beruhigenden Verabschiedung."]}'::jsonb);
END;
$seed$;
