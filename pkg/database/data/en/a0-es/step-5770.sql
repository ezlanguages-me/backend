-- ============================================================
-- Seed: A0 English Path – STEP 5770 – Writing – paraphrase and summarize effectively (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5770 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5770, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Parafrasear y resumir fuentes sobre medios digitales', '', '{"scenario": "Trabajas con fuentes de estudios de medios sobre comunicación digital e influencia de las redes sociales y debes parafrasear y resumir ideas para un trabajo final.", "tasks": ["Identifica la idea central de cada fuente sobre comunicación digital.", "Parafrasea definiciones o afirmaciones clave con vocabulario diferente.", "Cambia la estructura de las oraciones para evitar copiar el modelo original.", "Combina ideas parecidas de dos textos en una formulación más breve.", "Resume una explicación larga en una o dos frases académicas.", "Mantén un tono neutro al presentar la influencia de las redes sociales.", "Comprueba que no repites expresiones muy características de la fuente.", "Revisa si tu resumen responde bien a la pregunta del trabajo final."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Quellen zu digitalen Medien paraphrasieren und zusammenfassen', '', '{"scenario": "Du arbeitest mit medienwissenschaftlichen Quellen über digitale Kommunikation und den Einfluss sozialer Medien und musst Ideen für eine Abschlussarbeit paraphrasieren und zusammenfassen.", "tasks": ["Bestimme die zentrale Idee jeder Quelle zur digitalen Kommunikation.", "Paraphrasiere Definitionen oder wichtige Aussagen mit anderem Wortschatz.", "Verändere die Satzstruktur, damit du das Original nicht kopierst.", "Verbinde ähnliche Ideen aus zwei Texten zu einer kürzeren Formulierung.", "Fasse eine längere Erklärung in ein oder zwei akademischen Sätzen zusammen.", "Behalte einen neutralen Ton bei, wenn du den Einfluss sozialer Medien darstellst.", "Prüfe, ob du keine besonders typischen Formulierungen der Quelle wiederholst.", "Sieh nach, ob deine Zusammenfassung die Frage der Abschlussarbeit gut beantwortet."]}'::jsonb);
END;
$seed$;
