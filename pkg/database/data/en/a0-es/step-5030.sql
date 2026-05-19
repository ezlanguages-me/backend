-- ============================================================
-- Seed: A0 English Path – STEP 5030 – Speaking – summarize a lecture (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5030 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5030, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Resumir una clase', '', '{"scenario": "Después de una clase, quieres hacer un resumen oral corto para un compañero que no pudo asistir.", "tasks": ["Presenta el tema general de la clase.", "Di dos o tres ideas principales en orden.", "Menciona un ejemplo o un pequeño estudio citado por el profesor.", "Explica una recomendación práctica de la clase.", "Aclara una palabra clave importante.", "Señala qué parte te pareció más útil.", "Resume la conclusión en una frase sencilla.", "Termina ofreciendo tus apuntes o ayuda adicional."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine Vorlesung zusammenfassen', '', '{"scenario": "Nach einer Vorlesung möchtest du einem Kommilitonen, der gefehlt hat, eine kurze mündliche Zusammenfassung geben.", "tasks": ["Nenne das allgemeine Thema der Vorlesung.", "Sag zwei oder drei Hauptideen in der richtigen Reihenfolge.", "Nenne ein Beispiel oder eine kleine Studie aus der Vorlesung.", "Erkläre eine praktische Empfehlung aus dem Vortrag.", "Klär ein wichtiges Schlüsselwort.", "Sag, welcher Teil für dich am nützlichsten war.", "Fass den Schluss in einem einfachen Satz zusammen.", "Beende deinen Beitrag, indem du deine Notizen oder weitere Hilfe anbietest."]}'::jsonb);
END;
$seed$;
