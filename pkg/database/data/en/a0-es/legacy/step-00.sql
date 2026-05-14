DO $$
DECLARE
  v_path_id  UUID;
  v_deck0_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO deck (path_id, step_order, type, source_language)
    VALUES (v_path_id, 0, 'deck', 'en')
    RETURNING uuid INTO v_deck0_id;

  WITH w AS (
    INSERT INTO word (term, is_root, source_language) VALUES
      ('a', true, 'en'),
      ('b', true, 'en'),
      ('c', true, 'en'),
      ('d', true, 'en'),
      ('e', true, 'en'),
      ('f', true, 'en'),
      ('g', true, 'en'),
      ('h', true, 'en'),
      ('i', true, 'en'),
      ('j', true, 'en'),
      ('k', true, 'en'),
      ('l', true, 'en'),
      ('m', true, 'en'),
      ('n', true, 'en'),
      ('o', true, 'en'),
      ('p', true, 'en'),
      ('q', true, 'en'),
      ('r', true, 'en'),
      ('s', true, 'en'),
      ('t', true, 'en'),
      ('u', true, 'en'),
      ('v', true, 'en'),
      ('w', true, 'en'),
      ('x', true, 'en'),
      ('y', true, 'en'),
      ('z', true, 'en')
    RETURNING uuid, term
  ),
  dw AS (
    INSERT INTO deck_words (deck_id, word_id)
    SELECT v_deck0_id, uuid FROM w
  )
  INSERT INTO word_translation (word_id, language, pronunciation)
  SELECT uuid, 'es', CASE 
    WHEN term = 'a' THEN 'éi'
    WHEN term = 'b' THEN 'bi'
    WHEN term = 'c' THEN 'si'
    WHEN term = 'd' THEN 'di'
    WHEN term = 'e' THEN 'i'
    WHEN term = 'f' THEN 'ef'
    WHEN term = 'g' THEN 'yiy'
    WHEN term = 'h' THEN 'éich'
    WHEN term = 'i' THEN 'ái'
    WHEN term = 'j' THEN 'yéi'
    WHEN term = 'k' THEN 'kéi'
    WHEN term = 'l' THEN 'el'
    WHEN term = 'm' THEN 'em'
    WHEN term = 'n' THEN 'en'
    WHEN term = 'o' THEN 'óu'
    WHEN term = 'p' THEN 'pi'
    WHEN term = 'q' THEN 'kiú'
    WHEN term = 'r' THEN 'ar'
    WHEN term = 's' THEN 'es'
    WHEN term = 't' THEN 'ti'
    WHEN term = 'u' THEN 'yíu'
    WHEN term = 'v' THEN 'vi'
    WHEN term = 'w' THEN 'dábelyu'
    WHEN term = 'x' THEN 'ex'
    WHEN term = 'y' THEN 'uái'
    WHEN term = 'z' THEN 'zi'
  END
  FROM w;

  INSERT INTO deck_translation (deck_id, language, title, description)
  VALUES (v_deck0_id, 'es', 'Abecedario Inglés', '');

END;
$$;