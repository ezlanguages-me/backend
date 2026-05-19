-- ============================================================
-- Seed: A0 English Path – STEP 770 – Writing – leave a simple message giving information on e.g. where he/she has gone, what time he/she will be back (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_uuid UUID;
    v_writing_uuid UUID;
BEGIN
    SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM writing
    WHERE step_order = 770 AND path_uuid = v_path_uuid;

    INSERT INTO writing (path_uuid, step_order, source_language, type, category)
    VALUES (
        v_path_uuid,
        770,
        'en',
        'writing',
        'communication'
    )
    RETURNING uuid INTO v_writing_uuid;

    INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
    VALUES
        (
            v_writing_uuid,
            'es',
            'Deja una nota sencilla en la oficina',
            'Escribe un mensaje breve para decir dónde has ido y cuándo vuelves.',
            '{
                "scenario": "Estás en una oficina y tienes que salir un momento. Tu compañero llegará pronto y necesita saber dónde estás. Escribe una nota corta y sencilla para dejarla en tu mesa.",
                "tasks": [
                    "Empieza la nota con el nombre de tu compañero.",
                    "Di que ahora no estás en la oficina.",
                    "Explica adónde has ido.",
                    "Añade una razón simple para tu salida.",
                    "Di a qué hora volverás.",
                    "Termina la nota con una despedida corta y tu nombre."
                ]
            }'::jsonb
        ),
        (
            v_writing_uuid,
            'de',
            'Hinterlasse eine einfache Notiz im Büro',
            'Schreibe eine kurze Nachricht, um zu sagen, wohin du gegangen bist und wann du zurückkommst.',
            '{
                "scenario": "Du bist in einem Büro und musst kurz weg. Dein Kollege kommt bald und muss wissen, wo du bist. Schreib eine kurze und einfache Notiz und lass sie auf deinem Schreibtisch.",
                "tasks": [
                    "Beginne die Notiz mit dem Namen deines Kollegen.",
                    "Sag, dass du jetzt nicht im Büro bist.",
                    "Erkläre, wohin du gegangen bist.",
                    "Füge einen einfachen Grund für dein Weggehen hinzu.",
                    "Sag, um wie viel Uhr du zurück sein wirst.",
                    "Beende die Notiz mit einer kurzen Verabschiedung und deinem Namen."
                ]
            }'::jsonb
        );
END;
$seed$;
