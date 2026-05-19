-- ============================================================
-- Seed: A0 English Path – STEP 2680 – Speaking – Habla para repetir los consejos del médico
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2680 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2680, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para repetir los consejos del médico', 'Practica cómo decir qué te ha recomendado el médico y cómo confirmar si lo has entendido bien.', '{"scenario": "Acabas de salir de la consulta. Quieres repetir en voz alta los consejos principales del médico para comprobar que los has entendido.", "tasks": ["Empieza diciendo qué problema tienes según el médico.", "Di cuántos días debes descansar.", "Di qué debes beber o comer.", "Explica cuándo tomas la medicina.", "Di qué actividad no debes hacer esta semana.", "Di qué tienes que hacer si empeoras.", "Añade cuándo debes volver a la clínica.", "Termina con una frase de confirmación, por ejemplo I understand o Is that right?"]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um die Ratschläge des Arztes zu wiederholen', 'Übe, wie du sagst, was dir der Arzt empfohlen hat, und wie du bestätigst, dass du es verstanden hast.', '{"scenario": "Du kommst gerade aus der Sprechstunde. Du möchtest die wichtigsten Ratschläge des Arztes laut wiederholen, um zu prüfen, ob du sie verstanden hast.", "tasks": ["Beginne damit zu sagen, welches Problem du laut Arzt hast.", "Sage, wie viele Tage du ruhen sollst.", "Sage, was du trinken oder essen sollst.", "Erkläre, wann du das Medikament nimmst.", "Sage, welche Aktivität du diese Woche nicht machen sollst.", "Sage, was du tun musst, wenn es schlimmer wird.", "Füge hinzu, wann du in die Klinik zurückkommen sollst.", "Beende mit einem Bestätigungssatz, zum Beispiel I understand oder Is that right?"]}'::jsonb);
END;
$seed$;
