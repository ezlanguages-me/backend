-- ============================================================
-- Seed: A0 English Path – STEP 5340 – Speaking – give presentation on familiar topic answering questions (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5340 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5340, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Presentar un tema conocido y responder preguntas', '', '{"scenario": "Vas a presentar un tema familiar de clase y después responderás preguntas previsibles o factuales del público.", "tasks": ["Presenta el tema de forma clara desde el inicio.", "Organiza tu explicación en varias partes fáciles de seguir.", "Da uno o dos datos o ejemplos sencillos.", "Señala tu conclusión principal antes del final.", "Invita a preguntas del público.", "Escucha una pregunta y repítela si hace falta.", "Responde con una información breve y clara.", "Cierra la actividad con una despedida amable y segura."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Ein vertrautes Thema präsentieren und Fragen beantworten', '', '{"scenario": "Du präsentierst ein vertrautes Thema aus dem Unterricht und beantwortest danach vorhersehbare oder sachliche Fragen aus dem Publikum.", "tasks": ["Stell das Thema von Anfang an klar vor.", "Ordne deine Erklärung in mehrere leicht verständliche Teile.", "Gib ein oder zwei einfache Daten oder Beispiele.", "Nenne deine Hauptschlussfolgerung vor dem Ende.", "Lade das Publikum zu Fragen ein.", "Höre eine Frage an und wiederhole sie wenn nötig.", "Antworte kurz und klar mit Fakten.", "Beende den Beitrag freundlich und sicher."]}'::jsonb);
END;
$seed$;
