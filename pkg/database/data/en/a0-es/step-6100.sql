-- ============================================================
-- Seed: A0 English Path – STEP 6100 – Dialogue – state requirements, e.g. installing a telephone
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
    '{"character": "Tenant", "text": "I need to install a telephone line in the flat.", "es": "Necesito instalar una línea de teléfono en el piso.", "de": "Ich muss eine Telefonleitung in der Wohnung installieren lassen."}'::jsonb,
    '{"character": "Office", "text": "Do you also want internet in the same visit?", "es": "¿Quiere también internet en la misma visita?", "de": "Möchten Sie auch Internet beim gleichen Termin?"}'::jsonb,
    '{"character": "Tenant", "text": "Yes, and I need permission to drill one small hole.", "es": "Sí, y necesito permiso para hacer un pequeño agujero.", "de": "Ja, und ich brauche die Erlaubnis für ein kleines Bohrloch."}'::jsonb,
    '{"character": "Office", "text": "We can book a technician for next Tuesday morning.", "es": "Podemos reservar un técnico para el martes por la mañana.", "de": "Wir können einen Techniker für nächsten Dienstagmorgen buchen."}'::jsonb,
    '{"character": "Tenant", "text": "That time works for me.", "es": "Ese horario me viene bien.", "de": "Die Zeit passt mir."}'::jsonb,
    '{"character": "Office", "text": "Please keep the hallway clear and note your flat number.", "es": "Por favor, deje libre el pasillo y anote el número del piso.", "de": "Bitte halten Sie den Flur frei und notieren Sie die Wohnungsnummer."}'::jsonb,
    '{"character": "Tenant", "text": "I will send the request today.", "es": "Enviaré la solicitud hoy.", "de": "Ich werde die Anfrage heute schicken."}'::jsonb,
    '{"character": "Office", "text": "Great. We will confirm the appointment by email.", "es": "Muy bien. Confirmaremos la cita por correo electrónico.", "de": "Gut. Wir bestätigen den Termin per E-Mail."}'::jsonb
  ];
  v_exercises JSONB[] := ARRAY[
    '{"es": "El inquilino quiere instalar una línea de teléfono.", "de": "Der Mieter möchte eine Telefonleitung installieren lassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El inquilino también quiere internet en la misma visita.", "de": "Der Mieter möchte auch Internet beim gleichen Termin.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "Necesita permiso para hacer un pequeño agujero.", "de": "Er braucht die Erlaubnis für ein kleines Bohrloch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "El técnico llega el viernes por la tarde.", "de": "Der Techniker kommt am Freitagnachmittag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"es": "La oficina le pide el número del piso.", "de": "Das Büro fragt nach der Wohnungsnummer.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"es": "¿Qué quiere instalar el inquilino?", "de": "Was möchte der Mieter installieren lassen?", "s_es": {"type": "multiple_choice", "options": ["Una línea de teléfono", "Una piscina", "Un ascensor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Telefonleitung", "Einen Pool", "Einen Aufzug"], "answer": 0}}'::jsonb,
    '{"es": "¿Cuándo puede venir el técnico?", "de": "Wann kann der Techniker kommen?", "s_es": {"type": "multiple_choice", "options": ["El martes por la mañana", "El lunes por la noche", "El sábado al mediodía"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dienstagmorgen", "Montagabend", "Samstagmittag"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debe dejar libre el inquilino?", "de": "Was soll der Mieter freihalten?", "s_es": {"type": "multiple_choice", "options": ["El pasillo", "La cocina", "El balcón"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Flur", "Die Küche", "Den Balkon"], "answer": 0}}'::jsonb,
    '{"es": "¿Cómo se confirma la cita?", "de": "Wie wird der Termin bestätigt?", "s_es": {"type": "multiple_choice", "options": ["Por correo electrónico", "Por carta", "Por mensaje de texto"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per E-Mail", "Per Brief", "Per SMS"], "answer": 0}}'::jsonb,
    '{"es": "¿Qué debe anotar la oficina?", "de": "Was soll das Büro notieren?", "s_es": {"type": "multiple_choice", "options": ["El número del piso", "La marca del coche", "El color de la puerta"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Wohnungsnummer", "Die Automarke", "Die Türfarbe"], "answer": 0}}'::jsonb
  ];
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM exercise_translation WHERE exercise_uuid IN (SELECT e.uuid FROM exercise e JOIN dialogue d ON d.uuid = e.target_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6100 AND d.source_language = 'en');
  DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6100 AND source_language = 'en');
  DELETE FROM dialogue_lines_translation WHERE dialogue_line_uuid IN (SELECT dl.uuid FROM dialogue_lines dl JOIN dialogue d ON d.uuid = dl.dialogue_uuid WHERE d.path_uuid = v_path_uuid AND d.step_order = 6100 AND d.source_language = 'en');
  DELETE FROM dialogue_lines WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6100 AND source_language = 'en');
  DELETE FROM dialogue_translation WHERE dialogue_uuid IN (SELECT uuid FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6100 AND source_language = 'en');
  DELETE FROM dialogue WHERE path_uuid = v_path_uuid AND step_order = 6100 AND source_language = 'en';
  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (v_path_uuid, 6100, 'en', 'dialogue', 'Alquileres', '[{"name": "Agent", "gender": "neutral", "avatarURL": "https://example.com/avatars/agent.png"}, {"name": "Tenant", "gender": "neutral", "avatarURL": "https://example.com/avatars/tenant.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;
  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Expón tus necesidades, por ejemplo instalar un teléfono', 'Lee un diálogo corto sobre pedir una instalación de teléfono e internet.'),
         (v_dialogue_uuid, 'de', 'Nenne deine Bedürfnisse, zum Beispiel ein Telefon installieren', 'Lies einen kurzen Dialog über die Installation von Telefon und Internet.');

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
