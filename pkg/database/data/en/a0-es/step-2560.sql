-- ============================================================
-- Seed: A0 English Path – STEP 2560 – Speaking – Habla para pedir una cita médica
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2560 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2560, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para pedir una cita médica', 'Practica cómo pedir una cita médica presencial y cómo repetir los datos importantes.', '{"scenario": "Estás en la recepción de un centro de salud. Quieres pedir una cita presencial para hoy o para mañana porque no te encuentras bien.", "tasks": ["Saluda y di que necesitas una cita médica.", "Explica el problema con palabras simples, por ejemplo sore throat, fever o cough.", "Pregunta si hay una cita libre hoy.", "Si no, pregunta por la próxima hora disponible.", "Da tu nombre y un número de teléfono simple.", "Pregunta qué documento debes llevar.", "Repite la hora de la cita para confirmar.", "Termina agradeciendo la ayuda y despidiéndote."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um einen Arzttermin zu vereinbaren', 'Übe, wie man persönlich einen Arzttermin vereinbart und wichtige Angaben wiederholt.', '{"scenario": "Du bist an der Rezeption eines Gesundheitszentrums. Du möchtest einen Termin für heute oder morgen vereinbaren, weil es dir nicht gut geht.", "tasks": ["Begrüße die Person und sage, dass du einen Arzttermin brauchst.", "Erkläre das Problem mit einfachen Wörtern, zum Beispiel sore throat, fever oder cough.", "Frage, ob heute ein Termin frei ist.", "Wenn nicht, frage nach der nächsten freien Uhrzeit.", "Nenne deinen Namen und eine einfache Telefonnummer.", "Frage, welches Dokument du mitbringen musst.", "Wiederhole die Uhrzeit des Termins zur Bestätigung.", "Beende das Gespräch mit einem Dank und einer höflichen Verabschiedung."]}'::jsonb);
END;
$seed$;
