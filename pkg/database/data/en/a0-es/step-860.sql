-- ============================================================
-- Seed: A0 English Path – STEP 860 – Reading – understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_exercise_uuid UUID;
  ex JSONB;
  v_exercises JSONB[] := ARRAY[
        '{"es": "La clase de apoyo es el martes 14 de mayo a las 9:30 AM.", "de": "Der Förderunterricht ist am Dienstag, dem 14. Mai, um 9:30 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La clase es en el aula 204.", "de": "Der Unterricht ist in Raum 204.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes llegan a las 9:20 AM.", "de": "Die Lernenden kommen um 9:20 Uhr an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes solo llevan un lápiz rojo.", "de": "Die Lernenden bringen nur einen roten Stift mit.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Primero escriben el nombre y la fecha en la hoja.", "de": "Zuerst schreiben sie den Namen und das Datum auf das Blatt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Trabajan con una pareja desde el principio.", "de": "Sie arbeiten von Anfang an mit einem Partner.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La tarea es terminar el ejercicio 5 y enviar una foto.", "de": "Die Hausaufgabe ist, Übung 5 fertig zu machen und ein Foto zu senden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La prueba corta es el jueves en el aula 105.", "de": "Der kurze Test ist am Donnerstag in Raum 105.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿A qué hora empieza la clase de apoyo?", "de": "Um wie viel Uhr beginnt der Förderunterricht?", "s_es": {"type": "multiple_choice", "options": ["A las 9:30 AM", "A las 8:30 AM", "A las 10:30 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 9:30 Uhr", "Um 8:30 Uhr", "Um 10:30 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué aula es la clase?", "de": "In welchem Raum ist der Unterricht?", "s_es": {"type": "multiple_choice", "options": ["En el aula 204", "En el aula 104", "En el aula 220"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Raum 204", "In Raum 104", "In Raum 220"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué deben traer los estudiantes?", "de": "Was sollen die Lernenden mitbringen?", "s_es": {"type": "multiple_choice", "options": ["El libro, el cuaderno y un bolígrafo azul", "Solo el teléfono", "Una tablet y auriculares"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Buch, das Heft und einen blauen Stift", "Nur das Handy", "Ein Tablet und Kopfhörer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hacen después de escribir el nombre?", "de": "Was machen sie nach dem Schreiben des Namens?", "s_es": {"type": "multiple_choice", "options": ["Leer las páginas 6 y 7", "Salir del aula", "Llamar al profesor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Seiten 6 und 7 lesen", "Den Raum verlassen", "Die Lehrkraft anrufen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué preguntas contestan?", "de": "Welche Fragen beantworten sie?", "s_es": {"type": "multiple_choice", "options": ["Las preguntas 1 a 4", "Las preguntas 5 a 8", "Solo la pregunta 10"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Fragen 1 bis 4", "Die Fragen 5 bis 8", "Nur Frage 10"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo trabajan al principio?", "de": "Wie arbeiten sie am Anfang?", "s_es": {"type": "multiple_choice", "options": ["Solos durante diez minutos", "En grupos grandes", "Con el director"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Allein für zehn Minuten", "In großen Gruppen", "Mit dem Direktor"], "answer": 0}}'::jsonb,
        '{"es": "¿Antes de qué hora envían la foto?", "de": "Vor welcher Uhrzeit senden sie das Foto?", "s_es": {"type": "multiple_choice", "options": ["Antes de las 6 PM del miércoles", "Antes de las 9 PM del martes", "Antes del mediodía"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 18 Uhr am Mittwoch", "Vor 21 Uhr am Dienstag", "Vor Mittag"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde es la prueba corta del viernes?", "de": "Wo ist der kurze Test am Freitag?", "s_es": {"type": "multiple_choice", "options": ["En el aula 105", "En el aula 204", "En la biblioteca"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Raum 105", "In Raum 204", "In der Bibliothek"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  DELETE FROM exercise_translation
  WHERE exercise_uuid IN (
    SELECT e.uuid
    FROM exercise e
    JOIN reading r ON r.uuid = e.target_uuid
    WHERE r.path_uuid = v_path_uuid AND step_order = 860 AND source_language = 'en'
  );

  DELETE FROM exercise
  WHERE target_uuid IN (
    SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 860 AND source_language = 'en'
  );

  DELETE FROM reading_translation
  WHERE reading_uuid IN (
    SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 860 AND source_language = 'en'
  );

  DELETE FROM reading
  WHERE path_uuid = v_path_uuid AND step_order = 860 AND source_language = 'en';

  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (
    v_path_uuid,
    860,
    'en',
    'reading',
    'education',
    'Hello students,

Our English support class is on Tuesday, 14 May, at 9:30 AM in Room 204. Please come at 9:20 AM. Bring your book, your notebook, and a blue pen.

First, write your name and the date on the worksheet. Next, read pages 6 and 7. Then answer questions 1 to 4. Work alone for ten minutes, and then check your answers with a partner.

For homework, finish Exercise 5 and send one photo before Wednesday at 6 PM. Next Friday, we meet in Room 105 for the short test. If you cannot come, email your teacher.'
  )
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES
    (v_reading_uuid, 'es', 'Horario de clase y tarea', 'Lee un aviso escolar con hora, fecha, aula e instrucciones básicas para una tarea.'),
    (v_reading_uuid, 'de', 'Unterrichtszeit und Hausaufgabe', 'Lies eine kurze Schulmitteilung mit Uhrzeit, Datum, Raum und einfachen Arbeitsanweisungen.');

  FOREACH ex IN ARRAY v_exercises
  LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_reading_uuid, NULL)
    RETURNING uuid INTO v_exercise_uuid;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
      (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
      (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;
