-- ============================================================
-- Seed: A0 English Path – STEP 5280 – Reading – understand presentation slides/notes (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La primera diapositiva presenta el objetivo del proyecto.", "p_de": "Die erste Folie zeigt das Ziel des Projekts.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La segunda diapositiva dice que respondieron 120 estudiantes.", "p_de": "Die zweite Folie sagt, dass 120 Studierende geantwortet haben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tercera diapositiva indica un treinta y cinco por ciento de visitas frecuentes.", "p_de": "Die dritte Folie nennt fünfunddreißig Prozent häufige Besuche.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La franja con más actividad es de dos a cuatro de la tarde.", "p_de": "Die geschäftigste Zeit ist von zwei bis vier Uhr nachmittags.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala silenciosa es el espacio de estudio más popular.", "p_de": "Der stille Raum ist der beliebteste Lernort.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El uso del fin de semana es alto según la diapositiva 6.", "p_de": "Die Wochenendnutzung ist laut Folie 6 hoch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las recomendaciones finales incluyen más enchufes.", "p_de": "Die letzten Empfehlungen umfassen mehr Steckdosen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También sugieren más horas de sala silenciosa en semanas de exámenes.", "p_de": "Sie schlagen auch längere Öffnungszeiten des stillen Raums in Prüfungswochen vor.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuál es el objetivo del proyecto?", "p_de": "Was ist das Ziel des Projekts?", "s": {"type": "multiple_choice", "options": ["To understand how students use the library", "To test new office phones", "To compare hotel prices"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos estudiantes respondieron la encuesta?", "p_de": "Wie viele Studierende beantworteten die Umfrage?", "s": {"type": "multiple_choice", "options": ["120 students", "65 students", "40 students"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué porcentaje visita la biblioteca tres veces por semana o más?", "p_de": "Welcher Prozentsatz besucht die Bibliothek dreimal pro Woche oder öfter?", "s": {"type": "multiple_choice", "options": ["Sixty-five percent", "Thirty-five percent", "Ninety percent"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la hora de más uso?", "p_de": "Wann ist die stärkste Nutzungszeit?", "s": {"type": "multiple_choice", "options": ["From 2:00 to 4:00 p.m.", "From 6:00 to 8:00 a.m.", "From 9:00 to 10:00 p.m."], "answer": 0}}'::jsonb,
        '{"p": "¿Qué espacio es el más popular?", "p_de": "Welcher Raum ist am beliebtesten?", "s": {"type": "multiple_choice", "options": ["The quiet room", "The cafe area", "The printer corner"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es el uso del fin de semana?", "p_de": "Wie ist die Wochenendnutzung?", "s": {"type": "multiple_choice", "options": ["It stays low", "It is the highest of the week", "It is not measured"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recurso físico recomiendan añadir?", "p_de": "Welches physische Angebot empfehlen sie zusätzlich?", "s": {"type": "multiple_choice", "options": ["More power sockets", "More parking tickets", "More projector screens"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo sugieren más horas de sala silenciosa?", "p_de": "Wann schlagen sie längere Öffnungszeiten vor?", "s": {"type": "multiple_choice", "options": ["During exam weeks", "Only in summer", "On conference days"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5280 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5280 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5280, 'en', 'reading', 'academic', 'Slide notes: Slide 1 shows the project goal: understand how students use the library during the week. Slide 2 reports that 120 students answered the survey.

Slide 3 shows that sixty-five percent visit the library three times a week or more. Slide 4 says the busiest time is from 2:00 to 4:00 p.m. Slide 5 notes that the quiet room is the most popular study space.

Slide 6 explains that weekend use stays low. The final slide lists two recommendations: more power sockets and longer quiet-room hours during exam weeks.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Diapositivas sobre el uso de la biblioteca', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Folien über Bibliotheksnutzung', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
