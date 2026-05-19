-- ============================================================
-- Seed: A0 English Path – STEP 2600 – Speaking – Habla para indicar la naturaleza del problema
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2600 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2600, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para indicar la naturaleza del problema', 'Practica cómo decir dónde te duele, cuándo empezó y qué otros síntomas tienes.', '{"scenario": "Estás en triaje y la enfermera te pide que indiques la parte del cuerpo que te duele. Puedes acompañar tus palabras con un gesto o con el dedo.", "tasks": ["Saluda y di que tienes un problema de salud.", "Di dónde te duele con una frase corta: my stomach, my back, my throat...", "Añade left side o right side si hace falta.", "Di cuándo empezó el problema.", "Di si tienes fiebre, tos, náuseas o mareo.", "Di si puedes caminar, comer o dormir bien.", "Pide ayuda o di que el dolor es fuerte.", "Termina con una pregunta simple, por ejemplo Can I see the doctor now?"]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um die Art des Problems anzugeben', 'Übe, wie du sagst, wo es weh tut, wann es begann und welche weiteren Symptome du hast.', '{"scenario": "Du bist in der Triage und die Krankenschwester bittet dich zu zeigen, welcher Körperteil weh tut. Du kannst deine Worte mit einer Geste oder dem Finger begleiten.", "tasks": ["Begrüße die Person und sage, dass du ein Gesundheitsproblem hast.", "Sage mit einem kurzen Satz, wo es weh tut: my stomach, my back, my throat ...", "Füge left side oder right side hinzu, wenn es nötig ist.", "Sage, wann das Problem begonnen hat.", "Sage, ob du fever, cough, nausea oder dizziness hast.", "Sage, ob du gut gehen, essen oder schlafen kannst.", "Bitte um Hilfe oder sage, dass der Schmerz stark ist.", "Beende mit einer einfachen Frage, zum Beispiel Can I see the doctor now?"]}'::jsonb);
END;
$seed$;
