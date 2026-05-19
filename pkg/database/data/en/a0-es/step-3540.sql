-- ============================================================
-- Seed: A0 English Path – STEP 3540 – Speaking – describe your work area (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3540 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3540, 'en', 'speaking', 'professional')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Describe tu zona de trabajo', 'Ensaya una presentación oral sencilla de tu espacio de trabajo y del material que usas cada día.', '{"scenario": "Has empezado a trabajar en una pequeña oficina con almacén. Vas a grabar una descripción corta para un compañero nuevo para explicarle cómo es tu zona de trabajo.", "tasks": ["Di en qué parte de la empresa trabajas: oficina, recepción, almacén o taller.", "Describe dónde está tu mesa o tu puesto dentro de esa zona.", "Menciona dos objetos importantes que siempre tienes cerca.", "Explica dónde guardas documentos, cajas o herramientas.", "Di qué equipo usas cada día, por ejemplo ordenador, teléfono o escáner.", "Describe una zona de seguridad o una regla importante en ese espacio.", "Menciona quién trabaja cerca de ti y cómo os ayudáis.", "Termina explicando una tarea simple que haces allí cada mañana."]}'::jsonb),
        (v_speaking_id, 'de', 'Beschreibe deinen Arbeitsbereich', 'Übe eine einfache mündliche Beschreibung deines Arbeitsplatzes und der Dinge, die du jeden Tag benutzt.', '{"scenario": "Du hast eine neue Stelle in einem kleinen Büro mit Lager begonnen. Du willst eine kurze Aufnahme für einen neuen Kollegen machen und erklären, wie dein Arbeitsbereich aussieht.", "tasks": ["Sag, in welchem Teil der Firma du arbeitest: Büro, Empfang, Lager oder Werkstatt.", "Beschreibe, wo dein Tisch oder dein Platz in diesem Bereich ist.", "Nenne zwei wichtige Dinge, die immer in deiner Nähe sind.", "Erkläre, wo du Dokumente, Kartons oder Werkzeuge aufbewahrst.", "Sag, welches Gerät du jeden Tag benutzt, zum Beispiel Computer, Telefon oder Scanner.", "Beschreibe einen Sicherheitsbereich oder eine wichtige Regel in diesem Raum.", "Nenne, wer in deiner Nähe arbeitet und wie ihr euch helft.", "Beende die Aufnahme mit einer einfachen Aufgabe, die du dort jeden Morgen machst."]}'::jsonb);
END;
$seed$;
