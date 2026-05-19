-- ============================================================
-- Seed: A0 English Path – STEP 2640 – Speaking – Habla para explicar qué te pasa
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2640 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2640, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para explicar qué te pasa', 'Practica cómo describir síntomas básicos en una farmacia, en el médico o en el hospital.', '{"scenario": "Estás en una farmacia o delante de un profesional de salud. Necesitas explicar con frases cortas qué te pasa y desde cuándo.", "tasks": ["Saluda y di que no te encuentras bien.", "Di uno o dos síntomas claros: cough, sore throat, headache, toothache...", "Di si tienes fiebre o no.", "Explica desde cuándo tienes el problema.", "Di si tienes alergia a alguna medicina.", "Pregunta qué puedes tomar o qué debes hacer.", "Pregunta cuándo debes volver al médico si empeoras.", "Termina agradeciendo la ayuda."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um zu erklären, was dir fehlt', 'Übe, wie du grundlegende Symptome in der Apotheke, beim Arzt oder im Krankenhaus beschreibst.', '{"scenario": "Du bist in einer Apotheke oder vor einer medizinischen Fachkraft. Du musst mit kurzen Sätzen erklären, was dir fehlt und seit wann.", "tasks": ["Begrüße die Person und sage, dass es dir nicht gut geht.", "Nenne ein oder zwei klare Symptome: cough, sore throat, headache, toothache ...", "Sage, ob du Fieber hast oder nicht.", "Erkläre, seit wann du das Problem hast.", "Sage, ob du gegen ein Medikament allergisch bist.", "Frage, was du nehmen kannst oder was du tun sollst.", "Frage, wann du wieder zum Arzt gehen sollst, wenn es schlimmer wird.", "Beende das Gespräch mit einem Dank."]}'::jsonb);
END;
$seed$;
