-- ============================================================
-- Seed: A0 English Path – STEP 5670 – Reading – follow central ideas in abstracts (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- 8 true_false exercises first
        '{"p": "El abstract A trata sobre sueño y rendimiento académico.", "p_de": "Abstract A behandelt Schlaf und akademische Leistung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los estudiantes que durmieron siete u ocho horas obtuvieron mejores resultados de media.", "p_de": "Studierende mit sieben oder acht Stunden Schlaf erzielten im Durchschnitt bessere Ergebnisse.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El abstract B se centra en ejercicio y memoria.", "p_de": "Abstract B konzentriert sich auf Bewegung und Gedächtnis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El segundo estudio dice que el ejercicio empeora la memoria a corto plazo.", "p_de": "Die zweite Studie sagt, Bewegung verschlechtere das Kurzzeitgedächtnis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Para seguir la idea central hay que buscar tema, método, hallazgo principal y conclusión.", "p_de": "Um die Hauptidee zu verfolgen, sollte man Thema, Methode, Hauptergebnis und Schluss suchen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que memorizar todos los detalles del abstract antes de entenderlo.", "p_de": "Man muss alle Details des Abstracts auswendig lernen, bevor man es versteht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Identificar qué se estudió y qué resultado apareció ya ayuda a seguir la idea central.", "p_de": "Zu erkennen, was untersucht wurde und welches Ergebnis herauskam, hilft bereits bei der Hauptidee.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los dos abstracts presentan estudios diferentes.", "p_de": "Die beiden Abstracts stellen unterschiedliche Studien vor.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Sobre qué trata el abstract A?", "p_de": "Worum geht es in Abstract A?", "s": {"type": "multiple_choice", "options": ["Sleep and academic performance", "Parking and bus travel", "Library fines and lockers"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto durmieron los estudiantes con mejores resultados en el primer estudio?", "p_de": "Wie lange schliefen die Studierenden mit den besseren Ergebnissen in der ersten Studie?", "s": {"type": "multiple_choice", "options": ["Seven to eight hours", "One to two hours", "Twelve to thirteen hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Sobre qué trata el abstract B?", "p_de": "Worum geht es in Abstract B?", "s": {"type": "multiple_choice", "options": ["Exercise and memory", "Climate policy and cities", "Industrial history and factories"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué frecuencia hacían ejercicio los estudiantes del segundo estudio?", "p_de": "Wie oft trainierten die Studierenden in der zweiten Studie?", "s": {"type": "multiple_choice", "options": ["Three times a week", "Once a month", "Every two hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué cuatro elementos recomienda buscar el texto?", "p_de": "Welche vier Elemente empfiehlt der Text zu suchen?", "s": {"type": "multiple_choice", "options": ["Topic, method, main finding, and conclusion", "Title, cover, price, and color", "Room, date, key, and shelf"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué idea central aparece en el primer abstract?", "p_de": "Welche Hauptidee erscheint im ersten Abstract?", "s": {"type": "multiple_choice", "options": ["Regular sleep supports academic performance", "Noise improves concentration", "Catalogues replace textbooks"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué idea central aparece en el segundo abstract?", "p_de": "Welche Hauptidee erscheint im zweiten Abstract?", "s": {"type": "multiple_choice", "options": ["Regular physical activity may improve memory", "Exercise reduces all motivation", "Conference papers are always longer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué te permite seguir ya la idea central?", "p_de": "Was erlaubt es dir bereits, die Hauptidee zu erkennen?", "s": {"type": "multiple_choice", "options": ["Knowing what was studied and what result was found", "Memorizing every number first", "Reading only the author name"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5670 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5670 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5670, 'en', 'reading', 'academic', 'Abstract A reports a study on sleep and academic performance. It says students who slept seven to eight hours before an exam scored higher on average than students with shorter sleep. The main idea is that regular sleep supports academic performance.

Abstract B reports a study on exercise and memory. It explains that students who did moderate exercise three times a week showed better short term memory in simple recall tasks. The central idea is that regular physical activity may improve memory.

When reading abstracts, look for four elements: topic, method, main finding, and conclusion. You do not need every detail first. If you can identify what was studied and what result was found, you can already follow the central idea.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Seguir las ideas centrales en resúmenes académicos', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Zentrale Ideen in Abstracts erkennen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
