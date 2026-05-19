-- ============================================================
-- Seed: A0 English Path – STEP 7280 – Speaking – compose a personal email message (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7280 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7280, 'en', 'speaking', 'communication')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Compón un correo personal', 'Practica cómo crear un correo personal breve, claro y amable.', '{"scenario": "Tu amigo te ha escrito para invitarte a pasar un fin de semana en su ciudad. Ahora vas a componer un correo personal de respuesta con información práctica, noticias y un tono cercano.", "tasks": ["Escribe una línea de asunto breve y clara.", "Empieza con un saludo natural usando el nombre de tu amigo.", "Da las gracias por la invitación o por el mensaje recibido.", "Di claramente si aceptas, dudas o no puedes ir.", "Añade dos detalles prácticos, por ejemplo fecha, hora o transporte.", "Cuenta una noticia personal corta para que el correo suene cercano.", "Haz una pregunta sencilla para continuar la conversación.", "Cierra con una despedida amable y tu nombre, y luego léelo en voz alta una vez."]}'::jsonb),
        (v_speaking_id, 'de', 'Verfasse eine persönliche E-Mail', 'Übe, wie man eine kurze, klare und freundliche persönliche E-Mail schreibt.', '{"scenario": "Dein Freund hat dir geschrieben und dich eingeladen, ein Wochenende in seiner Stadt zu verbringen. Jetzt verfasst du eine persönliche Antwort-E-Mail mit praktischen Informationen, Neuigkeiten und einem nahen Ton.", "tasks": ["Schreibe eine kurze und klare Betreffzeile.", "Beginne mit einer natürlichen Begrüßung und dem Namen deines Freundes.", "Bedanke dich für die Einladung oder für die erhaltene Nachricht.", "Sage klar, ob du zusagst, unsicher bist oder nicht kommen kannst.", "Füge zwei praktische Details hinzu, zum Beispiel Datum, Uhrzeit oder Verkehrsmittel.", "Berichte eine kurze persönliche Neuigkeit, damit die E-Mail nah wirkt.", "Stelle eine einfache Frage, um das Gespräch fortzusetzen.", "Beende die E-Mail mit einer freundlichen Verabschiedung und deinem Namen und lies sie danach einmal laut vor."]}'::jsonb);
END;
$seed$;
