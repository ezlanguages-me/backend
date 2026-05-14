-- ============================================================
-- Seed: A0 English Path – STEP 6680 – Reading – understand key points, such as dates, departure times and costs, in a brochure or leaflet in a tourist information centre (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6680, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand key points, such as dates, departure times and costs, in a brochure or leaflet in a tourist information centre (Turismo y Entretenimiento)', 'Práctica guiada de reading: understand key points, such as dates, departure times and costs, in a brochure or leaflet in a tourist information centre (Turismo y Entretenimiento).', '{"instruction":"understand key points, such as dates, departure times and costs, in a brochure or leaflet in a tourist information centre (Turismo y Entretenimiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
