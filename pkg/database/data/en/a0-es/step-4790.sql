-- ============================================================
-- Seed: A0 English Path – STEP 4790 – Speaking – take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking
    WHERE step_order = 4790
      AND path_uuid = v_path_id
      AND source_language = 'en'
      AND type = 'speaking';

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4790, 'en', 'speaking', 'professional')
    RETURNING uuid INTO v_item_id;

    INSERT INTO speaking_translation (
        speaking_uuid,
        language,
        title,
        description,
        prompt
    )
    VALUES (
        v_item_id,
        'es',
        'Practica tomar recados telefónicos complejos',
        'Practica cómo tomar y transmitir recados telefónicos detallados de forma profesional.',
        '{
    "scenario": "Una persona llama para dejar un recado complejo para un compañero que no está disponible. Practica cómo tomar el recado con todos los detalles, repetir la información para confirmar y transmitirla correctamente.",
    "tasks": [
        "Contesta el teléfono de forma profesional con el nombre de la empresa.",
        "Explica que la persona no está disponible y ofrece tomar un recado.",
        "Pide el nombre y empresa de quien llama.",
        "Anota el mensaje principal: qué ha cambiado, cuándo y dónde.",
        "Repite cada dato importante para confirmar.",
        "Pregunta si hay que traer documentos o hacer preparativos.",
        "Pide un número de teléfono o correo para devolver la llamada si es necesario.",
        "Confirma que darás el recado en cuanto la persona esté disponible."
    ]
}'::jsonb
    );

    INSERT INTO speaking_translation (
        speaking_uuid,
        language,
        title,
        description,
        prompt
    )
    VALUES (
        v_item_id,
        'de',
        'Übe das Aufnehmen komplexer Telefonnachrichten',
        'Übe, wie man detaillierte Telefonnachrichten professionell aufnimmt und weitergibt.',
        '{
    "scenario": "Eine Person ruft an, um eine komplexe Nachricht für einen nicht verfügbaren Kollegen zu hinterlassen. Üben Sie, die Nachricht mit allen Details aufzunehmen, die Informationen zu bestätigen und weiterzugeben.",
    "tasks": [
        "Nehmen Sie das Telefon professionell mit dem Firmennamen ab.",
        "Erklären Sie, dass die Person nicht verfügbar ist, und bieten Sie an, eine Nachricht aufzunehmen.",
        "Fragen Sie nach Namen und Firma des Anrufers.",
        "Notieren Sie die Hauptnachricht: was sich geändert hat, wann und wo.",
        "Wiederholen Sie jeden wichtigen Punkt zur Bestätigung.",
        "Fragen Sie, ob Dokumente mitgebracht oder Vorbereitungen getroffen werden müssen.",
        "Bitten Sie um eine Telefonnummer oder E-Mail für einen Rückruf.",
        "Bestätigen Sie, dass Sie die Nachricht weitergeben, sobald die Person verfügbar ist."
    ]
}'::jsonb
    );
END;
$seed$;
