-- ============================================================
-- Seed: A0 English Path – STEP 5300 – Writing – make notes that will be of reasonable use for essay or revision purposes (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5300 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5300, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Tomar apuntes útiles para un ensayo o repaso', '', '{"scenario": "Has asistido a una presentación académica sobre un tema conocido del campus y quieres tomar notas claras que después te sirvan para estudiar o escribir un pequeño ensayo.", "tasks": ["Escribe el tema central de la presentación en una línea.", "Anota dos o tres ideas principales en orden.", "Añade una cifra, fecha o dato importante.", "Separa claramente ejemplos y conclusiones.", "Anota una palabra clave o concepto nuevo.", "Escribe una pregunta que te queda abierta.", "Resume la conclusión del ponente en una frase breve.", "Revisa tus notas y organiza lo más útil para un ensayo o examen."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Nützliche Notizen für Aufsatz oder Wiederholung machen', '', '{"scenario": "Du hast einen akademischen Vortrag über ein vertrautes Campus-Thema gehört und möchtest klare Notizen machen, die dir später für Wiederholung oder einen kurzen Aufsatz helfen.", "tasks": ["Schreibe das zentrale Thema des Vortrags in eine Zeile.", "Notiere zwei oder drei Hauptideen in der richtigen Reihenfolge.", "Füge eine wichtige Zahl, ein Datum oder eine Information hinzu.", "Trenne Beispiele und Schlussfolgerungen klar voneinander.", "Notiere ein Schlüsselwort oder einen neuen Begriff.", "Schreibe eine offene Frage auf, die bleibt.", "Fass den Schluss des Vortragenden in einem kurzen Satz zusammen.", "Ordne deine Notizen so, dass sie für Aufsatz oder Prüfung nützlich sind."]}'::jsonb);
END;
$seed$;
