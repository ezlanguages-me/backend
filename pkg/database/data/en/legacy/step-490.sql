-- ============================================================
-- Seed: A0 English Path – STEP 490 – Speaking – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 490 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 490, 'en', 'speaking', 'accommodation')RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'es', 'Alquilar una habitación', '{"scenario": "Estás interesado en alquilar una habitación en una casa compartida. Llamas al propietario para preguntar los detalles básicos antes de decidir si quieres visitarla.", "tasks": ["Saluda y di que llamas porque quieres información sobre la habitación.", "Pregunta cuánto cuesta al mes y cuánto es el depósito.", "Pregunta qué muebles tiene la habitación.", "Pregunta qué espacios son compartidos en la casa.", "Pregunta cuáles son las normas de la casa, por ejemplo sobre visitas u horarios.", "Pregunta desde cuándo está disponible y termina la conversación de forma amable."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'de', 'Ein Zimmer mieten', '{"scenario": "Du interessierst dich für ein Zimmer in einer WG. Du rufst den Vermieter an, um grundlegende Details zu erfragen, bevor du entscheidest, ob du es besichtigen möchtest.", "tasks": ["Begrüße die Person und sag, dass du anrufst, weil du Informationen über das Zimmer möchtest.", "Frag, wie viel es pro Monat kostet und wie hoch die Kaution ist.", "Frag, welche Möbel das Zimmer hat.", "Frag, welche Räume im Haus geteilt werden.", "Frag nach den Hausregeln, zum Beispiel zu Gästen oder Zeiten.", "Frag, ab wann das Zimmer verfügbar ist, und beende das Gespräch freundlich."]}'::jsonb);
END;
$seed$;

