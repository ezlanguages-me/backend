-- ============================================================
-- Seed: A0 English Path – STEP 4550 – Writing – write most letters (s)he is likely to be asked to do (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing
            WHERE step_order = 4550
              AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 4550, 'en', 'writing', 'professional')
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
                'Escribe una carta de seguimiento',
                '',
                '{
    "scenario": "Escribiste una carta de consulta hace dos semanas pero no has recibido respuesta. Escribe una carta de seguimiento amable pero directa para preguntar si recibieron tu mensaje anterior y pedir una respuesta.",
    "tasks": [
        "Abre con un saludo formal.",
        "Menciona que escribiste hace dos semanas sobre material de oficina.",
        "Di que no has recibido respuesta todavía.",
        "Adjunta o resume brevemente tu petición original.",
        "Pregunta si pueden responder esta semana.",
        "Indica que estás interesado en hacer un pedido pronto.",
        "Ofrece tu teléfono o correo para una respuesta rápida.",
        "Cierra con una despedida amable y profesional."
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
                'Schreibe ein Nachfassschreiben',
                '',
                '{
    "scenario": "Sie haben vor zwei Wochen einen Anfragebriefs geschickt, aber keine Antwort erhalten. Schreiben Sie ein freundliches, aber direktes Nachfassschreiben.",
    "tasks": [
        "Beginnen Sie mit einer formellen Begrüßung.",
        "Erwähnen Sie Ihr Schreiben von vor zwei Wochen über Büromaterial.",
        "Teilen Sie mit, dass Sie noch keine Antwort erhalten haben.",
        "Legen Sie Ihre ursprüngliche Anfrage kurz zusammen oder fügen Sie sie bei.",
        "Fragen Sie, ob diese Woche eine Antwort möglich ist.",
        "Weisen Sie darauf hin, dass Sie bald eine Bestellung aufgeben möchten.",
        "Geben Sie Ihre Telefonnummer oder E-Mail für eine schnelle Antwort an.",
        "Beenden Sie freundlich und professionell."
    ]
}'::jsonb
            );
        END;
        $seed$;
