-- ============================================================
-- Seed: A0 English Path – STEP 4480 – Speaking – Da instrucciones de entrega a un proveedor
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4480 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4480, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Da instrucciones de entrega a un proveedor', 'Practica cómo dar instrucciones claras sobre cómo y cuándo entregar mercancía.', '{"scenario": "Un proveedor va a hacer una entrega en tu empresa esta semana. Necesitas darle instrucciones claras sobre el proceso de entrega.", "tasks": ["Saluda e identifícate con tu nombre y empresa.", "Indica el día y la franja horaria preferida para la entrega.", "Describe el lugar exacto donde deben dejar la mercancía.", "Explica si hay que avisar antes de llegar y con cuánta antelación.", "Indica si es necesario que alguien firme la entrega.", "Menciona si hay alguna restricción de acceso al edificio o almacén.", "Explica qué debe hacer el conductor si no hay nadie disponible.", "Agradece y confirma que esperáis la entrega."]}'::jsonb),
        (v_item_id, 'de', 'Gib Lieferanweisungen an einen Lieferanten', 'Übe, wie man klare Anweisungen dazu gibt, wie und wann Waren geliefert werden sollen.', '{"scenario": "Ein Lieferant wird diese Woche eine Lieferung in deinem Unternehmen vornehmen. Du musst klare Anweisungen zum Lieferprozess geben.", "tasks": ["Grüße und identifiziere dich mit deinem Namen und Unternehmen.", "Nenne den bevorzugten Tag und das Zeitfenster für die Lieferung.", "Beschreibe den genauen Ort, wo die Waren abgestellt werden sollen.", "Erkläre, ob vor der Ankunft Bescheid gegeben werden soll und wie früh.", "Teile mit, ob jemand die Lieferung unterschreiben muss.", "Erwähne eventuelle Zugangsbeschränkungen zum Gebäude oder Lager.", "Erkläre, was der Fahrer tun soll, wenn niemand verfügbar ist.", "Bedanke dich und bestätige, dass ihr die Lieferung erwartet."]}'::jsonb);
END;
$seed$;
