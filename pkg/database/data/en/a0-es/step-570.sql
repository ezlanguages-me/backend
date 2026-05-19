-- ============================================================
-- Seed: A0 English Path – STEP 570 – Speaking – understand, and ask questions about, house rules/conventions, such as the time of meals (Convivencia)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking WHERE step_order = 570 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 570, 'en', 'speaking', 'social')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Preguntar por las normas', '', '{"scenario": "Acabas de llegar a casa de tu familia anfitriona. Habla con Sarah para entender horarios y normas básicas de la casa.", "tasks": ["Pregunta a qué hora es el desayuno.", "Pregunta qué pasa si llegas tarde a cenar.", "Pregunta hasta qué hora puedes usar la cocina.", "Pregunta cuándo es el día de la colada.", "Pregunta si puedes invitar a un amigo."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Nach den Regeln fragen', '', '{"scenario": "Du bist gerade im Haus deiner Gastfamilie angekommen. Sprich mit Sarah, um die Uhrzeiten und die wichtigsten Hausregeln zu verstehen.", "tasks": ["Frage, wann das Frühstück ist.", "Frage, was passiert, wenn du zu spät zum Abendessen kommst.", "Frage, bis wann du die Küche benutzen kannst.", "Frage, wann Waschtag ist.", "Frage, ob du einen Freund einladen kannst."]}'::jsonb);
END;
$seed$;
