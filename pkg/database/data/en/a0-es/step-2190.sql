-- ============================================================
-- Seed: A0 English Path – STEP 2190 – Speaking – ask basic questions about the food in relation to the menu, and about the services available (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2190 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2190, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Preguntar por platos y servicios del restaurante', '', '{"scenario": "Estás entrando en un restaurante. Necesitas hacer preguntas básicas sobre la comida y también sobre los servicios disponibles.", "tasks": ["Pregunta si una sopa o ensalada es vegetariana.", "Pregunta con qué acompañamiento viene un plato.", "Pregunta si tienen comida para llevar.", "Pregunta si hay terraza o mesas fuera.", "Pregunta si tienen agua gratis o menú infantil.", "Haz una pregunta sobre una bebida.", "Pide una recomendación simple.", "Termina diciendo qué opción te interesa más."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Nach Gerichten und Restaurantservice fragen', '', '{"scenario": "Du kommst in ein Restaurant. Du musst einfache Fragen zum Essen und auch zu den verfügbaren Services stellen.", "tasks": ["Frage, ob eine Suppe oder ein Salat vegetarisch ist.", "Frage, mit welcher Beilage ein Gericht kommt.", "Frage, ob es Essen zum Mitnehmen gibt.", "Frage, ob es eine Terrasse oder Tische draußen gibt.", "Frage, ob es kostenloses Wasser oder ein Kindermenü gibt.", "Stelle eine Frage zu einem Getränk.", "Bitte um eine einfache Empfehlung.", "Beende damit, welche Option dich am meisten interessiert."]}'::jsonb);
END;
$seed$;
