-- ============================================================
-- Seed: A0 English Path – STEP 270 – Writing – write simple letters of the 'Thank you' type (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing WHERE step_order = 270 AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 270, 'en', 'writing', 'correspondence')
            RETURNING uuid INTO v_writing_id;

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'es', 'Carta de agradecimiento', '',
                '{
    "scenario": "Un amigo te ayudó durante un viaje corto y quieres darle las gracias por mensaje. Escribe una carta breve, amable y muy simple.",
    "tasks": [
        "Saluda a tu amigo de forma sencilla.",
        "Dale las gracias por su ayuda o su regalo.",
        "Di por qué fue importante para ti.",
        "Menciona un detalle concreto del momento.",
        "Di que esperas verle o escribirle pronto.",
        "Despídete de forma amable y firma con tu nombre."
    ]
}'::jsonb
            );

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'de', 'Einfacher Dankesbrief', '',
                '{
    "scenario": "Ein Freund hat dir auf einer kurzen Reise geholfen, und du möchtest ihm mit einer Nachricht danken. Schreib einen kurzen, freundlichen und sehr einfachen Brief.",
    "tasks": [
        "Begrüße deinen Freund auf einfache Weise.",
        "Bedanke dich für die Hilfe oder das Geschenk.",
        "Sag, warum es für dich wichtig war.",
        "Nenne ein konkretes Detail aus diesem Moment.",
        "Sag, dass du hoffst, ihn bald zu sehen oder ihm bald zu schreiben.",
        "Verabschiede dich freundlich und unterschreibe mit deinem Namen."
    ]
}'::jsonb
            );
        END;
        $seed$;
