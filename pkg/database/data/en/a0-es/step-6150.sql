-- ============================================================
-- Seed: A0 English Path – STEP 6150 – Reading – understand house rules and regulations
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
    '{"es": "El silencio empieza a las 10 PM.", "de": "Die Ruhezeit beginnt um 22 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Los invitados deben registrarse y salir antes de las 11 PM.", "de": "Gäste müssen sich anmelden und vor 23 Uhr gehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Hay que separar la basura por días de reciclaje.", "de": "Der Müll muss nach Recyclingtagen getrennt werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Se puede fumar dentro.", "de": "Rauchen ist drinnen erlaubt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "Hay que reservar la lavandería.", "de": "Die Waschküche muss gebucht werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Las bicicletas van en el cobertizo.", "de": "Die Fahrräder kommen in den Schuppen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Hay que dejar los zapatos en la entrada.", "de": "Die Schuhe sollen am Eingang bleiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "La renta se paga el primer día del mes.", "de": "Die Miete wird am ersten Tag des Monats bezahlt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuándo empieza el silencio?", "de": "Wann beginnt die Ruhezeit?", "s_es": {"type": "multiple_choice", "options": ["A las 10 PM", "A las 8 PM", "A las 11 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 22 Uhr", "Um 20 Uhr", "Um 23 Uhr"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué deben hacer los invitados?", "de": "Was müssen Gäste tun?", "s_es": {"type": "multiple_choice", "options": ["Registrarse y salir antes de las 11 PM", "Dormir en el salón", "Dejar las llaves en la calle"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sich anmelden und vor 23 Uhr gehen", "Im Wohnzimmer schlafen", "Die Schlüssel auf der Straße lassen"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo se separa la basura?", "de": "Wie wird der Müll getrennt?", "s_es": {"type": "multiple_choice", "options": ["Por días de reciclaje", "Por colores de coche", "Por nombres"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach Recyclingtagen", "Nach Autofarben", "Nach Namen"], "answer": 0}}'::jsonb,
    '{"es": "¿Dónde se puede fumar?", "de": "Wo darf man rauchen?", "s_es": {"type": "multiple_choice", "options": ["Fuera", "En la cocina", "En el dormitorio"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Draußen", "In der Küche", "Im Schlafzimmer"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué hay que reservar?", "de": "Was muss gebucht werden?", "s_es": {"type": "multiple_choice", "options": ["La lavandería", "La ventana", "La escalera"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Waschküche", "Das Fenster", "Die Treppe"], "answer": 0}}'::jsonb,
    '{"es": "¿Dónde van las bicicletas?", "de": "Wohin kommen die Fahrräder?", "s_es": {"type": "multiple_choice", "options": ["Al cobertizo", "Al salón", "A la cocina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In den Schuppen", "Ins Wohnzimmer", "In die Küche"], "answer": 0}}'::jsonb,
    '{"es": "¿Dónde se dejan los zapatos?", "de": "Wo bleiben die Schuhe?", "s_es": {"type": "multiple_choice", "options": ["En la entrada", "En la ventana", "En el jardín"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Eingang", "Am Fenster", "Im Garten"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuándo se paga la renta?", "de": "Wann wird die Miete bezahlt?", "s_es": {"type": "multiple_choice", "options": ["El primer día del mes", "El último día del año", "Cada domingo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am ersten Tag des Monats", "Am letzten Tag des Jahres", "Jeden Sonntag"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6150 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6150 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6150 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6150 AND source_language = 'en';
  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 6150, 'en', 'reading', 'Alquileres', $content$
House rules: quiet time starts at 10 PM, and guests must sign in and leave by 11 PM.

Sort the rubbish by recycling day and smoke only outside. You must book the laundry room.

Bikes go in the shed, shoes stay at the entrance, and rent is paid on the first day of the month.
$content$)
  RETURNING uuid INTO v_reading_uuid;
  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Comprende las normas de la casa y la residencia', 'Lee unas normas sencillas para vivir en una casa compartida.'),
         (v_reading_uuid, 'de', 'Verstehe Hausregeln und Vorschriften', 'Lies einfache Regeln für das Leben in einer Wohngemeinschaft.');

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
