-- ============================================================
-- Seed: A0 English Path – STEP 1640 – Speaking – understand simple directions (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1640 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1640, 'en', 'speaking', 'Viajes y Transporte')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Explica cómo llegar al metro', '', '{"scenario": "Estás en la recepción de un hotel. Un huésped te pregunta cómo llegar a la estación de metro más cercana. Da indicaciones cortas y muy claras.", "tasks": ["Di desde qué lugar empieza la ruta.", "Indica cómo salir del hotel.", "Di si la persona debe girar a la izquierda o a la derecha.", "Menciona una calle o un punto de referencia.", "Explica cuánto debe caminar.", "Di dónde está la estación al final.", "Comprueba si la otra persona ha entendido.", "Termina con una frase amable."]}'::jsonb);

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Erkläre den Weg zur U-Bahn', '', '{"scenario": "Du bist an der Rezeption eines Hotels. Ein Gast fragt dich nach dem Weg zur nächsten U-Bahn-Station. Gib kurze und sehr klare Wegbeschreibungen.", "tasks": ["Sage, wo der Weg beginnt.", "Erkläre, wie man das Hotel verlässt.", "Sage, ob die Person links oder rechts abbiegen soll.", "Nenne eine Straße oder einen Orientierungspunkt.", "Erkläre, wie lange man zu Fuß geht.", "Sage, wo die Station am Ende liegt.", "Prüfe, ob die andere Person es verstanden hat.", "Beende mit einem freundlichen Satz."]}'::jsonb);
END;
$seed$;
