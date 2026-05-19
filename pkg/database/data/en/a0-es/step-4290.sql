-- ============================================================
-- Seed: A0 English Path – STEP 4290 – Speaking – explain technical procedures (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4290 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4290, 'en', 'speaking', 'professional') RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Explica procedimientos técnicos', 'Practica cómo explicar oralmente los pasos de un procedimiento técnico de mantenimiento o instalación.', '{"scenario": "Un técnico o empleado nuevo necesita entender un procedimiento técnico. Quieres practicar cómo explicarlo de forma clara, paso a paso, en inglés.", "tasks": ["Presenta el nombre del procedimiento o sistema del que vas a hablar.", "Explica qué materiales o herramientas son necesarios.", "Describe el primer paso del procedimiento con claridad.", "Describe el segundo paso y añade una precaución de seguridad.", "Explica el tercer paso con un dato técnico concreto.", "Menciona la frecuencia con que debe realizarse el procedimiento.", "Explica cómo registrar o documentar el trabajo.", "Termina ofreciendo responder preguntas o dejar instrucciones escritas."]}'::jsonb),
        (v_item_id, 'de', 'Erkläre technische Verfahren', 'Übe, wie man mündlich die Schritte eines technischen Wartungs- oder Installationsverfahrens erklärt.', '{"scenario": "Ein neuer Techniker oder Mitarbeiter muss ein technisches Verfahren verstehen. Du möchtest üben, es klar und schrittweise auf Englisch zu erklären.", "tasks": ["Stelle den Namen des Verfahrens oder Systems vor, über das du sprichst.", "Erkläre, welche Materialien oder Werkzeuge benötigt werden.", "Beschreibe den ersten Schritt des Verfahrens klar.", "Beschreibe den zweiten Schritt und füge einen Sicherheitshinweis hinzu.", "Erkläre den dritten Schritt mit einer konkreten technischen Angabe.", "Nenne die Häufigkeit, mit der das Verfahren durchgeführt werden soll.", "Erkläre, wie die Arbeit protokolliert oder dokumentiert wird.", "Beende mit dem Angebot, Fragen zu beantworten oder schriftliche Anweisungen zu hinterlassen."]}'::jsonb);
END;
$seed$;
