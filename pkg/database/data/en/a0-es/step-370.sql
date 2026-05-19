-- ============================================================
-- Seed: A0 English Path – STEP 370 – Speaking – ask simple questions of a factual nature and understand the answers (Alojamiento)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_speaking_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM speaking WHERE step_order = 370 AND path_uuid = v_path_id;

            INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 370, 'en', 'speaking', 'accommodation')
            RETURNING uuid INTO v_speaking_id;

            INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
            VALUES (
                v_speaking_id, 'es', 'Preguntar en un hotel', '',
                '{
    "scenario": "Acabas de llegar a un hotel y hablas con la persona de recepción. Necesitas información básica sobre tu habitación y los servicios del hotel.",
    "tasks": [
        "Saluda y di que acabas de llegar al hotel.",
        "Pregunta si tu habitación es individual o doble y en qué planta está.",
        "Pregunta a qué hora es el desayuno y dónde está el comedor.",
        "Pregunta si hay Wi‑Fi gratis y dónde está la contraseña.",
        "Pregunta si hay aparcamiento y cuánto cuesta.",
        "Pregunta a qué hora es el check-out y termina con una despedida amable."
    ]
}'::jsonb
            );

            INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
            VALUES (
                v_speaking_id, 'de', 'Fragen im Hotel stellen', '',
                '{
    "scenario": "Du bist gerade in einem Hotel angekommen und sprichst mit der Rezeption. Du brauchst einfache Informationen über dein Zimmer und die Dienstleistungen des Hotels.",
    "tasks": [
        "Begrüße die Person und sag, dass du gerade im Hotel angekommen bist.",
        "Frag, ob dein Zimmer ein Einzelzimmer oder ein Doppelzimmer ist und in welchem Stock es liegt.",
        "Frag, wann das Frühstück ist und wo der Speisesaal ist.",
        "Frag, ob es kostenloses WLAN gibt und wo das Passwort steht.",
        "Frag, ob es Parkplätze gibt und was sie kosten.",
        "Frag, wann der Check-out ist, und verabschiede dich freundlich."
    ]
}'::jsonb
            );
        END;
        $seed$;
