-- ============================================================
-- Seed: A0 English Path – STEP 1430 – Speaking – ask to open an account at a bank
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1430 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1430, 'en', 'speaking', 'banking')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Pregunta por tipos de cuenta en el banco', 'Habla con el banco para comparar tipos de cuenta antes de abrir una.', '{"scenario": "Estás en un banco y quieres entender la diferencia entre una cuenta básica y una cuenta de ahorro antes de abrir una.", "tasks": ["Saluda y di que quieres abrir una cuenta.", "Pregunta qué tipos de cuenta tiene el banco.", "Pregunta cuál es mejor para pagos diarios.", "Pregunta cuál es mejor para ahorrar dinero.", "Pregunta si hay cuota mensual en cada cuenta.", "Pregunta si ambas cuentas tienen tarjeta de débito y banca en línea.", "Pregunta cuál es el depósito inicial mínimo.", "Di qué cuenta prefieres y explica por qué."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Frage nach Kontoarten in der Bank', 'Sprich mit der Bank, um Kontoarten vor der Eröffnung zu vergleichen.', '{"scenario": "Du bist in einer Bank und möchtest den Unterschied zwischen einem Basiskonto und einem Sparkonto verstehen, bevor du eines eröffnest.", "tasks": ["Begrüße den Mitarbeiter und sag, dass du ein Konto eröffnen möchtest.", "Frag, welche Kontoarten die Bank hat.", "Frag, welches Konto besser für tägliche Zahlungen ist.", "Frag, welches Konto besser zum Sparen ist.", "Frag, ob es bei den Konten eine monatliche Gebühr gibt.", "Frag, ob beide Konten eine Debitkarte und Online-Banking haben.", "Frag, wie hoch die Mindesteinzahlung ist.", "Sag, welches Konto du bevorzugst und warum."]}'::jsonb);
END;
$seed$;
