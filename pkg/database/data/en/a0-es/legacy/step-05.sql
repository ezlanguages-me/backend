-- ============================================================
-- Seed: A0 English Path – STEP 9: Deck – Familia y Parentescos
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id  UUID;
  v_deck9_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- ── STEP 9: Deck – Familia y Parentescos Completos en Inglés ────────────────
-- ============================================================================

INSERT INTO deck (path_id, step_order, type, source_language) 
VALUES (v_path_id, 6, 'deck', 'en') 
RETURNING uuid INTO v_deck9_id;

WITH w AS (
  INSERT INTO word (term, is_root, source_language) VALUES 
  ('family', true, 'en'), 
  ('mother', true, 'en'), 
  ('father', true, 'en'), 
  ('parents', true, 'en'), 
  ('son', true, 'en'), 
  ('daughter', true, 'en'), 
  ('children', true, 'en'), 
  ('brother', true, 'en'), 
  ('sister', true, 'en'), 
  ('siblings', true, 'en'),
  ('grandfather', true, 'en'), 
  ('grandmother', true, 'en'), 
  ('grandparents', true, 'en'),
  ('grandson', true, 'en'),
  ('granddaughter', true, 'en'),
  ('grandchildren', true, 'en'),
  ('uncle', true, 'en'), 
  ('aunt', true, 'en'), 
  ('cousin', true, 'en'), 
  ('nephew', true, 'en'), 
  ('niece', true, 'en'), 
  ('husband', true, 'en'), 
  ('wife', true, 'en'),
  ('spouse', true, 'en'),
  ('father-in-law', true, 'en'),
  ('mother-in-law', true, 'en'),
  ('parents-in-law', true, 'en'),
  ('son-in-law', true, 'en'),
  ('daughter-in-law', true, 'en'),
  ('brother-in-law', true, 'en'),
  ('sister-in-law', true, 'en'),
  ('stepfather', true, 'en'),
  ('stepmother', true, 'en'),
  ('stepson', true, 'en'),
  ('stepdaughter', true, 'en'),
  ('stepbrother', true, 'en'),
  ('stepsister', true, 'en'),
  ('godfather', true, 'en'),
  ('godmother', true, 'en'),
  ('godchild', true, 'en')
  RETURNING uuid, term
), 
dw AS (
  INSERT INTO deck_words (deck_id, word_id) 
  SELECT v_deck9_id, uuid FROM w
)
INSERT INTO word_translation (word_id, language, pronunciation, meaning)
SELECT uuid, 'es',
  CASE 
    WHEN term = 'family' THEN 'fámili'
    WHEN term = 'mother' THEN 'móder'
    WHEN term = 'father' THEN 'fáder'
    WHEN term = 'parents' THEN 'pérents'
    WHEN term = 'son' THEN 'san'
    WHEN term = 'daughter' THEN 'dóter'
    WHEN term = 'children' THEN 'chíldren'
    WHEN term = 'brother' THEN 'bróder'
    WHEN term = 'sister' THEN 'síster'
    WHEN term = 'siblings' THEN 'síblings'
    WHEN term = 'grandfather' THEN 'granfáder'
    WHEN term = 'grandmother' THEN 'granmóder'
    WHEN term = 'grandparents' THEN 'granpérents'
    WHEN term = 'grandson' THEN 'gransan'
    WHEN term = 'granddaughter' THEN 'grandóter'
    WHEN term = 'grandchildren' THEN 'granchíldren'
    WHEN term = 'uncle' THEN 'ánkol'
    WHEN term = 'aunt' THEN 'ant'
    WHEN term = 'cousin' THEN 'kózin'
    WHEN term = 'nephew' THEN 'néfiu'
    WHEN term = 'niece' THEN 'níis'
    WHEN term = 'husband' THEN 'hásband'
    WHEN term = 'wife' THEN 'uáif'
    WHEN term = 'spouse' THEN 'spáus'
    WHEN term = 'father-in-law' THEN 'fáder-in-lo'
    WHEN term = 'mother-in-law' THEN 'móder-in-lo'
    WHEN term = 'parents-in-law' THEN 'pérents-in-lo'
    WHEN term = 'son-in-law' THEN 'san-in-lo'
    WHEN term = 'daughter-in-law' THEN 'dóter-in-lo'
    WHEN term = 'brother-in-law' THEN 'bróder-in-lo'
    WHEN term = 'sister-in-law' THEN 'síster-in-lo'
    WHEN term = 'stepfather' THEN 'stepfáder'
    WHEN term = 'stepmother' THEN 'stepmóder'
    WHEN term = 'stepson' THEN 'stepsan'
    WHEN term = 'stepdaughter' THEN 'stepdóter'
    WHEN term = 'stepbrother' THEN 'stepbróder'
    WHEN term = 'stepsister' THEN 'stepsíster'
    WHEN term = 'godfather' THEN 'godfáder'
    WHEN term = 'godmother' THEN 'godmóder'
    WHEN term = 'godchild' THEN 'godcháild'
  END,
  CASE 
    WHEN term = 'family' THEN '[{"kind":"NOUN","definition":"Familia","example":"My family is big"}]'::jsonb
    WHEN term = 'mother' THEN '[{"kind":"NOUN","definition":"Madre","example":"My mother is a teacher"}]'::jsonb
    WHEN term = 'father' THEN '[{"kind":"NOUN","definition":"Padre","example":"His father works hard"}]'::jsonb
    WHEN term = 'parents' THEN '[{"kind":"NOUN","definition":"Padres (madre y padre)","example":"I live with my parents"}]'::jsonb
    WHEN term = 'son' THEN '[{"kind":"NOUN","definition":"Hijo","example":"They have one son"}]'::jsonb
    WHEN term = 'daughter' THEN '[{"kind":"NOUN","definition":"Hija","example":"Her daughter is five years old"}]'::jsonb
    WHEN term = 'children' THEN '[{"kind":"NOUN","definition":"Hijos / Niños","example":"How many children do you have?"}]'::jsonb
    WHEN term = 'brother' THEN '[{"kind":"NOUN","definition":"Hermano","example":"He is my older brother"}]'::jsonb
    WHEN term = 'sister' THEN '[{"kind":"NOUN","definition":"Hermana","example":"I have two sisters"}]'::jsonb
    WHEN term = 'siblings' THEN '[{"kind":"NOUN","definition":"Hermanos (en general, sin distinguir genero)","example":"Do you have any siblings?"}]'::jsonb
    WHEN term = 'grandfather' THEN '[{"kind":"NOUN","definition":"Abuelo","example":"My grandfather is very wise"}]'::jsonb
    WHEN term = 'grandmother' THEN '[{"kind":"NOUN","definition":"Abuela","example":"My grandmother makes great cookies"}]'::jsonb
    WHEN term = 'grandparents' THEN '[{"kind":"NOUN","definition":"Abuelos (ambos)","example":"I visit my grandparents on Sundays"}]'::jsonb
    WHEN term = 'grandson' THEN '[{"kind":"NOUN","definition":"Nieto","example":"Her grandson is playing outside"}]'::jsonb
    WHEN term = 'granddaughter' THEN '[{"kind":"NOUN","definition":"Nieta","example":"They bought a gift for their granddaughter"}]'::jsonb
    WHEN term = 'grandchildren' THEN '[{"kind":"NOUN","definition":"Nietos (en general)","example":"She has five grandchildren"}]'::jsonb
    WHEN term = 'uncle' THEN '[{"kind":"NOUN","definition":"Tío","example":"My uncle lives in London"}]'::jsonb
    WHEN term = 'aunt' THEN '[{"kind":"NOUN","definition":"Tía","example":"My aunt is visiting us today"}]'::jsonb
    WHEN term = 'cousin' THEN '[{"kind":"NOUN","definition":"Primo / Prima","example":"My cousin and I are the same age"}]'::jsonb
    WHEN term = 'nephew' THEN '[{"kind":"NOUN","definition":"Sobrino","example":"I bought a toy for my nephew"}]'::jsonb
    WHEN term = 'niece' THEN '[{"kind":"NOUN","definition":"Sobrina","example":"My niece loves to draw"}]'::jsonb
    WHEN term = 'husband' THEN '[{"kind":"NOUN","definition":"Esposo / Marido","example":"Her husband is an engineer"}]'::jsonb
    WHEN term = 'wife' THEN '[{"kind":"NOUN","definition":"Esposa / Mujer","example":"He bought flowers for his wife"}]'::jsonb
    WHEN term = 'spouse' THEN '[{"kind":"NOUN","definition":"Cónyuge / Pareja casada","example":"Employees can bring their spouse to the party"}]'::jsonb
    WHEN term = 'father-in-law' THEN '[{"kind":"NOUN","definition":"Suegro","example":"My father-in-law is a retired doctor"}]'::jsonb
    WHEN term = 'mother-in-law' THEN '[{"kind":"NOUN","definition":"Suegra","example":"I get along well with my mother-in-law"}]'::jsonb
    WHEN term = 'parents-in-law' THEN '[{"kind":"NOUN","definition":"Suegros","example":"We are having dinner with my parents-in-law"}]'::jsonb
    WHEN term = 'son-in-law' THEN '[{"kind":"NOUN","definition":"Yerno","example":"Their son-in-law helps them a lot"}]'::jsonb
    WHEN term = 'daughter-in-law' THEN '[{"kind":"NOUN","definition":"Nuera","example":"My daughter-in-law is very kind"}]'::jsonb
    WHEN term = 'brother-in-law' THEN '[{"kind":"NOUN","definition":"Cuñado","example":"My brother-in-law fixed my car"}]'::jsonb
    WHEN term = 'sister-in-law' THEN '[{"kind":"NOUN","definition":"Cuñada","example":"I went shopping with my sister-in-law"}]'::jsonb
    WHEN term = 'stepfather' THEN '[{"kind":"NOUN","definition":"Padrastro","example":"His stepfather taught him how to fish"}]'::jsonb
    WHEN term = 'stepmother' THEN '[{"kind":"NOUN","definition":"Madrastra","example":"She has a good relationship with her stepmother"}]'::jsonb
    WHEN term = 'stepson' THEN '[{"kind":"NOUN","definition":"Hijastro","example":"He is very proud of his stepson"}]'::jsonb
    WHEN term = 'stepdaughter' THEN '[{"kind":"NOUN","definition":"Hijastra","example":"She helped her stepdaughter with her homework"}]'::jsonb
    WHEN term = 'stepbrother' THEN '[{"kind":"NOUN","definition":"Hermanastro","example":"My stepbrother and I share a room"}]'::jsonb
    WHEN term = 'stepsister' THEN '[{"kind":"NOUN","definition":"Hermanastra","example":"Her stepsister is older than her"}]'::jsonb
    WHEN term = 'godfather' THEN '[{"kind":"NOUN","definition":"Padrino","example":"My godfather always gives me great advice"}]'::jsonb
    WHEN term = 'godmother' THEN '[{"kind":"NOUN","definition":"Madrina","example":"She is the godmother of my child"}]'::jsonb
    WHEN term = 'godchild' THEN '[{"kind":"NOUN","definition":"Ahijado / Ahijada","example":"I bought a present for my godchild"}]'::jsonb
  END
FROM w;

INSERT INTO deck_translation (deck_id, language, title, description) 
VALUES (v_deck9_id, 'es', 'Familia y Parentescos (Completo)', 'Aprende todo el vocabulario necesario sobre el árbol genealógico, incluyendo familia política y compuesta.');

-- ============================================================================

END;
$$;
