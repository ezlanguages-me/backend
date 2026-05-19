-- ============================================================
-- Seed: A0 English Path - STEP 7710 - Reading - read a visual aid/slide (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La diapositiva trata sobre señales para salas de estudio silenciosas.", "de": "Die Folie handelt von Schildern für ruhige Lernräume.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La foto muestra tres puertas de biblioteca.", "de": "Das Foto zeigt drei Bibliothekstüren.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Green significa open.", "de": "Green bedeutet open.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Yellow significa full room.", "de": "Yellow bedeutet full room.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La diapositiva dice 40 students in one week.", "de": "Auf der Folie steht 40 students in one week.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La prueba usó 30 salas de estudio.", "de": "Im Test wurden 30 Lernräume benutzt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El resultado dice que los estudiantes encontraron una sala más rápido.", "de": "Das Ergebnis sagt, dass Studierende einen Raum schneller fanden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Una pequeña tarjeta de color puede ahorrar tiempo.", "de": "Eine kleine Farbkarte kann Zeit sparen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuál es el título de la diapositiva?", "de": "Wie lautet der Titel der Folie?", "s_es": {"type": "multiple_choice", "options": ["Quiet Study Room Signs", "Library Bus Times", "Coffee Break Plan"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Quiet Study Room Signs", "Library Bus Times", "Coffee Break Plan"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significa red?", "de": "Was bedeutet red?", "s_es": {"type": "multiple_choice", "options": ["Sala llena", "Sala abierta", "Sala nueva"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Voller Raum", "Offener Raum", "Neuer Raum"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas salas de estudio había en la prueba?", "de": "Wie viele Lernräume gab es im Test?", "s_es": {"type": "multiple_choice", "options": ["3", "8", "40"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3", "8", "40"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué se ve en la foto?", "de": "Was sieht man auf dem Foto?", "s_es": {"type": "multiple_choice", "options": ["Tres puertas de biblioteca", "Un mapa de tren", "Un menú de café"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Bibliothekstüren", "Einen Zugplan", "Ein Cafémenü"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué significa yellow?", "de": "Was bedeutet yellow?", "s_es": {"type": "multiple_choice", "options": ["Sala ocupada", "Sala vacía", "Edificio cerrado"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Besetzter Raum", "Leerer Raum", "Geschlossenes Gebäude"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos estudiantes aparecen en la gráfica simple?", "de": "Wie viele Studierende stehen im einfachen Diagramm?", "s_es": {"type": "multiple_choice", "options": ["40", "14", "4"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["40", "14", "4"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el resultado principal?", "de": "Was ist das wichtigste Ergebnis?", "s_es": {"type": "multiple_choice", "options": ["Los estudiantes encontraron una sala más rápido", "Los estudiantes se quedaron en casa", "El personal cerró las salas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Studierenden fanden schneller einen Raum", "Die Studierenden blieben zu Hause", "Das Personal schloss die Räume"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué puede hacer una pequeña tarjeta de color?", "de": "Was kann eine kleine Farbkarte tun?", "s_es": {"type": "multiple_choice", "options": ["Ahorrar tiempo", "Abrir la puerta", "Limpiar la sala"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zeit sparen", "Die Tür öffnen", "Den Raum reinigen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7710 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7710 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7710, 'en', 'reading', 'meetings', 'Conference Slide 3
Title: Quiet Study Room Signs\n\nPhoto:
Three library doors with green, yellow, and red cards\n\nMain points:
- Green = open room
- Yellow = busy room
- Red = full room\n\nSimple chart:
- 40 students in one week
- 3 study rooms in the test\n\nResult:
- Students found a room faster\n\nTake-away:
- One small color card can save time')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Leer una diapositiva con apoyo visual', 'Lee una diapositiva sencilla de conferencia con foto, colores y cifras clave.'),
        (v_reading_id, 'de', 'Lies eine Folie mit visueller Hilfe', 'Lies eine einfache Konferenzfolie mit Foto, Farben und wichtigen Zahlen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
