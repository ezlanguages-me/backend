-- ============================================================
-- Seed: A0 English Path – STEP 5380 – Speaking – respond to feedback gracefully (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 5380 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 5380, 'en', 'speaking', 'academic')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Responder al feedback con elegancia', '', '{"scenario": "Has recibido comentarios sobre una presentación o un ensayo y quieres responder de manera tranquila, abierta y profesional.", "tasks": ["Escucha el comentario y reconoce que lo has entendido.", "Da las gracias por la observación recibida.", "Di qué parte del comentario te parece útil.", "Explica brevemente qué vas a cambiar.", "Si algo no está claro, pide un ejemplo con educación.", "Menciona también un punto fuerte que quieres mantener.", "Resume tu siguiente paso de mejora.", "Termina con una respuesta positiva y respetuosa."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Gelassen auf Feedback reagieren', '', '{"scenario": "Du hast Rückmeldungen zu einem Vortrag oder Aufsatz erhalten und möchtest ruhig, offen und professionell darauf reagieren.", "tasks": ["Höre den Kommentar an und zeige, dass du ihn verstanden hast.", "Bedanke dich für die Rückmeldung.", "Sag, welcher Teil des Kommentars für dich nützlich ist.", "Erkläre kurz, was du ändern wirst.", "Wenn etwas unklar ist, bitte höflich um ein Beispiel.", "Nenne auch einen starken Punkt, den du beibehalten möchtest.", "Fasse deinen nächsten Verbesserungsschritt zusammen.", "Beende deine Reaktion positiv und respektvoll."]}'::jsonb);
END;
$seed$;
