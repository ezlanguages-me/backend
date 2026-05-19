-- ============================================================
-- Seed: A0 English Path – STEP 5580 – Writing – make notes from simple sources that will be of some limited use (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5580 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5580, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Tomar notas de fuentes simples', '', '{"scenario": "Tienes dos fuentes cortas y sencillas sobre el uso de la biblioteca y quieres sacar notas básicas que luego te ayuden un poco a estudiar.", "tasks": ["Anota el tema general de cada fuente.", "Escribe una o dos ideas principales de forma breve.", "Copia una cifra o un dato importante.", "Distingue entre hechos y ejemplos simples.", "Usa palabras clave en lugar de frases largas.", "Marca qué información parece más útil para recordar.", "Agrupa notas parecidas de las dos fuentes.", "Relee tus notas para comprobar que todavía se entienden."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Notizen aus einfachen Quellen machen', '', '{"scenario": "Du hast zwei kurze einfache Quellen über die Bibliotheksnutzung und möchtest daraus grundlegende Notizen machen, die dir später beim Lernen etwas helfen.", "tasks": ["Notiere das allgemeine Thema jeder Quelle.", "Schreibe ein oder zwei Hauptideen kurz auf.", "Übernimm eine wichtige Zahl oder Information.", "Unterscheide zwischen Fakten und einfachen Beispielen.", "Verwende Schlüsselwörter statt langer Sätze.", "Markiere, welche Information am nützlichsten zum Merken ist.", "Ordne ähnliche Notizen aus beiden Quellen zusammen.", "Lies deine Notizen noch einmal, um zu prüfen, ob sie verständlich sind."]}'::jsonb);
END;
$seed$;
