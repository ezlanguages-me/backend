-- ============================================================
-- Seed: A0 English Path – STEP 450 – Speaking – make a complaint about simple matters, for example 'The light in my room doesn't work.' (Alojamiento)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_speaking_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM speaking WHERE step_order = 450 AND path_uuid = v_path_id;

            INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 450, 'en', 'speaking', 'accommodation')
            RETURNING uuid INTO v_speaking_id;

            INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
            VALUES (
                v_speaking_id, 'es', 'Quejarte de un problema concreto', '',
                '{
    "scenario": "Estás en tu habitación del hotel y descubres varios problemas concretos. Hablas con recepción para explicarlos uno por uno y pedir una solución.",
    "tasks": [
        "Di tu número de habitación.",
        "Explica que la luz de tu habitación no funciona.",
        "Di que la ducha está rota o no funciona bien.",
        "Menciona que no hay toalla en el baño.",
        "Pregunta cuándo puede venir un técnico o alguien del hotel.",
        "Di si puedes esperar en la habitación y termina de forma educada."
    ]
}'::jsonb
            );

            INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
            VALUES (
                v_speaking_id, 'de', 'Sich über ein konkretes Problem beschweren', '',
                '{
    "scenario": "Du bist in deinem Hotelzimmer und entdeckst mehrere konkrete Probleme. Du sprichst mit der Rezeption, erklärst sie nacheinander und bittest um eine Lösung.",
    "tasks": [
        "Nenne deine Zimmernummer.",
        "Erklär, dass das Licht in deinem Zimmer nicht funktioniert.",
        "Sag, dass die Dusche kaputt ist oder nicht richtig funktioniert.",
        "Erwähne, dass es kein Handtuch im Badezimmer gibt.",
        "Frag, wann ein Techniker oder jemand vom Hotel kommen kann.",
        "Sag, ob du im Zimmer warten kannst, und beende das Gespräch höflich."
    ]
}'::jsonb
            );
        END;
        $seed$;
