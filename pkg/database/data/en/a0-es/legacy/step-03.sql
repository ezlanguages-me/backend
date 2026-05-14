-- ============================================================
-- Seed: A0 English Path – STEP 3: Dialogue – Saludos Básicos en Inglés
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id  UUID;
  v_dialogue_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO dialogue (path_id, step_order, characters, source_language, category)
  VALUES (
    v_path_id,
    3,
    '[
      {"name":"Alice","gender":"female","avatarURL":"https://example.com/avatars/alice.png"},
      {"name":"Bob",  "gender":"male",  "avatarURL":"https://example.com/avatars/bob.png"}
    ]'::jsonb,
    'en',
    'introduction'
  )
  RETURNING uuid INTO v_dialogue_id;

  INSERT INTO dialogue_translation (dialogue_id, language, title, description)
  VALUES (
    v_dialogue_id,
    'es',
    'Presentación Básica',
    'Aprende a decir tu nombre y saludar a alguien nuevo.'
  );  

  INSERT INTO dialogue_lines (dialogue_id, line_order, character_name, text)
  VALUES 
    (v_dialogue_id, 0, 'Alice', 'Hello! I am Alice.'),
    (v_dialogue_id, 1, 'Bob', 'Hi Alice! I am Bob. Nice to meet you.'),
    (v_dialogue_id, 2, 'Alice', 'Likewise.');

  INSERT INTO dialogue_lines_translation (dialogue_line_id, language, meaning)
  VALUES (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 0),
    'es',
    '[{"lineOrder":0,"character":"Alice","text":"Hello! I am Alice.", 
       "pronunciation":"/jelóu! ái am Ális/",
       "translations":[{"languageCode":"es","translation":"¡Hola! Soy Alice."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 1),
    'es',
    '[{"lineOrder":1,"character":"Bob","text":"Hi Alice! I am Bob. Nice to meet you.", 
       "pronunciation":"/jái Ális! ái am Bob. náis tu míit iú/",
       "translations":[{"languageCode":"es","translation":"¡Hola Alice! Soy Bob. Encantado de conocerte."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 2),
    'es',
     '[{"lineOrder":2,"character":"Alice","text":"Likewise.", 
       "pronunciation":"/láikuais/",
       "translations":[{"languageCode":"es","translation":"Igualmente."}]}]'::jsonb
  );

  -- ==============================================================================
  -- DIÁLOGO 1: Saludo Muy Básico (Cómo estás)
  -- ==============================================================================
  INSERT INTO dialogue (path_id, step_order, characters, source_language, category)
  VALUES (
    v_path_id,
    5,
    '[
      {"name":"Bob", "gender":"male", "avatarURL":"https://example.com/avatars/bob.png"},
      {"name":"Alice", "gender":"female", "avatarURL":"https://example.com/avatars/alice.png"}
    ]'::jsonb,
    'en',
    'greetings'
  )
  RETURNING uuid INTO v_dialogue_id;

  INSERT INTO dialogue_translation (dialogue_id, language, title, description)
  VALUES (
    v_dialogue_id,
    'es',
    'Saludos Básicos 1',
    'Aprende a decir hola y preguntar cómo estás de forma muy sencilla.'
  );  

  INSERT INTO dialogue_lines (dialogue_id, line_order, character_name, text)
  VALUES 
    (v_dialogue_id, 0, 'Bob', 'Hello, Alice.'),
    (v_dialogue_id, 1, 'Alice', 'Hi, Bob. How are you?'),
    (v_dialogue_id, 2, 'Bob', 'I am fine. And you?'),
    (v_dialogue_id, 3, 'Alice', 'I am fine too.');

  INSERT INTO dialogue_lines_translation (dialogue_line_id, language, meaning)
  VALUES (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 0),
    'es',
    '[{"lineOrder":0,"character":"Bob","text":"Hello, Alice.", "pronunciation":"/jelóu, Ális/", "translations":[{"languageCode":"es","translation":"Hola, Alice."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 1),
    'es',
    '[{"lineOrder":1,"character":"Alice","text":"Hi, Bob. How are you?", "pronunciation":"/jái, Bob. Jáu ar iú?/", "translations":[{"languageCode":"es","translation":"Hola, Bob. ¿Cómo estás?"}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 2),
    'es',
     '[{"lineOrder":2,"character":"Bob","text":"I am fine. And you?", "pronunciation":"/ái am fáin. And iú?/", "translations":[{"languageCode":"es","translation":"Estoy bien. ¿Y tú?"}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 3),
    'es',
     '[{"lineOrder":3,"character":"Alice","text":"I am fine too.", "pronunciation":"/ái am fáin tú/", "translations":[{"languageCode":"es","translation":"Estoy bien también."}]}]'::jsonb
  );


  -- ==============================================================================
  -- DIÁLOGO 2: Despedida Muy Básica
  -- ==============================================================================
  INSERT INTO dialogue (path_id, step_order, characters, source_language, category)
  VALUES (
    v_path_id,
    7,
    '[
      {"name":"Bob", "gender":"male", "avatarURL":"https://example.com/avatars/bob.png"},
      {"name":"Alice", "gender":"female", "avatarURL":"https://example.com/avatars/alice.png"}
    ]'::jsonb,
    'en',
    'farewells'
  )
  RETURNING uuid INTO v_dialogue_id;

  INSERT INTO dialogue_translation (dialogue_id, language, title, description)
  VALUES (
    v_dialogue_id,
    'es',
    'Despedidas Básicas',
    'Aprende las palabras más fáciles para despedirte.'
  );  

  INSERT INTO dialogue_lines (dialogue_id, line_order, character_name, text)
  VALUES 
    (v_dialogue_id, 0, 'Bob', 'Goodbye, Alice.'),
    (v_dialogue_id, 1, 'Alice', 'Bye, Bob. See you later.'),
    (v_dialogue_id, 2, 'Bob', 'See you!');

  INSERT INTO dialogue_lines_translation (dialogue_line_id, language, meaning)
  VALUES (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 0),
    'es',
    '[{"lineOrder":0,"character":"Bob","text":"Goodbye, Alice.", "pronunciation":"/gudbái, Ális/", "translations":[{"languageCode":"es","translation":"Adiós, Alice."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 1),
    'es',
    '[{"lineOrder":1,"character":"Alice","text":"Bye, Bob. See you later.", "pronunciation":"/bái, Bób. Sí iu léiter/", "translations":[{"languageCode":"es","translation":"Adiós, Bob. Nos vemos luego."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 2),
    'es',
     '[{"lineOrder":2,"character":"Bob","text":"See you!", "pronunciation":"/sí iu!/", "translations":[{"languageCode":"es","translation":"¡Nos vemos!"}]}]'::jsonb
  );


  -- ==============================================================================
  -- DIÁLOGO 3: Buenos días
  -- ==============================================================================
  INSERT INTO dialogue (path_id, step_order, characters, source_language, category)
  VALUES (
    v_path_id,
    6,
    '[
      {"name":"Bob", "gender":"male", "avatarURL":"https://example.com/avatars/bob.png"},
      {"name":"Alice", "gender":"female", "avatarURL":"https://example.com/avatars/alice.png"}
    ]'::jsonb,
    'en',
    'greetings'
  )
  RETURNING uuid INTO v_dialogue_id;

  INSERT INTO dialogue_translation (dialogue_id, language, title, description)
  VALUES (
    v_dialogue_id,
    'es',
    'Buenos días',
    'Aprende a decir buenos días y desear un buen día.'
  );  

  INSERT INTO dialogue_lines (dialogue_id, line_order, character_name, text)
  VALUES 
    (v_dialogue_id, 0, 'Bob', 'Good morning, Alice.'),
    (v_dialogue_id, 1, 'Alice', 'Good morning, Bob.'),
    (v_dialogue_id, 2, 'Bob', 'Have a good day.'),
    (v_dialogue_id, 3, 'Alice', 'Thank you! Bye.');

  INSERT INTO dialogue_lines_translation (dialogue_line_id, language, meaning)
  VALUES (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 0),
    'es',
    '[{"lineOrder":0,"character":"Bob","text":"Good morning, Alice.", "pronunciation":"/gud mórnin, Ális/", "translations":[{"languageCode":"es","translation":"Buenos días, Alice."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 1),
    'es',
    '[{"lineOrder":1,"character":"Alice","text":"Good morning, Bob.", "pronunciation":"/gud mórnin, Bob/", "translations":[{"languageCode":"es","translation":"Buenos días, Bob."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 2),
    'es',
     '[{"lineOrder":2,"character":"Bob","text":"Have a good day.", "pronunciation":"/jav a gud déi/", "translations":[{"languageCode":"es","translation":"Ten un buen día."}]}]'::jsonb
  ),
  (
    (SELECT uuid FROM dialogue_lines WHERE dialogue_id = v_dialogue_id AND line_order = 3),
    'es',
     '[{"lineOrder":3,"character":"Alice","text":"Thank you! Bye.", "pronunciation":"/zánkiu! bái/", "translations":[{"languageCode":"es","translation":"¡Gracias! Adiós."}]}]'::jsonb
  );

END;
$$;
