-- ============================================================
-- Seed: A0 English Path – STEP 4830 – Speaking – make a professional phone call (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4830 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4830, 'en', 'speaking', 'professional')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Hacer una llamada profesional', '', '{"scenario": "Vas a llamar a un proveedor para confirmar una entrega de oficina y aclarar algunos detalles antes del final del día.", "tasks": ["Saluda e identifícate con tu nombre y tu empresa.", "Explica por qué llamas hoy.", "Pregunta si es un buen momento para hablar.", "Confirma qué pedido o entrega estás revisando.", "Pregunta la fecha y la hora previstas de entrega.", "Aclara un detalle práctico como la puerta, la dirección o el número de contacto.", "Repite la información importante para comprobar que es correcta.", "Cierra la llamada con una despedida profesional."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Ein professionelles Telefonat führen', '', '{"scenario": "Du rufst einen Lieferanten an, um eine Bürolieferung zu bestätigen und vor Tagesende einige Details zu klären.", "tasks": ["Begrüße die Person und nenne deinen Namen und deine Firma.", "Erkläre, warum du heute anrufst.", "Frag, ob es ein guter Moment zum Sprechen ist.", "Bestätige, welche Bestellung oder Lieferung du prüfst.", "Frag nach dem geplanten Lieferdatum und der Uhrzeit.", "Klär ein praktisches Detail wie Tor, Adresse oder Telefonnummer.", "Wiederhole die wichtigen Informationen zur Kontrolle.", "Beende das Gespräch mit einer professionellen Verabschiedung."]}'::jsonb);
END;
$seed$;
