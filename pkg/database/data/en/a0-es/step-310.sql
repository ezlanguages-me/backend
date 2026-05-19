-- ============================================================
-- Seed: A0 English Path – STEP 310 – Writing – write simple letters relating facts and events (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================

        DO $seed$
        DECLARE
            v_path_id UUID;
            v_writing_id UUID;
        BEGIN
            SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

            DELETE FROM writing WHERE step_order = 310 AND path_uuid = v_path_id;

            INSERT INTO writing (path_uuid, step_order, source_language, type, category)
            VALUES (v_path_id, 310, 'en', 'writing', 'correspondence')
            RETURNING uuid INTO v_writing_id;

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'es', 'Contar hechos y eventos en una carta', '',
                '{
    "scenario": "Quieres contar a un amigo un hecho reciente, como una salida, una visita o un pequeño problema. Describe lo que pasó con frases cortas y en orden.",
    "tasks": [
        "Saluda al amigo.",
        "Di cuándo pasó el evento.",
        "Explica dónde estabas.",
        "Cuenta dos o tres cosas que pasaron.",
        "Di cómo te sentiste al final.",
        "Despídete y di que esperas su respuesta."
    ]
}'::jsonb
            );

            INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
            VALUES (
                v_writing_id, 'de', 'Ereignisse in einem einfachen Brief erzählen', '',
                '{
    "scenario": "Du möchtest einem Freund von einem kurzen Ereignis erzählen, zum Beispiel von einem Ausflug, einem Besuch oder einem kleinen Problem. Beschreibe mit kurzen Sätzen, was passiert ist.",
    "tasks": [
        "Begrüße deinen Freund.",
        "Sag, wann das Ereignis passiert ist.",
        "Erklär, wo du warst.",
        "Erzähl zwei oder drei Dinge, die passiert sind.",
        "Sag, wie du dich am Ende gefühlt hast.",
        "Verabschiede dich und sag, dass du auf eine Antwort hoffst."
    ]
}'::jsonb
            );
        END;
        $seed$;
