-- ============================================================
-- Seed: A0 English Path – STEP 840 – Dialogue – make an outgoing call and pass on simple, prepared messages (Teléfono Profesional)
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
        '{"p": "Nina responde desde River Bank Offices.", "p_de": "Nina meldet sich von River Bank Offices.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ben llama de City Clinic.", "p_de": "Ben ruft von der City Clinic an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La señora Klein está fuera de la oficina esta mañana.", "p_de": "Frau Klein ist heute Morgen nicht im Büro.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ben no deja ningún mensaje.", "p_de": "Ben hinterlässt keine Nachricht.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El coche para el aeropuerto está reservado para el viernes a las 6 AM.", "p_de": "Das Auto zum Flughafen ist für Freitag um 6 Uhr gebucht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lista de pasajeros debe enviarse antes de las 3 PM.", "p_de": "Die Passagierliste soll vor 15 Uhr geschickt werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Nina dice que no puede pasar el mensaje.", "p_de": "Nina sagt, dass sie die Nachricht nicht weitergeben kann.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué empresa contesta la llamada?", "p_de": "Welche Firma nimmt den Anruf an?", "s_es": {"type": "multiple_choice", "options": ["River Bank Offices", "South Park Travel", "North Star Office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["River Bank Offices", "South Park Travel", "North Star Office"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién llama?", "p_de": "Wer ruft an?", "s_es": {"type": "multiple_choice", "options": ["Ben", "Nina", "Ms Klein"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ben", "Nina", "Frau Klein"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué empresa llama Ben?", "p_de": "Von welcher Firma ruft Ben an?", "s_es": {"type": "multiple_choice", "options": ["South Park Travel", "River Bank Offices", "Green Tech"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["South Park Travel", "River Bank Offices", "Green Tech"], "answer": 0}}'::jsonb,
        '{"p": "¿Con quién quiere hablar Ben?", "p_de": "Mit wem möchte Ben sprechen?", "s_es": {"type": "multiple_choice", "options": ["Con la señora Klein", "Con Nina", "Con Emma"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Frau Klein", "Mit Nina", "Mit Emma"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué no puede ponerse la señora Klein al teléfono?", "p_de": "Warum kann Frau Klein nicht ans Telefon kommen?", "s_es": {"type": "multiple_choice", "options": ["Porque está fuera de la oficina", "Porque está en una reunión larga", "Porque está de viaje toda la semana"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Weil sie nicht im Büro ist", "Weil sie in einer langen Besprechung ist", "Weil sie die ganze Woche auf Reise ist"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué está reservado?", "p_de": "Was ist gebucht?", "s_es": {"type": "multiple_choice", "options": ["El coche para el aeropuerto", "Una sala de reuniones", "Un hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Auto zum Flughafen", "Ein Besprechungsraum", "Ein Hotel"], "answer": 0}}'::jsonb,
        '{"p": "¿Para cuándo está reservado?", "p_de": "Für wann ist es gebucht?", "s_es": {"type": "multiple_choice", "options": ["Para el viernes a las 6 AM", "Para el jueves a las 6 AM", "Para el viernes a las 3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für Freitag um 6 Uhr", "Für Donnerstag um 6 Uhr", "Für Freitag um 15 Uhr"], "answer": 0}}'::jsonb
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
    WHERE d.step_order = 840
      AND d.path_uuid = v_path_uuid
      AND d.source_language = 'en'
      AND d.type = 'dialogue'
  );

  DELETE FROM exercise
  WHERE target_uuid IN (
    SELECT uuid
    FROM dialogue
    WHERE step_order = 840
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'dialogue'
  );

  DELETE FROM dialogue_lines_translation
  WHERE dialogue_line_uuid IN (
    SELECT dl.uuid
    FROM dialogue_lines dl
    JOIN dialogue d ON dl.dialogue_uuid = d.uuid
    WHERE d.step_order = 840
      AND d.path_uuid = v_path_uuid
      AND d.source_language = 'en'
      AND d.type = 'dialogue'
  );

  DELETE FROM dialogue_lines
  WHERE dialogue_uuid IN (
    SELECT uuid
    FROM dialogue
    WHERE step_order = 840
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'dialogue'
  );

  DELETE FROM dialogue_translation
  WHERE dialogue_uuid IN (
    SELECT uuid
    FROM dialogue
    WHERE step_order = 840
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'dialogue'
  );

  DELETE FROM dialogue
  WHERE step_order = 840
    AND path_uuid = v_path_uuid
    AND source_language = 'en'
    AND type = 'dialogue';
  INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
  VALUES (
    v_path_uuid,
    840,
    'en',
    'dialogue',
    'professional',
    '[{"name": "Nina", "gender": "female", "avatarURL": "https://example.com/avatars/nina.png"}, {"name": "Ben", "gender": "male", "avatarURL": "https://example.com/avatars/ben.png"}]'::jsonb
  )
  RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'Pasar un mensaje preparado', 'Practica una llamada saliente con un mensaje corto y preparado.');

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'de', 'Eine vorbereitete Nachricht weitergeben', 'Übe einen ausgehenden Anruf mit einer kurzen vorbereiteten Nachricht.');

  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 0, 'Nina', 'Good morning, River Bank Offices. Nina speaking.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Buenos días, River Bank Offices. Habla Nina.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Guten Morgen, River Bank Offices. Nina am Apparat.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 1, 'Ben', 'Hello. This is Ben from South Park Travel. Can I speak to Ms Klein?')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Hola. Soy Ben de South Park Travel. ¿Puedo hablar con la señora Klein?'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Hallo. Hier ist Ben von South Park Travel. Kann ich mit Frau Klein sprechen?'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 2, 'Nina', 'She is out of the office this morning.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Esta mañana está fuera de la oficina.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Sie ist heute Morgen nicht im Büro.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 3, 'Ben', 'Okay. Can I leave a message for her?')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'De acuerdo. ¿Puedo dejarle un mensaje?'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Okay. Kann ich eine Nachricht für sie hinterlassen?'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 4, 'Nina', 'Yes, please.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Sí, por favor.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Ja, bitte.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 5, 'Ben', 'Please tell her the airport car is booked for Friday at 6 AM.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Por favor, dígale que el coche para el aeropuerto está reservado para el viernes a las 6 AM.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Bitte sagen Sie ihr, dass das Auto zum Flughafen für Freitag um 6 Uhr gebucht ist.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 6, 'Nina', 'Friday at 6 AM. The airport car is booked.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Viernes a las 6 AM. El coche para el aeropuerto está reservado.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Freitag um 6 Uhr. Das Auto zum Flughafen ist gebucht.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 7, 'Ben', 'Great. Also ask her to send the passenger list before 3 PM.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Muy bien. Además, pídale que envíe la lista de pasajeros antes de las 3 PM.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Gut. Bitten Sie sie außerdem, die Passagierliste vor 15 Uhr zu schicken.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 8, 'Nina', 'Sure. I will pass on the message.')
  RETURNING uuid INTO v_line_uuid;

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'es', jsonb_build_object('translation', 'Claro. Le pasaré el mensaje.'));

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES (v_line_uuid, 'de', jsonb_build_object('translation', 'Gerne. Ich gebe die Nachricht weiter.'));
  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES (v_dialogue_uuid, 9, 'Ben', 'Thanks very much.')
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
