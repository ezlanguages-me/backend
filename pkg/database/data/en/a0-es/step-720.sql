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
    VALUES (v_path_id, 720, 'en', 'speaking', 'communication')RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'es', 'Dejar un mensaje sencillo', '{"scenario": "Quieres dejar un mensaje de teléfono sencillo para que alguien sepa cuándo llegas y dónde encontrarte. Practica decir quién eres, la hora, el lugar y cómo reconocerte.", "tasks": ["Empieza el mensaje saludando y di tu nombre con claridad.", "Di cuándo llegas o a qué hora te encontrarás con la persona.", "Di dónde estará la persona o adónde debe ir, por ejemplo la estación o recepción.", "Menciona algo que ayude a reconocerte, como la ropa que llevarás o algo que tendrás contigo.", "Pide que te devuelvan la llamada para confirmar que han recibido el mensaje.", "Di lo que harás si no te contestan, por ejemplo que les volverás a llamar más tarde.", "Termina el mensaje con una despedida corta y natural."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'de', 'Nachricht hinterlassen', '{"scenario": "Du möchtest eine einfache Telefonnachricht hinterlassen, damit jemand weiß, wann du ankommst und wo er dich finden kann. Übe, wer du bist, die Uhrzeit, den Ort und wie man dich erkennen kann zu sagen.", "tasks": ["Beginne die Nachricht mit einem Gruß und nenne deinen Namen deutlich.", "Sag, wann du ankommst oder zu welcher Uhrzeit ihr euch treffen werdet.", "Sag, wo die Person sein wird oder wohin sie gehen soll, zum Beispiel zum Bahnhof oder zur Rezeption.", "Erwähne etwas, das beim Erkennen hilft, zum Beispiel was du trägst oder dabei hast.", "Bitte um einen Rückruf, um zu bestätigen, dass die Nachricht angekommen ist.", "Sag, was du tust, falls du keine Antwort bekommst, zum Beispiel später noch einmal anrufst.", "Beende die Nachricht mit einer kurzen, natürlichen Verabschiedung."]}'::jsonb);
END;
$seed$;
