-- ============================================================
-- Seed: A0 English Path – STEP 3100 – Speaking – deal with most situations likely to arise when hiring a car, boat, or similar transport
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3100 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3100, 'en', 'speaking', 'transport')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para resolver situaciones comunes al alquilar una barca', 'Practica cómo tratar precio, documentos, seguridad y devolución al alquilar una pequeña barca.', '{"scenario": "Estás en un puerto y quieres alquilar una pequeña barca para la tarde. Necesitas hablar del precio, de las normas y de qué hacer durante el alquiler.", "tasks": ["Saluda y di que quieres alquilar una barca pequeña para esta tarde.", "Pregunta cuánto cuesta por media jornada o por el día.", "Di cuántas personas van a ir contigo.", "Pregunta qué documento debes enseñar antes de salir.", "Comprueba si los chalecos salvavidas están incluidos.", "Pregunta qué debes hacer con el combustible o con la batería al volver.", "Pregunta qué pasa si vuelves un poco tarde o si cambia el tiempo.", "Termina confirmando la reserva y la forma de pago."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich über typische Situationen beim Mieten eines Boots', 'Übe, wie du Preis, Dokumente, Sicherheit und Rückgabe beim Mieten eines kleinen Boots regelst.', '{"scenario": "Du bist in einem Hafen und möchtest für den Nachmittag ein kleines Boot mieten. Du musst über den Preis, die Regeln und das Vorgehen während der Miete sprechen.", "tasks": ["Begrüße die Person und sag, dass du für heute Nachmittag ein kleines Boot mieten möchtest.", "Frage, wie viel es für einen halben Tag oder für den ganzen Tag kostet.", "Sag, wie viele Personen mit dir fahren.", "Frage, welches Dokument du vor der Abfahrt zeigen musst.", "Prüfe, ob die Schwimmwesten inklusive sind.", "Frage, was du mit dem Kraftstoff oder der Batterie bei der Rückgabe tun musst.", "Frage, was passiert, wenn du etwas zu spät zurückkommst oder wenn sich das Wetter ändert.", "Beende das Gespräch, indem du die Buchung und die Zahlungsart bestätigst."]}'::jsonb);
END;
$seed$;
