-- ============================================================
-- Seed: A0 English Path – STEP 7540 – Speaking – present a simple project proposal (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7540 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7540, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Presenta una propuesta de proyecto sencilla', 'Practica una presentación corta con problema, solución, materiales, coste y beneficio.', '{"scenario": "Estás en una reunión del equipo y quieres presentar una propuesta simple para crear un rincón de espera para visitantes.", "tasks": ["Di el título corto de tu propuesta.", "Explica el problema con una frase simple.", "Presenta tu solución principal.", "Nombra dos o tres materiales que necesitas.", "Di el coste aproximado del proyecto.", "Explica cuándo puede empezar o terminar.", "Da un beneficio claro para visitantes o personal.", "Termina pidiendo una respuesta breve, por ejemplo Do you agree?"]}'::jsonb),
        (v_speaking_id, 'de', 'Präsentiere einen einfachen Projektvorschlag', 'Übe eine kurze Präsentation mit Problem, Lösung, Material, Kosten und Nutzen.', '{"scenario": "Du bist in einem Teammeeting und möchtest einen einfachen Vorschlag vorstellen, um eine Warteecke für Besucher zu schaffen.", "tasks": ["Nenne den kurzen Titel deines Vorschlags.", "Erkläre das Problem mit einem einfachen Satz.", "Stelle deine Hauptlösung vor.", "Nenne zwei oder drei Materialien, die du brauchst.", "Sag die ungefähren Projektkosten.", "Erkläre, wann es beginnen oder enden kann.", "Nenne einen klaren Nutzen für Besucher oder Personal.", "Beende mit einer kurzen Bitte um Antwort, zum Beispiel Do you agree?"]}'::jsonb);
END;
$seed$;
