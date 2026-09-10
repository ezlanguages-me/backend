-- ============================================================
-- Seed: A0 English Path – STEP 2: Deck – Colores Básicos en Inglés
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id  UUID;
  v_deck2_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

  -- ── STEP 2: Deck – Colores Básicos en Inglés ──────────────────────────
  INSERT INTO deck (path_id, step_order, type, source_language)
  VALUES (v_path_id, 2, 'deck', 'en')
  RETURNING uuid INTO v_deck2_id;

  WITH w AS (
    INSERT INTO word (term, is_root, source_language) VALUES
      ('red', true, 'en'),
      ('blue', true, 'en'),
      ('yellow', true, 'en'),
      ('green', true, 'en'),
      ('orange', true, 'en'),
      ('purple', true, 'en'),
      ('pink', true, 'en'),
      ('black', true, 'en'),
      ('white', true, 'en'),
      ('gray', true, 'en'),
      ('brown', true, 'en'),
      ('gold', true, 'en'),
      ('silver', true, 'en'),
      ('violet', true, 'en')
    RETURNING uuid, term
  ),
  dw AS (
    INSERT INTO deck_words (deck_id, word_id)
    SELECT v_deck2_id, uuid FROM w
  )
  INSERT INTO word_translation (word_id, language, pronunciation, meaning)
  SELECT uuid, 'es', 
    CASE 
      WHEN term = 'red' THEN 'red'
      WHEN term = 'blue' THEN 'blú'
      WHEN term = 'yellow' THEN 'yélou'
      WHEN term = 'green' THEN 'grin'
      WHEN term = 'orange' THEN 'óranch'
      WHEN term = 'purple' THEN 'pérpol'
      WHEN term = 'pink' THEN 'pink'
      WHEN term = 'black' THEN 'blak'
      WHEN term = 'white' THEN 'uáit'
      WHEN term = 'gray' THEN 'gréi'
      WHEN term = 'brown' THEN 'bráun'
      WHEN term = 'gold' THEN 'góuld'
      WHEN term = 'silver' THEN 'sílver'
      WHEN term = 'violet' THEN 'váiolet'
    END,
    CASE 
      WHEN term = 'red' THEN '[{"kind":"ADJECTIVE","definition":"Rojo","example":"The apple is red"}]'::jsonb
      WHEN term = 'blue' THEN '[{"kind":"ADJECTIVE","definition":"Azul","example":"The sky is clear and blue today"}]'::jsonb
      WHEN term = 'yellow' THEN '[{"kind":"ADJECTIVE","definition":"Amarillo","example":"Bananas are usually yellow"}]'::jsonb
      WHEN term = 'green' THEN '[{"kind":"ADJECTIVE","definition":"Verde","example":"The grass is very green after the rain"}]'::jsonb
      WHEN term = 'orange' THEN '[{"kind":"ADJECTIVE","definition":"Naranja","example":"She is wearing an orange shirt"},{"kind":"NOUN","definition":"Una fruta cítrica de color naranja","example":"I like to drink orange juice in the morning"}]'::jsonb
      WHEN term = 'purple' THEN '[{"kind":"ADJECTIVE","definition":"Morado o púrpura","example":"Grapes can be green or purple"}]'::jsonb
      WHEN term = 'pink' THEN '[{"kind":"ADJECTIVE","definition":"Rosa","example":"Flamingos are famous for being pink"}]'::jsonb
      WHEN term = 'black' THEN '[{"kind":"ADJECTIVE","definition":"Negro","example":"I like drinking black coffee"}]'::jsonb
      WHEN term = 'white' THEN '[{"kind":"ADJECTIVE","definition":"Blanco","example":"He has a beautiful white cat"}]'::jsonb
      WHEN term = 'gray' THEN '[{"kind":"ADJECTIVE","definition":"Gris","example":"The clouds are gray; it might rain"}]'::jsonb
      WHEN term = 'brown' THEN '[{"kind":"ADJECTIVE","definition":"Marrón o café","example":"Chocolate is usually brown"}]'::jsonb
      WHEN term = 'gold' THEN '[{"kind":"ADJECTIVE","definition":"Dorado (color oro)","example":"She won a gold medal"},{"kind":"NOUN","definition":"Un metal precioso de color amarillo brillante","example":"Gold is often used in jewelry"}]'::jsonb
      WHEN term = 'silver' THEN '[{"kind":"ADJECTIVE","definition":"Plateado (color plata)","example":"The car is silver"},{"kind":"NOUN","definition":"Un metal precioso de color blanco brillante","example":"Silver is used in making jewelry and coins"}]'::jsonb
      WHEN term = 'violet' THEN '[{"kind":"ADJECTIVE","definition":"Violeta","example":"Violet flowers are very pretty"},{"kind":"NOUN","definition":"Una planta con flores de color violeta","example":"She picked a violet from the garden"}]'::jsonb
    END
  FROM w;

  INSERT INTO deck_translation (deck_id, language, title, description)
  VALUES (v_deck2_id, 'es', 'Colores Básicos en Inglés', 'Aprende los colores básicos en inglés');

END;
$$;
