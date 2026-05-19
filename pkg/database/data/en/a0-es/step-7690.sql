-- ============================================================
-- Seed: A0 English Path - STEP 7690 - Reading - read a conference paper abstract (Meetings)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El resumen trata sobre salas de estudio silenciosas.", "de": "Das Abstract handelt von ruhigen Lernräumen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El equipo usó tres señales de puerta.", "de": "Das Team benutzte drei Türschilder.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La señal azul significa que la sala está llena.", "de": "Das blaue Schild bedeutet, dass der Raum voll ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La prueba duró un mes.", "de": "Der Test dauerte einen Monat.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Cuarenta estudiantes usaron las salas.", "de": "Vierzig Studierende nutzten die Räume.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes encontraron una sala libre más despacio.", "de": "Die Studierenden fanden einen freien Raum langsamer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El personal respondió menos preguntas en el mostrador.", "de": "Das Personal beantwortete am Schalter weniger Fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El artículo concluye que pequeñas señales visuales pueden mejorar el flujo.", "de": "Der Text schließt, dass kleine visuelle Schilder den Ablauf verbessern können.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué color significa open?", "de": "Welche Farbe bedeutet open?", "s_es": {"type": "multiple_choice", "options": ["Verde", "Azul", "Negro"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Grün", "Blau", "Schwarz"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas salas estaban en la prueba?", "de": "Wie viele Räume waren im Test?", "s_es": {"type": "multiple_choice", "options": ["Tres", "Cinco", "Diez"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Fünf", "Zehn"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto duró la prueba?", "de": "Wie lange dauerte der Test?", "s_es": {"type": "multiple_choice", "options": ["Una semana", "Un mes", "Un día"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Woche", "Ein Monat", "Ein Tag"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién usó las salas?", "de": "Wer nutzte die Räume?", "s_es": {"type": "multiple_choice", "options": ["Estudiantes", "Profesores", "Visitantes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Studierende", "Lehrkräfte", "Besucher"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde hubo menos preguntas?", "de": "Wo gab es weniger Fragen?", "s_es": {"type": "multiple_choice", "options": ["En el mostrador de la biblioteca", "En la cafetería", "En la entrada"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Bibliotheksschalter", "In der Cafeteria", "Am Eingang"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué miraban los estudiantes antes de abrir la puerta?", "de": "Was sahen die Studierenden an, bevor sie die Tür öffneten?", "s_es": {"type": "multiple_choice", "options": ["El color", "El reloj", "El suelo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Farbe", "Die Uhr", "Den Boden"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el tema principal del resumen?", "de": "Was ist das Hauptthema des Abstracts?", "s_es": {"type": "multiple_choice", "options": ["Señales visuales simples para salas de estudio", "Una nueva sala de ordenadores", "Un horario de autobuses del campus"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einfache visuelle Schilder für Lernräume", "Ein neuer Computerraum", "Ein Campusbusfahrplan"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué lugar ocurrió el estudio?", "de": "Wo fand die Studie statt?", "s_es": {"type": "multiple_choice", "options": ["En una biblioteca universitaria", "En un hotel", "En un banco"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In einer Hochschulbibliothek", "In einem Hotel", "In einer Bank"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7690 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7690 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7690, 'en', 'reading', 'meetings', 'Conference Paper Abstract
Title: Color Signs for Quiet Study Rooms
Authors: Lena Ortiz and Malik Reed
Event: City Learning Conference\n\nAbstract:
This paper describes a simple system for quiet study rooms in a college library. The team used three door signs: green for open, yellow for busy, and red for full. They tested the signs for one week in three rooms. The paper reports that 40 students used the rooms during the test. Most students found a free room faster because they looked at the color before they opened the door. Library staff also answered fewer questions at the desk. The paper concludes that small visual signs can improve student flow in a busy study area.\n\nKeywords: library, study rooms, signs, students')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Leer el resumen de una ponencia de conferencia', 'Lee el resumen breve de una ponencia sobre señales de color para salas de estudio silenciosas.'),
        (v_reading_id, 'de', 'Lies das Abstract eines Konferenzvortrags', 'Lies ein kurzes Abstract über Farbschilder für ruhige Lernräume.');

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
