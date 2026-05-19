-- ============================================================
-- Seed: A0 English Path – STEP 850 – Speaking – make an outgoing call and pass on simple, prepared messages (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO STRICT v_path_uuid
  FROM path
  WHERE source_language = 'en'
  LIMIT 1;

  DELETE FROM speaking_translation
  WHERE speaking_uuid IN (
    SELECT uuid
    FROM speaking
    WHERE step_order = 850
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'speaking'
  );

  DELETE FROM speaking
  WHERE step_order = 850
    AND path_uuid = v_path_uuid
    AND source_language = 'en'
    AND type = 'speaking';
  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (
    v_path_uuid,
    850,
    'en',
    'speaking',
    'professional'
  )
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (
    v_speaking_uuid,
    'es',
    'Hacer una llamada profesional simple',
    'Haz una llamada saliente y deja un mensaje claro y preparado.',
    '{"scenario": "Necesitas hacer una llamada profesional corta en inglés para dejar un mensaje preparado a una clínica. La persona correcta no está disponible y tú debes hablar con recepción.", "tasks": ["Saluda y di tu nombre y el nombre de tu empresa.", "Pide hablar con la persona correcta de forma educada.", "Explica que quieres dejar un mensaje porque esa persona no está disponible.", "Da el mensaje principal con una hora o una fecha clara.", "Añade una segunda instrucción simple, por ejemplo pedir una confirmación o un documento.", "Termina con tu número de teléfono y una despedida educada."]}'::jsonb
  );

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (
    v_speaking_uuid,
    'de',
    'Einen einfachen geschäftlichen Anruf machen',
    'Mache einen ausgehenden Anruf und hinterlasse eine klare vorbereitete Nachricht.',
    '{"scenario": "Du musst einen kurzen geschäftlichen Anruf auf Englisch machen, um einer Klinik eine vorbereitete Nachricht zu hinterlassen. Die richtige Person ist nicht verfügbar und du musst mit der Rezeption sprechen.", "tasks": ["Begrüße die Person und nenne deinen Namen und den Namen deiner Firma.", "Bitte höflich darum, mit der richtigen Person zu sprechen.", "Erkläre, dass du eine Nachricht hinterlassen möchtest, weil die Person nicht verfügbar ist.", "Gib die Hauptnachricht mit einer klaren Uhrzeit oder einem klaren Datum.", "Füge eine zweite einfache Anweisung hinzu, zum Beispiel eine Bestätigung oder ein Dokument.", "Beende den Anruf mit deiner Telefonnummer und einer höflichen Verabschiedung."]}'::jsonb
  );
END;
$seed$;
