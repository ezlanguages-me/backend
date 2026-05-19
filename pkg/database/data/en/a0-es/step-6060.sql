-- ============================================================
-- Seed: A0 English Path – STEP 6060 – Dialogue – negotiate rental terms
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_dialogue_uuid UUID;
  v_line_uuid UUID;
  v_exercise_uuid UUID;
  v_line_order SMALLINT := 0;
  line JSONB;
  ex JSONB;
  v_lines JSONB[] := ARRAY[
    '{"character": "Tenant", "text": "I would like to negotiate the rent before I sign.", "es": "Quiero negociar la renta antes de firmar.", "de": "Ich möchte die Miete vor der Unterschrift verhandeln."}'::jsonb,
    '{"character": "Landlord", "text": "What term do you need?", "es": "¿Qué condición necesita?", "de": "Welche Bedingung brauchen Sie?"}'::jsonb,
    '{"character": "Tenant", "text": "If I stay for a year, could you reduce the price?", "es": "Si me quedo un año, ¿podría bajar el precio?", "de": "Wenn ich ein Jahr bleibe, könnten Sie den Preis senken?"}'::jsonb,
    '{"character": "Landlord", "text": "The rent is £780, and the deposit is £780.", "es": "La renta es £780, y la fianza es £780.", "de": "Die Miete beträgt £780, und die Kaution ist £780."}'::jsonb,
    '{"character": "Tenant", "text": "Could the bills be included?", "es": "¿Podrían incluirse los gastos?", "de": "Könnten die Nebenkosten enthalten sein?"}'::jsonb,
    '{"character": "Landlord", "text": "Yes, they are included. The place is furnished.", "es": "Sí, están incluidos. El piso está amueblado.", "de": "Ja, sie sind enthalten. Die Wohnung ist möbliert."}'::jsonb,
    '{"character": "Tenant", "text": "Could you include a shared garden before move-in?", "es": "¿Podría incluir a shared garden antes de la mudanza?", "de": "Könnten Sie a shared garden vor dem Einzug einplanen?"}'::jsonb,
    '{"character": "Landlord", "text": "The contract is 12 months, and move-in is next month.", "es": "El contrato es de 12 months y la entrada es next month.", "de": "Der Vertrag läuft 12 months, und der Einzug ist next month."}'::jsonb
  ];
  v_exercises JSONB[] := ARRAY[
    '{"es": "La vivienda está en near the station.", "de": "Die Unterkunft liegt in near the station.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Dónde está la vivienda?", "de": "Wo liegt die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["near the station", "una zona ruidosa", "un polígono industrial"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["near the station", "eine laute Gegend", "ein Industriegebiet"], "answer": 0}}'::jsonb,
    '{"es": "La renta es de £780 al mes.", "de": "Die Miete beträgt 780 im Monat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la renta?", "de": "Wie hoch ist die Miete?", "s_es": {"type": "multiple_choice", "options": ["£780", "£740", "£840"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["780 £", "740 £", "840 £"], "answer": 0}}'::jsonb,
    '{"es": "La fianza es de £780.", "de": "Die Kaution beträgt 780 .", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la fianza?", "de": "Wie hoch ist die Kaution?", "s_es": {"type": "multiple_choice", "options": ["£780", "£730", "£830"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["780 £", "730 £", "830 £"], "answer": 0}}'::jsonb,
    '{"es": "Los gastos están incluidos.", "de": "Die Nebenkosten sind enthalten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Están incluidos los gastos?", "de": "Sind die Nebenkosten enthalten?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo la calefacción"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur die Heizung"], "answer": 0}}'::jsonb,
    '{"es": "La vivienda está amueblada.", "de": "Die Unterkunft ist möbliert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿La vivienda está amueblada?", "de": "Ist die Unterkunft möbliert?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo parcialmente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur teilweise"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6060 AND d.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6060 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6060 AND d.source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6060 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6060 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6060 AND source_language = 'en';
  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 6060, 'en', 'dialogue', 'Alquileres', '[{"name": "Agent", "gender": "neutral", "avatarURL": "https://example.com/avatars/agent.png"}, {"name": "Tenant", "gender": "neutral", "avatarURL": "https://example.com/avatars/tenant.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;
  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Negocia las condiciones del alquiler', 'Lee un diálogo donde el inquilino intenta negociar el precio y las condiciones.'),
         (v_dialogue_uuid, 'de', 'Verhandle Mietbedingungen', 'Lies einen Dialog, in dem der Mieter Preis und Bedingungen verhandelt.');

  FOREACH line IN ARRAY v_lines LOOP
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_uuid, v_line_order, line->>'character', line->>'text')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES
      (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')), 
      (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
    v_line_order := v_line_order + 1;
  END LOOP;

  FOREACH ex IN ARRAY v_exercises LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_dialogue_uuid, NULL)
    RETURNING uuid INTO v_exercise_uuid;
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
      (v_exercise_uuid, 'es', ex->>'es', ex->'s_es'),
      (v_exercise_uuid, 'de', ex->>'de', ex->'s_de');
  END LOOP;
END;
$seed$;
