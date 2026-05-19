-- ============================================================
-- Seed: A0 English Path – STEP 490 – Speaking – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 490 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 490, 'en', 'speaking', 'accommodation')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Preguntar por detalles del alquiler', '', '{"scenario": "Vas a visitar una habitación amueblada en una casa compartida. Quieres saber si te encaja para mudarte pronto y necesitas detalles prácticos.", "tasks": ["Saluda y di que quieres información sobre la fecha de entrada.", "Pregunta qué muebles hay en la habitación.", "Pregunta qué espacios son compartidos en la casa.", "Pregunta qué transporte hay cerca, por ejemplo tranvía o autobús.", "Pregunta si necesitas llave, depósito o alguna regla para las visitas.", "Termina la conversación de forma amable."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Nach Mietdetails fragen', '', '{"scenario": "Du besichtigst ein möbliertes Zimmer in einem geteilten Haus. Du möchtest wissen, ob es für deinen baldigen Einzug passt, und brauchst praktische Details.", "tasks": ["Begrüße die Person und sag, dass du Informationen über das Einzugsdatum möchtest.", "Frag, welche Möbel im Zimmer sind.", "Frag, welche Räume im Haus geteilt werden.", "Frag, welche Verkehrsmittel in der Nähe sind, zum Beispiel Straßenbahn oder Bus.", "Frag, ob du einen Schlüssel, eine Kaution oder Regeln für Besuche beachten musst.", "Beende das Gespräch freundlich."]}'::jsonb);
END;
$seed$;

