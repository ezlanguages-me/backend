-- ============================================================
-- Seed: A0 English Path – STEP 760 – Speaking – understand a simple phone message and confirm details of the message (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking
    WHERE step_order = 760 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 760, 'en', 'speaking', 'communication')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (
        v_speaking_id,
        'es',
        'Confirmar los datos de un mensaje de voz',
        'Practica una llamada corta para confirmar hora, fecha y lugar.',
        '{"scenario":"Tu amiga Nina te dejó un mensaje de voz. Dice que llega el viernes 12 de mayo a las 4:30 PM a Central Station y espera junto a la taquilla. Ahora la llamas para confirmar todos los datos.","tasks":["Saluda y di que has escuchado su mensaje.","Repite el día y la fecha para comprobarlos.","Repite la hora de llegada.","Confirma el lugar y la parte exacta de la estación.","Pregunta por la chaqueta y la bolsa para reconocerla.","Termina la llamada de forma amable y di que la verás allí."]}'::jsonb
    );

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (
        v_speaking_id,
        'de',
        'Details einer Sprachnachricht bestätigen',
        'Übe einen kurzen Anruf, um Uhrzeit, Datum und Ort zu bestätigen.',
        '{"scenario":"Deine Freundin Nina hat dir eine Sprachnachricht geschickt. Sie sagt, dass sie am Freitag, dem 12. Mai, um 16:30 Uhr am Central Station ankommt und beim Fahrkartenschalter wartet. Jetzt rufst du sie an, um alle Details zu bestätigen.","tasks":["Begrüße sie und sag, dass du ihre Nachricht gehört hast.","Wiederhole den Tag und das Datum zur Kontrolle.","Wiederhole die Ankunftszeit.","Bestätige den Ort und den genauen Teil des Bahnhofs.","Frage nach der Jacke und der Tasche, damit du sie erkennen kannst.","Beende das Gespräch freundlich und sag, dass du sie dort sehen wirst."]}'::jsonb
    );
END;
$seed$;
