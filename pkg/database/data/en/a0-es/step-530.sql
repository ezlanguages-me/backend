-- ============================================================
-- Seed: A0 English Path – STEP 530 – Speaking – make a simple complaint, for example 'The cooker is broken. Can you replace it?' (Alquileres)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking WHERE step_order = 530 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 530, 'en', 'speaking', 'accommodation')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Hablar con el casero', '', '{"scenario": "Tu casero te llama para hablar de varios problemas en tu piso. Explica qué está roto, di por qué es un problema y pide una solución sencilla con frases muy cortas.", "tasks": ["Saluda al casero y di tu nombre y tu piso.", "Di que la cocina está rota.", "Menciona otro problema, por ejemplo la lavadora o la calefacción.", "Pregunta si puede arreglar o cambiar la cocina.", "Di cuándo estás en casa para una visita."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Mit dem Vermieter sprechen', '', '{"scenario": "Dein Vermieter ruft dich an, um über mehrere Probleme in deiner Wohnung zu sprechen. Erkläre, was kaputt ist, warum es ein Problem ist, und bitte mit sehr kurzen Sätzen um eine einfache Lösung.", "tasks": ["Begrüße den Vermieter und nenne deinen Namen und deine Wohnung.", "Sage, dass der Herd kaputt ist.", "Nenne ein weiteres Problem, zum Beispiel die Waschmaschine oder die Heizung.", "Frage, ob er den Herd reparieren oder ersetzen kann.", "Sage, wann du für einen Besuch zu Hause bist."]}'::jsonb);
END;
$seed$;
