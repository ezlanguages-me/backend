-- ============================================================
-- Seed: A0 English Path – STEP 2230 – Speaking – ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2230 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2230, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Explicar restricciones alimentarias', '', '{"scenario": "Estás en un restaurante y necesitas explicar tus restricciones alimentarias antes de pedir. Habla con claridad y pide una alternativa segura.", "tasks": ["Di qué alergia o restricción tienes.", "Explica un ingrediente que no puedes comer.", "Pregunta si un plato es seguro para ti.", "Pregunta por una alternativa sin ese ingrediente.", "Di si también eres vegetariano o vegano, si quieres.", "Elige un plato que sí puedes comer.", "Pide una bebida sencilla.", "Da las gracias por la ayuda."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Essenseinschränkungen erklären', '', '{"scenario": "Du bist in einem Restaurant und musst vor der Bestellung deine Ernährungseinschränkungen erklären. Sprich klar und bitte um eine sichere Alternative.", "tasks": ["Sage, welche Allergie oder Einschränkung du hast.", "Erkläre eine Zutat, die du nicht essen kannst.", "Frage, ob ein Gericht für dich sicher ist.", "Frage nach einer Alternative ohne diese Zutat.", "Sage auch, ob du vegetarisch oder vegan bist, wenn du möchtest.", "Wähle ein Gericht, das du essen kannst.", "Bestelle ein einfaches Getränk.", "Bedanke dich für die Hilfe."]}'::jsonb);
END;
$seed$;
