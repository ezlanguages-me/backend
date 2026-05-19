-- ============================================================
-- Seed: A0 English Path – STEP 5740 – Writing – make notes from simple sources that will be of some limited use for essay or revision (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5740 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5740, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Tomar notas básicas sobre la Revolución Industrial', '', '{"scenario": "Lees un capítulo corto de un libro de historia sobre la Revolución Industrial y quieres sacar notas básicas que luego puedan servirte un poco para un ensayo o para repasar.", "tasks": ["Anota el periodo o contexto histórico principal del capítulo.", "Escribe dos o tres causas básicas de la Revolución Industrial.", "Recoge ejemplos sencillos de inventos o cambios tecnológicos.", "Anota consecuencias sobre trabajo, ciudades o transporte.", "Separa causas, cambios y consecuencias en grupos claros.", "Incluye un nombre, fecha o lugar que pueda ayudarte a recordar el tema.", "Escribe una breve idea que podría servir para una futura respuesta escrita.", "Ordena las notas para que resulten útiles en un repaso rápido."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Grundlegende Notizen zur Industriellen Revolution machen', '', '{"scenario": "Du liest ein kurzes Geschichtskapitel über die Industrielle Revolution und möchtest grundlegende Notizen machen, die später etwas für einen Aufsatz oder zur Wiederholung nützlich sein können.", "tasks": ["Notiere den wichtigsten Zeitraum oder historischen Kontext des Kapitels.", "Schreibe zwei oder drei grundlegende Ursachen der Industriellen Revolution auf.", "Sammle einfache Beispiele für Erfindungen oder technologische Veränderungen.", "Notiere Folgen für Arbeit, Städte oder Verkehr.", "Trenne Ursachen, Veränderungen und Folgen in klaren Gruppen.", "Füge einen Namen, ein Datum oder einen Ort hinzu, der beim Erinnern hilft.", "Schreibe eine kurze Idee auf, die für eine spätere schriftliche Antwort nützlich sein könnte.", "Ordne die Notizen so, dass sie für eine schnelle Wiederholung taugen."]}'::jsonb);
END;
$seed$;
