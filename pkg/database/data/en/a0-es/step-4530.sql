-- ============================================================
-- Seed: A0 English Path – STEP 4530 – Writing – write straightforward, routine letters of a factual nature (enquiry letter) (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing
            WHERE step_order = 4530
              AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 4530, 'en', 'writing', 'professional')
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
                'Escribe una carta de consulta rutinaria',
                '',
                '{
    "scenario": "Trabaja en una empresa de oficinas y necesita solicitar información sobre un proveedor de material de oficina. Escribe una carta formal de consulta donde preguntes por productos, precios y condiciones de entrega.",
    "tasks": [
        "Encabeza la carta con tu nombre, empresa y fecha.",
        "Empieza con un saludo formal.",
        "Explica quién eres y a qué empresa representas.",
        "Di por qué escribes: necesitas información sobre material de oficina.",
        "Pregunta por los productos disponibles y los precios actuales.",
        "Pregunta por las condiciones de entrega y el plazo de envío.",
        "Pide un catálogo o lista de precios si está disponible.",
        "Termina con una despedida formal y tus datos de contacto."
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
                'Schreibe einen einfachen Anfragebriefs',
                '',
                '{
    "scenario": "Sie arbeiten in einem Büro und möchten Informationen bei einem Büromateriallieferanten anfragen. Schreiben Sie einen formellen Anfragebriefs mit Fragen zu Produkten, Preisen und Lieferbedingungen.",
    "tasks": [
        "Fügen Sie Ihren Namen, die Firma und das Datum als Kopfzeile ein.",
        "Beginnen Sie mit einer formellen Begrüßung.",
        "Erklären Sie, wer Sie sind und welche Firma Sie vertreten.",
        "Erklären Sie, warum Sie schreiben: Sie benötigen Informationen zu Büromaterial.",
        "Fragen Sie nach verfügbaren Produkten und aktuellen Preisen.",
        "Fragen Sie nach den Lieferbedingungen und der Lieferzeit.",
        "Bitten Sie um einen Katalog oder eine Preisliste, falls vorhanden.",
        "Beenden Sie mit einer formellen Verabschiedung und Ihren Kontaktdaten."
    ]
}'::jsonb
            );
        END;
        $seed$;
