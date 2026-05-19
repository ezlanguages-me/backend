-- ============================================================
-- Seed: A0 English Path – STEP 890 – Speaking – understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio)
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
    SELECT uuid FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 890 AND source_language = 'en'
  );

  DELETE FROM speaking
  WHERE path_uuid = v_path_uuid AND step_order = 890 AND source_language = 'en';

  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (
    v_path_uuid,
    890,
    'en',
    'speaking',
    'education'
  )
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES
    (v_speaking_uuid, 'es', 'Explica las instrucciones básicas de clase', 'Habla como si repitieras a un compañero la hora, el aula y la tarea de una clase.', '{"scenario": "Acabas de leer un aviso de clase y quieres enviar un audio corto a un compañero para explicarle las instrucciones básicas.", "tasks": ["Saluda a tu compañero y di qué clase explicas.", "Di el día, la fecha, la hora y el aula de la clase.", "Explica a qué hora deben llegar y qué materiales deben llevar.", "Di qué hacen primero en la hoja y qué páginas o preguntas leen y responden.", "Explica que primero trabajan solos y después revisan con una pareja.", "Di cuál es la tarea para casa, cuándo la envían y termina con una despedida simple."]}'::jsonb),
    (v_speaking_uuid, 'de', 'Erkläre die einfachen Unterrichtsanweisungen', 'Sprich so, als würdest du einem Mitschüler Uhrzeit, Raum und Aufgabe des Unterrichts erklären.', '{"scenario": "Du hast gerade eine Unterrichtsnotiz gelesen und willst einem Mitschüler eine kurze Sprachnachricht schicken, um die einfachen Anweisungen zu erklären.", "tasks": ["Begrüße deinen Mitschüler und sag, welchen Unterricht du erklärst.", "Nenne den Tag, das Datum, die Uhrzeit und den Raum des Unterrichts.", "Erkläre, wann ihr kommen sollt und welche Materialien ihr mitbringt.", "Sag, was ihr zuerst auf dem Blatt macht und welche Seiten oder Fragen ihr lest und beantwortet.", "Erkläre, dass ihr zuerst allein arbeitet und danach mit einem Partner prüft.", "Nenne die Hausaufgabe, wann ihr sie schickt, und verabschiede dich einfach."]}'::jsonb);
END;
$seed$;
