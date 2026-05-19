-- ============================================================
-- Seed: A0 English Path – STEP 2760 – Speaking – Habla para confirmar instrucciones después de una operación
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2760 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2760, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para confirmar instrucciones después de una operación', 'Practica cómo repetir cuidados básicos después de una operación y cómo pedir aclaraciones.', '{"scenario": "Te dan el alta después de una operación pequeña. Quieres confirmar lo que debes hacer en casa durante los próximos días.", "tasks": ["Pregunta cuánto tiempo debes descansar.", "Pregunta cómo debe estar el vendaje.", "Pregunta si puedes conducir o llevar peso hoy.", "Pregunta qué puedes comer esta noche.", "Pregunta cuándo tienes que volver al hospital o a la clínica.", "Pregunta qué síntomas son una señal de alarma.", "Repite las instrucciones principales con tus propias palabras.", "Termina dando las gracias y confirmando que has entendido todo."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um Anweisungen nach einer Operation zu bestätigen', 'Übe, wie du grundlegende Pflegehinweise nach einer Operation wiederholst und wie du nachfragst.', '{"scenario": "Du wirst nach einer kleinen Operation entlassen. Du möchtest bestätigen, was du in den nächsten Tagen zu Hause tun sollst.", "tasks": ["Frage, wie lange du ruhen sollst.", "Frage, wie der Verband sein soll.", "Frage, ob du heute fahren oder Gewicht tragen darfst.", "Frage, was du heute Abend essen kannst.", "Frage, wann du ins Krankenhaus oder in die Klinik zurückkommen musst.", "Frage, welche Symptome ein Warnzeichen sind.", "Wiederhole die wichtigsten Anweisungen mit deinen eigenen Worten.", "Beende das Gespräch mit einem Dank und einer Bestätigung, dass du alles verstanden hast."]}'::jsonb);
END;
$seed$;
