-- ============================================================
-- Seed: A0 English Path – STEP 4750 – Writing – write a set of instructions with clarity and precision, addressing the reader effectively (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing
            WHERE step_order = 4750
              AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 4750, 'en', 'writing', 'professional')
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
                'Escribe instrucciones técnicas con precisión',
                '',
                '{
    "scenario": "Un nuevo empleado necesita conectar su ordenador portátil a la red de la empresa y acceder al sistema interno. Escribe instrucciones claras y precisas que guíen al empleado paso a paso.",
    "tasks": [
        "Comienza con un título y el propósito de las instrucciones.",
        "Lista los requisitos previos: qué equipos y contraseñas necesita el empleado.",
        "Escribe el primer paso: conectar el portátil al WiFi de la empresa.",
        "Explica cómo acceder al portal interno con usuario y contraseña.",
        "Describe cómo verificar que la conexión es correcta.",
        "Incluye una advertencia sobre no compartir contraseñas.",
        "Explica qué hacer si la conexión falla: llamar a IT.",
        "Indica dónde encontrar más ayuda o documentación adicional."
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
                'Schreibe präzise technische Anweisungen',
                '',
                '{
    "scenario": "Ein neuer Mitarbeiter muss seinen Laptop mit dem Unternehmensnetzwerk verbinden und auf das interne System zugreifen. Schreiben Sie klare und präzise Anweisungen.",
    "tasks": [
        "Beginnen Sie mit einem Titel und dem Zweck der Anleitung.",
        "Listen Sie die Voraussetzungen auf: Geräte und Passwörter.",
        "Schreiben Sie den ersten Schritt: Laptop mit dem Firmen-WLAN verbinden.",
        "Erklären Sie, wie man mit Benutzername und Passwort auf das interne Portal zugreift.",
        "Beschreiben Sie, wie man überprüft, ob die Verbindung korrekt ist.",
        "Fügen Sie eine Warnung ein: Passwörter nicht weitergeben.",
        "Erklären Sie, was bei einem Verbindungsfehler zu tun ist: IT anrufen.",
        "Geben Sie an, wo weitere Hilfe oder Dokumentation zu finden ist."
    ]
}'::jsonb
            );
        END;
        $seed$;
