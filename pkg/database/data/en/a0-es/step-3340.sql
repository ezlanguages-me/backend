-- ============================================================
-- Seed: A0 English Path – STEP 3340 – Speaking – describe the circumstances of a theft to the police
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3340 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3340 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3340 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3340 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3340 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3340 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3340 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3340 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3340 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3340 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 3340, 'en', 'speaking', 'emergency')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Describe a la policía cómo ocurrió un robo', 'Practica una denuncia oral con hora, lugar, objetos robados y una descripción simple del sospechoso.', '{"scenario": "Estás en una comisaría porque alguien abrió tu taquilla del gimnasio y te robó la cartera y el teléfono. Quieres explicar el robo con frases simples pero claras.", "tasks": ["Di cuándo y dónde ocurrió el robo.", "Explica qué objetos faltan, por ejemplo wallet, phone o keys.", "Di la última vez que viste esas cosas antes del robo.", "Menciona el número de la taquilla, la mesa o el lugar exacto.", "Describe si viste a una persona sospechosa y cómo era su ropa.", "Explica si alguien más estaba cerca o si hay una cámara o un testigo.", "Di qué había dentro de los objetos robados, como cards, cash o ID.", "Termina pidiendo el número del informe y diciendo cómo pueden contactarte."]}'::jsonb),
        (v_speaking_id, 'de', 'Beschreibe der Polizei die Umstände eines Diebstahls', 'Übe eine mündliche Meldung mit Uhrzeit, Ort, gestohlenen Gegenständen und einer einfachen Täterbeschreibung.', '{"scenario": "Du bist auf einer Polizeiwache, weil jemand dein Schließfach im Fitnessstudio geöffnet und deine Geldbörse und dein Telefon gestohlen hat. Du willst den Diebstahl mit einfachen, aber klaren Sätzen erklären.", "tasks": ["Sag, wann und wo der Diebstahl passiert ist.", "Erkläre, welche Gegenstände fehlen, zum Beispiel wallet, phone oder keys.", "Sag, wann du diese Dinge zuletzt vor dem Diebstahl gesehen hast.", "Nenne die Nummer des Schließfachs, des Tisches oder den genauen Ort.", "Beschreibe, ob du eine verdächtige Person gesehen hast und wie ihre Kleidung aussah.", "Erkläre, ob noch jemand in der Nähe war oder ob es eine Kamera oder einen Zeugen gibt.", "Sag, was sich in den gestohlenen Sachen befand, zum Beispiel cards, cash oder ID.", "Beende die Meldung damit, dass du nach der Berichtsnummer fragst und sagst, wie man dich erreichen kann."]}'::jsonb);
END;
$seed$;
