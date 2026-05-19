-- ============================================================
-- Seed: A0 English Path – STEP 290 – Writing – express opinions of the 'I don't like..' type (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing WHERE step_order = 290 AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 290, 'en', 'writing', 'correspondence')
            RETURNING uuid INTO v_writing_id;

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'es', 'Hablar de gustos y opiniones', '',
                '{
    "scenario": "Quieres escribir un mensaje personal sobre cosas que te gustan y que no te gustan. Usa frases muy simples para dar tu opinión.",
    "tasks": [
        "Saluda a la otra persona.",
        "Di dos cosas que te gustan.",
        "Di dos cosas que no te gustan.",
        "Explica una preferencia con una razón muy breve.",
        "Pregunta a la otra persona qué le gusta.",
        "Termina con una despedida sencilla."
    ]
}'::jsonb
            );

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'de', 'Über Vorlieben und Meinungen schreiben', '',
                '{
    "scenario": "Du möchtest eine persönliche Nachricht über Dinge schreiben, die du magst und nicht magst. Verwende sehr einfache Sätze, um deine Meinung auszudrücken.",
    "tasks": [
        "Begrüße die andere Person.",
        "Nenne zwei Dinge, die du magst.",
        "Nenne zwei Dinge, die du nicht magst.",
        "Erkläre eine Vorliebe mit einem sehr kurzen Grund.",
        "Frag die andere Person, was sie mag.",
        "Beende die Nachricht mit einer einfachen Verabschiedung."
    ]
}'::jsonb
            );
        END;
        $seed$;
