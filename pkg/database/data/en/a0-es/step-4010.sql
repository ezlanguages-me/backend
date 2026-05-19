-- ============================================================
-- Seed: A0 English Path – STEP 4010 – Writing – handle a wide range of routine and non-routine situations in which professional services are requested (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 4010 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'writing';
    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4010, 'en', 'writing', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Escribe peticiones de servicios rutinarias y no rutinarias', 'Practica una solicitud escrita más completa para un servicio profesional con contexto, urgencia y necesidades especiales.', '{"scenario": "Tu empresa necesita pedir un servicio profesional que no es totalmente estándar, por ejemplo una reparación urgente, una visita extra o una instalación especial. Quieres escribir una solicitud clara y organizada.", "tasks": ["Escribe el saludo y presenta brevemente a tu empresa.", "Explica qué servicio necesitas y por qué lo necesitas ahora.", "Describe el problema o la situación de forma clara.", "Indica la fecha, hora o nivel de urgencia.", "Añade requisitos especiales como acceso, material, seguridad o horario.", "Explica qué resultado esperas del servicio.", "Pide confirmación de disponibilidad, coste o tiempo de respuesta.", "Cierra el mensaje con una despedida profesional y tus datos de contacto."]}'::jsonb),
        (v_item_id, 'de', 'Schreibe routinemäßige und nicht routinemäßige Serviceanfragen', 'Übe eine ausführlichere schriftliche Anfrage für einen professionellen Service mit Kontext, Dringlichkeit und besonderen Anforderungen.', '{"scenario": "Deine Firma muss einen professionellen Service anfragen, der nicht ganz standardmäßig ist, zum Beispiel eine dringende Reparatur, einen Zusatzbesuch oder eine besondere Installation. Du möchtest eine klare und gut strukturierte Anfrage schreiben.", "tasks": ["Schreibe die Begrüßung und stelle deine Firma kurz vor.", "Erkläre, welchen Service du brauchst und warum du ihn jetzt brauchst.", "Beschreibe das Problem oder die Situation klar.", "Nenne Datum, Uhrzeit oder Dringlichkeit.", "Füge besondere Anforderungen wie Zugang, Material, Sicherheit oder Zeitfenster hinzu.", "Erkläre, welches Ergebnis du vom Service erwartest.", "Bitte um Bestätigung von Verfügbarkeit, Kosten oder Reaktionszeit.", "Beende die Nachricht mit einer professionellen Verabschiedung und deinen Kontaktdaten."]}'::jsonb);
END;
$seed$;
