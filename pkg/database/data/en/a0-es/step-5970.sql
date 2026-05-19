-- ============================================================
-- Seed: A0 English Path – STEP 5970 – Speaking – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5970 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5970, 'en', 'speaking', 'Alojamiento')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Haz peticiones en el hotel', 'Practica cómo pedir toallas, salida tardía, taxis y ayuda en el hotel.', '{"scenario": "You are staying in a hotel and need to make polite requests at the front desk. Ask for towels, a taxi, late checkout, and help with your room.", "tasks": ["Greet the receptionist politely.", "Ask for an extra towel.", "Ask for a wake-up call.", "Ask for a taxi for tomorrow morning.", "Ask if late checkout is possible.", "Ask for help with the Wi-Fi or room key.", "Ask where breakfast is served.", "Finish politely and thank the receptionist."]}'::jsonb),
        (v_speaking_id, 'de', 'Stelle Anfragen im Hotel', 'Übe, wie man im Hotel Handtücher, späteren Check-out, Taxis und Hilfe anfragt.', '{"scenario": "Du übernachtest in einem Hotel und musst höfliche Anfragen an der Rezeption stellen. Bitte um Handtücher, ein Taxi, späteren Check-out und Hilfe im Zimmer.", "tasks": ["Begrüße die Rezeption höflich.", "Bitte um ein zusätzliches Handtuch.", "Bitte um einen Weckruf.", "Bitte um ein Taxi für morgen früh.", "Frage, ob späterer Check-out möglich ist.", "Bitte um Hilfe mit WLAN oder Zimmerschlüssel.", "Frage, wo das Frühstück serviert wird.", "Beende das Gespräch höflich und bedanke dich."]}'::jsonb);
END;
$seed$;

