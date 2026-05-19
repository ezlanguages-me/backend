-- ============================================================
-- Seed: A0 English Path – STEP 4540 – Writing – write a non-routine letter restricted to matters of fact (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing
            WHERE step_order = 4540
              AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 4540, 'en', 'writing', 'professional')
            RETURNING uuid INTO v_writing_id;

            INSERT INTO writing_translation (
                writing_uuid,
                language,
                title,
                description,
                prompt
            )
            VALUES (
                v_writing_id,
                'es',
                'Escribe una carta de queja sobre un pedido',
                '',
                '{
    "scenario": "Ha recibido un pedido de material de oficina con artículos incorrectos y algunos dañados. Escribe una carta de queja formal al proveedor explicando el problema con datos concretos.",
    "tasks": [
        "Abre la carta con un saludo formal al proveedor.",
        "Indica el número de pedido y la fecha de entrega.",
        "Describe qué artículos llegaron incorrectos o dañados.",
        "Menciona el número de unidades afectadas.",
        "Explica el impacto que esto tiene en tu trabajo.",
        "Pide la reposición de los artículos correctos.",
        "Especifica cuándo necesitas la reposición.",
        "Termina con una petición de confirmación por escrito."
    ]
}'::jsonb
            );

            INSERT INTO writing_translation (
                writing_uuid,
                language,
                title,
                description,
                prompt
            )
            VALUES (
                v_writing_id,
                'de',
                'Schreibe einen Beschwerdebrief über eine Bestellung',
                '',
                '{
    "scenario": "Sie haben eine Bestellung mit falschen und beschädigten Artikeln erhalten. Schreiben Sie einen formellen Beschwerdebrief mit konkreten Informationen.",
    "tasks": [
        "Beginnen Sie mit einer formellen Begrüßung.",
        "Nennen Sie die Bestellnummer und das Lieferdatum.",
        "Beschreiben Sie, welche Artikel falsch oder beschädigt waren.",
        "Nennen Sie die Anzahl der betroffenen Einheiten.",
        "Erklären Sie, wie sich das auf Ihre Arbeit auswirkt.",
        "Fordern Sie den Ersatz der richtigen Artikel an.",
        "Geben Sie an, wann Sie den Ersatz benötigen.",
        "Bitten Sie am Ende um eine schriftliche Bestätigung."
    ]
}'::jsonb
            );
        END;
        $seed$;
