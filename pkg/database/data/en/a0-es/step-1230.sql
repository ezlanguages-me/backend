-- ============================================================
-- Seed: A0 English Path – STEP 1230 – Speaking – exchange simple information with other customers in a queue (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 1230 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 1230, 'en', 'speaking', 'shopping')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Habla con otras personas mientras esperas en la cola', 'Practica frases muy cortas para confirmar turnos, dejar pasar y responder con educación en una cola.', '{"scenario": "Estás en la cola del supermercado con pocos productos. Otra persona llega detrás de ti y ambos necesitáis hablar un momento sobre el turno y sobre quién pasa primero.", "tasks": ["Empieza con una pregunta simple: Are you next?", "Di cuántos productos llevas.", "Pregunta si la otra persona tiene muchos artículos o solo una cesta.", "Ofrece dejar pasar primero a la otra persona o acepta su oferta.", "Da una razón simple, por ejemplo I only have two items.", "Haz un comentario breve sobre la cola: long, slow or fast.", "Di que tienes la tarjeta o el dinero preparado.", "Termina con una respuesta amable, como Thank you or You are welcome."]}'::jsonb),
        (v_speaking_id, 'de', 'Sprich mit anderen Menschen, während du in der Schlange wartest', 'Übe sehr kurze Sätze, um Plätze zu bestätigen, jemanden vorzulassen und höflich in einer Schlange zu antworten.', '{"scenario": "Du stehst mit wenigen Artikeln in der Supermarktschlange. Eine andere Person kommt hinter dir an, und ihr müsst kurz über den Platz in der Schlange und darüber sprechen, wer zuerst geht.", "tasks": ["Beginne mit einer einfachen Frage: Are you next?", "Sag, wie viele Artikel du dabeihast.", "Frage, ob die andere Person viele Artikel oder nur einen Korb hat.", "Biete an, die andere Person vorzulassen, oder nimm ihr Angebot an.", "Gib einen einfachen Grund, zum Beispiel I only have two items.", "Mach einen kurzen Kommentar über die Schlange: long, slow oder fast.", "Sag, dass du Karte oder Geld schon bereit hast.", "Beende das Gespräch mit einer freundlichen Antwort wie Thank you oder You are welcome."]}'::jsonb);
END;
$seed$;
