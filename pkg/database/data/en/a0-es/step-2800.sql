-- ============================================================
-- Seed: A0 English Path – STEP 2800 – Speaking – Habla para preguntar por servicios de salud
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2800 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2800, 'en', 'speaking', 'health')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para preguntar por servicios de salud', 'Practica cómo pedir información sobre servicios, documentos y derechos en un centro de salud.', '{"scenario": "Acabas de llegar a un centro de salud nuevo y quieres saber qué servicios hay y cómo registrarte.", "tasks": ["Saluda y di que eres un paciente nuevo.", "Pregunta qué servicios hay en el centro.", "Pregunta para qué sirve urgent care.", "Pregunta si hay ayuda de intérprete o traducción.", "Pregunta qué documentos necesitas para registrarte.", "Pregunta si un niño puede usar la clínica de enfermería.", "Pregunta si hay que reservar un servicio antes.", "Termina resumiendo qué debes llevar y hacer."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um nach Gesundheitsdiensten zu fragen', 'Übe, wie du in einem Gesundheitszentrum nach Diensten, Dokumenten und Ansprüchen fragst.', '{"scenario": "Du kommst gerade in ein neues Gesundheitszentrum und möchtest wissen, welche Dienste es gibt und wie du dich anmeldest.", "tasks": ["Begrüße die Person und sage, dass du ein neuer Patient bist.", "Frage, welche Dienste es im Zentrum gibt.", "Frage, wofür urgent care da ist.", "Frage, ob es Dolmetscherhilfe oder Übersetzung gibt.", "Frage, welche Dokumente du zur Anmeldung brauchst.", "Frage, ob ein Kind die Pflegeklinik nutzen kann.", "Frage, ob man einen Dienst vorher buchen muss.", "Beende das Gespräch damit, zusammenzufassen, was du mitbringen und tun musst."]}'::jsonb);
END;
$seed$;
