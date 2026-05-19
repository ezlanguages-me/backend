-- ============================================================
-- Seed: A0 English Path – STEP 720 – Speaking – understand simple phone messages (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking WHERE step_order = 720 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 720, 'en', 'speaking', 'communication')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Dejar un mensaje sencillo', '', '{"scenario": "Quieres dejar o repetir un mensaje de teléfono muy simple. Practica decir quién llama, la hora y una instrucción corta.", "tasks": ["Di tu nombre al empezar el mensaje.", "Di una hora simple, por ejemplo las 4:30 o las 8 AM.", "Di dónde estará la persona o dónde debe ir, por ejemplo la estación o recepción.", "Pide que te devuelvan la llamada o que te esperen.", "Termina con una despedida corta."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine einfache Nachricht hinterlassen', '', '{"scenario": "Du möchtest eine sehr einfache Telefonnachricht hinterlassen oder wiederholen. Übe zu sagen, wer anruft, die Uhrzeit und eine kurze Anweisung.", "tasks": ["Nenne am Anfang der Nachricht deinen Namen.", "Nenne eine einfache Uhrzeit, zum Beispiel 4:30 oder 8 Uhr.", "Sag, wo die Person sein wird oder wohin sie gehen soll, zum Beispiel zum Bahnhof oder zur Rezeption.", "Bitte um einen Rückruf oder darum, dass man auf dich wartet.", "Beende mit einer kurzen Verabschiedung."]}'::jsonb);
END;
$seed$;
