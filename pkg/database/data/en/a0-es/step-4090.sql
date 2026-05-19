-- ============================================================
-- Seed: A0 English Path – STEP 4090 – Speaking – take and pass on simple messages of a routine kind (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4090 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4090, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Toma y transmite mensajes rutinarios', 'Practica cómo tomar un mensaje por teléfono y luego transmitirlo oralmente a un compañero.', '{"scenario": "Estás en recepción y recibes una llamada de un cliente o proveedor con un mensaje para un compañero que no está disponible. Quieres practicar cómo tomar el mensaje con precisión y luego comunicarlo.", "tasks": ["Responde al teléfono con el nombre de la empresa y un saludo.", "Explica que la persona solicitada no está disponible.", "Ofrécete a tomar un mensaje.", "Pregunta el nombre completo y la empresa de quien llama.", "Pregunta el motivo del mensaje o la información clave.", "Repite el mensaje para confirmar los detalles.", "Pide o confirma el número de contacto para devolverle la llamada.", "Explica cuándo y cómo se transmitirá el mensaje."]}'::jsonb),
        (v_item_id, 'de', 'Nimm Routinenachrichten auf und gib sie weiter', 'Übe, wie man eine Nachricht am Telefon aufnimmt und sie dann mündlich an einen Kollegen weitergibt.', '{"scenario": "Du bist am Empfang und erhältst einen Anruf von einem Kunden oder Lieferanten mit einer Nachricht für einen nicht verfügbaren Kollegen. Du möchtest üben, die Nachricht genau aufzunehmen und weiterzugeben.", "tasks": ["Beantworte das Telefon mit dem Firmennamen und einer Begrüßung.", "Erkläre, dass die gewünschte Person nicht verfügbar ist.", "Biete an, eine Nachricht aufzunehmen.", "Frage nach dem vollständigen Namen und der Firma des Anrufers.", "Frage nach dem Grund der Nachricht oder den wichtigsten Informationen.", "Wiederhole die Nachricht zur Bestätigung der Details.", "Bitte um die Kontaktnummer oder bestätige sie für einen Rückruf.", "Erkläre, wann und wie die Nachricht weitergegeben wird."]}'::jsonb);
END;
$seed$;
