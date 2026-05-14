-- ============================================================
-- Seed: A0 English Path – STEP 4290 – Speaking – offer advice to clients within own job area on simple matters (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO speaking (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 4290, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'offer advice to clients within own job area on simple matters (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de speaking: offer advice to clients within own job area on simple matters (Servicios Laborales (Petición y Prestación)).', '{"instruction":"offer advice to clients within own job area on simple matters (Servicios Laborales (Petición y Prestación))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
