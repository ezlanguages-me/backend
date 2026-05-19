-- ============================================================
-- Seed: A0 English Path – STEP 3240 – Speaking – give details in an emergency
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3240 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3240 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3240 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3240 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3240 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3240 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3240 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3240 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3240 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3240 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3240, 'en', 'speaking', 'emergency')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Da detalles claros durante una llamada de emergencia', 'Practica cómo explicar una situación urgente, la ubicación y el estado de la persona herida.', '{"scenario": "Estás llamando al 112 porque un ciclista se ha caído en un parque. Quieres hablar con calma y dar toda la información importante para que llegue la ayuda correcta.", "tasks": ["Saluda al operador y di qué servicio necesitas.", "Di el lugar exacto del accidente en el parque.", "Explica quién está herido, por ejemplo a cyclist o an older man.", "Describe si la persona está despierta, puede hablar o tiene dolor.", "Menciona una o dos lesiones visibles, como blood on the arm o a hurt leg.", "Explica si hay un peligro cerca, por ejemplo traffic, stairs o water.", "Da tu número de teléfono para que puedan volver a llamarte.", "Termina diciendo dónde esperarás a la ambulancia o al equipo de ayuda."]}'::jsonb),
        (v_speaking_id, 'de', 'Gib in einem Notfall klare Details', 'Übe, wie du eine dringende Situation, den Ort und den Zustand einer verletzten Person erklärst.', '{"scenario": "Du rufst 112 an, weil ein Radfahrer in einem Park gestürzt ist. Du willst ruhig sprechen und alle wichtigen Informationen geben, damit die richtige Hilfe kommt.", "tasks": ["Begrüße die Einsatzkraft und sag, welchen Dienst du brauchst.", "Nenne den genauen Ort des Unfalls im Park.", "Erkläre, wer verletzt ist, zum Beispiel a cyclist oder an older man.", "Beschreibe, ob die Person wach ist, sprechen kann oder Schmerzen hat.", "Nenne ein oder zwei sichtbare Verletzungen wie blood on the arm oder a hurt leg.", "Erkläre, ob es in der Nähe eine Gefahr gibt, zum Beispiel traffic, stairs oder water.", "Gib deine Telefonnummer an, damit man dich zurückrufen kann.", "Beende die Nachricht damit, wo du auf den Krankenwagen oder das Hilfsteam wartest."]}'::jsonb);
END;
$seed$;
