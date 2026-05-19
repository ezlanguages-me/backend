-- ============================================================
-- Seed: A0 English Path – STEP 4440 – Speaking – Realiza un pedido detallado por teléfono
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4440 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4440, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Realiza un pedido detallado por teléfono', 'Practica cómo realizar un pedido completo a un proveedor de forma clara y profesional.', '{"scenario": "Necesitas llamar a tu proveedor para hacer un pedido de varios productos de limpieza para tu empresa. Asegúrate de dar todos los detalles necesarios.", "tasks": ["Saluda e identifícate con tu nombre y empresa.", "Da tu número de cuenta al agente.", "Pide el primer producto indicando su referencia y cantidad.", "Pide el segundo producto indicando su referencia y cantidad.", "Confirma o facilita la dirección de entrega.", "Pregunta la fecha de entrega estimada.", "Pide que te lean el pedido de vuelta para verificarlo.", "Agradece y despídete de forma profesional."]}'::jsonb),
        (v_item_id, 'de', 'Gib eine detaillierte Bestellung per Telefon auf', 'Übe, wie man eine vollständige Bestellung klar und professionell bei einem Lieferanten aufgibt.', '{"scenario": "Du musst deinen Lieferanten anrufen, um mehrere Reinigungsprodukte für dein Unternehmen zu bestellen. Stelle sicher, dass du alle notwendigen Details angibst.", "tasks": ["Grüße und identifiziere dich mit deinem Namen und Unternehmen.", "Gib dem Mitarbeiter deine Kontonummer.", "Bestelle das erste Produkt mit Referenz und Menge.", "Bestelle das zweite Produkt mit Referenz und Menge.", "Bestätige oder gib die Lieferadresse an.", "Frage nach dem voraussichtlichen Lieferdatum.", "Bitte darum, dass die Bestellung zurückgelesen wird, um sie zu überprüfen.", "Bedanke dich und verabschiede dich professionell."]}'::jsonb);
END;
$seed$;
