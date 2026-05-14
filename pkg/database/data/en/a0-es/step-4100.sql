-- ============================================================
-- Seed: A0 English Path – STEP 4100 – Reading – offer some help to a client/customer, for example, 'I'll give you our new catalogue' (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 4100, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'offer some help to a client/customer, for example, ''I''ll give you our new catalogue'' (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de reading: offer some help to a client/customer, for example, ''I''ll give you our new catalogue'' (Servicios Laborales (Petición y Prestación)).', '{"instruction":"offer some help to a client/customer, for example, ''I''ll give you our new catalogue'' (Servicios Laborales (Petición y Prestación))","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
