-- ============================================================
-- Seed: A0 English Path – STEP 6070 – Speaking – understand the main points of a tenancy agreement, for example deposits, payment of bills etc., and ask straightforward questions (Alquileres)
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
  VALUES (v_path_uuid, 6070, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand the main points of a tenancy agreement, for example deposits, payment of bills etc., and ask straightforward questions (Alquileres)', 'Práctica guiada de speaking: understand the main points of a tenancy agreement, for example deposits, payment of bills etc., and ask straightforward questions (Alquileres).', '{"instruction":"understand the main points of a tenancy agreement, for example deposits, payment of bills etc., and ask straightforward questions (Alquileres)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
