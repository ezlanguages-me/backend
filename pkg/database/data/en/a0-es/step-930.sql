-- ============================================================
-- Seed: A0 English Path – STEP 930 – Speaking – check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio)
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
    SELECT uuid FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 930 AND source_language = 'en'
  );

  DELETE FROM speaking
  WHERE path_uuid = v_path_uuid AND step_order = 930 AND source_language = 'en';

  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (
    v_path_uuid,
    930,
    'en',
    'speaking',
    'education'
  )
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES
    (v_speaking_uuid, 'es', 'Repite las instrucciones para confirmarlas', 'Habla como si enviaras un audio al profesor para repetir y comprobar las instrucciones de clase.', '{"scenario": "Acabas de salir de clase y quieres enviar un audio corto al profesor para repetir las instrucciones y comprobar que todo está correcto.", "tasks": ["Saluda al profesor y di que quieres comprobar las instrucciones.", "Repite el día, la fecha, la hora y el aula de la clase.", "Di a qué hora llegas y qué materiales llevas contigo.", "Explica los primeros pasos en clase: escribir el nombre y la fecha, leer la página correcta y hacer las preguntas o tareas indicadas.", "Di que primero trabajas solo y después revisas con tu pareja o compañero.", "Repite la tarea para casa, la hora límite de entrega y despídete de forma educada."]}'::jsonb),
    (v_speaking_uuid, 'de', 'Wiederhole die Anweisungen zur Bestätigung', 'Sprich so, als würdest du der Lehrkraft eine Sprachnachricht schicken, um die Unterrichtsanweisungen zu wiederholen und zu prüfen.', '{"scenario": "Du kommst gerade aus dem Unterricht und willst der Lehrkraft eine kurze Sprachnachricht schicken, um die Anweisungen zu wiederholen und zu prüfen, ob alles stimmt.", "tasks": ["Begrüße die Lehrkraft und sag, dass du die Anweisungen prüfen möchtest.", "Wiederhole den Tag, das Datum, die Uhrzeit und den Raum des Unterrichts.", "Sag, wann du kommst und welche Materialien du dabeihast.", "Erkläre die ersten Schritte im Unterricht: den Namen und das Datum schreiben, die richtige Seite lesen und die genannten Fragen oder Aufgaben machen.", "Sag, dass du zuerst allein arbeitest und danach mit deinem Partner oder Mitschüler prüfst.", "Wiederhole die Hausaufgabe, die Abgabezeit und verabschiede dich höflich."]}'::jsonb);
END;
$seed$;
