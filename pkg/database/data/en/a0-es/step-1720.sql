-- ============================================================
-- Seed: A0 English Path – STEP 1720 – Speaking – go to a travel information centre (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1720 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1720, 'en', 'speaking', 'Viajes y Transporte')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Planear un trayecto con ayuda del centro de información', '', '{"scenario": "Estás en un centro de información de viajes de una estación. Quieres saber cómo ir desde tu estación actual hasta otra ciudad o hasta el aeropuerto.", "tasks": ["Di a dónde quieres ir.", "Pregunta qué transporte debes tomar primero.", "Pregunta desde qué andén o parada sale.", "Pregunta si necesitas cambiar de transporte.", "Pregunta cuánto dura el viaje.", "Pregunta dónde compras el billete o el mapa.", "Repite la información principal para comprobarla.", "Termina dando las gracias."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine Fahrt mit Hilfe des Informationszentrums planen', '', '{"scenario": "Du bist in einem Reiseinformationszentrum im Bahnhof. Du möchtest wissen, wie du von deinem aktuellen Bahnhof in eine andere Stadt oder zum Flughafen kommst.", "tasks": ["Sage, wohin du fahren möchtest.", "Frage, welches Verkehrsmittel du zuerst nehmen musst.", "Frage, von welchem Bahnsteig oder welcher Haltestelle es abfährt.", "Frage, ob du umsteigen musst.", "Frage, wie lange die Fahrt dauert.", "Frage, wo du das Ticket oder den Stadtplan kaufen kannst.", "Wiederhole die wichtigsten Informationen zur Kontrolle.", "Beende mit einem Dank."]}'::jsonb);
END;
$seed$;
