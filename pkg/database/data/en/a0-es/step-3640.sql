-- ============================================================
-- Seed: A0 English Path – STEP 3640 – Speaking – make a hotel reservation by phone (Alojamiento)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3640 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3640, 'en', 'speaking', 'accommodation')
    RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Haz una reserva de hotel por teléfono', 'Practica una llamada para pedir disponibilidad, precio y detalles de una reserva.', '{"scenario": "Vas a llamar a un hotel para reservar una habitación. Antes de marcar, quieres preparar lo que vas a decir para que la llamada sea clara y corta.", "tasks": ["Saluda al hotel y di que quieres reservar una habitación.", "Indica las fechas de llegada y salida.", "Di cuántas noches te quedas.", "Pide un tipo de habitación, por ejemplo individual o doble.", "Pregunta el precio por noche y si el desayuno está incluido.", "Menciona tu hora aproximada de llegada.", "Da tu nombre y un número de teléfono de contacto.", "Termina confirmando la reserva y agradeciendo la ayuda."]}'::jsonb),
        (v_item_id, 'de', 'Reserviere telefonisch ein Hotelzimmer', 'Übe einen Anruf, um Verfügbarkeit, Preis und Details einer Buchung zu erfragen.', '{"scenario": "Du willst ein Hotel anrufen, um ein Zimmer zu reservieren. Vor dem Anruf möchtest du vorbereiten, was du sagen willst, damit das Gespräch klar und kurz ist.", "tasks": ["Begrüße das Hotel und sag, dass du ein Zimmer reservieren möchtest.", "Nenne An- und Abreisedatum.", "Sag, wie viele Nächte du bleibst.", "Bitte um eine Zimmerart, zum Beispiel Einzel- oder Doppelzimmer.", "Frage nach dem Preis pro Nacht und ob das Frühstück inklusive ist.", "Nenne deine ungefähre Ankunftszeit.", "Gib deinen Namen und eine Telefonnummer an.", "Beende den Anruf, indem du die Buchung bestätigst und dich bedankst."]}'::jsonb);
END;
$seed$;
