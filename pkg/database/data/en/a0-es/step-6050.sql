-- ============================================================
-- Seed: A0 English Path – STEP 6050 – Listening – listen to landlord explaining terms
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
    '{"es": "La vivienda está en near the station.", "de": "Die Unterkunft liegt in near the station.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Dónde está la vivienda?", "de": "Wo liegt die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["near the station", "una zona ruidosa", "un polígono industrial"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["near the station", "eine laute Gegend", "ein Industriegebiet"], "answer": 0}}'::jsonb,
    '{"es": "La renta es de £540 al mes.", "de": "Die Miete beträgt 540 im Monat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la renta?", "de": "Wie hoch ist die Miete?", "s_es": {"type": "multiple_choice", "options": ["£540", "£500", "£600"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["540 £", "500 £", "600 £"], "answer": 0}}'::jsonb,
    '{"es": "La fianza es de £540.", "de": "Die Kaution beträgt 540 .", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la fianza?", "de": "Wie hoch ist die Kaution?", "s_es": {"type": "multiple_choice", "options": ["£540", "£490", "£590"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["540 £", "490 £", "590 £"], "answer": 0}}'::jsonb,
    '{"es": "Los gastos no están incluidos.", "de": "Die Nebenkosten sind nicht enthalten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Están incluidos los gastos?", "de": "Sind die Nebenkosten enthalten?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo la calefacción"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur die Heizung"], "answer": 1}}'::jsonb,
    '{"es": "La vivienda está amueblada.", "de": "Die Unterkunft ist möbliert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿La vivienda está amueblada?", "de": "Ist die Unterkunft möbliert?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo parcialmente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur teilweise"], "answer": 0}}'::jsonb,
    '{"es": "La vivienda tiene a shared garden and a bike shed.", "de": "Die Unterkunft hat a shared garden and a bike shed.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué tiene la vivienda?", "de": "Was hat die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["a shared garden and a bike shed", "un garaje", "un sótano"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["a shared garden and a bike shed", "eine Garage", "einen Keller"], "answer": 0}}'::jsonb,
    '{"es": "El contrato es de 6 months minimum.", "de": "Der Vertrag läuft 6 months minimum.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿De cuánto es el contrato?", "de": "Wie lang ist der Vertrag?", "s_es": {"type": "multiple_choice", "options": ["6 months minimum", "6 meses", "18 meses"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["6 months minimum", "6 Monate", "18 Monate"], "answer": 0}}'::jsonb,
    '{"es": "Puedes mudarte el after references are checked.", "de": "Du kannst am after references are checked einziehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuándo puedes mudarte?", "de": "Wann kannst du einziehen?", "s_es": {"type": "multiple_choice", "options": ["after references are checked", "el próximo mes", "hoy mismo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["after references are checked", "nächsten Monat", "heute noch"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN listening t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6050 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6050 AND source_language = 'en');
  DELETE FROM listening_translation WHERE listening_uuid IN (SELECT uuid FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6050 AND source_language = 'en');
  DELETE FROM listening WHERE path_uuid = v_path_uuid AND step_order = 6050 AND source_language = 'en';
  INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
  VALUES (v_path_uuid, 6050, 'en', 'listening', 'Alquileres', $transcript$
The property is a house share in near the station. The rent is £540 a month and the deposit is £540.

Bills are not included. The place is furnished and has a shared garden and a bike shed.

The contract is 6 months minimum, and you can move in on after references are checked. No pets and a guarantor is required.
$transcript$)
  RETURNING uuid INTO v_listening_uuid;
  INSERT INTO listening_translation (listening_uuid, language, title, description)
  VALUES (v_listening_uuid, 'es', 'Escucha a la persona propietaria explicar las condiciones', 'Escucha a la persona propietaria explicar depósito, aviso y normas básicas.'),
         (v_listening_uuid, 'de', 'Höre zu, wie der Vermieter die Bedingungen erklärt', 'Höre, wie der Vermieter Kaution, Kündigung und Grundregeln erklärt.');

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
