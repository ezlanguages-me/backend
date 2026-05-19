-- ============================================================
-- Seed: A0 English Path – STEP 2840 – Speaking – Habla para pedir información sobre productos sin receta
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2840 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2840, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para pedir información sobre productos sin receta', 'Practica cómo pedir un producto sin receta, preguntar por la dosis y entender una advertencia básica.', '{"scenario": "Estás en la farmacia y quieres un producto sin receta para un problema sencillo como alergia, tos, nariz tapada o dolor muscular.", "tasks": ["Saluda y di qué síntoma tienes.", "Pregunta qué producto sin receta puede ayudarte.", "Pregunta cuántas veces al día debes tomarlo o usarlo.", "Pregunta si también sirve para un niño o para otra persona.", "Pregunta si hay una advertencia importante.", "Pregunta si puedes combinarlo con otro producto simple.", "Di qué producto eliges al final.", "Termina agradeciendo la explicación."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um Informationen über rezeptfreie Produkte zu erfragen', 'Übe, wie du nach einem rezeptfreien Produkt fragst, nach der Dosis fragst und eine einfache Warnung verstehst.', '{"scenario": "Du bist in der Apotheke und möchtest ein rezeptfreies Produkt für ein einfaches Problem wie Allergie, Husten, verstopfte Nase oder Muskelschmerzen.", "tasks": ["Begrüße die Person und sage, welches Symptom du hast.", "Frage, welches rezeptfreie Produkt dir helfen kann.", "Frage, wie oft am Tag du es nehmen oder benutzen sollst.", "Frage, ob es auch für ein Kind oder für eine andere Person geeignet ist.", "Frage, ob es eine wichtige Warnung gibt.", "Frage, ob du es mit einem anderen einfachen Produkt kombinieren kannst.", "Sage, welches Produkt du am Ende wählst.", "Beende das Gespräch mit einem Dank für die Erklärung."]}'::jsonb);
END;
$seed$;
