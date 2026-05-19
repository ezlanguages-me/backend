-- ============================================================
-- Seed: A0 English Path – STEP 4970 – Speaking – give a short seminar contribution (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 4970 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 4970, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Intervención breve en un seminario', '', '{"scenario": "En tu seminario vas a intervenir brevemente para comentar unos resultados sencillos de una encuesta y añadir una idea personal.", "tasks": ["Presenta el tema del que hablas.", "Menciona un resultado sencillo con una cifra.", "Explica por qué ese resultado te parece importante.", "Compara dos ideas o dos grupos de forma simple.", "Añade un problema que aparece en los datos.", "Propón una solución o una recomendación breve.", "Relaciona tu comentario con el seminario de hoy.", "Termina con una frase corta para invitar a la discusión."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Kurzer Beitrag im Seminar', '', '{"scenario": "Im Seminar gibst du einen kurzen Beitrag, um einfache Umfrageergebnisse zu kommentieren und eine eigene Idee hinzuzufügen.", "tasks": ["Stell das Thema deines Beitrags vor.", "Nenne ein einfaches Ergebnis mit einer Zahl.", "Erkläre, warum dieses Ergebnis für dich wichtig ist.", "Vergleiche zwei Ideen oder zwei Gruppen auf einfache Weise.", "Füge ein Problem hinzu, das in den Daten erscheint.", "Schlag kurz eine Lösung oder Empfehlung vor.", "Verbinde deinen Kommentar mit dem heutigen Seminar.", "Beende deinen Beitrag mit einem kurzen Satz, der zur Diskussion einlädt."]}'::jsonb);
END;
$seed$;
