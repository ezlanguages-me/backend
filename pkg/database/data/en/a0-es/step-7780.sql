-- ============================================================
-- Seed: A0 English Path - STEP 7780 - Speaking - give a short conference-style presentation (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7780 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7780, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Dar una presentación corta de estilo conferencia', 'Practica una mini presentación clara y ordenada sobre un proyecto sencillo.', '{"scenario": "Das una presentación muy breve en estilo conferencia sobre los puntos de devolución de vasos reutilizables en un evento. Quieres sonar claro, ordenado y profesional.", "tasks": ["Empieza con un saludo corto al público.", "Di el tema de tu presentación en una frase.", "Explica el problema con una frase simple, por ejemplo demasiada basura.", "Da un dato sobre el número de puntos de devolución.", "Da un dato sobre el dinero que se devuelve.", "Menciona una cifra del resultado, por ejemplo 300 vasos.", "Di cuál es el beneficio principal para el recinto.", "Termina con una frase final e invita a una pregunta breve."]}'::jsonb),
        (v_speaking_id, 'de', 'Eine kurze Präsentation im Konferenzstil halten', 'Übe eine klare und geordnete Mini-Präsentation über ein einfaches Projekt.', '{"scenario": "Du hältst eine sehr kurze Präsentation im Konferenzstil über die Rückgabestellen für Mehrwegbecher bei einer Veranstaltung. Du möchtest klar, geordnet und professionell klingen.", "tasks": ["Beginne mit einer kurzen Begrüßung des Publikums.", "Nenne das Thema deiner Präsentation in einem Satz.", "Erkläre das Problem in einem einfachen Satz, zum Beispiel zu viel Müll.", "Nenne eine Information über die Zahl der Rückgabestellen.", "Nenne eine Information über das Geld, das zurückgegeben wird.", "Erwähne eine Ergebniszahl, zum Beispiel 300 Becher.", "Sag, was der wichtigste Vorteil für die Halle ist.", "Beende mit einem kurzen Schlusssatz und lade zu einer kurzen Frage ein."]}'::jsonb);
END;
$seed$;
