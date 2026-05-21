-- ============================================================
-- Seed: A0 English Path – STEP 980 – Reading – check that all instructions are understood (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_exercise_uuid UUID;
  ex JSONB;
  v_exercises JSONB[] := ARRAY[
        '{"es": "La lección de hoy es en la sala de ordenadores 14.", "de": "Die heutige Stunde ist im Computerraum 14.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes abren el archivo Review-1.", "de": "Die Lernenden öffnen die Datei Review-1.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Primero leen una nota corta en la pantalla.", "de": "Zuerst lesen die Lernenden eine kurze Notiz auf dem Bildschirm.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después completan los ejercicios A a D.", "de": "Danach bearbeiten sie die Übungen A bis D.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Guardan el documento como Name-Review.", "de": "Sie speichern das Dokument als Name-Review.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Mañana deben traer calculadora y cuaderno.", "de": "Morgen sollen sie Taschenrechner und Heft mitbringen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Con qué inician sesión los estudiantes?", "de": "Womit melden sich die Lernenden an?", "s_es": {"type": "multiple_choice", "options": ["Con un pasaporte", "Con la tarjeta de estudiante", "Con un bolígrafo azul"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Mit einem Reisepass", "Mit dem Studentenausweis", "Mit einem blauen Stift"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué hacen después de guardar el documento?", "de": "Was machen die Lernenden nach dem Speichern des Dokuments?", "s_es": {"type": "multiple_choice", "options": ["Ir a casa", "Cambiar de aula", "Imprimir una página"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Nach Hause gehen", "Den Raum wechseln", "Eine Seite drucken"], "answer": 2}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading r ON r.uuid = e.target_uuid WHERE r.path_uuid = v_path_uuid AND step_order = 980 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 980 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 980 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 980 AND source_language = 'en';

  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (
    v_path_uuid,
    980,
    'en',
    'reading',
    'education',
    'Hello students,

Today we meet in Computer Room 14 on Monday, 16 June, at 3 PM. The room is in the main building. Please come on time.

When you arrive, log in with your student card. You cannot use a passport or any other card. After you log in, open the file called Review-2. Do not open Review-1.

First, read the short note on the screen. It has important information. Then complete Exercises A to C. There are three exercises in the file. After you finish, save the document with the name Name-Review. Then print one page and give it to the teacher.

After class, upload the file to the class website. The deadline is today at 7 PM. If a computer does not work, tell the assistant.

Tomorrow, bring your headphones and your notebook to class. You do not need a calculator.'
)RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title)
  VALUES (v_reading_uuid, 'es', 'Comprueba las instrucciones'), (v_reading_uuid, 'de', 'Überprüfe die Anweisungen');

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_uuid, NULL) RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
           (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;

