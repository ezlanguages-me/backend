-- ============================================================
-- Seed: A0 English Path – STEP 4050 – Speaking – present services to a potential client (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4050 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4050, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Presenta servicios a un cliente potencial', 'Practica una presentación oral de los servicios de tu empresa a un nuevo cliente.', '{"scenario": "Un cliente potencial te ha pedido información sobre los servicios de tu empresa. Quieres hacer una presentación oral clara y persuasiva para explicar qué ofrecéis.", "tasks": ["Saluda al cliente y preséntate con tu nombre y cargo.", "Presenta brevemente la empresa y sus años de experiencia.", "Describe el primer servicio principal con detalles clave.", "Describe el segundo servicio con un beneficio concreto.", "Menciona los planes disponibles y sus precios aproximados.", "Explica las condiciones del contrato, como duración mínima.", "Ofrece un paso siguiente, como una visita de evaluación o una prueba.", "Termina agradeciendo el interés e invita a hacer preguntas."]}'::jsonb),
        (v_item_id, 'de', 'Stelle Dienstleistungen einem potenziellen Kunden vor', 'Übe eine mündliche Präsentation der Unternehmensdienstleistungen für einen neuen Kunden.', '{"scenario": "Ein potenzieller Kunde hat dich nach Informationen über die Dienstleistungen deines Unternehmens gefragt. Du möchtest eine klare und überzeugende mündliche Präsentation halten.", "tasks": ["Begrüße den Kunden und stelle dich mit Name und Position vor.", "Stelle das Unternehmen kurz vor und nenne die Erfahrungsjahre.", "Beschreibe den ersten Hauptdienst mit wichtigen Details.", "Beschreibe den zweiten Dienst mit einem konkreten Vorteil.", "Nenne die verfügbaren Pläne und ihre ungefähren Preise.", "Erkläre die Vertragsbedingungen, wie Mindestlaufzeit.", "Biete einen nächsten Schritt an, z. B. einen Bewertungsbesuch oder eine Probezeit.", "Beende die Präsentation mit einem Dank und einer Einladung zu Fragen."]}'::jsonb);
END;
$seed$;
