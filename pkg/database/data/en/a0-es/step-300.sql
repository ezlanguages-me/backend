-- ============================================================
-- Seed: A0 English Path – STEP 300 – Writing – write letters of a generally routine nature (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing WHERE step_order = 300 AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 300, 'en', 'writing', 'correspondence')
            RETURNING uuid INTO v_writing_id;

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'es', 'Carta personal rutinaria', '',
                '{
    "scenario": "Tienes que escribir una carta personal sobre un asunto normal de cada día, como una visita o un plan sencillo. El texto debe ser claro, corto y práctico.",
    "tasks": [
        "Saluda a la persona.",
        "Explica por qué escribes.",
        "Da la información principal: día, hora o lugar.",
        "Añade una instrucción o petición sencilla.",
        "Pregunta si todo está bien o si la persona puede venir.",
        "Despídete de forma amable."
    ]
}'::jsonb
            );

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'de', 'Einfacher Routinebrief', '',
                '{
    "scenario": "Du musst einen persönlichen Brief über eine normale Alltagssache schreiben, zum Beispiel über einen Besuch oder einen einfachen Plan. Der Text soll klar, kurz und praktisch sein.",
    "tasks": [
        "Begrüße die Person.",
        "Erklär, warum du schreibst.",
        "Gib die Hauptinformation: Tag, Uhrzeit oder Ort.",
        "Füg eine einfache Anweisung oder Bitte hinzu.",
        "Frag, ob alles gut ist oder ob die Person kommen kann.",
        "Verabschiede dich freundlich."
    ]
}'::jsonb
            );
        END;
        $seed$;
