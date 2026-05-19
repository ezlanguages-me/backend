-- ============================================================
-- Seed: A0 English Path – STEP 970 – Speaking – understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  DELETE FROM speaking_translation
  WHERE speaking_uuid IN (
    SELECT uuid FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 970 AND source_language = 'en'
  );

  DELETE FROM speaking
  WHERE path_uuid = v_path_uuid AND step_order = 970 AND source_language = 'en';

  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (
    v_path_uuid,
    970,
    'en',
    'speaking',
    'education'
  )
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES
    (v_speaking_uuid, 'es', 'Repite las instrucciones del profesor', 'Habla como si confirmaras con tu profesor las instrucciones de clase y la tarea.', '{"scenario": "Acabas de salir de clase y quieres enviar un audio corto a tu profesor para comprobar que entendiste las instrucciones de hoy.", "tasks": ["Saluda y di que quieres repetir las instrucciones de hoy.", "Explica la primera tarea: abrir el libro de ejercicios en la página 12 y leer el texto corto.", "Explica la segunda tarea: escribir cinco frases sobre tu rutina diaria en la hoja y poner tu nombre arriba.", "Di cómo se hace el ejercicio B: primero solo y después con una pareja.", "Explica la tarea para casa: terminar el ejercicio C y subir una foto clara antes de las 8 PM.", "Di qué materiales llevas mañana y despídete de forma educada."]}'::jsonb),
    (v_speaking_uuid, 'de', 'Wiederhole die Anweisungen der Lehrkraft', 'Sprich so, als würdest du mit deiner Lehrkraft die Unterrichtsanweisungen und die Hausaufgabe bestätigen.', '{"scenario": "Du kommst gerade aus dem Unterricht und willst deiner Lehrkraft eine kurze Sprachnachricht schicken, um zu prüfen, ob du die heutigen Anweisungen verstanden hast.", "tasks": ["Begrüße die Lehrkraft und sag, dass du die heutigen Anweisungen wiederholen möchtest.", "Erkläre die erste Aufgabe: das Arbeitsbuch auf Seite 12 öffnen und den kurzen Text lesen.", "Erkläre die zweite Aufgabe: fünf Sätze über deinen Tagesablauf auf das Blatt schreiben und oben deinen Namen notieren.", "Sag, wie Übung B gemacht wird: zuerst allein und danach mit einem Partner.", "Erkläre die Hausaufgabe: Übung C fertig machen und vor 20 Uhr ein klares Foto hochladen.", "Sag, welche Materialien du morgen mitbringst, und verabschiede dich höflich."]}'::jsonb);
END;
$seed$;
