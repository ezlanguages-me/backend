-- ============================================================
-- Seed: A0 English Path – STEP 1470 – Speaking – ask questions related to post office services
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1470 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1470, 'en', 'speaking', 'postal')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Usa correo certificado para un documento importante', 'Practica cómo pedir información para enviar un documento por correo certificado.', '{"scenario": "Tienes un documento importante y quieres enviarlo por correo certificado. Habla con el empleado para preguntar por el servicio.", "tasks": ["Saluda y di que quieres enviar un documento importante.", "Pregunta si el correo certificado es la mejor opción.", "Pregunta si el envío necesita firma al recibirlo.", "Pregunta cuánto cuesta el servicio.", "Pregunta si recibes número de seguimiento.", "Pregunta cuánto tarda en llegar.", "Pide un recibo y una explicación breve del proceso.", "Confirma el servicio elegido y despídete."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Nutze Einschreiben für ein wichtiges Dokument', 'Übe, wie man Informationen zum Versenden eines Dokuments per Einschreiben erfragt.', '{"scenario": "Du hast ein wichtiges Dokument und möchtest es per Einschreiben schicken. Sprich mit dem Mitarbeiter und frag nach dem Service.", "tasks": ["Begrüße den Mitarbeiter und sag, dass du ein wichtiges Dokument schicken möchtest.", "Frag, ob Einschreiben die beste Option ist.", "Frag, ob die Sendung bei der Zustellung eine Unterschrift braucht.", "Frag, wie viel der Service kostet.", "Frag, ob du eine Sendungsnummer bekommst.", "Frag, wie lange die Zustellung dauert.", "Bitte um einen Beleg und eine kurze Erklärung des Ablaufs.", "Bestätige den gewählten Service und verabschiede dich."]}'::jsonb);
END;
$seed$;
