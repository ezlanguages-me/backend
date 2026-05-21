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
        '{"es": "La lectura trata de un seminario de geografía.", "de": "Der Text handelt von einem Geographie-Seminar.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El seminario es en el aula 18 a las 9 AM.", "de": "Das Seminar ist in Raum 18 um 9 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes usan el teléfono durante la discusión.", "de": "Die Lernenden benutzen während der Diskussion das Handy.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Primero leen un mapa en la página 40.", "de": "Zuerst lesen die Lernenden eine Karte auf Seite 40.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después subrayan cinco fechas en el texto.", "de": "Danach unterstreichen sie fünf Daten im Text.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La tarea es subir un resumen antes del sábado a las 12 PM.", "de": "Die Hausaufgabe ist, vor Samstag um 12 Uhr eine Zusammenfassung hochzuladen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué llevan los estudiantes al seminario?", "de": "Was bringen die Lernenden zum Seminar mit?", "s_es": {"type": "multiple_choice", "options": ["Solo una tableta", "Libro de historia, cuaderno y bolígrafo negro", "Pinturas y tijeras"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Nur ein Tablet", "Geschichtsbuch, Heft und schwarzen Stift", "Farben und Schere"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué escriben al final en clase?", "de": "Was schreiben die Lernenden am Ende im Unterricht?", "s_es": {"type": "multiple_choice", "options": ["Un examen completo", "Una lista de compras", "Cuatro frases sobre la calzada romana"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Eine ganze Prüfung", "Eine Einkaufsliste", "Vier Sätze über die Römerstraße"], "answer": 2}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading r ON r.uuid = e.target_uuid WHERE r.path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 940 AND source_language = 'en';

  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (
    v_path_uuid,
    940,
    'en',
    'reading',
    'education',
    'Hello class,

Our history seminar is on Friday, 24 January, at 9 AM in Room 18. This is a history class, not a geography class. Please come at 8:50 AM. Bring your history book, your notebook, and a black pen.

In the seminar, we start with the map on page 40. Read it carefully. Then underline three dates in the text. Remember: only three dates, not five. After that, talk with a partner about the Roman road.

Write four short sentences on the worksheet. Write about what you read and discussed. Please keep your phone in your bag during the discussion. Speak quietly and listen to your partner.

For homework, write a short summary about the Roman road. Upload the summary to the class website before Saturday at 12 PM. Do not send it by email.

Next week, bring the same worksheet to class again.'
)RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title)
  VALUES (v_reading_uuid, 'es', 'Seminario de historia'), (v_reading_uuid, 'de', 'Geschichtsseminar');

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_uuid, NULL) RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
           (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;

