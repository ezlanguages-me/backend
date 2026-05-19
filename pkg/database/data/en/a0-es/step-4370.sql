-- ============================================================
-- Seed: A0 English Path – STEP 4370 – Speaking – Informa sobre un problema de calidad
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4370 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4370, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Informa sobre un problema de calidad', 'Practica cómo hablar sobre un problema de calidad de forma clara y profesional.', '{"scenario": "En el trabajo encuentras un problema de calidad en un lote de productos. Necesitas reportarlo a tu supervisor de forma clara.", "tasks": ["Di el número del lote o referencia del producto afectado.", "Explica qué tipo de defecto o problema has encontrado.", "Di cuántos artículos o cajas están afectados.", "Explica qué has hecho con los artículos defectuosos.", "Informa si ya has rellenado el formulario de incidencia.", "Pregunta qué pasos deben seguirse a continuación.", "Sugiere si el resto del lote debe ser retenido.", "Ofrece más información si es necesario."]}'::jsonb),
        (v_item_id, 'de', 'Melde ein Qualitätsproblem', 'Übe, wie man klar und professionell über ein Qualitätsproblem spricht.', '{"scenario": "Bei der Arbeit entdeckst du ein Qualitätsproblem in einer Produktcharge. Du musst es deinem Vorgesetzten klar melden.", "tasks": ["Nenne die Chargennummer oder Produktreferenz des betroffenen Artikels.", "Erkläre, welche Art von Fehler oder Problem du gefunden hast.", "Sage, wie viele Artikel oder Kartons betroffen sind.", "Teile mit, was du mit den defekten Artikeln gemacht hast.", "Informiere, ob du das Störungsformular bereits ausgefüllt hast.", "Frage, welche Schritte als nächstes unternommen werden sollen.", "Schlage vor, ob der Rest der Charge zurückgehalten werden soll.", "Biete weitere Informationen an, falls nötig."]}'::jsonb);
END;
$seed$;
