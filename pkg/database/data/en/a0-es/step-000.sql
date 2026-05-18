-- ============================================================
-- Seed: A0 English Path – STEP 0 – Deck
-- Title: Los Fundamentos (El Alfabeto, fonética y Números Cardinales/Ordinales)
-- Source language: en  |  Translation: es
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_deck_uuid UUID;
BEGIN
  SELECT uuid INTO STRICT v_path_uuid
  FROM path
  WHERE source_language = 'en'
  LIMIT 1;

  INSERT INTO deck (path_uuid, step_order, source_language, type)
  VALUES (v_path_uuid, 0, 'en', 'deck')
  RETURNING uuid INTO v_deck_uuid;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'es', 'El Abecedario', '');

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'de', 'Das Alphabet', '');

  WITH inserted_words AS (
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
  deck_links AS (
    INSERT INTO deck_words (deck_uuid, word_uuid)
    SELECT v_deck_uuid, uuid FROM inserted_words
  )
  INSERT INTO word_translation (word_uuid, language, pronunciation)
  SELECT
    uuid,
    'es',
    CASE term
      WHEN 'a' THEN '/éi/'
      WHEN 'b' THEN '/bi/'
      WHEN 'c' THEN '/si/'
      WHEN 'd' THEN '/di/'
      WHEN 'e' THEN '/i/'
      WHEN 'f' THEN '/ef/'
      WHEN 'g' THEN '/yiy/'
      WHEN 'h' THEN '/éich/'
      WHEN 'i' THEN '/ái/'
      WHEN 'j' THEN '/yéi/'
      WHEN 'k' THEN '/kéi/'
      WHEN 'l' THEN '/el/'
      WHEN 'm' THEN '/em/'
      WHEN 'n' THEN '/en/'
      WHEN 'o' THEN '/óu/'
      WHEN 'p' THEN '/pi/'
      WHEN 'q' THEN '/kiú/'
      WHEN 'r' THEN '/ar/'
      WHEN 's' THEN '/es/'
      WHEN 't' THEN '/ti/'
      WHEN 'u' THEN '/yíu/'
      WHEN 'v' THEN '/vi/'
      WHEN 'w' THEN '/dábelyu/'
      WHEN 'x' THEN '/ex/'
      WHEN 'y' THEN '/uái/'
      WHEN 'z' THEN '/zi/'
    END
  FROM inserted_words;

  -- German letter pronunciations
  INSERT INTO word_translation (word_uuid, language, pronunciation)
  SELECT dw.word_uuid, 'de',
    CASE w.term
      WHEN 'a' THEN '/EJ/'
      WHEN 'b' THEN '/BIE/'
      WHEN 'c' THEN '/SIE/'
      WHEN 'd' THEN '/DIE/'
      WHEN 'e' THEN '/IE/'
      WHEN 'f' THEN '/EF/'
      WHEN 'g' THEN '/DSCHIE/'
      WHEN 'h' THEN '/EJ-TSCH/'
      WHEN 'i' THEN '/AI/'
      WHEN 'j' THEN '/DSCHEJ/'
      WHEN 'k' THEN '/KEJ/'
      WHEN 'l' THEN '/EL/'
      WHEN 'm' THEN '/EM/'
      WHEN 'n' THEN '/EN/'
      WHEN 'o' THEN '/OU/'
      WHEN 'p' THEN '/PIE/'
      WHEN 'q' THEN '/KJUH/'
      WHEN 'r' THEN '/AAR/'
      WHEN 's' THEN '/ES/'
      WHEN 't' THEN '/TIE/'
      WHEN 'u' THEN '/JUH/'
      WHEN 'v' THEN '/WIE/'
      WHEN 'w' THEN '/DAB-öl-JUH/'
      WHEN 'x' THEN '/EKS/'
      WHEN 'y' THEN '/WAI/'
      WHEN 'z' THEN '/SED/'
    END
  FROM deck_words dw
  JOIN word w ON dw.word_uuid = w.uuid
  WHERE dw.deck_uuid = v_deck_uuid;
END;
$seed$;
