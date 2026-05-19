-- ============================================================
-- Seed: A0 English Path – STEP 7880 – Speaking – summarize a conference session (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7880 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7880, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Resume una sesión de conferencia', 'Practica un resumen oral muy breve de una sesión de conferencia para otra persona.', '{"scenario": "Has salido de una sesión de conferencia y una compañera no ha podido entrar. Ahora le haces un resumen muy corto y claro de lo que has escuchado.", "tasks": ["Di el tema o el nombre de la sesión.", "Menciona quién fue la persona que habló.", "Di cuándo fue la sesión, por ejemplo Monday morning.", "Explica una idea principal con una frase corta.", "Menciona un ejemplo útil de la sesión.", "Di qué preguntó el público.", "Explica la próxima acción o el siguiente paso.", "Termina con una opinión breve, por ejemplo It was clear or It was useful."]}'::jsonb),
        (v_speaking_id, 'de', 'Fasse eine Konferenzsitzung zusammen', 'Übe eine sehr kurze mündliche Zusammenfassung einer Konferenzsitzung für eine andere Person.', '{"scenario": "Du kommst aus einer Konferenzsitzung, und eine Kollegin konnte nicht hineingehen. Jetzt gibst du ihr eine sehr kurze und klare Zusammenfassung von dem, was du gehört hast.", "tasks": ["Nenne das Thema oder den Namen der Sitzung.", "Sag, wer gesprochen hat.", "Sag, wann die Sitzung war, zum Beispiel Monday morning.", "Erkläre eine Hauptidee mit einem kurzen Satz.", "Nenne ein nützliches Beispiel aus der Sitzung.", "Sag, was das Publikum gefragt hat.", "Erkläre die nächste Aktion oder den nächsten Schritt.", "Beende mit einer kurzen Meinung, zum Beispiel It was clear oder It was useful."]}'::jsonb);
END;
$seed$;
