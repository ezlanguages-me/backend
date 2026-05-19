-- ============================================================
-- Seed: A0 English Path – STEP 4250 – Speaking – report on work progress (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4250 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4250, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Informa sobre el progreso de un trabajo', 'Practica cómo dar un informe oral del avance de un proyecto con fases, plazos y presupuesto.', '{"scenario": "Tu jefe te pide una actualización oral del estado de un proyecto en curso. Quieres practicar cómo informar de forma clara y estructurada.", "tasks": ["Saluda y agradece la oportunidad de dar el informe.", "Indica el nombre del proyecto del que informas.", "Describe el estado de la fase actual del proyecto.", "Menciona si hay algún retraso o problema y su causa.", "Explica la solución o el plan para resolver el problema.", "Informa sobre el estado del presupuesto.", "Di cuál es el próximo paso o la próxima fase.", "Ofrece enviar un informe escrito completo para confirmar los detalles."]}'::jsonb),
        (v_item_id, 'de', 'Berichte über den Arbeitsfortschritt', 'Übe, wie man mündlich einen Projektfortschrittsbericht mit Phasen, Fristen und Budget gibt.', '{"scenario": "Dein Vorgesetzter bittet dich um eine mündliche Aktualisierung des Stands eines laufenden Projekts. Du möchtest üben, klar und strukturiert zu berichten.", "tasks": ["Begrüße und danke für die Gelegenheit zum Bericht.", "Nenne den Namen des Projekts, über das du berichtest.", "Beschreibe den aktuellen Stand der Projektphase.", "Erwähne eventuelle Verzögerungen oder Probleme und ihre Ursache.", "Erkläre die Lösung oder den Plan zur Problembehebung.", "Informiere über den Budgetstand.", "Nenne den nächsten Schritt oder die nächste Phase.", "Biete an, einen vollständigen schriftlichen Bericht zur Bestätigung der Details zu schicken."]}'::jsonb);
END;
$seed$;
