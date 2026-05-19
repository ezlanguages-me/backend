-- ============================================================
-- Seed: A0 English Path – STEP 810 – Speaking – receive simple messages (Teléfono Profesional)
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
    WHERE step_order = 810
      AND path_uuid = v_path_uuid
      AND source_language = 'en'
      AND type = 'speaking'
  );

  DELETE FROM speaking
  WHERE step_order = 810
    AND path_uuid = v_path_uuid
    AND source_language = 'en'
    AND type = 'speaking';
  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (
    v_path_uuid,
    810,
    'en',
    'speaking',
    'professional'
  )
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (
    v_speaking_uuid,
    'es',
    'Tomar un recado en recepción',
    'Habla como recepcionista y recoge un mensaje simple.',
    '{"scenario": "Estás en recepción de una pequeña oficina. Tu compañera Ana no está en su mesa y un cliente llama para dejar un recado. Graba una respuesta breve y clara en inglés.", "tasks": ["Saluda y di el nombre de la empresa y tu nombre.", "Explica que Ana no puede ponerse al teléfono ahora.", "Pide el nombre de la persona que llama y su empresa.", "Pregunta cuál es el mensaje importante.", "Repite el número de teléfono o la hora para confirmar los datos.", "Cierra la llamada de forma educada y di que pasarás el mensaje."]}'::jsonb
  );

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (
    v_speaking_uuid,
    'de',
    'An der Rezeption eine Nachricht aufnehmen',
    'Sprich wie an einer Rezeption und nimm eine einfache Nachricht auf.',
    '{"scenario": "Du bist an der Rezeption eines kleinen Büros. Deine Kollegin Ana ist nicht an ihrem Platz und ein Kunde ruft an, um eine Nachricht zu hinterlassen. Nimm eine kurze und klare Antwort auf Englisch auf.", "tasks": ["Begrüße den Anrufer und nenne den Firmennamen und deinen Namen.", "Erkläre, dass Ana jetzt nicht ans Telefon kommen kann.", "Frage nach dem Namen des Anrufers und seiner Firma.", "Frage, was die wichtige Nachricht ist.", "Wiederhole die Telefonnummer oder die Uhrzeit, um die Angaben zu bestätigen.", "Beende das Gespräch höflich und sage, dass du die Nachricht weitergibst."]}'::jsonb
  );
END;
$seed$;
