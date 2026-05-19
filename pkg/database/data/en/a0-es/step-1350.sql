-- ============================================================
-- Seed: A0 English Path – STEP 1350 – Speaking – ask for simple post office services (Servicios Financieros y Postales)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1350 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1350, 'en', 'speaking', 'postal')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Pide ayuda con el franqueo internacional', 'Habla para resolver un envío internacional sencillo en la oficina de correos.', '{"scenario": "Estás en una oficina de correos y quieres enviar una tarjeta de cumpleaños al extranjero. Habla con el empleado para pedir ayuda con el franqueo y los pasos básicos.", "tasks": ["Saluda al empleado y di que quieres enviar una tarjeta al extranjero.", "Di a qué país va la tarjeta.", "Pregunta qué servicio es mejor para una carta simple.", "Pregunta cuántos sellos necesitas o cuánto cuesta el envío.", "Pregunta si debes escribir el código postal o un formulario extra.", "Pregunta cuánto tarda en llegar.", "Pide un recibo o una confirmación del envío.", "Da las gracias y despídete de forma educada."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Bitte um Hilfe beim internationalen Porto', 'Sprich, um einen einfachen internationalen Versand in der Postfiliale zu erledigen.', '{"scenario": "Du bist in einer Postfiliale und möchtest eine Geburtstagskarte ins Ausland schicken. Sprich mit dem Mitarbeiter und bitte um Hilfe beim Porto und bei den einfachen Schritten.", "tasks": ["Begrüße den Mitarbeiter und sag, dass du eine Karte ins Ausland schicken möchtest.", "Sag, in welches Land die Karte geht.", "Frag, welcher Service für einen einfachen Brief am besten ist.", "Frag, wie viele Briefmarken du brauchst oder wie viel der Versand kostet.", "Frag, ob du die Postleitzahl oder ein zusätzliches Formular schreiben musst.", "Frag, wie lange die Zustellung dauert.", "Bitte um einen Beleg oder eine Versandbestätigung.", "Bedank dich und verabschiede dich höflich."]}'::jsonb);
END;
$seed$;
