-- ============================================================
-- Seed: A0 English Path – STEP 6040 – Reading – understand a rental listing
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
    '{"es": "La vivienda está en close to the university and the park.", "de": "Die Unterkunft liegt in close to the university and the park.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Dónde está la vivienda?", "de": "Wo liegt die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["close to the university and the park", "una zona ruidosa", "un polígono industrial"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["close to the university and the park", "eine laute Gegend", "ein Industriegebiet"], "answer": 0}}'::jsonb,
    '{"es": "La renta es de £950 al mes.", "de": "Die Miete beträgt 950 im Monat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la renta?", "de": "Wie hoch ist die Miete?", "s_es": {"type": "multiple_choice", "options": ["£950", "£910", "£1010"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["950 £", "910 £", "1010 £"], "answer": 0}}'::jsonb,
    '{"es": "La fianza es de £1,000.", "de": "Die Kaution beträgt 1,000 .", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la fianza?", "de": "Wie hoch ist die Kaution?", "s_es": {"type": "multiple_choice", "options": ["£1,000", "£950", "£1050"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["1,000 £", "950 £", "1050 £"], "answer": 0}}'::jsonb,
    '{"es": "Los gastos no están incluidos.", "de": "Die Nebenkosten sind nicht enthalten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Están incluidos los gastos?", "de": "Sind die Nebenkosten enthalten?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo la calefacción"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur die Heizung"], "answer": 1}}'::jsonb,
    '{"es": "La vivienda no está amueblada.", "de": "Die Unterkunft ist unmöbliert.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿La vivienda está amueblada?", "de": "Ist die Unterkunft möbliert?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo parcialmente"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur teilweise"], "answer": 1}}'::jsonb,
    '{"es": "La vivienda tiene a balcony.", "de": "Die Unterkunft hat a balcony.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué tiene la vivienda?", "de": "Was hat die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["a balcony", "un garaje", "un sótano"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["a balcony", "eine Garage", "einen Keller"], "answer": 0}}'::jsonb,
    '{"es": "El contrato es de 12 months.", "de": "Der Vertrag läuft 12 months.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿De cuánto es el contrato?", "de": "Wie lang ist der Vertrag?", "s_es": {"type": "multiple_choice", "options": ["12 months", "6 meses", "18 meses"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 months", "6 Monate", "18 Monate"], "answer": 0}}'::jsonb,
    '{"es": "Puedes mudarte el 15 September.", "de": "Du kannst am 15 September einziehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuándo puedes mudarte?", "de": "Wann kannst du einziehen?", "s_es": {"type": "multiple_choice", "options": ["15 September", "el próximo mes", "hoy mismo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["15 September", "nächsten Monat", "heute noch"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN reading t ON t.uuid = e.target_uuid WHERE t.path_uuid = v_path_uuid AND t.step_order = 6040 AND t.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6040 AND source_language = 'en');
  DELETE FROM reading_translation WHERE reading_uuid IN (SELECT uuid FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6040 AND source_language = 'en');
  DELETE FROM reading WHERE path_uuid = v_path_uuid AND step_order = 6040 AND source_language = 'en';
  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 6040, 'en', 'reading', 'Alquileres', $content$
The property is a two-bedroom flat in close to the university and the park. The rent is £950 a month and the deposit is £1,000.

Bills are not included. The place is unfurnished and has a balcony.

The contract is 12 months, and you can move in on 15 September. Non-smokers only.
$content$)
  RETURNING uuid INTO v_reading_uuid;
  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Comprende un anuncio de alquiler', 'Lee un anuncio completo con precio, depósito y normas.'),
         (v_reading_uuid, 'de', 'Verstehe eine Mietanzeige', 'Lies eine vollständige Anzeige mit Preis, Kaution und Regeln.');

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
