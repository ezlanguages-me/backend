-- ============================================================
-- Seed: A0 English Path – STEP 530 – Speaking – make a simple complaint, for example ‘The cooker is broken. Can you replace it?’ (Alquileres)
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
    VALUES (v_path_id, 530, 'en', 'speaking', 'accommodation') RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'es', 'Hablar con el casero', '{"scenario": "Llamas a tu casero porque hay varios problemas en tu piso. Explica qué está roto, por qué es un problema urgente y pide una solución concreta.", "tasks": ["Saluda al casero, di tu nombre y el número de tu piso.", "Di que la cocina está rota y que no puedes cocinar.", "Pregunta si puede reemplazarla o arreglarla lo antes posible.", "Menciona otro problema, por ejemplo la lavadora o la calefacción.", "Di por qué ese segundo problema también es urgente.", "Pregunta cuándo puede venir y di en qué horario estás en casa.", "Termina la llamada de forma educada."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'de', 'Mit dem Vermieter sprechen', '{"scenario": "Du rufst deinen Vermieter an, weil es mehrere Probleme in deiner Wohnung gibt. Erkläre, was kaputt ist, warum es dringend ist, und bitte um eine konkrete Lösung.", "tasks": ["Begrüße den Vermieter, nenne deinen Namen und deine Wohnungsnummer.", "Sage, dass der Herd kaputt ist und du nicht kochen kannst.", "Frage, ob er ihn so schnell wie möglich ersetzen oder reparieren kann.", "Erwähne ein weiteres Problem, zum Beispiel die Waschmaschine oder die Heizung.", "Sage, warum auch dieses zweite Problem dringend ist.", "Frage, wann er kommen kann, und nenne deine verfügbaren Zeiten.", "Beende das Gespräch höflich."]}'::jsonb);
END;
$seed$;
