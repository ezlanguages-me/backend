-- ============================================================
-- Seed: A0 English Path – STEP 6110 – Reading – read a maintenance request form
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_exercise_uuid UUID;
  ex JSONB;
  v_exercises JSONB[] := ARRAY[
    '{"es": "El piso es el 3B.", "de": "Die Wohnung ist 3B.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El radiador del dormitorio no funciona.", "de": "Der Heizkörper im Schlafzimmer funktioniert nicht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El problema es urgente porque la habitación está fría.", "de": "Das Problem ist dringend, weil das Zimmer kalt ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El equipo de reparación solo puede ir por la noche.", "de": "Das Reparaturteam kann nur nachts kommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "Se adjuntan fotos.", "de": "Fotos sind beigefügt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El número de referencia es 4582.", "de": "Die Referenznummer ist 4582.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El formulario se envía a maintenance@example.com.", "de": "Das Formular wird an maintenance@example.com gesendet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La llamada puede hacerse entre las 9 y las 11 de la mañana.", "de": "Der Anruf kann zwischen 9 und 11 Uhr morgens erfolgen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué piso es?", "de": "Welche Wohnung ist es?", "s_es": {"type": "multiple_choice", "options": ["3B", "2A", "4C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3B", "2A", "4C"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué no funciona?", "de": "Was funktioniert nicht?", "s_es": {"type": "multiple_choice", "options": ["El radiador del dormitorio", "La televisión", "La puerta del coche"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Heizkörper im Schlafzimmer", "Der Fernseher", "Die Autotür"], "answer": 0}}'::jsonb,
    '{"es": "¿Por qué es urgente?", "de": "Warum ist es dringend?", "s_es": {"type": "multiple_choice", "options": ["Porque la habitación está fría", "Porque hay ruido fuera", "Porque llega una carta"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil das Zimmer kalt ist", "Weil es draußen laut ist", "Weil ein Brief kommt"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuándo pueden llamar?", "de": "Wann können sie anrufen?", "s_es": {"type": "multiple_choice", "options": ["Por la mañana entre las 9 y las 11", "Solo a medianoche", "Durante el fin de semana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morgens zwischen 9 und 11 Uhr", "Nur um Mitternacht", "Am Wochenende"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué puede hacer el equipo?", "de": "Was kann das Team tun?", "s_es": {"type": "multiple_choice", "options": ["Entrar con una llave de repuesto", "Romper una ventana", "Llamar al buzón"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einem Ersatzschlüssel eintreten", "Ein Fenster einschlagen", "Den Briefkasten anrufen"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué se adjunta?", "de": "Was ist beigefügt?", "s_es": {"type": "multiple_choice", "options": ["Fotos", "Billetes", "Flores"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fotos", "Tickets", "Blumen"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuál es el número de referencia?", "de": "Wie lautet die Referenznummer?", "s_es": {"type": "multiple_choice", "options": ["4582", "4825", "5842"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["4582", "4825", "5842"], "answer": 0}}'::jsonb,
    '{"es": "¿A qué correo se envía?", "de": "An welche E-Mail wird es gesendet?", "s_es": {"type": "multiple_choice", "options": ["maintenance@example.com", "info@example.com", "rent@example.com"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["maintenance@example.com", "info@example.com", "rent@example.com"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6110 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6110 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6110 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6110 AND source_language = 'en';
  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 6110, 'en', 'reading', 'Alquileres', $content$
Maintenance request form: Flat 3B. Issue: the bedroom radiator is not working. The problem is urgent because the room is cold.

Contact time: mornings between 9 and 11. The repair team can enter with a spare key. Photos are attached.

Reference number: 4582. Send the form to maintenance@example.com.
$content$)
  RETURNING uuid INTO v_reading_uuid;
  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Lee un formulario de solicitud de mantenimiento', 'Lee un formulario breve sobre una avería en una vivienda alquilada.'),
         (v_reading_uuid, 'de', 'Lies ein Wartungsformular', 'Lies ein kurzes Formular zu einem Schaden in einer Mietwohnung.');

  FOREACH ex IN ARRAY v_exercises LOOP
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
