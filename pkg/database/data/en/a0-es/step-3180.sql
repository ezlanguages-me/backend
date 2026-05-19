-- ============================================================
-- Seed: A0 English Path – STEP 3180 – Speaking – handle airport or station procedures (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3180 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3180, 'en', 'speaking', 'transport')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (
            v_speaking_id,
            'es',
            'Habla en los trámites del aeropuerto',
            'Practica cómo pasar por el mostrador de facturación y pedir información simple antes del vuelo.',
            '{"scenario": "Estás en el mostrador de facturación del aeropuerto para un vuelo de mañana. Necesitas mostrar tus documentos, hablar de tu maleta y encontrar tu puerta.", "tasks": ["Saluda y di tu destino o número de vuelo.", "Enseña o menciona tu pasaporte y tu billete o boarding pass.", "Di cuántas maletas llevas.", "Pregunta si la maleta va en cabina o en facturación.", "Pregunta si puedes tener asiento de ventana o de pasillo.", "Pregunta dónde está security o la gate.", "Repite la hora de embarque o el número de puerta para confirmar.", "Termina con un gracias y una despedida corta."]}'::jsonb
        ),
        (
            v_speaking_id,
            'de',
            'Sprich bei den Abläufen am Flughafen',
            'Übe, wie man am Check-in-Schalter einfache Informationen gibt und nach dem Gate fragt.',
            '{"scenario": "Du bist am Check-in-Schalter für einen Morgenflug. Du musst deine Dokumente zeigen, über dein Gepäck sprechen und dein Gate finden.", "tasks": ["Begrüße das Personal und nenne dein Ziel oder deine Flugnummer.", "Zeige oder nenne deinen Reisepass und dein Ticket oder boarding pass.", "Sag, wie viele Taschen oder Koffer du hast.", "Frage, ob das Gepäck in die Kabine oder in den Check-in geht.", "Frage, ob du einen Fenster- oder Gangplatz haben kannst.", "Frage, wo security oder das Gate ist.", "Wiederhole die Boardingzeit oder die Gate Nummer zur Bestätigung.", "Beende mit einem Danke und einer kurzen Verabschiedung."]}'::jsonb
        );
END;
$seed$;
