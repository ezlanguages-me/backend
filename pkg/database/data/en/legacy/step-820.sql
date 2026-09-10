-- ============================================================
-- Seed: A0 English Path – STEP 820 – Reading – make an outgoing call and pass on simple, prepared messages (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
  v_ex_uuid UUID;
  ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Nora debe llamar primero al Silver Hotel.", "p_de": "Nora soll zuerst beim Silver Hotel anrufen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El equipo de limpieza llegará el miércoles a las 8:30 AM.", "p_de": "Das Reinigungsteam kommt am Mittwoch um 8:30 Uhr an.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "En la primera llamada, Nora debe preguntar si la puerta principal estará abierta.", "p_de": "Im ersten Anruf soll Nora fragen, ob die Eingangstür offen sein wird.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La factura que debe mencionar Nora es la 240.", "p_de": "Die Rechnung, die Nora erwähnen soll, ist die 240.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El señor Stein debe confirmar la recepción antes de las 5 PM.", "p_de": "Herr Stein soll den Erhalt vor 17 Uhr bestätigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Luis sí puede ir a la visita de las 4 PM de hoy.", "p_de": "Luis kann heute doch zum Termin um 16 Uhr kommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La nueva hora propuesta para City Clinic es el jueves a las 10 AM.", "p_de": "Die neue vorgeschlagene Uhrzeit für die City Clinic ist Donnerstag um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El número para devolver la llamada es 555-0160.", "p_de": "Die Rückrufnummer ist 555-0160.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La nota final dice que Nora debe hablar muy rápido.", "p_de": "Die letzte Notiz sagt, dass Nora sehr schnell sprechen soll.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿A qué empresa debe llamar Nora primero?", "p_de": "Welche Firma soll Nora zuerst anrufen?", "s_es": {"type": "multiple_choice", "options": ["Silver Hotel", "Green Tech", "City Clinic"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Silver Hotel", "Green Tech", "City Clinic"], "answer": 0}}'::jsonb,
        '{"p": "¿Con quién debe hablar en la primera llamada?", "p_de": "Mit wem soll sie im ersten Anruf sprechen?", "s_es": {"type": "multiple_choice", "options": ["Con Mr Stein", "Con Paula Diaz", "Con Luis"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Mit Herrn Stein", "Mit Paula Diaz", "Mit Luis"], "answer": 1}}'::jsonb,
        '{"p": "¿A qué hora llegará el equipo de limpieza el miércoles?", "p_de": "Um wie viel Uhr kommt das Reinigungsteam am Mittwoch an?", "s_es": {"type": "multiple_choice", "options": ["A las 8 AM", "A las 8:30 AM", "A las 10 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 8 Uhr", "Um 8:30 Uhr", "Um 10 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe preguntar Nora al Silver Hotel?", "p_de": "Was soll Nora das Silver Hotel fragen?", "s_es": {"type": "multiple_choice", "options": ["Si hay una reunión a las 3 PM", "Si pueden enviar una factura", "Si la puerta principal estará abierta"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Ob es um 15 Uhr ein Treffen gibt", "Ob sie eine Rechnung schicken können", "Ob die Eingangstür offen sein wird"], "answer": 2}}'::jsonb,
        '{"p": "¿Qué factura debe mencionar Nora en Green Tech?", "p_de": "Welche Rechnung soll Nora bei Green Tech erwähnen?", "s_es": {"type": "multiple_choice", "options": ["La factura 204", "La factura 420", "La factura 216"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rechnung 204", "Rechnung 420", "Rechnung 216"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer Mr Stein antes de las 5 PM?", "p_de": "Was soll Herr Stein vor 17 Uhr tun?", "s_es": {"type": "multiple_choice", "options": ["Llamar al hotel", "Confirmar la recepción", "Enviar un paquete"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Im Hotel anrufen", "Den Erhalt bestätigen", "Ein Paket schicken"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué pasa con la visita de las 4 PM en City Clinic?", "p_de": "Was passiert mit dem Termin um 16 Uhr in der City Clinic?", "s_es": {"type": "multiple_choice", "options": ["Se adelanta a las 2 PM", "Ya está terminada", "Luis no puede ir"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Er wird auf 14 Uhr vorverlegt", "Er ist schon vorbei", "Luis kann nicht kommen"], "answer": 2}}'::jsonb,
        '{"p": "¿Qué nueva hora ofrece Nora?", "p_de": "Welche neue Uhrzeit bietet Nora an?", "s_es": {"type": "multiple_choice", "options": ["Viernes a las 10 AM", "Jueves a las 10 AM", "Jueves a las 4 PM"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Freitag um 10 Uhr", "Donnerstag um 10 Uhr", "Donnerstag um 16 Uhr"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué debe repetir Nora una vez al final?", "p_de": "Was soll Nora am Ende einmal wiederholen?", "s_es": {"type": "multiple_choice", "options": ["El nombre del hotel", "La hora del almuerzo", "El número de teléfono"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Den Namen des Hotels", "Die Mittagszeit", "Die Telefonnummer"], "answer": 2}}'::jsonb
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
    WHERE r.step_order = 820
      AND r.path_uuid = v_path_uuid
      AND r.source_language = 'en'
      AND r.type = 'reading'
  );

  DELETE FROM exercise
  WHERE target_uuid IN (
    SELECT uuid
    FROM reading
    WHERE step_order = 820
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'reading'
  );

  DELETE FROM reading_translation
  WHERE reading_uuid IN (
    SELECT uuid
    FROM reading
    WHERE step_order = 820
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'reading'
  );

  DELETE FROM reading
  WHERE step_order = 820
    AND path_uuid = v_path_uuid
    AND source_language = 'en'
    AND type = 'reading';
  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (
    v_path_uuid,
    820,
    'en',
    'reading',
    'professional',
    $content$OUTGOING CALL SHEET FOR NORA — Tuesday, 6 June

BEFORE EACH CALL:
Say your name and company at the start.
Speak slowly and clearly.
Repeat any phone number or time one time.

Call 1: Silver Hotel — ask for Paula Diaz
Our cleaning team will arrive on Wednesday at 8 AM, not 8:30 AM.
Please ask if the front door will be open for them.
If Paula is not there, leave the message with reception.

Call 2: Green Tech — ask for Mr Stein
Invoice 204 is in his email today.
Please ask him to confirm receipt before 5 PM.
If he does not reply, call again tomorrow morning.

Call 3: City Clinic — speak to reception
Luis cannot come to the 4 PM visit today.
We would like to offer a new time: Thursday at 10 AM.
Ask them to call back on 555-0160 to confirm.
If the new time does not work, ask for another option.

GENERAL NOTES:
Always ask "Is this a good time to speak?" before giving details.
Write down the name of the person you spoke to.$content$
  )RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title)
  VALUES (v_reading_uuid, 'es', 'Guion para llamadas salientes');

  INSERT INTO reading_translation (reading_uuid, language, title)
  VALUES (v_reading_uuid, 'de', 'Leitfaden für ausgehende Anrufe');

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
