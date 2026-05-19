-- ============================================================
-- Seed: A0 English Path – STEP 2270 – Speaking – make a complaint about straightforward matters, for example, the service or the bill (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 2270 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 2270, 'en', 'speaking', 'Restauración')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'es', 'Pedir una solución por un problema de servicio o cuenta', '', '{"scenario": "Tienes un pedido equivocado, tu bebida no llega y la cuenta tiene un error. Explica el problema y pide una solución adecuada.", "tasks": ["Llama al camarero o al encargado.", "Explica qué plato has pedido realmente.", "Menciona que falta una bebida o un acompañamiento.", "Di qué error hay en la cuenta.", "Pide una nueva cuenta correcta.", "Pide una solución rápida o una pequeña compensación.", "Pregunta cuánto tiempo tardará la solución.", "Termina de forma firme pero educada."]}'::jsonb);
    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES (v_speaking_id, 'de', 'Eine Lösung für Service- oder Rechnungsprobleme verlangen', '', '{"scenario": "Du hast eine falsche Bestellung, dein Getränk kommt nicht und die Rechnung hat einen Fehler. Erkläre das Problem und bitte um eine passende Lösung.", "tasks": ["Rufe den Kellner oder den Manager.", "Erkläre, welches Gericht du wirklich bestellt hast.", "Erwähne, dass ein Getränk oder eine Beilage fehlt.", "Sage, welcher Fehler auf der Rechnung steht.", "Bitte um eine neue korrekte Rechnung.", "Bitte um eine schnelle Lösung oder eine kleine Entschädigung.", "Frage, wie lange die Lösung dauern wird.", "Beende bestimmt, aber höflich."]}'::jsonb);
END;
$seed$;
