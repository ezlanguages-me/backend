-- ============================================================
-- Seed: A0 English Path – STEP 800 – Dialogue – receive simple messages (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_dialogue_uuid UUID;
  v_line_uuid UUID;
  v_ex_uuid UUID;
  ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Eva trabaja en West Lake Design.", "p_de": "Eva arbeitet bei West Lake Design.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Mark llama de Blue Market.", "p_de": "Mark ruft von Blue Market an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El señor Reed está con un cliente.", "p_de": "Herr Reed ist bei einem Kunden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Mark no deja ningún mensaje.", "p_de": "Mark hinterlässt keine Nachricht.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La impresora está lista para recoger hoy.", "p_de": "Der Drucker ist heute abholbereit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Mark quiere una llamada después de las 4 PM.", "p_de": "Mark möchte einen Anruf nach 16 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Eva repite el número para confirmar el mensaje.", "p_de": "Eva wiederholt die Nummer, um die Nachricht zu bestätigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué empresa contesta la llamada?", "p_de": "Welche Firma nimmt den Anruf an?", "s_es": {"type": "multiple_choice", "options": ["West Lake Design", "PrintPoint", "North Star Office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["West Lake Design", "PrintPoint", "North Star Office"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién llama?", "p_de": "Wer ruft an?", "s_es": {"type": "multiple_choice", "options": ["Mark", "Eva", "Mr Reed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mark", "Eva", "Herr Reed"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué empresa llama Mark?", "p_de": "Von welcher Firma ruft Mark an?", "s_es": {"type": "multiple_choice", "options": ["PrintPoint", "Green Hotel", "City Clinic"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["PrintPoint", "Green Hotel", "City Clinic"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué no puede hablar Mark con el señor Reed?", "p_de": "Warum kann Mark nicht mit Herrn Reed sprechen?", "s_es": {"type": "multiple_choice", "options": ["Porque está con un cliente", "Porque está enfermo", "Porque está de vacaciones"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil er bei einem Kunden ist", "Weil er krank ist", "Weil er im Urlaub ist"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué está listo hoy?", "p_de": "Was ist heute fertig?", "s_es": {"type": "multiple_choice", "options": ["La impresora", "La sala de reuniones", "La factura"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Drucker", "Der Besprechungsraum", "Die Rechnung"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer el señor Reed?", "p_de": "Was soll Herr Reed tun?", "s_es": {"type": "multiple_choice", "options": ["Llamar a Mark", "Enviar un email", "Ir al aeropuerto"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mark anrufen", "Eine E-Mail schicken", "Zum Flughafen fahren"], "answer": 0}}'::jsonb,
        '{"p": "¿Antes de qué hora debe llamar?", "p_de": "Vor welcher Uhrzeit soll er anrufen?", "s_es": {"type": "multiple_choice", "options": ["Antes de las 4 PM", "Antes de las 2 PM", "Antes de las 5 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 16 Uhr", "Vor 14 Uhr", "Vor 17 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
  SELECT uuid INTO STRICT v_path_uuid
  FROM path
  WHERE source_language = 'en'
  LIMIT 1;

  DELETE FROM exercise_translation
  WHERE exercise_uuid IN (
    SELECT e.uuid
    FROM exercise e
    JOIN dialogue d ON e.target_uuid = d.uuid
    WHERE d.step_order = 800
      AND d.path_uuid = v_path_uuid
      AND d.source_language = 'en'
      AND d.type = 'dialogue'
  );

  DELETE FROM exercise
  WHERE target_uuid IN (
    SELECT uuid
    FROM dialogue
    WHERE step_order = 800
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'dialogue'
  );

  DELETE FROM dialogue_lines_translation
  WHERE dialogue_line_uuid IN (
    SELECT dl.uuid
    FROM dialogue_lines dl
    JOIN dialogue d ON dl.dialogue_uuid = d.uuid
    WHERE d.step_order = 800
      AND d.path_uuid = v_path_uuid
      AND d.source_language = 'en'
      AND d.type = 'dialogue'
  );

  DELETE FROM dialogue_lines
  WHERE dialogue_uuid IN (
    SELECT uuid
    FROM dialogue
    WHERE step_order = 800
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'dialogue'
  );

  DELETE FROM dialogue_translation
  WHERE dialogue_uuid IN (
    SELECT uuid
    FROM dialogue
    WHERE step_order = 800
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'dialogue'
  );

  DELETE FROM dialogue
  WHERE step_order = 800
    AND path_uuid = v_path_uuid
    AND source_language = 'en'
    AND type = 'dialogue';
  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (
    v_path_uuid,
    800,
    'en',
    'dialogue',
    'professional',
    '[{"name": "Eva", "gender": "female", "avatarURL": "https://example.com/avatars/eva.png"}, {"name": "Mark", "gender": "male", "avatarURL": "https://example.com/avatars/mark.png"}]'::jsonb
  )
  RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Recibir un mensaje para un compañero', 'Practica cómo recibir y repetir un mensaje corto en la oficina.');

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'de', 'Eine Nachricht für einen Kollegen annehmen', 'Übe, wie man im Büro eine kurze Nachricht annimmt und wiederholt.');

  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 0, 'Eva', 'Good morning, West Lake Design. Eva speaking.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Buenos días, West Lake Design. Habla Eva.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Guten Morgen, West Lake Design. Eva am Apparat.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 1, 'Mark', 'Hello. This is Mark from PrintPoint. Is Mr Reed there, please?')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Hola. Soy Mark de PrintPoint. ¿Está el señor Reed, por favor?'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Hallo. Hier ist Mark von PrintPoint. Ist Herr Reed da, bitte?'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 2, 'Eva', 'He is with a client right now.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Ahora mismo está con un cliente.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Er ist gerade bei einem Kunden.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 3, 'Mark', 'Okay. Can you take a message?')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'De acuerdo. ¿Puede tomar un mensaje?'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Okay. Können Sie eine Nachricht aufnehmen?'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 4, 'Eva', 'Yes, of course.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Sí, claro.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Ja, natürlich.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 5, 'Mark', 'Please tell him the printer is ready for pickup today.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Por favor, dígale que la impresora está lista para recoger hoy.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Bitte sagen Sie ihm, dass der Drucker heute abholbereit ist.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 6, 'Eva', 'The printer is ready for pickup today. Got it.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'La impresora está lista para recoger hoy. Entendido.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Der Drucker ist heute abholbereit. Verstanden.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 7, 'Mark', 'And please ask him to call me before 4 PM at 555-0132.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Y por favor pídale que me llame antes de las 4 PM al 555-0132.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Und bitte bitten Sie ihn, mich vor 16 Uhr unter 555-0132 anzurufen.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 8, 'Eva', 'Before 4 PM at 555-0132. I will pass on the message.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Antes de las 4 PM al 555-0132. Le pasaré el mensaje.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Vor 16 Uhr unter 555-0132. Ich gebe die Nachricht weiter.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 9, 'Mark', 'Thank you very much.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Muchas gracias.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Vielen Dank.'));
  FOREACH ex IN ARRAY v_exercises
  LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_dialogue_uuid, NULL)
    RETURNING uuid INTO v_ex_uuid;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_uuid, 'es', ex->>'p', ex->'s_es');

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_uuid, 'de', ex->>'p_de', ex->'s_de');
  END LOOP;
END;
$seed$;
