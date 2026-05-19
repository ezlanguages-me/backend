-- ============================================================
-- Seed: A0 English Path – STEP 3680 – Speaking – complain about accommodation (Alojamiento)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_item_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 3680 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'speaking';
    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3680, 'en', 'speaking', 'accommodation')
    RETURNING uuid INTO v_item_id;
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_item_id, 'es', 'Quéjate del alojamiento', 'Practica cómo explicar un problema de alojamiento con claridad y pedir una solución.', '{"scenario": "Estás en un hotel o apartamento y algo no funciona bien. Quieres practicar una queja breve pero educada para hablar con recepción o con el propietario.", "tasks": ["Saluda y di tu número de habitación o la dirección del alojamiento.", "Explica cuál es el problema principal.", "Añade un segundo detalle si hay otro problema relacionado.", "Di desde cuándo ocurre el problema.", "Explica cómo te afecta durante la estancia.", "Pide una solución concreta, por ejemplo reparación, limpieza o cambio de habitación.", "Pregunta cuándo pueden ayudarte.", "Termina con una frase educada y firme."]}'::jsonb),
        (v_item_id, 'de', 'Beschwere dich über die Unterkunft', 'Übe, wie du ein Problem mit der Unterkunft klar erklärst und eine Lösung verlangst.', '{"scenario": "Du bist in einem Hotel oder Apartment und etwas funktioniert nicht richtig. Du willst eine kurze, aber höfliche Beschwerde üben, um mit der Rezeption oder dem Vermieter zu sprechen.", "tasks": ["Begrüße die Person und nenne deine Zimmernummer oder die Adresse.", "Erkläre das Hauptproblem.", "Füge ein zweites Detail hinzu, wenn es noch ein weiteres Problem gibt.", "Sag, seit wann das Problem besteht.", "Erkläre, wie es deinen Aufenthalt beeinflusst.", "Bitte um eine konkrete Lösung, zum Beispiel Reparatur, Reinigung oder Zimmerwechsel.", "Frage, wann man dir helfen kann.", "Beende die Beschwerde mit einem höflichen, aber klaren Satz."]}'::jsonb);
END;
$seed$;
