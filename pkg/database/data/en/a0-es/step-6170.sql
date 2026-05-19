-- ============================================================
-- Seed: A0 English Path – STEP 6170 – Dialogue – discuss house rules
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
    '{"character": "Flatmate A", "text": "We should talk about the house rules.", "es": "Deberíamos hablar de las normas de la casa.", "de": "Wir sollten über die Hausregeln sprechen."}'::jsonb,
    '{"character": "Flatmate B", "text": "Sure. What is the first rule?", "es": "Claro. ¿Cuál es la primera norma?", "de": "Klar. Was ist die erste Regel?"}'::jsonb,
    '{"character": "Flatmate A", "text": "Quiet time starts at 10 PM on weekdays.", "es": "El silencio empieza a las 10 PM entre semana.", "de": "Die Ruhezeit beginnt werktags um 22 Uhr."}'::jsonb,
    '{"character": "Flatmate B", "text": "That is fine, and guests should leave by 11 PM.", "es": "Está bien, y los invitados deben irse antes de las 11 PM.", "de": "Das ist in Ordnung, und Gäste sollten vor 23 Uhr gehen."}'::jsonb,
    '{"character": "Flatmate A", "text": "We also need to book the laundry room.", "es": "También tenemos que reservar la lavandería.", "de": "Wir müssen auch die Waschküche buchen."}'::jsonb,
    '{"character": "Flatmate B", "text": "Yes, and bikes should stay in the shed.", "es": "Sí, y las bicicletas deben quedar en el cobertizo.", "de": "Ja, und Fahrräder sollten im Schuppen bleiben."}'::jsonb,
    '{"character": "Flatmate A", "text": "Please leave shoes at the entrance.", "es": "Por favor, deja los zapatos en la entrada.", "de": "Bitte lass die Schuhe am Eingang."}'::jsonb,
    '{"character": "Flatmate B", "text": "Agreed. We can pay the rent on the first day too.", "es": "De acuerdo. También podemos pagar la renta el primer día.", "de": "Einverstanden. Wir können die Miete auch am ersten Tag zahlen."}'::jsonb
  ];
  v_exercises JSONB[] := ARRAY[
    '{"es": "El silencio empieza a las 10 PM entre semana.", "de": "Die Ruhezeit beginnt werktags um 22 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Los invitados deben irse antes de las 11 PM.", "de": "Gäste sollten vor 23 Uhr gehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Hay que reservar la lavandería.", "de": "Die Waschküche muss gebucht werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Las bicicletas deben quedarse en el cobertizo.", "de": "Die Fahrräder sollen im Schuppen bleiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Hay que dejar los zapatos en la entrada.", "de": "Die Schuhe sollen am Eingang bleiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Cuándo empieza el silencio?", "de": "Wann beginnt die Ruhezeit?", "s_es": {"type": "multiple_choice", "options": ["A las 10 PM", "A las 8 PM", "A las 11 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 22 Uhr", "Um 20 Uhr", "Um 23 Uhr"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué deben hacer los invitados?", "de": "Was sollen Gäste tun?", "s_es": {"type": "multiple_choice", "options": ["Salir antes de las 11 PM", "Dormir en la cocina", "Dejar la casa abierta"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 23 Uhr gehen", "In der Küche schlafen", "Das Haus offen lassen"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué hay que reservar?", "de": "Was muss gebucht werden?", "s_es": {"type": "multiple_choice", "options": ["La lavandería", "El balcón", "La escalera"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Waschküche", "Den Balkon", "Die Treppe"], "answer": 0}}'::jsonb,
    '{"es": "¿Dónde van las bicicletas?", "de": "Wohin kommen die Fahrräder?", "s_es": {"type": "multiple_choice", "options": ["Al cobertizo", "A la sala de estar", "A la cocina"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In den Schuppen", "Ins Wohnzimmer", "In die Küche"], "answer": 0}}'::jsonb,
    '{"es": "¿Dónde se dejan los zapatos?", "de": "Wo bleiben die Schuhe?", "s_es": {"type": "multiple_choice", "options": ["En la entrada", "En el tejado", "En el baño"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Eingang", "Auf dem Dach", "Im Bad"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6170 AND d.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6170 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6170 AND d.source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6170 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6170 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6170 AND source_language = 'en';
  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 6170, 'en', 'dialogue', 'Alquileres', '[{"name": "Agent", "gender": "neutral", "avatarURL": "https://example.com/avatars/agent.png"}, {"name": "Tenant", "gender": "neutral", "avatarURL": "https://example.com/avatars/tenant.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;
  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Habla de las normas de la casa', 'Lee un diálogo sobre reglas compartidas en una casa o piso compartido.'),
         (v_dialogue_uuid, 'de', 'Sprich über die Hausregeln', 'Lies einen Dialog über gemeinsame Regeln in einer Wohngemeinschaft.');

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
