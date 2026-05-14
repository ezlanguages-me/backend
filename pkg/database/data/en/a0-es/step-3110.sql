-- ============================================================
-- Seed: A0 English Path – STEP 3110 – Reading – understand detailed, complex conditions of hire, e.g. conditions relating to break-down or theft of a hired car (Viajes y Transporte)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO reading (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 3110, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand detailed, complex conditions of hire, e.g. conditions relating to break-down or theft of a hired car (Viajes y Transporte)', 'Práctica guiada de reading: understand detailed, complex conditions of hire, e.g. conditions relating to break-down or theft of a hired car (Viajes y Transporte).', '{"instruction":"understand detailed, complex conditions of hire, e.g. conditions relating to break-down or theft of a hired car (Viajes y Transporte)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
