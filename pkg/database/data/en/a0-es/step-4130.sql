-- ============================================================
-- Seed: A0 English Path – STEP 4130 – Speaking – offer professional help (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4130 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4130, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Ofrece ayuda profesional', 'Practica cómo ofrecer ayuda a un cliente o visitante de forma oral, con claridad y amabilidad.', '{"scenario": "Un cliente o visitante llega a tu empresa o te llama por teléfono y parece necesitar orientación o apoyo. Quieres practicar cómo ofrecer ayuda profesional de forma natural.", "tasks": ["Saluda al cliente o visitante con una bienvenida apropiada.", "Pregunta cómo puedes ayudar o qué necesita.", "Ofrece enviar información relevante por correo electrónico.", "Menciona un servicio o recurso adicional que puede serle útil.", "Ofrece un paso concreto como una visita, una llamada o una demostración.", "Confirma los datos necesarios para seguir adelante.", "Pregunta si hay algo más en lo que puedas ayudar.", "Termina la interacción de forma profesional y amable."]}'::jsonb),
        (v_item_id, 'de', 'Biete professionelle Hilfe an', 'Übe, wie man einem Kunden oder Besucher mündlich Hilfe auf klare und freundliche Weise anbietet.', '{"scenario": "Ein Kunde oder Besucher kommt zu deinem Unternehmen oder ruft an und scheint Orientierung oder Unterstützung zu benötigen. Du möchtest üben, professionelle Hilfe auf natürliche Weise anzubieten.", "tasks": ["Begrüße den Kunden oder Besucher angemessen.", "Frage, wie du helfen kannst oder was er braucht.", "Biete an, relevante Informationen per E-Mail zu schicken.", "Erwähne einen weiteren Dienst oder eine Ressource, die nützlich sein könnte.", "Schlage einen konkreten nächsten Schritt vor, z. B. einen Besuch, Anruf oder Vorführung.", "Bestätige die nötigen Daten, um voranzukommen.", "Frage, ob es noch etwas gibt, womit du helfen kannst.", "Beende die Interaktion professionell und freundlich."]}'::jsonb);
END;
$seed$;
