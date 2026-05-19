-- ============================================================
-- Seed: A0 English Path – STEP 280 – Writing – convey personal information of a routine nature to, for example, a pen friend (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing WHERE step_order = 280 AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 280, 'en', 'writing', 'correspondence')
            RETURNING uuid INTO v_writing_id;

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'es', 'Presentarte a un amigo por carta', '',
                '{
    "scenario": "Vas a escribir a un nuevo amigo por correspondencia. Quiere saber cosas básicas sobre tu vida diaria, tu familia y tu ciudad.",
    "tasks": [
        "Saluda a tu nuevo amigo.",
        "Di tu nombre, tu edad y de dónde eres.",
        "Cuenta a qué te dedicas o qué estudias.",
        "Menciona a las personas que viven contigo.",
        "Di una o dos cosas que haces normalmente cada día.",
        "Haz una pregunta sencilla al final y despídete."
    ]
}'::jsonb
            );

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'de', 'Sich in einem Brief vorstellen', '',
                '{
    "scenario": "Du schreibst an einen neuen Brieffreund. Er möchte einfache Informationen über dein tägliches Leben, deine Familie und deine Stadt wissen.",
    "tasks": [
        "Begrüße deinen neuen Freund.",
        "Sag deinen Namen, dein Alter und woher du kommst.",
        "Erzähl, was du machst oder was du lernst.",
        "Nenne die Personen, die mit dir zusammen wohnen.",
        "Sag ein oder zwei Dinge, die du normalerweise jeden Tag machst.",
        "Stell am Ende eine einfache Frage und verabschiede dich."
    ]
}'::jsonb
            );
        END;
        $seed$;
