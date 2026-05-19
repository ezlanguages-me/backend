-- ============================================================
-- Seed: A0 English Path – STEP 5750 – Writing – select the most salient and relevant ideas and represent them clearly and briefly (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5750 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5750, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Seleccionar ideas útiles de estudios de economía', '', '{"scenario": "Trabajas con varios artículos de economía sobre competencia de mercado y debes elegir solo las ideas más útiles antes de escribir un ensayo breve.", "tasks": ["Localiza la afirmación principal de cada artículo sobre competencia de mercado.", "Selecciona las ideas que mejor expliquen cómo compiten las empresas.", "Elimina detalles técnicos que no necesites para un ensayo corto.", "Anota un dato, ejemplo o resultado que refuerce cada idea elegida.", "Compara qué fuente aporta el argumento más útil para tu enfoque.", "Escribe las ideas en frases muy breves y claras.", "Ordena los puntos elegidos según su importancia para el ensayo.", "Revisa que tus notas no incluyan información repetida o poco relevante."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Nützliche Ideen aus Wirtschaftsartikeln auswählen', '', '{"scenario": "Du arbeitest mit mehreren wirtschaftswissenschaftlichen Artikeln über Marktwettbewerb und musst vor einem kurzen Aufsatz nur die nützlichsten Ideen auswählen.", "tasks": ["Finde die Hauptaussage jedes Artikels über Marktwettbewerb.", "Wähle die Ideen aus, die am besten erklären, wie Unternehmen konkurrieren.", "Lass technische Details weg, die du für einen kurzen Aufsatz nicht brauchst.", "Notiere zu jeder gewählten Idee eine Zahl, ein Beispiel oder ein Ergebnis.", "Vergleiche, welche Quelle den nützlichsten Gedanken für deinen Fokus bietet.", "Schreibe die Ideen in sehr kurzen und klaren Sätzen auf.", "Ordne die ausgewählten Punkte nach ihrer Bedeutung für den Aufsatz.", "Prüfe, dass deine Notizen keine wiederholte oder wenig relevante Information enthalten."]}'::jsonb);
END;
$seed$;
