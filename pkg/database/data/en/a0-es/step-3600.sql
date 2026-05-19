-- ============================================================
-- Seed: A0 English Path – STEP 3600 – Writing – write to a hotel in order to confirm accommodation, etc (Alojamiento)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 3600 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'writing';
    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3600, 'en', 'writing', 'accommodation')
    RETURNING uuid INTO v_item_id;
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Escribe para confirmar un alojamiento', 'Practica un email breve a un hotel para confirmar tu reserva y detalles prácticos.', '{"scenario": "Has reservado una habitación y ahora quieres escribir al hotel para confirmar la estancia y algunos detalles importantes antes de viajar.", "tasks": ["Escribe el saludo inicial al hotel.", "Indica tu nombre y el número de reserva si lo tienes.", "Confirma las fechas de llegada y salida.", "Di qué tipo de habitación esperas tener.", "Pregunta si el desayuno está incluido o a qué hora se sirve.", "Añade tu hora aproximada de llegada y menciona si será tarde.", "Pregunta por un detalle práctico, por ejemplo aparcamiento, ascensor o late check-in.", "Termina con un agradecimiento y una despedida cortés."]}'::jsonb),
        (v_item_id, 'de', 'Schreibe, um eine Unterkunft zu bestätigen', 'Übe eine kurze E-Mail an ein Hotel, um deine Buchung und praktische Details zu bestätigen.', '{"scenario": "Du hast ein Zimmer reserviert und möchtest jetzt dem Hotel schreiben, um den Aufenthalt und einige wichtige Details vor der Reise zu bestätigen.", "tasks": ["Schreibe die Begrüßung an das Hotel.", "Nenne deinen Namen und die Buchungsnummer, wenn du sie hast.", "Bestätige An- und Abreisedatum.", "Sag, welche Zimmerart du erwartest.", "Frage, ob das Frühstück inklusive ist oder wann es serviert wird.", "Nenne deine ungefähre Ankunftszeit und erwähne, wenn sie spät ist.", "Frage nach einem praktischen Detail, zum Beispiel Parkplatz, Aufzug oder spätem Check-in.", "Beende die Nachricht mit einem Dank und einer höflichen Verabschiedung."]}'::jsonb);
END;
$seed$;
