-- ============================================================
-- Seed: A0 English Path – STEP 6020 – Dialogue – enquire about a rental property
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
    '{"character": "Agent", "text": "Good afternoon. How can I help you?", "es": "Buenas tardes. ¿En qué puedo ayudarle?", "de": "Guten Nachmittag. Wie kann ich Ihnen helfen?"}'::jsonb,
    '{"character": "Tenant", "text": "I am looking for a flat near the station.", "es": "Busco un piso cerca de la estación.", "de": "Ich suche eine Wohnung in der Nähe des Bahnhofs."}'::jsonb,
    '{"character": "Agent", "text": "The flat is on a quiet street near the station.", "es": "El piso está en a quiet street near the station.", "de": "Die Wohnung liegt in a quiet street near the station."}'::jsonb,
    '{"character": "Tenant", "text": "How much is the rent?", "es": "¿Cuánto es la renta?", "de": "Wie hoch ist die Miete?"}'::jsonb,
    '{"character": "Agent", "text": "The rent is £860, and the deposit is £960.", "es": "La renta es £860 y la fianza es £960.", "de": "Die Miete beträgt £860, und die Kaution ist £960."}'::jsonb,
    '{"character": "Tenant", "text": "Are bills included?", "es": "¿Están incluidos los gastos?", "de": "Sind die Nebenkosten enthalten?"}'::jsonb,
    '{"character": "Agent", "text": "No, they are not included. It is furnished and has a small kitchen.", "es": "No, no están incluidos. Está amueblado y tiene a small kitchen.", "de": "Nein, sie sind nicht enthalten. Es ist möbliert und hat a small kitchen."}'::jsonb,
    '{"character": "Tenant", "text": "When can I move in?", "es": "¿Cuándo puedo mudarme?", "de": "Wann kann ich einziehen?"}'::jsonb,
    '{"character": "Agent", "text": "You can move in on 1 October.", "es": "Puede mudarse el 1 October.", "de": "Sie können am 1 October einziehen."}'::jsonb
  ];
  v_exercises JSONB[] := ARRAY[
    '{"es": "La vivienda está en a quiet street near the station.", "de": "Die Unterkunft liegt in a quiet street near the station.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Dónde está la vivienda?", "de": "Wo liegt die Unterkunft?", "s_es": {"type": "multiple_choice", "options": ["a quiet street near the station", "una zona ruidosa", "un polígono industrial"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["a quiet street near the station", "eine laute Gegend", "ein Industriegebiet"], "answer": 0}}'::jsonb,
    '{"es": "La renta es de £860 al mes.", "de": "Die Miete beträgt 860 im Monat.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la renta?", "de": "Wie hoch ist die Miete?", "s_es": {"type": "multiple_choice", "options": ["£860", "£820", "£920"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["860 £", "820 £", "920 £"], "answer": 0}}'::jsonb,
    '{"es": "La fianza es de £960.", "de": "Die Kaution beträgt 960 .", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuánto es la fianza?", "de": "Wie hoch ist die Kaution?", "s_es": {"type": "multiple_choice", "options": ["£960", "£910", "£1010"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["960 £", "910 £", "1010 £"], "answer": 0}}'::jsonb,
    '{"es": "Los gastos no están incluidos.", "de": "Die Nebenkosten sind nicht enthalten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "¿Están incluidos los gastos?", "de": "Sind die Nebenkosten enthalten?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo la calefacción"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur die Heizung"], "answer": 1}}'::jsonb,
    '{"es": "La vivienda está amueblada.", "de": "Die Unterkunft ist möbliert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿La vivienda está amueblada?", "de": "Ist die Unterkunft möbliert?", "s_es": {"type": "multiple_choice", "options": ["Sí", "No", "Solo parcialmente"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Nur teilweise"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6020 AND d.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6020 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6020 AND d.source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6020 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6020 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6020 AND source_language = 'en';
  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 6020, 'en', 'dialogue', 'Alquileres', '[{"name": "Agent", "gender": "neutral", "avatarURL": "https://example.com/avatars/agent.png"}, {"name": "Tenant", "gender": "neutral", "avatarURL": "https://example.com/avatars/tenant.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;
  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Pregunta por una vivienda de alquiler', 'Lee un diálogo en el que alguien pregunta por una vivienda y sus condiciones.'),
         (v_dialogue_uuid, 'de', 'Erkundige dich nach einer Mietwohnung', 'Lies einen Dialog, in dem jemand nach einer Wohnung und ihren Bedingungen fragt.');

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
