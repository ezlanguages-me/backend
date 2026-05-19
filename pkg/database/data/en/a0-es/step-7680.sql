-- ============================================================
-- Seed: A0 English Path – STEP 7680 – Speaking – hold position during discussion (Reuniones y Presentaciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_speaking_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM speaking WHERE step_order = 7680 AND path_uuid = v_path_id;

    INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
    VALUES (v_path_id, 7680, 'en', 'speaking', 'meetings')
    RETURNING uuid INTO v_speaking_id;

    INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
    VALUES
        (v_speaking_id, 'es', 'Mantén tu postura durante una discusión', 'Practica cómo sostener una opinión con razones, responder a presión y cerrar con una posición clara.', '{"scenario": "En una discusión de equipo, varias personas quieren mover la reunión semanal con clientes a la tarde. Tú piensas que la mañana sigue siendo la mejor opción y quieres mantener esa postura.", "tasks": ["Empieza diciendo tu posición de forma directa y educada.", "Da una primera razón relacionada con concentración o tiempo de respuesta.", "Añade una segunda razón con un ejemplo práctico del trabajo diario.", "Responde a una objeción sin abandonar tu idea principal.", "Repite tu punto clave con palabras diferentes.", "Ofrece un pequeño ajuste o compromiso que no cambie tu postura central.", "Pide al grupo que compare las dos opciones con criterios claros.", "Cierra con una frase firme que mantenga tu posición final."]}'::jsonb),
        (v_speaking_id, 'de', 'Halte deine Position in einer Diskussion', 'Übe, wie du eine Meinung mit Gründen vertrittst, auf Druck reagierst und mit einer klaren Position abschließt.', '{"scenario": "In einer Teamdiskussion wollen mehrere Personen das wöchentliche Kundentreffen auf den Nachmittag verlegen. Du findest, dass der Vormittag weiter die beste Option ist und möchtest diese Position halten.", "tasks": ["Beginne damit, deine Position direkt und höflich zu nennen.", "Gib einen ersten Grund zu Konzentration oder Reaktionszeit.", "Ergänze einen zweiten Grund mit einem praktischen Beispiel aus dem Arbeitsalltag.", "Reagiere auf einen Einwand, ohne deine Hauptidee aufzugeben.", "Wiederhole deinen Kernpunkt mit anderen Worten.", "Biete eine kleine Anpassung oder einen Kompromiss an, der deine zentrale Position nicht verändert.", "Bitte die Gruppe, beide Optionen mit klaren Kriterien zu vergleichen.", "Beende mit einem klaren Satz, der deine Schlussposition festhält."]}'::jsonb);
END;
$seed$;
