-- ============================================================
-- Seed: A0 English Path – STEP 5430 – Speaking – moderate a short discussion (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5430 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5430, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Moderar una discusión breve', '', '{"scenario": "Te toca moderar una discusión corta de clase y necesitas abrir el tema, dar turnos y cerrar el intercambio de forma clara.", "tasks": ["Presenta el tema general de la discusión.", "Invita a una primera persona a empezar.", "Pide una razón o un ejemplo para aclarar la opinión dada.", "Da turno a otra persona con una idea distinta.", "Resume brevemente dos posiciones que hayan aparecido.", "Mantén un tono neutro y organizado.", "Invita a un comentario final o a una última aclaración.", "Cierra la discusión con una frase clara de resumen."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine kurze Diskussion moderieren', '', '{"scenario": "Du moderierst eine kurze Unterrichtsdiskussion und musst das Thema eröffnen, das Wort geben und den Austausch klar beenden.", "tasks": ["Stell das allgemeine Diskussionsthema vor.", "Lade eine erste Person zum Beginn ein.", "Bitte um einen Grund oder ein Beispiel, um die geäußerte Meinung zu klären.", "Gib dann einer anderen Person mit einer anderen Idee das Wort.", "Fasse zwei aufgetauchte Positionen kurz zusammen.", "Bleibe neutral und gut organisiert.", "Lade zu einem letzten Kommentar oder einer letzten Klärung ein.", "Beende die Diskussion mit einem klaren zusammenfassenden Satz."]}'::jsonb);
END;
$seed$;
