-- ============================================================
-- Seed: A0 English Path – STEP 6140 – Speaking – request repairs
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  DELETE FROM speaking_translation WHERE speaking_uuid IN (SELECT uuid FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6140 AND source_language = 'en');
  DELETE FROM speaking WHERE path_uuid = v_path_uuid AND step_order = 6140 AND source_language = 'en';
  INSERT INTO speaking (path_uuid, step_order, source_language, type, category)
  VALUES (v_path_uuid, 6140, 'en', 'speaking', 'Alquileres')
  RETURNING uuid INTO v_speaking_uuid;
  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'Pide reparaciones', 'Practica cómo pedir reparaciones de forma clara y educada.', '{"scenario": "Hay una avería en tu vivienda y necesitas pedir una reparación al propietario o al gestor.", "tasks": ["Saluda y explica el problema principal.", "Di dónde está la avería.", "Explica si es urgente o no.", "Menciona desde cuándo ocurre.", "Pregunta cuándo pueden venir a arreglarlo.", "Ofrece una hora para entrar en la vivienda.", "Pregunta si necesitas enviar fotos.", "Cierra agradeciendo la ayuda."]}'::jsonb),
         (v_speaking_uuid, 'de', 'Bitte um Reparaturen', 'Übe, wie du Reparaturen klar und höflich anforderst.', '{"scenario": "Es gibt einen Schaden in deiner Wohnung und du musst den Eigentümer oder Verwalter um Reparatur bitten.", "tasks": ["Begrüße die Person und erkläre das Hauptproblem.", "Sag, wo der Schaden ist.", "Erkläre, ob es dringend ist oder nicht.", "Erwähne, seit wann das Problem besteht.", "Frage, wann jemand zur Reparatur kommen kann.", "Nenne eine Uhrzeit, zu der man in die Wohnung kommen kann.", "Frage, ob du Fotos schicken sollst.", "Schließe mit einem Dank für die Hilfe ab."]}'::jsonb);
END;
$seed$;
