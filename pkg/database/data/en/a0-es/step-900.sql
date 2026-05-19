-- ============================================================
-- Seed: A0 English Path – STEP 900 – Reading – check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_exercise_uuid UUID;
  ex JSONB;
  v_exercises JSONB[] := ARRAY[
        '{"es": "El correo es sobre un taller de pósteres de arte.", "de": "Die E-Mail handelt von einem Kunst-Poster-Workshop.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El taller es el jueves 12 de septiembre a las 2 PM en el aula de arte 7.", "de": "Der Workshop ist am Donnerstag, dem 12. September, um 14 Uhr in Kunstraum 7.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El estudiante lleva calculadora y cuaderno azul.", "de": "Der Lernende bringt einen Taschenrechner und ein blaues Heft mit.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Primero escribe su nombre en la carpeta.", "de": "Zuerst schreibt der Lernende seinen Namen auf die Mappe.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después elige dos colores para un póster de ciudad.", "de": "Danach wählt der Lernende zwei Farben für ein Stadtposter.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tarea es subir una foto antes del viernes a las 7 PM.", "de": "Die Hausaufgabe ist, vor Freitag um 19 Uhr ein Foto hochzuladen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué lleva el estudiante al taller?", "de": "Was bringt der Lernende zum Workshop mit?", "s_es": {"type": "multiple_choice", "options": ["Un delantal, una camiseta vieja y lápices de colores", "Solo el teléfono", "Una regla y una calculadora"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Schürze, ein altes T-Shirt und Buntstifte", "Nur das Handy", "Ein Lineal und einen Taschenrechner"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace después de mirar los ejemplos?", "de": "Was macht der Lernende nach dem Anschauen der Beispiele?", "s_es": {"type": "multiple_choice", "options": ["Elegir dos colores y pintar", "Salir del aula", "Escribir un examen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Farben wählen und malen", "Den Raum verlassen", "Eine Prüfung schreiben"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading r ON r.uuid = e.target_uuid WHERE r.path_uuid = v_path_uuid AND step_order = 900 AND source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 900 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 900 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 900 AND source_language = 'en';

  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 900, 'en', 'reading', 'education', 'Hello Ms Reed,

I want to check the art workshop details. The poster workshop is on Thursday, 12 September, at 2 PM in Art Room 7. I come at 1:50 PM with an apron, an old shirt, and my coloured pencils.

First, I write my name on the folder. Then I look at the example posters on the wall. Next, I choose two colours and paint a small city poster on page 3.

For homework, I finish the title and upload one photo before Friday at 7 PM. On Monday, we put the posters in the school hall.

Thank you for your help.')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Correo para confirmar un taller de arte', 'Lee un correo donde un estudiante repite instrucciones concretas para un taller de pósteres de arte.'),
         (v_reading_uuid, 'de', 'E-Mail zur Bestätigung eines Kunstworkshops', 'Lies eine E-Mail, in der ein Lernender konkrete Anweisungen für einen Kunst-Poster-Workshop wiederholt.');

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_uuid, NULL) RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
           (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;

