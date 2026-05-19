-- ============================================================
-- Seed: A0 English Path – STEP 2940 – Speaking – buy a ticket
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2940 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2940, 'en', 'speaking', 'transport')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para pedir billetes de metro', 'Practica cómo pedir el billete correcto en un punto de información del metro.', '{"scenario": "Estás en un punto de información del metro de una ciudad nueva. Quieres comprar los billetes correctos para ir al museo hoy con un niño y volver por la tarde.", "tasks": ["Saluda y di que necesitas billetes para el metro.", "Explica a dónde quieres ir hoy.", "Di cuántos adultos y cuántos niños viajan.", "Pregunta si necesitas un billete sencillo o de ida y vuelta.", "Pregunta cuánto cuesta el billete correcto.", "Pregunta dónde puedes comprar o validar el billete.", "Di si pagas con tarjeta o en efectivo.", "Termina con una despedida amable."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um U-Bahn-Fahrkarten zu verlangen', 'Übe, wie du am Informationspunkt die richtige Fahrkarte verlangst.', '{"scenario": "Du bist an einem U-Bahn-Informationspunkt in einer neuen Stadt. Du möchtest die richtigen Fahrkarten kaufen, um heute mit einem Kind zum Museum zu fahren und am Nachmittag zurückzukommen.", "tasks": ["Begrüße die Person und sag, dass du Fahrkarten für die U-Bahn brauchst.", "Erkläre, wohin du heute fahren möchtest.", "Sag, wie viele Erwachsene und wie viele Kinder fahren.", "Frage, ob du eine einfache Fahrkarte oder eine Hin- und Rückfahrkarte brauchst.", "Frage, wie viel die richtige Fahrkarte kostet.", "Frage, wo du die Fahrkarte kaufen oder entwerten kannst.", "Sag, ob du mit Karte oder bar bezahlst.", "Beende das Gespräch mit einer freundlichen Verabschiedung."]}'::jsonb);
END;
$seed$;
