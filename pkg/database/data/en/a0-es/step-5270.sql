-- ============================================================
-- Seed: A0 English Path – STEP 5270 – Speaking – give a clear presentation on familiar topic (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5270 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5270, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Dar una presentación clara sobre un tema conocido', '', '{"scenario": "Vas a dar una presentación breve sobre un tema familiar de clase o del campus, con una estructura clara y algunos datos sencillos.", "tasks": ["Presenta el tema y explica por qué es importante.", "Organiza tu presentación en dos o tres partes claras.", "Da uno o dos ejemplos sencillos.", "Incluye un dato, una cifra o un resultado fácil de entender.", "Usa una frase para pasar de una parte a otra.", "Resume tu idea principal antes de terminar.", "Invita a preguntas del público.", "Cierra con una despedida breve y segura."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Einen klaren Vortrag zu einem vertrauten Thema halten', '', '{"scenario": "Du hältst einen kurzen Vortrag über ein vertrautes Thema aus dem Unterricht oder vom Campus mit klarer Struktur und einfachen Daten.", "tasks": ["Stell das Thema vor und erkläre, warum es wichtig ist.", "Ordne deinen Vortrag in zwei oder drei klare Teile.", "Gib ein oder zwei einfache Beispiele.", "Nenne eine Zahl oder ein leicht verständliches Ergebnis.", "Verwende einen Übergangssatz zwischen den Teilen.", "Fass deine Hauptidee vor dem Ende zusammen.", "Lade das Publikum zu Fragen ein.", "Beende den Vortrag mit einem kurzen sicheren Abschlusssatz."]}'::jsonb);
END;
$seed$;
