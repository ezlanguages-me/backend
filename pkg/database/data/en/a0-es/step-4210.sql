-- ============================================================
-- Seed: A0 English Path – STEP 4210 – Speaking – respond to visitor requests (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4210 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4210, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Responde a las peticiones de un visitante', 'Practica cómo responder oralmente a las peticiones habituales de un visitante en tu empresa.', '{"scenario": "Un visitante llega a tu oficina y hace varias peticiones típicas. Quieres practicar cómo responder a cada una de forma clara y útil.", "tasks": ["Saluda al visitante y pregunta en qué puedes ayudarle.", "Responde a la petición de usar una sala de reuniones.", "Informa sobre el acceso a la wifi para visitantes.", "Ofrece una bebida como café o agua.", "Explica dónde está la impresora o el baño si se pregunta.", "Confirma el nombre del visitante para el registro de visitas.", "Ofrece acompañar al visitante a su destino en el edificio.", "Cierra la conversación ofreciendo más ayuda si la necesita."]}'::jsonb),
        (v_item_id, 'de', 'Antworte auf Besucheranfragen', 'Übe, wie man mündlich auf typische Anfragen eines Besuchers in deinem Unternehmen reagiert.', '{"scenario": "Ein Besucher kommt in dein Büro und stellt mehrere typische Anfragen. Du möchtest üben, auf jede klar und hilfreich zu antworten.", "tasks": ["Begrüße den Besucher und frage, womit du helfen kannst.", "Antworte auf die Anfrage, einen Besprechungsraum zu nutzen.", "Informiere über den WLAN-Zugang für Besucher.", "Biete ein Getränk wie Kaffee oder Wasser an.", "Erkläre, wo der Drucker oder das WC ist, falls gefragt.", "Bestätige den Namen des Besuchers für das Besucherregister.", "Biete an, den Besucher zu seinem Ziel im Gebäude zu begleiten.", "Beende das Gespräch mit dem Angebot weiterer Hilfe."]}'::jsonb);
END;
$seed$;
