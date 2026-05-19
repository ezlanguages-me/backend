-- ============================================================
-- Seed: A0 English Path – STEP 3060 – Speaking – book a car hire
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3060 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3060, 'en', 'speaking', 'transport')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para reservar un coche de alquiler desde un hotel', 'Practica cómo pedir un coche de alquiler para una excursión desde la recepción de un hotel.', '{"scenario": "Estás en la recepción de un hotel y quieres reservar un coche para una excursión de un día. Necesitas hablar de tipo de coche, precio, recogida y extras.", "tasks": ["Saluda y di que quieres reservar un coche para una excursión.", "Di para qué día lo necesitas y a qué hora quieres recogerlo.", "Pide un coche pequeño o mediano y responde si hay dos opciones.", "Pregunta cuánto cuesta por un día.", "Pregunta si el seguro básico está incluido.", "Añade un extra sencillo, por ejemplo GPS o silla infantil.", "Confirma dónde recoges el coche y a qué hora lo devuelves.", "Termina la reserva con una frase amable de confirmación."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um von einem Hotel aus einen Mietwagen zu buchen', 'Übe, wie du über die Hotelrezeption einen Mietwagen für einen Ausflug buchst.', '{"scenario": "Du bist an der Rezeption eines Hotels und möchtest für einen Tagesausflug ein Auto buchen. Du musst über Fahrzeugtyp, Preis, Abholung und Extras sprechen.", "tasks": ["Begrüße die Person und sag, dass du für einen Ausflug ein Auto buchen möchtest.", "Sag, für welchen Tag du es brauchst und wann du es abholen möchtest.", "Bitte um einen kleinen oder mittleren Wagen und antworte, wenn es zwei Optionen gibt.", "Frage, wie viel es für einen Tag kostet.", "Frage, ob die Grundversicherung inklusive ist.", "Füge ein einfaches Extra hinzu, zum Beispiel GPS oder einen Kindersitz.", "Bestätige, wo du das Auto abholst und wann du es zurückgibst.", "Beende die Buchung mit einer freundlichen Bestätigung."]}'::jsonb);
END;
$seed$;
