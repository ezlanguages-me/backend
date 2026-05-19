-- ============================================================
-- Seed: A0 English Path – STEP 6000 – Reading – establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres)
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
    '{"es": "La vivienda está en a quiet street in South London near a bus stop.", "de": "Die Unterkunft liegt in a quiet street in South London near a bus stop.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Dónde está la vivienda?", "de": "Wo liegt die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["a quiet street in South London near a bus stop", "una zona ruidosa", "un polígono industrial"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["a quiet street in South London near a bus stop", "eine laute Gegend", "ein Industriegebiet"], "answer": 0}}'::jsonb,
    '{"es": "La renta es de £860 al mes.", "de": "Die Miete beträgt 860 im Monat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la renta?", "de": "Wie hoch ist die Miete?", "s_es": {"type": "multiple_choice", "options": ["£860", "£820", "£920"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["860 £", "820 £", "920 £"], "answer": 0}}'::jsonb,
    '{"es": "La fianza es de £960.", "de": "Die Kaution beträgt 960 .", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la fianza?", "de": "Wie hoch ist die Kaution?", "s_es": {"type": "multiple_choice", "options": ["£960", "£910", "£1010"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["960 £", "910 £", "1010 £"], "answer": 0}}'::jsonb,
    '{"es": "Los gastos no están incluidos.", "de": "Die Nebenkosten sind nicht enthalten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Están incluidos los gastos?", "de": "Sind die Nebenkosten enthalten?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo la calefacción"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur die Heizung"], "answer": 1}}'::jsonb,
    '{"es": "La vivienda está amueblada.", "de": "Die Unterkunft ist möbliert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿La vivienda está amueblada?", "de": "Ist die Unterkunft möbliert?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo parcialmente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur teilweise"], "answer": 0}}'::jsonb,
    '{"es": "La vivienda tiene a small kitchen and a bright living room.", "de": "Die Unterkunft hat a small kitchen and a bright living room.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué tiene la vivienda?", "de": "Was hat die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["a small kitchen and a bright living room", "un garaje", "un sótano"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["a small kitchen and a bright living room", "eine Garage", "einen Keller"], "answer": 0}}'::jsonb,
    '{"es": "El contrato es de 12 months.", "de": "Der Vertrag läuft 12 months.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿De cuánto es el contrato?", "de": "Wie lang ist der Vertrag?", "s_es": {"type": "multiple_choice", "options": ["12 months", "6 meses", "18 meses"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 months", "6 Monate", "18 Monate"], "answer": 0}}'::jsonb,
    '{"es": "Puedes mudarte el 1 October.", "de": "Du kannst am 1 October einziehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuándo puedes mudarte?", "de": "Wann kannst du einziehen?", "s_es": {"type": "multiple_choice", "options": ["1 October", "el próximo mes", "hoy mismo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1 October", "nächsten Monat", "heute noch"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6000 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6000 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6000 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6000 AND source_language = 'en';
  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 6000, 'en', 'reading', 'Alquileres', $content$
The property is a one-bedroom flat in a quiet street in South London near a bus stop. The rent is £860 a month and the deposit is £960.

Bills are not included. The place is furnished and has a small kitchen and a bright living room.

The contract is 12 months, and you can move in on 1 October. No pets are allowed.
$content$)
  RETURNING uuid INTO v_reading_uuid;
  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Comprueba que la vivienda cubre tus necesidades', 'Lee un anuncio y comprueba si la vivienda encaja con tus necesidades.'),
         (v_reading_uuid, 'de', 'Prüfe, ob die Wohnung passt', 'Lies eine Anzeige und prüfe, ob die Wohnung zu deinen Bedürfnissen passt.');

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
