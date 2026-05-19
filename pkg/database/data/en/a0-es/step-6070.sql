-- ============================================================
-- Seed: A0 English Path – STEP 6070 – Speaking – discuss rental agreement details
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM speaking_translation WHERE speaking_uuid IN (SELECT uuid FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6070 AND source_language = 'en');
  DELETE FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6070 AND source_language = 'en';
  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (v_path_uuid, 6070, 'en', 'speaking', 'Alquileres')
  RETURNING uuid INTO v_speaking_uuid;
  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'Habla de los detalles del contrato de alquiler', 'Practica cómo preguntar y responder sobre un contrato de alquiler.', '{"scenario": "Tienes delante un contrato de alquiler y quieres aclarar las condiciones antes de firmar.", "tasks": ["Pregunta por la duración total del contrato.", "Di si la fianza te parece alta o razonable.", "Pregunta qué gastos están incluidos.", "Pregunta si hay una cláusula de aviso.", "Menciona si necesitas permiso para subarrendar.", "Pregunta qué pasa si sales antes de tiempo.", "Di qué punto del contrato quieres revisar otra vez.", "Termina confirmando que entiendes las condiciones principales."]}'::jsonb),
         (v_speaking_uuid, 'de', 'Sprich über die Details des Mietvertrags', 'Übe, wie du Fragen zu einem Mietvertrag stellst und beantwortest.', '{"scenario": "Du hast einen Mietvertrag vor dir und möchtest die Bedingungen vor der Unterschrift klären.", "tasks": ["Frage nach der gesamten Vertragsdauer.", "Sag, ob dir die Kaution hoch oder angemessen erscheint.", "Frage, welche Nebenkosten enthalten sind.", "Frage, ob es eine Kündigungsklausel gibt.", "Erwähne, ob du eine Erlaubnis zum Untervermieten brauchst.", "Frage, was passiert, wenn du früher ausziehst.", "Sag, welchen Punkt du noch einmal prüfen möchtest.", "Schließe ab, indem du bestätigst, dass du die wichtigsten Bedingungen verstanden hast."]}'::jsonb);
END;
$seed$;
