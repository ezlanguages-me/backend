-- ============================================================
-- Seed: A0 English Path – STEP 7470 – Speaking – make a limited contribution to meetings on practical matters (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7470 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7470, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Haz una contribución breve sobre asuntos prácticos', 'Practica aportar ideas cortas sobre materiales, lugar y tiempo en una reunión práctica.', '{"scenario": "Estás en una reunión breve para preparar una sala para visitantes. Tu papel es hacer contribuciones cortas sobre detalles prácticos.", "tasks": ["Di un material que la sala necesita.", "Sugiere dónde debe ir ese material.", "Propón una hora simple para preparar la sala.", "Di si estás de acuerdo con una idea práctica.", "Haz una pregunta corta sobre cantidad o lugar.", "Ofrece ayuda con una tarea pequeña.", "Confirma una acción que puedes hacer hoy.", "Termina con una frase breve como That is all from me."]}'::jsonb),
        (v_speaking_id, 'de', 'Mach einen kurzen Beitrag zu praktischen Punkten im Meeting', 'Übe kurze Beiträge zu Material, Ort und Zeit in einem praktischen Meeting.', '{"scenario": "Du bist in einem kurzen Meeting, um einen Raum für Besucher vorzubereiten. Deine Rolle ist es, kurze Beiträge zu praktischen Details zu machen.", "tasks": ["Nenne ein Material, das der Raum braucht.", "Schlage vor, wo dieses Material stehen soll.", "Schlage eine einfache Uhrzeit für die Vorbereitung des Raums vor.", "Sag, ob du einer praktischen Idee zustimmst.", "Stelle eine kurze Frage zu Menge oder Ort.", "Biete Hilfe bei einer kleinen Aufgabe an.", "Bestätige eine Handlung, die du heute machen kannst.", "Beende mit einem kurzen Satz wie That is all from me."]}'::jsonb);
END;
$seed$;
