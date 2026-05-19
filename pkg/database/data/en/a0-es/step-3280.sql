-- ============================================================
-- Seed: A0 English Path – STEP 3280 – Speaking – give a first aid description
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3280 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3280 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3280 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3280 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3280 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3280 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3280 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3280 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3280 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3280 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3280, 'en', 'speaking', 'emergency')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Describe una situación de primeros auxilios', 'Practica cómo explicar una lesión simple, el estado de la persona y la ayuda que ya has dado.', '{"scenario": "Estás con una amiga que se ha quemado la mano en una cocina compartida. Vas a explicar la situación a un profesional para recibir instrucciones claras de primeros auxilios.", "tasks": ["Di quién está herido y dónde ocurrió el accidente.", "Explica qué parte del cuerpo está lesionada.", "Describe si la quemadura o la herida es pequeña, grande, roja o sangra.", "Di si la persona está despierta, puede hablar y respira bien.", "Cuenta qué primeros auxilios ya has hecho, por ejemplo cold water o a clean cloth.", "Menciona el nivel de dolor o si la persona se siente mareada.", "Pregunta si necesitas una ambulancia, un médico o solo más instrucciones.", "Termina diciendo que te quedarás con la persona y seguirás las indicaciones."]}'::jsonb),
        (v_speaking_id, 'de', 'Beschreibe eine Erste-Hilfe-Situation', 'Übe, wie du eine einfache Verletzung, den Zustand der Person und die bereits gegebene Hilfe erklärst.', '{"scenario": "Du bist mit einer Freundin zusammen, die sich in einer Gemeinschaftsküche die Hand verbrannt hat. Du willst die Situation einer Fachkraft erklären, um klare Erste-Hilfe-Anweisungen zu bekommen.", "tasks": ["Sag, wer verletzt ist und wo der Unfall passiert ist.", "Erkläre, welcher Körperteil verletzt ist.", "Beschreibe, ob die Verbrennung oder Wunde klein, groß, rot ist oder blutet.", "Sag, ob die Person wach ist, sprechen kann und gut atmet.", "Erzähl, welche Erste Hilfe du schon gemacht hast, zum Beispiel cold water oder a clean cloth.", "Nenne die Schmerzstärke oder ob der Person schwindlig ist.", "Frage, ob du einen Krankenwagen, einen Arzt oder nur weitere Anweisungen brauchst.", "Beende die Nachricht damit, dass du bei der Person bleibst und den Anweisungen folgst."]}'::jsonb);
END;
$seed$;
