-- ============================================================
-- Seed: A0 English Path – STEP 410 – Speaking – make simple complaints, for example 'The water is cold' (Alojamiento)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_speaking_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM speaking WHERE step_order = 410 AND path_uuid = v_path_id;

            INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 410, 'en', 'speaking', 'accommodation')
            RETURNING uuid INTO v_speaking_id;

            INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
            VALUES (
                v_speaking_id, 'es', 'Explicar una queja sencilla', '',
                '{
    "scenario": "Estás en un hotel y llamas o hablas con recepción porque tienes varios problemas simples en la habitación. Debes explicar lo que pasa de forma educada y clara.",
    "tasks": [
        "Saluda e indica tu número de habitación.",
        "Di que el agua está fría o que no hay agua caliente.",
        "Menciona que la calefacción no funciona o que la televisión está rota.",
        "Di si hay mucho ruido en tu planta o en el pasillo.",
        "Pide ayuda de forma educada.",
        "Pregunta si pueden enviar a alguien o cambiarte de habitación."
    ]
}'::jsonb
            );

            INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
            VALUES (
                v_speaking_id, 'de', 'Eine einfache Beschwerde erklären', '',
                '{
    "scenario": "Du bist in einem Hotel und rufst an oder sprichst mit der Rezeption, weil es mehrere einfache Probleme im Zimmer gibt. Du sollst höflich und klar erklären, was passiert.",
    "tasks": [
        "Begrüße die Person und nenne deine Zimmernummer.",
        "Sag, dass das Wasser kalt ist oder dass es kein heißes Wasser gibt.",
        "Erwähne, dass die Heizung nicht funktioniert oder der Fernseher kaputt ist.",
        "Sag, ob es viel Lärm auf deiner Etage oder im Flur gibt.",
        "Bitte höflich um Hilfe.",
        "Frag, ob jemand kommen kann oder ob du ein anderes Zimmer bekommen kannst."
    ]
}'::jsonb
            );
        END;
        $seed$;
