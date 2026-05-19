-- ============================================================
-- Seed: A0 English Path – STEP 1390 – Speaking – ask to change money at a bank
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1390 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1390, 'en', 'speaking', 'financial')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Pide ayuda para sacar efectivo en un cajero', 'Habla con un empleado para entender cómo conseguir efectivo local con tu tarjeta.', '{"scenario": "Estás en el banco y quieres sacar moneda local de un cajero automático con una tarjeta extranjera. Habla con un empleado para pedir ayuda.", "tasks": ["Saluda y di que tienes una tarjeta extranjera.", "Explica que necesitas efectivo en moneda local.", "Pregunta si el cajero automático acepta tu tarjeta.", "Pregunta cómo cambiar el idioma de la pantalla.", "Pregunta cuál es la cantidad máxima que puedes sacar.", "Pregunta si hay una comisión por usar el cajero.", "Pregunta si puedes imprimir un recibo.", "Da las gracias y repite la información importante."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Bitte um Hilfe beim Geldabheben am Automaten', 'Sprich mit einem Mitarbeiter, um zu verstehen, wie du mit deiner Karte Bargeld in Landeswährung bekommst.', '{"scenario": "Du bist in der Bank und möchtest mit einer ausländischen Karte Landeswährung am Geldautomaten abheben. Sprich mit einem Mitarbeiter und bitte um Hilfe.", "tasks": ["Begrüße den Mitarbeiter und sag, dass du eine ausländische Karte hast.", "Erkläre, dass du Bargeld in der Landeswährung brauchst.", "Frag, ob der Geldautomat deine Karte akzeptiert.", "Frag, wie man die Sprache auf dem Bildschirm ändert.", "Frag, wie hoch der maximale Auszahlungsbetrag ist.", "Frag, ob es eine Gebühr für den Automaten gibt.", "Frag, ob du einen Beleg drucken kannst.", "Bedank dich und wiederhole die wichtigen Informationen."]}'::jsonb);
END;
$seed$;
