-- ============================================================
-- Seed: A0 English Path – STEP 3020 – Speaking – understand cost per hour and per day
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3020 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3020, 'en', 'speaking', 'transport')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para preguntar el precio por hora y por día de un kayak', 'Practica cómo pedir información básica sobre precio, tiempo e incluidos en un alquiler de kayak.', '{"scenario": "Estás en un lago y quieres alquilar un kayak. Necesitas preguntar el precio por hora y por día antes de decidir cuánto tiempo lo quieres.", "tasks": ["Saluda y di que quieres alquilar un kayak.", "Pregunta cuánto cuesta por una hora.", "Pregunta cuánto cuesta por un día entero.", "Di cuánto tiempo quieres el kayak.", "Pregunta si el chaleco salvavidas está incluido.", "Comprueba a qué hora debes devolver el kayak.", "Di si pagas ahora o pregunta si puedes pagar con tarjeta.", "Termina con una confirmación corta y amable."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um nach dem Preis pro Stunde und pro Tag für ein Kajak zu fragen', 'Übe, wie du einfache Informationen zu Preis, Dauer und Inklusivleistungen bei einem Kajakverleih fragst.', '{"scenario": "Du bist an einem See und möchtest ein Kajak mieten. Du musst nach dem Preis pro Stunde und pro Tag fragen, bevor du entscheidest, wie lange du es willst.", "tasks": ["Begrüße die Person und sag, dass du ein Kajak mieten möchtest.", "Frage, wie viel es für eine Stunde kostet.", "Frage, wie viel es für einen ganzen Tag kostet.", "Sag, wie lange du das Kajak möchtest.", "Frage, ob die Schwimmweste inklusive ist.", "Prüfe, bis wann du das Kajak zurückbringen musst.", "Sag, ob du jetzt bezahlst, oder frage, ob Kartenzahlung möglich ist.", "Beende das Gespräch mit einer kurzen freundlichen Bestätigung."]}'::jsonb);
END;
$seed$;
