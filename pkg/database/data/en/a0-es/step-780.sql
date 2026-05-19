-- ============================================================
-- Seed: A0 English Path – STEP 780 – Reading – receive simple messages (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_ex_uuid UUID;
  ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Anna llamó por la nueva lista de precios.", "p_de": "Anna hat wegen der neuen Preisliste angerufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reunión con Green Hotel ahora es el lunes.", "p_de": "Das Treffen mit dem Green Hotel ist jetzt am Montag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Lisa trabaja en recursos humanos (HR).", "p_de": "Lisa arbeitet in der Personalabteilung (HR).", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala de formación está libre antes del almuerzo.", "p_de": "Der Schulungsraum ist vor dem Mittagessen frei.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Helen White llamó desde la oficina.", "p_de": "Helen White hat aus dem Büro angerufen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La visita del cliente empieza a las 2 PM.", "p_de": "Der Kundentermin beginnt um 14 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El conductor de la entrega tiene dos cajas.", "p_de": "Der Lieferfahrer hat zwei Kartons.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que llamar a recepción por la entrega de la puerta trasera.", "p_de": "Man soll wegen der Lieferung an der Hintertür die Rezeption anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El teléfono nuevo estará listo después de las 5 PM.", "p_de": "Das neue Telefon ist erst nach 17 Uhr fertig.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Quién llamó a las 9:10 AM?", "p_de": "Wer hat um 9:10 Uhr angerufen?", "s_es": {"type": "multiple_choice", "options": ["Anna de Bright Office Supplies", "Lisa de HR", "Sam de IT"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Anna von Bright Office Supplies", "Lisa von HR", "Sam von IT"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué necesita Anna?", "p_de": "Was braucht Anna?", "s_es": {"type": "multiple_choice", "options": ["La nueva lista de precios", "La factura final", "La clave del wifi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die neue Preisliste", "Die Schlussrechnung", "Das WLAN-Passwort"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es ahora la reunión con Green Hotel?", "p_de": "Wann ist jetzt das Treffen mit dem Green Hotel?", "s_es": {"type": "multiple_choice", "options": ["El martes a las 3 PM", "El martes a las 10 AM", "El jueves a las 3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Dienstag um 15 Uhr", "Am Dienstag um 10 Uhr", "Am Donnerstag um 15 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién necesita la lista final de nombres hoy?", "p_de": "Wer braucht heute die endgültige Namensliste?", "s_es": {"type": "multiple_choice", "options": ["Lisa de HR", "Anna de compras", "Helen White"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lisa aus HR", "Anna aus dem Einkauf", "Helen White"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde dónde llamó Helen White?", "p_de": "Von wo hat Helen White angerufen?", "s_es": {"type": "multiple_choice", "options": ["Desde el aeropuerto", "Desde recepción", "Desde un hotel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vom Flughafen", "Von der Rezeption", "Von einem Hotel"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tienes que empezar a las 2 PM?", "p_de": "Was musst du um 14 Uhr beginnen?", "s_es": {"type": "multiple_choice", "options": ["La visita del cliente", "La reunión de HR", "La llamada de IT"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Kundentermin", "Das HR-Treffen", "Den IT-Anruf"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el conductor de la entrega?", "p_de": "Wo ist der Lieferfahrer?", "s_es": {"type": "multiple_choice", "options": ["Fuera de la puerta trasera", "En la puerta principal", "En el aparcamiento"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor der Hintertür", "An der Eingangstür", "Auf dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas cajas trae la entrega?", "p_de": "Wie viele Kartons bringt die Lieferung?", "s_es": {"type": "multiple_choice", "options": ["Tres cajas", "Una caja", "Cinco cajas"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Kartons", "Einen Karton", "Fünf Kartons"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué está listo antes de las 5 PM?", "p_de": "Was ist vor 17 Uhr fertig?", "s_es": {"type": "multiple_choice", "options": ["Tu teléfono", "La sala de formación", "El correo electrónico"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dein Telefon", "Der Schulungsraum", "Die E-Mail"], "answer": 0}}'::jsonb
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
    JOIN reading r ON e.target_uuid = r.uuid
    WHERE r.step_order = 780
      AND r.path_uuid = v_path_uuid
      AND r.source_language = 'en'
      AND r.type = 'reading'
  );

  DELETE FROM exercise
  WHERE target_uuid IN (
    SELECT uuid
    FROM reading
    WHERE step_order = 780
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'reading'
  );

  DELETE FROM reading_translation
  WHERE reading_uuid IN (
    SELECT uuid
    FROM reading
    WHERE step_order = 780
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'reading'
  );

  DELETE FROM reading
  WHERE step_order = 780
    AND path_uuid = v_path_uuid
    AND source_language = 'en'
    AND type = 'reading';
  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (
    v_path_uuid,
    780,
    'en',
    'reading',
    'professional',
    $content$PHONE MESSAGES FOR MR CLARK

9:10 AM - Anna from Bright Office Supplies called.
She needs the new price list.
Please call her back at 555-0141.

10:00 AM - Mr Gomez from Green Hotel called.
The meeting is now on Tuesday at 3 PM.
He will send an email too.

11:25 AM - Lisa from HR called.
The training room is free after lunch.
She needs your final list of names today.

1:15 PM - Helen White called from the airport.
She is late.
Please start the client visit at 2 PM.
She will join online.

2:40 PM - A delivery driver called.
He is outside the back door with three boxes.
Please call reception.

4:05 PM - Sam from IT left a message.
Your phone is ready.
Please pick it up before 5 PM.$content$
  )
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'Mensajes telefónicos de oficina', 'Lee mensajes simples de teléfono y encuentra la información importante.');

  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'de', 'Telefonnotizen im Büro', 'Lies einfache Telefonnotizen und finde die wichtigen Informationen.');

  FOREACH ex IN ARRAY v_exercises
  LOOP
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_reading_uuid, NULL)
    RETURNING uuid INTO v_ex_uuid;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_uuid, 'es', ex->>'p', ex->'s_es');

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_uuid, 'de', ex->>'p_de', ex->'s_de');
  END LOOP;
END;
$seed$;
