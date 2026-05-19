-- ============================================================
-- Seed: A0 English Path – STEP 4870 – Speaking – leave a clear voicemail (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4870 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4870, 'en', 'speaking', 'professional')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Dejar un mensaje de voz claro', '', '{"scenario": "No consigues hablar con una persona de contacto y tienes que dejar un mensaje profesional y claro sobre una reunión o una entrega.", "tasks": ["Di tu nombre y tu empresa al comienzo.", "Explica brevemente por qué llamas.", "Menciona el pedido, la reunión o el asunto concreto.", "Da una hora, una fecha o un plazo importante.", "Incluye un número de teléfono para devolver la llamada.", "Repite el número con calma.", "Indica qué acción necesitas de la otra persona.", "Termina con una frase profesional y cortés."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine klare Voicemail hinterlassen', '', '{"scenario": "Du erreichst eine Kontaktperson nicht direkt und musst eine klare professionelle Voicemail zu einem Meeting oder einer Lieferung hinterlassen.", "tasks": ["Nenne am Anfang deinen Namen und deine Firma.", "Erkläre kurz, warum du anrufst.", "Nenne die Bestellung, das Meeting oder das konkrete Thema.", "Gib eine wichtige Uhrzeit, ein Datum oder eine Frist an.", "Nenne eine Telefonnummer für den Rückruf.", "Wiederhole die Nummer ruhig.", "Sag, welche Handlung du von der anderen Person brauchst.", "Beende die Nachricht mit einem höflichen professionellen Satz."]}'::jsonb);
END;
$seed$;
