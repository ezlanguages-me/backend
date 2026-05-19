-- ============================================================
-- Seed: A0 English Path – STEP 2110 – Speaking – make simple complaints, for example, 'The food is cold' (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2110 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2110, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Hacer una queja sencilla en un restaurante', '', '{"scenario": "Estás en un restaurante y tienes varios problemas sencillos con tu comida. Habla con el camarero y explica la situación con educación.", "tasks": ["Llama al camarero de manera amable.", "Di que tu comida está fría o no está bien.", "Menciona un segundo problema con el pan o la bebida.", "Pide una solución simple.", "Pregunta cuánto tiempo tardará.", "Responde a la disculpa del camarero.", "Confirma lo que quieres recibir ahora.", "Termina con una frase cortés."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine einfache Beschwerde im Restaurant machen', '', '{"scenario": "Du bist in einem Restaurant und hast mehrere einfache Probleme mit deinem Essen. Sprich höflich mit dem Kellner und erkläre die Situation.", "tasks": ["Rufe den Kellner freundlich.", "Sage, dass dein Essen kalt ist oder nicht stimmt.", "Nenne ein zweites Problem mit dem Brot oder dem Getränk.", "Bitte um eine einfache Lösung.", "Frage, wie lange es dauern wird.", "Reagiere auf die Entschuldigung des Kellners.", "Bestätige, was du jetzt bekommen möchtest.", "Beende mit einem höflichen Satz."]}'::jsonb);
END;
$seed$;
