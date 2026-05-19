-- ============================================================
-- Seed: A0 English Path – STEP 4740 – Writing – write a continuous set of instructions, for example a section of an operating manual, provided that they are simple and of limited length (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing
            WHERE step_order = 4740
              AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 4740, 'en', 'writing', 'professional')
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
                'Escribe una sección de manual de operaciones',
                '',
                '{
    "scenario": "Eres responsable técnico y debes escribir una sección del manual de operaciones para el sistema de impresión de la oficina. El texto debe ser claro, numerado y fácil de seguir para cualquier empleado.",
    "tasks": [
        "Añade un título de sección claro, por ejemplo, ''Cómo imprimir un documento''.",
        "Escribe una breve introducción de una o dos frases.",
        "Lista los pasos numerados para completar la tarea.",
        "Incluye al menos seis pasos claros y específicos.",
        "Añade una nota de advertencia si hay algo que puede salir mal.",
        "Escribe qué hacer si ocurre un error común.",
        "Usa verbos en forma de comando (imperativo) para cada paso.",
        "Termina con una nota sobre dónde obtener más ayuda."
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
                'Schreibe einen Abschnitt eines Betriebshandbuchs',
                '',
                '{
    "scenario": "Sie sind technisch Verantwortlicher und schreiben einen Abschnitt des Betriebshandbuchs für das Drucksystem. Der Text soll klar, nummeriert und für alle Mitarbeiter leicht verständlich sein.",
    "tasks": [
        "Fügen Sie einen klaren Abschnittstitel ein, z.B. ''Wie man ein Dokument druckt''.",
        "Schreiben Sie eine kurze Einleitung von ein bis zwei Sätzen.",
        "Listen Sie die nummerierten Schritte auf.",
        "Fügen Sie mindestens sechs klare und spezifische Schritte ein.",
        "Fügen Sie eine Warnungsnotiz hinzu, falls etwas schiefgehen kann.",
        "Beschreiben Sie, was bei einem häufigen Fehler zu tun ist.",
        "Verwenden Sie Imperativformen für jeden Schritt.",
        "Enden Sie mit einem Hinweis, wo weitere Hilfe erhältlich ist."
    ]
}'::jsonb
            );
        END;
        $seed$;
