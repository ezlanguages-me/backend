-- ============================================================
-- Seed: A0 English Path – STEP 940 – Reading – understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_exercise_uuid UUID;
  ex JSONB;
  v_exercises JSONB[] := ARRAY[
        '{"es": "La lectura trata de un seminario de historia.", "de": "Der Text handelt von einem Geschichtsseminar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El seminario es en el aula 18 a las 9 AM.", "de": "Das Seminar ist in Raum 18 um 9 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes usan el teléfono durante la discusión.", "de": "Die Lernenden benutzen während der Diskussion das Handy.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Primero leen un mapa en la página 40.", "de": "Zuerst lesen die Lernenden eine Karte auf Seite 40.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después subrayan tres fechas en el texto.", "de": "Danach unterstreichen sie drei Daten im Text.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tarea es subir un resumen antes del sábado a las 12 PM.", "de": "Die Hausaufgabe ist, vor Samstag um 12 Uhr eine Zusammenfassung hochzuladen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué llevan los estudiantes al seminario?", "de": "Was bringen die Lernenden zum Seminar mit?", "s_es": {"type": "multiple_choice", "options": ["Libro de historia, cuaderno y bolígrafo negro", "Solo una tableta", "Pinturas y tijeras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Geschichtsbuch, Heft und schwarzen Stift", "Nur ein Tablet", "Farben und Schere"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué escriben al final en clase?", "de": "Was schreiben die Lernenden am Ende im Unterricht?", "s_es": {"type": "multiple_choice", "options": ["Cuatro frases sobre la calzada romana", "Un examen completo", "Una lista de compras"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vier Sätze über die Römerstraße", "Eine ganze Prüfung", "Eine Einkaufsliste"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading r ON r.uuid = e.target_uuid WHERE r.path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en';

  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 940, 'en', 'reading', 'education', 'Hello class,

Our history seminar is on Friday, 24 January, at 9 AM in Room 18. Please come at 8:50 with your history book, notebook, and a black pen.

First, read the map on page 40. Next, underline three dates in the text. Then talk with a partner about the Roman road and write four short sentences on the worksheet.

Please keep your phone in your bag and speak quietly during the discussion.

For homework, write a short summary of the road and upload it before Saturday at 12 PM. Next week, bring the same worksheet again.') RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Instrucciones para un seminario de historia', 'Lee un mensaje del profesor con hora, aula, materiales y pasos concretos para un seminario de historia.'),
         (v_reading_uuid, 'de', 'Anweisungen für ein Geschichtsseminar', 'Lies eine Nachricht der Lehrkraft mit Uhrzeit, Raum, Material und konkreten Schritten für ein Geschichtsseminar.');

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_uuid, NULL) RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
           (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;

