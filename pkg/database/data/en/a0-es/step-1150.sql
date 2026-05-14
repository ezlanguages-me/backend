-- ============================================================
-- Seed: A0 English Path – STEP 1150 – Speaking – go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones)
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
  VALUES (v_path_uuid, 1150, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones)', 'Práctica guiada de speaking: go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones).', '{"instruction":"go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
