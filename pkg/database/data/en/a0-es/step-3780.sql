-- ============================================================
-- Seed: A0 English Path – STEP 3780 – Speaking – describe a tourist attraction (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3780 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3780, 'en', 'speaking', 'tourism') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Describe una atracción turística', 'Practica una descripción oral de un lugar famoso con ubicación, aspecto y actividad principal.', '{"scenario": "Quieres grabar una pequeña guía de audio sobre una atracción turística de tu ciudad para ayudar a otros visitantes.", "tasks": ["Di el nombre de la atracción y dónde está.", "Explica qué tipo de lugar es: museo, parque, castillo, torre u otro.", "Describe cómo es por fuera o qué se ve primero.", "Menciona una cosa importante que la gente puede hacer allí.", "Di si es mejor visitarla por la mañana, por la tarde o por la noche.", "Añade un detalle práctico como precio, transporte o tiempo de visita.", "Explica por qué te gusta o por qué es especial para la ciudad.", "Termina invitando a la gente a visitarla."]}'::jsonb),
        (v_item_id, 'de', 'Beschreibe eine Sehenswürdigkeit', 'Übe eine mündliche Beschreibung eines bekannten Ortes mit Lage, Aussehen und Hauptaktivität.', '{"scenario": "Du möchtest einen kleinen Audioguide über eine Sehenswürdigkeit deiner Stadt aufnehmen, um anderen Besuchern zu helfen.", "tasks": ["Nenne den Namen der Sehenswürdigkeit und ihren Ort.", "Erkläre, was für ein Ort es ist: Museum, Park, Schloss, Turm oder etwas anderes.", "Beschreibe, wie sie von außen aussieht oder was man zuerst sieht.", "Nenne eine wichtige Aktivität, die man dort machen kann.", "Sag, ob man sie am besten morgens, nachmittags oder abends besucht.", "Füge ein praktisches Detail hinzu, zum Beispiel Preis, Verkehr oder Besuchsdauer.", "Erkläre, warum du den Ort magst oder warum er für die Stadt besonders ist.", "Beende die Aufnahme mit einer Einladung, den Ort zu besuchen."]}'::jsonb);
END;
$seed$;
