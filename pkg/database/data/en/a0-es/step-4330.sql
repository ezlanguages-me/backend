-- ============================================================
-- Seed: A0 English Path – STEP 4330 – Speaking – dictate a business message clearly (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4330 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4330, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Dicta un mensaje de negocios con claridad', 'Practica cómo dictar oralmente un mensaje de trabajo corto de forma clara, con pausas y puntuación nombrada.', '{"scenario": "Necesitas dictar un mensaje de trabajo a un asistente o colega que lo escribirá. Quieres practicar cómo dictar con claridad, indicando la puntuación y el formato.", "tasks": ["Avisa al asistente de que vas a dictar y pídele que esté listo.", "Indica el destinatario con nombre completo y empresa.", "Dicta el saludo con puntuación nombrada en voz alta.", "Dicta la primera oración del mensaje con datos clave.", "Nombra la puntuación al final de cada oración.", "Incluye al menos una referencia o número y deletrea o repite si es necesario.", "Dicta el cierre formal del mensaje.", "Pide al asistente que repita el mensaje para comprobar la exactitud."]}'::jsonb),
        (v_item_id, 'de', 'Diktiere eine Geschäftsnachricht klar', 'Übe, wie man mündlich eine kurze Arbeitsnachricht klar diktiert, mit Pausen und laut genannter Zeichensetzung.', '{"scenario": "Du musst einem Assistenten oder Kollegen eine Arbeitsnachricht diktieren, der sie aufschreiben wird. Du möchtest üben, klar zu diktieren, mit Zeichensetzung und Format.", "tasks": ["Informiere den Assistenten, dass du diktieren wirst, und bitte ihn, bereit zu sein.", "Nenne den Empfänger mit vollem Namen und Unternehmen.", "Diktiere die Anrede mit laut genannter Zeichensetzung.", "Diktiere den ersten Satz der Nachricht mit Schlüsseldaten.", "Nenne die Zeichensetzung am Ende jedes Satzes.", "Füge mindestens eine Referenz oder Nummer ein und buchstabiere oder wiederhole bei Bedarf.", "Diktiere den formellen Abschluss der Nachricht.", "Bitte den Assistenten, die Nachricht zur Überprüfung der Genauigkeit vorzulesen."]}'::jsonb);
END;
$seed$;
