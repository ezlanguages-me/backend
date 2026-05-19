-- ============================================================
-- Seed: A0 English Path – STEP 5930 – Speaking – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5930 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5930, 'en', 'speaking', 'Alojamiento')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla sobre situaciones en el hotel', 'Practica cómo responder y pedir ayuda en recepción, en la habitación y en el restaurante del hotel.', '{"scenario": "You are staying in a hotel and need help with simple problems. Ask about breakfast, the room key, messages, and late arrival.", "tasks": ["Greet the receptionist politely.", "Say you have a booking.", "Ask where breakfast is served.", "Ask what time breakfast starts.", "Ask for a wake-up call.", "Ask about Wi-Fi or the room key.", "Ask if someone can take a message for you.", "Finish politely and thank the staff."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich über Hotelsituationen', 'Übe, wie man an der Rezeption, im Zimmer und im Hotelrestaurant reagiert und um Hilfe bittet.', '{"scenario": "Du übernachtest in einem Hotel und brauchst Hilfe bei einfachen Problemen. Frage nach Frühstück, Zimmerschlüssel, Nachrichten und später Ankunft.", "tasks": ["Begrüße die Rezeption höflich.", "Sage, dass du eine Buchung hast.", "Frage, wo das Frühstück serviert wird.", "Frage, wann das Frühstück beginnt.", "Bitte um einen Weckruf.", "Frage nach WLAN oder dem Zimmerschlüssel.", "Frage, ob jemand eine Nachricht für dich aufnehmen kann.", "Beende das Gespräch höflich und bedanke dich."]}'::jsonb);
END;
$seed$;

