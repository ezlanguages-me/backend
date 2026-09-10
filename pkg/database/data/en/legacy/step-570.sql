-- ============================================================
-- Seed: A0 English Path – STEP 570 – Speaking – understand, and ask questions about, house rules/conventions, such as the time of meals (Convivencia)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM speaking WHERE step_order = 570 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 570, 'en', 'speaking', 'social') RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'es', 'Entender las normas de la casa', '{"scenario": "Acabas de llegar a casa de tu familia anfitriona. Habla con Sarah para entender los horarios de las comidas y las normas básicas de la casa.", "tasks": ["Salúda a Sarah y dí que acabas de llegar.", "Pregunta a qué hora es el desayuno y dónde lo sirven.", "Pregunta a qué hora es la cena y si hay que avisar si no puedes venir.", "Pregunta si hay alguna norma sobre el uso de la cocina, por ejemplo a qué hora cierran.", "Pregunta cuáles son las horas de silencio en la casa.", "Pregunta si puedes tener visitas en tu habitación.", "Agradece la información y despídete."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, prompt)
    VALUES (v_speaking_id, 'de', 'Die Hausregeln verstehen', '{"scenario": "Du bist gerade bei deiner Gastfamilie angekommen. Sprich mit Sarah, um die Essenszeiten und die wichtigsten Hausregeln zu verstehen.", "tasks": ["Begrüße Sarah und sag, dass du gerade angekommen bist.", "Frage, wann das Frühstück ist und wo es serviert wird.", "Frage, wann das Abendessen ist und ob du Bescheid sagen musst, wenn du nicht kommst.", "Frage nach Regeln für die Küche, zum Beispiel bis wann man sie benutzen darf.", "Frage, wann die Ruhezeiten im Haus sind.", "Frage, ob du Gäste in deinem Zimmer empfangen darfst.", "Bedanke dich für die Informationen und verabschiede dich."]}'::jsonb);
END;
$seed$;
