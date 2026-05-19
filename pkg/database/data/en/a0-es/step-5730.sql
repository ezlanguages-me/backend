-- ============================================================
-- Seed: A0 English Path – STEP 5730 – Writing – make simple notes from written sources (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_writing_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM writing WHERE step_order = 5730 AND path_uuid = v_path_id;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5730, 'en', 'writing', 'academic')
    RETURNING uuid INTO v_writing_id;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'es', 'Tomar notas sencillas de artículos de ecología', '', '{"scenario": "Trabajas con dos artículos breves de ecología sobre biodiversidad para una tarea del curso y quieres sacar notas simples que te ayuden a recordar las ideas básicas.", "tasks": ["Anota el tema general de cada artículo sobre biodiversidad.", "Escribe una o dos ideas principales de cada fuente.", "Copia un ejemplo de especie, hábitat o ecosistema mencionado.", "Separa amenazas a la biodiversidad y medidas de protección.", "Usa palabras clave en vez de frases completas cuando sea posible.", "Agrupa notas parecidas de los dos textos bajo un mismo subtítulo.", "Marca qué información podría servir para explicar el concepto de biodiversidad.", "Relee tus notas para comprobar que todavía se entienden con facilidad."]}'::jsonb);
    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES (v_writing_id, 'de', 'Einfache Notizen aus Ökologieartikeln machen', '', '{"scenario": "Du arbeitest mit zwei kurzen Ökologieartikeln über Biodiversität für eine Kursaufgabe und möchtest einfache Notizen machen, die dir helfen, die Grundideen zu behalten.", "tasks": ["Notiere das allgemeine Thema jedes Artikels über Biodiversität.", "Schreibe ein oder zwei Hauptideen jeder Quelle auf.", "Übernimm ein Beispiel für eine Art, einen Lebensraum oder ein Ökosystem.", "Trenne Bedrohungen der Biodiversität von Schutzmaßnahmen.", "Verwende wenn möglich Schlüsselwörter statt ganzer Sätze.", "Ordne ähnliche Notizen aus beiden Texten unter derselben Zwischenüberschrift.", "Markiere, welche Information gut zur Erklärung des Begriffs Biodiversität passt.", "Lies deine Notizen noch einmal und prüfe, ob sie leicht verständlich bleiben."]}'::jsonb);
END;
$seed$;
