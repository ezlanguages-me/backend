-- ============================================================
-- Seed: A0 English Path – STEP 6130 – Dialogue – report a maintenance issue
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
    '{"character": "Tenant", "text": "Hello, I need to report a maintenance issue in my flat.", "es": "Hola, necesito informar de una avería en mi piso.", "de": "Hallo, ich muss einen Schaden in meiner Wohnung melden."}'::jsonb,
    '{"character": "Desk", "text": "What seems to be the problem?", "es": "¿Cuál es el problema?", "de": "Was ist das Problem?"}'::jsonb,
    '{"character": "Tenant", "text": "The sink is leaking under the kitchen cupboard.", "es": "El fregadero gotea debajo del armario de la cocina.", "de": "Das Waschbecken tropft unter dem Küchenschrank."}'::jsonb,
    '{"character": "Desk", "text": "Is it urgent?", "es": "¿Es urgente?", "de": "Ist es dringend?"}'::jsonb,
    '{"character": "Tenant", "text": "Yes, because the water is spreading on the floor.", "es": "Sí, porque el agua se está extendiendo por el suelo.", "de": "Ja, weil sich das Wasser auf dem Boden ausbreitet."}'::jsonb,
    '{"character": "Desk", "text": "Can the repair team enter with a spare key?", "es": "¿Puede entrar el equipo con una llave de repuesto?", "de": "Kann das Team mit einem Ersatzschlüssel eintreten?"}'::jsonb,
    '{"character": "Tenant", "text": "Yes, that is fine. I also have photos.", "es": "Sí, está bien. También tengo fotos.", "de": "Ja, das ist in Ordnung. Ich habe auch Fotos."}'::jsonb,
    '{"character": "Desk", "text": "We will log the report and send an engineer today.", "es": "Registraremos el aviso y enviaremos a un técnico hoy.", "de": "Wir erfassen die Meldung und schicken heute einen Techniker."}'::jsonb
  ];
  v_exercises JSONB[] := ARRAY[
    '{"es": "El inquilino informa de una avería en el piso.", "de": "Der Mieter meldet einen Schaden in der Wohnung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El fregadero gotea debajo del armario de la cocina.", "de": "Das Waschbecken tropft unter dem Küchenschrank.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El agua se está extendiendo por el suelo.", "de": "Das Wasser breitet sich auf dem Boden aus.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El problema no es urgente.", "de": "Das Problem ist nicht dringend.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "El equipo puede entrar con una llave de repuesto.", "de": "Das Team kann mit einem Ersatzschlüssel eintreten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué problema tiene el inquilino?", "de": "Welches Problem hat der Mieter?", "s_es": {"type": "multiple_choice", "options": ["Un fregadero que gotea", "Una ventana nueva", "Un coche averiado"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein tropfendes Waschbecken", "Ein neues Fenster", "Ein kaputtes Auto"], "answer": 0}}'::jsonb,
    '{"es": "¿Dónde gotea?", "de": "Wo tropft es?", "s_es": {"type": "multiple_choice", "options": ["Debajo del armario de la cocina", "En el techo del salón", "En la puerta de entrada"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Unter dem Küchenschrank", "An der Wohnzimmerdecke", "An der Eingangstür"], "answer": 0}}'::jsonb,
    '{"es": "¿Por qué es urgente?", "de": "Warum ist es dringend?", "s_es": {"type": "multiple_choice", "options": ["Porque el agua se extiende", "Porque hay una carta", "Porque llega un paquete"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil sich das Wasser ausbreitet", "Weil ein Brief kommt", "Weil ein Paket ankommt"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué tiene el inquilino además del aviso?", "de": "Was hat der Mieter außer der Meldung noch?", "s_es": {"type": "multiple_choice", "options": ["Fotos", "Flores", "Billetes de tren"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Fotos", "Blumen", "Fahrkarten"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué enviará el mostrador hoy?", "de": "Was schickt der Schalter heute?", "s_es": {"type": "multiple_choice", "options": ["Un técnico", "Una carta de cumpleaños", "Un libro"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Techniker", "Eine Geburtstagskarte", "Ein Buch"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6130 AND d.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6130 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6130 AND d.source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6130 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6130 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6130 AND source_language = 'en';
  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 6130, 'en', 'dialogue', 'Alquileres', '[{"name": "Agent", "gender": "neutral", "avatarURL": "https://example.com/avatars/agent.png"}, {"name": "Tenant", "gender": "neutral", "avatarURL": "https://example.com/avatars/tenant.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;
  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Informa de un problema de mantenimiento', 'Lee un diálogo sobre informar de una avería en la vivienda.'),
         (v_dialogue_uuid, 'de', 'Melde ein Wartungsproblem', 'Lies einen Dialog über die Meldung eines Schadens in der Wohnung.');

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
