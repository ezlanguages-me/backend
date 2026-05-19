-- ============================================================
-- Seed: A0 English Path – STEP 6160 – Listening – listen to neighbour and building rules
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_listening_uuid UUID;
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
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN listening t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6160 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6160 AND source_language = 'en');
  DELETE FROM listening_translation WHERE listening_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6160 AND source_language = 'en');
  DELETE FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6160 AND source_language = 'en';
  INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
  VALUES (v_path_uuid, 6160, 'en', 'listening', 'Alquileres', $transcript$
Building rules: weekday quiet time starts at 9:30 PM and weekend quiet time starts at 11 PM.

No loud music in the hallway. Parcels are left at reception, parking is only in marked bays, and balcony doors should stay closed after dark.

Dogs must be on a leash in the lobby. Use the lift for moving boxes only with a booking, and return keys at the checkout desk.
$transcript$)
  RETURNING uuid INTO v_listening_uuid;
  INSERT INTO listening_translation (listening_uuid, language, title, description)
  VALUES (v_listening_uuid, 'es', 'Escucha las normas del edificio y del vecindario', 'Escucha a un encargado explicar las reglas del edificio.'),
         (v_listening_uuid, 'de', 'Höre die Regeln für Nachbarn und das Gebäude', 'Höre, wie ein Hausmeister die Regeln des Gebäudes erklärt.');

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_listening_uuid, NULL)
    RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
      (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
      (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;
