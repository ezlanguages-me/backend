-- ============================================================
-- Seed: A0 English Path – STEP 2980 – Speaking – find out train times
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2980 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2980, 'en', 'speaking', 'transport')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla para preguntar horarios de tren en un hotel', 'Practica cómo pedir ayuda con horarios de tren en la recepción de un hotel.', '{"scenario": "Estás en la recepción de un hotel pequeño. Mañana por la mañana quieres ir en tren al aeropuerto y necesitas saber qué tren te conviene.", "tasks": ["Saluda y di que necesitas ayuda con horarios de trenes.", "Explica a qué lugar quieres ir y qué día viajas.", "Pregunta cuál es el primer tren de la mañana.", "Pregunta a qué hora sale el siguiente tren.", "Pregunta desde qué andén sale tu tren.", "Pregunta cuánto tarda el viaje.", "Pregunta si el tren es directo o si hace paradas.", "Termina repitiendo el horario que eliges y despídete."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich, um im Hotel nach Zugzeiten zu fragen', 'Übe, wie du an der Hotelrezeption nach Zugzeiten fragst.', '{"scenario": "Du bist an der Rezeption eines kleinen Hotels. Morgen früh möchtest du mit dem Zug zum Flughafen fahren und musst wissen, welcher Zug für dich passt.", "tasks": ["Begrüße die Person und sag, dass du Hilfe mit Zugzeiten brauchst.", "Erkläre, wohin du fahren möchtest und an welchem Tag du reist.", "Frage nach dem ersten Zug am Morgen.", "Frage, wann der nächste Zug fährt.", "Frage, von welchem Bahnsteig dein Zug abfährt.", "Frage, wie lange die Fahrt dauert.", "Frage, ob der Zug direkt fährt oder Zwischenhalte hat.", "Beende das Gespräch, indem du die gewählte Zeit wiederholst und dich verabschiedest."]}'::jsonb);
END;
$seed$;
