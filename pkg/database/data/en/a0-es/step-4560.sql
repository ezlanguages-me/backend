-- ============================================================
-- Seed: A0 English Path – STEP 4560 – Writing – write any type of letter necessary in the course of his/her work (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing
            WHERE step_order = 4560
              AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 4560, 'en', 'writing', 'professional')
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
                'Escribe una carta formal de solicitud',
                '',
                '{
    "scenario": "Eres gerente de compras y necesitas solicitar formalmente una reunión con un proveedor clave para negociar un contrato anual. La carta debe ser formal, clara y convincente.",
    "tasks": [
        "Indica el asunto de la carta en el encabezado.",
        "Abre con un saludo formal y el nombre del destinatario.",
        "Preséntate y explica tu cargo.",
        "Explica el propósito: solicitar una reunión para negociar el contrato anual.",
        "Propón dos fechas y horarios posibles para la reunión.",
        "Menciona los temas que deseas tratar: precios, plazos y condiciones.",
        "Proporciona tus datos de contacto.",
        "Cierra formalmente y expresa tu esperanza de recibir una respuesta pronto."
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
                'Schreibe einen formellen Antragsbrief',
                '',
                '{
    "scenario": "Sie sind Einkaufsleiter und möchten offiziell ein Treffen mit einem wichtigen Lieferanten vereinbaren, um einen Jahresvertrag zu verhandeln.",
    "tasks": [
        "Geben Sie den Betreff des Briefes in der Kopfzeile an.",
        "Beginnen Sie mit einer formellen Begrüßung und dem Namen des Empfängers.",
        "Stellen Sie sich vor und nennen Sie Ihre Position.",
        "Erklären Sie den Zweck: ein Treffen für Jahresvertragsverhandlungen anfragen.",
        "Schlagen Sie zwei mögliche Termine und Uhrzeiten vor.",
        "Erwähnen Sie die Themen: Preise, Fristen und Konditionen.",
        "Geben Sie Ihre Kontaktdaten an.",
        "Beenden Sie formell und drücken Sie die Hoffnung auf eine baldige Antwort aus."
    ]
}'::jsonb
            );
        END;
        $seed$;
