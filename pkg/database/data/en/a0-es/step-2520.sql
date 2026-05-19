-- ============================================================
-- Seed: A0 English Path – STEP 2520 – Writing – Consultar sobre servicios disponibles en un alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 2520 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2520, 'en', 'writing', 'accommodation')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_writing_id, 'es', 'Consultar sobre servicios disponibles en un alojamiento', 'Practica cómo preguntar por instalaciones accesibles y por dietas especiales en un hotel o albergue.', '{"scenario": "Vas a reservar una habitación en un hotel para un viaje corto. Necesitas confirmar si el edificio tiene acceso para personas con movilidad reducida y si el restaurante puede ofrecer comidas especiales.", "tasks": ["Saluda y explica que quieres información antes de reservar.", "Pregunta si hay una habitación adaptada o acceso sin escaleras.", "Pregunta si el hotel tiene ascensor y baños accesibles.", "Consulta si hay plaza de aparcamiento cerca de la entrada.", "Pregunta si el restaurante ofrece dieta vegetariana, sin gluten o sin lactosa.", "Pregunta a qué hora se sirven las comidas especiales.", "Pide que te confirmen por escrito un servicio importante.", "Termina agradeciendo la información y diciendo si quieres continuar con la reserva."]}'::jsonb),
        (v_writing_id, 'de', 'Nach verfügbaren Dienstleistungen in einer Unterkunft fragen', 'Übe, wie man in einem Hotel oder Hostel nach barrierefreien Einrichtungen und Sonderkost fragt.', '{"scenario": "Du möchtest ein Zimmer in einem Hotel für eine kurze Reise buchen. Du musst bestätigen, ob das Gebäude barrierefreien Zugang hat und ob das Restaurant spezielle Mahlzeiten anbieten kann.", "tasks": ["Begrüße die Person und erkläre, dass du vor der Buchung Informationen möchtest.", "Frage, ob es ein angepasstes Zimmer oder einen Zugang ohne Treppen gibt.", "Frage, ob das Hotel einen Aufzug und barrierefreie Badezimmer hat.", "Erkundige dich, ob es einen Parkplatz nahe am Eingang gibt.", "Frage, ob das Restaurant vegetarische, glutenfreie oder laktosefreie Kost anbietet.", "Frage, wann die speziellen Mahlzeiten serviert werden.", "Bitte darum, dass dir ein wichtiger Service schriftlich bestätigt wird.", "Beende den Text mit einem Dank und sage, ob du mit der Buchung weitermachen möchtest."]}'::jsonb);
END;
$seed$;
