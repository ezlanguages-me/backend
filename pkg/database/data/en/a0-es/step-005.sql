-- ============================================================
-- Seed: A0 English Path – STEP 1 – Grammar
-- Title: Números en Inglés
-- Source language: en  |  Translation: es
-- Generated from ordered-steps-table.md
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid  UUID;
  v_grammar_uuid UUID;
  v_rule1_uuid UUID;
  v_rule2_uuid UUID;
  v_rule3_uuid UUID;
  v_rule4_uuid UUID;
  v_rule5_uuid UUID;
  v_rule6_uuid UUID;
  v_ex_uuid UUID;
BEGIN

  SELECT uuid INTO STRICT v_path_uuid
  FROM path
  WHERE source_language = 'en'
  LIMIT 1;

  INSERT INTO grammar (path_uuid, step_order, source_language, type)
  VALUES (
    v_path_uuid,
    5,
    'en',
    'grammar'
  )
  RETURNING uuid INTO v_grammar_uuid;

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
VALUES (
  v_grammar_uuid,
  'es',
  'Los Números',
  '',
  to_jsonb('## Los Números

¡Domina los números en inglés para manejar dinero, dar tu edad o compartir tu teléfono! Aprenderemos los patrones clave para que puedas construirlos lógicamente sin tener que memorizarlos todos de golpe.

### Vocabulario Base: 0 al 12
| Español / Ítem | Inglés | Tip de Pronunciación / Nota |
| :--- | :--- | :--- |
| Cero | Zero | /**zí**-rou/ |
| Uno | One | /uán/ |
| Dos | Two | /tú/ |
| Tres | Three | /zríi/ (Pon la lengua entre los dientes para la "th") |
| Cuatro | Four | /for/ |
| Cinco | Five | /faiv/ |
| Seis | Six | /siks/ |
| Siete | Seven | /**sé**-ven/ |
| Ocho | Eight | /éit/ |
| Nueve | Nine | /náin/ |
| Diez | Ten | /ten/ |
| Once | Eleven | /i-**lé**-ven/ |
| Doce | Twelve | /tuelv/ |

### Los "Teens" (13 al 19)
| Español / Ítem | Inglés | Tip de Pronunciación / Nota |
| :--- | :--- | :--- |
| Trece | Thir**teen** | /zer-**tíin**/ (Acentúa fuerte el final) |
| Catorce | Four**teen** | /for-**tíin**/ |
| Quince | Fif**teen** | /fif-**tíin**/ (Ojo a la raíz: *fif*, no *five*) |
| 16, 17, 18, 19 | ...**teen** | Número base + **-teen** (Ej: Six**teen**) |

### Las Decenas (20, 30, 40...)
| Español / Ítem | Inglés | Tip de Pronunciación / Nota |
| :--- | :--- | :--- |
| Veinte | Twen**ty** | /**tué**-ni/ (Suele enmudecerse la ''t'') |
| Treinta | Thir**ty** | /**zér**-di/ (Acentúa fuerte el inicio) |
| Cuarenta | For**ty** | /**fór**-di/ (Ojo ortografía: pierde la ''u'' de *four*) |
| Cincuenta | Fif**ty** | /**fíf**-ti/ |

### Reglas Gramaticales y de Uso

* **Números compuestos (21 al 99):** Siempre llevan un guion (**hyphen**) uniendo la decena y la unidad al escribirse.
    * ✅ Thirty**-**five (Treinta y cinco)
    * ❌ Thirty five (Treinta y cinco)
* **Cientos (Hundred) y Miles (Thousand):** Son palabras invariables. Nunca les agregues una "s" al final cuando van acompañados de un número específico.
    * ✅ Two **hundred** dollars (Doscientos dólares)
    * ❌ Two **hundreds** dollars (Doscientos dólares)
* **Omitir el "and":** En inglés formal, **no** se usa "and" para conectar las centenas con las decenas.
    * ✅ One hundred fifty (Ciento cincuenta)
    * ❌ One hundred **and** fifty (Ciento cincuenta - *forma alternativa menos frecuente*)

### Excepciones Importantes

> **El truco de la "T" suave (Flap T):**
> La terminación **-ty** (30, 40, 50, etc.) suena más como una "r" suave en español (como en la palabra "pe**r**o") o una "d" muy rápida. 
> *Ejemplo:* **Forty** suena como /**fór**-di/.
> 
> **¡Cuidado con la sílaba tónica!**
> Es la única forma de distinguir si dices 13 o 30:
> 13: Thir-**TEEN** (Sube al final) 🆚 30: **THIR**-ty (Sube al inicio).

### Real-life Context (Usos Prácticos)

* **Números de teléfono:** Se dictan dígito por dígito. El cero casi siempre se pronuncia como la letra **O** (/ou/). 
    * *555-0198* = "Five five five, **O** one nine eight."
* **Precios:** Para hacerlo más rápido, se dividen los precios con decimales en dos partes, ignorando la palabra "dollars" y "cents". 
    * *$4.50* = "Four fifty."
    * *$12.99* = "Twelve ninety-nine."
* **Años:** Se leen en bloques de dos dígitos. 
    * *1998* = "Nineteen ninety-eight."
    * *2024* = "Twenty twenty-four."
'::text)
);

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
  VALUES (
    v_grammar_uuid,
    'de',
    'Die Zahlen',
    '',
    to_jsonb('## Die Zahlen

Lerne englische Zahlen, um Geld zu handhaben, dein Alter anzugeben oder deine Telefonnummer zu teilen! Wir lernen die wichtigsten Muster, damit du sie logisch aufbauen kannst, ohne alle auswendig lernen zu müssen.

### Grundvokabular: 0 bis 12
| Deutsch / Element | Englisch | Aussprache / Hinweis |
| :--- | :--- | :--- |
| Null | Zero | /**ZI**-rou/ |
| Eins | One | /WAAN/ |
| Zwei | Two | /TUU/ |
| Drei | Three | /SSRIE/ (Zunge zwischen die Zähne für "th") |
| Vier | Four | /FOO/ |
| Fünf | Five | /FAIW/ |
| Sechs | Six | /SIKS/ |
| Sieben | Seven | /**SE**-wön/ |
| Acht | Eight | /EJT/ |
| Neun | Nine | /NAIN/ |
| Zehn | Ten | /TEN/ |
| Elf | Eleven | /i-**LE**-wön/ |
| Zwölf | Twelve | /TWELW/ |

### Die "Teens" (13 bis 19)
| Deutsch | Englisch | Aussprache / Hinweis |
| :--- | :--- | :--- |
| Dreizehn | Thir**teen** | /ssö-**TIEN**/ (Betonung stark am Ende) |
| Vierzehn | Four**teen** | /foo-**TIEN**/ |
| Fünfzehn | Fif**teen** | /fif-**TIEN**/ (Achtung: *fif*, nicht *five*) |
| 16, 17, 18, 19 | ...**teen** | Grundzahl + **-teen** (Bsp: Six**teen**) |

### Die Zehner (20, 30, 40...)
| Deutsch | Englisch | Aussprache / Hinweis |
| :--- | :--- | :--- |
| Zwanzig | Twen**ty** | /**TWEN**-ti/ |
| Dreißig | Thir**ty** | /**SSÖÖ**-ti/ |
| Vierzig | For**ty** | /**FOO**-ti/ (Achtung: verliert das "u" von *four*) |
| Fünfzig | Fif**ty** | /**FIF**-ti/ |

### Grammatikregeln und Verwendung

* **Zusammengesetzte Zahlen (21 bis 99):** Beim Schreiben wird immer ein Bindestrich (**hyphen**) zwischen Zehner und Einer gesetzt.
    * ✅ Thirty**-**five (fünfunddreißig)
    * ❌ Thirty five (fünfunddreißig)
* **Hundert (Hundred) und Tausend (Thousand):** Diese Wörter sind unveränderlich. Füge ihnen kein "s" hinzu, wenn sie mit einer bestimmten Zahl kombiniert werden.
    * ✅ Two **hundred** dollars (zweihundert Dollar)
    * ❌ Two **hundreds** dollars (zweihundert Dollar)
* **"And" weglassen:** Im formellen Englisch wird **kein** "and" verwendet, um Hunderte mit Zehnern zu verbinden.
    * ✅ One hundred fifty (hundertfünfzig)
    * ❌ One hundred **and** fifty (hundertfünfzig - *seltenere alternative Form*)

### Wichtige Ausnahmen

> **Der weiche "T"-Trick (Flap T):**
> Die Endung **-ty** (30, 40, 50 usw.) klingt eher wie ein sehr schnelles "d" oder "r".
> *Beispiel:* **Forty** klingt wie /**FOO**-di/.
> 
> **Achte auf die Betonung!**
> Das ist die einzige Möglichkeit zu unterscheiden, ob du 13 oder 30 sagst:
> 13: Thir-**TEEN** (Betonung am Ende) 🆚 30: **THIR**-ty (Betonung am Anfang).

### Alltagskontext (Praktische Verwendung)

* **Telefonnummern:** Werden Ziffer für Ziffer genannt. Die Null wird fast immer wie der Buchstabe **O** (/ou/) ausgesprochen.
    * *555-0198* = "Five five five, **O** one nine eight."
* **Preise:** Zur schnelleren Aussprache werden Dezimalpreise in zwei Teile aufgeteilt, ohne "dollars" und "cents".
    * *$4.50* = "Four fifty."
    * *$12.99* = "Twelve ninety-nine."
* **Jahre:** Werden in Zweierblöcken gelesen.
    * *1998* = "Nineteen ninety-eight."
    * *2024* = "Twenty twenty-four."
'::text)
  );

  -- Regla 1: Guion en números compuestos
  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule1_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule1_uuid, 'es', 'Regla del Guion (21-99)', 'Recuerda usar un guion (-) para números compuestos entre 21 y 99 (ej: thirty-five).');
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule1_uuid, 'de', 'Bindestregel (21-99)', 'Denke daran, einen Bindestrich (-) für zusammengesetzte Zahlen zwischen 21 und 99 zu verwenden (z.B.: thirty-five).');

  -- Regla 2: Plural en cientos y miles
  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule2_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule2_uuid, 'es', 'Cientos y Miles Invariables', 'Las palabras "hundred" y "thousand" no llevan "s" cuando van acompañadas de una cantidad exacta (ej: two hundred).');
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule2_uuid, 'de', 'Hundert und Tausend unveränderlich', 'Die Wörter "hundred" und "thousand" bekommen kein "s", wenn sie mit einer genauen Menge stehen (z.B.: two hundred).');

  -- Regla 3: Uso del "and" en cientos
  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule3_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule3_uuid, 'es', 'Omisión de "and" en Centenas', 'No se usa "and" para conectar las centenas con las decenas (ej: one hundred fifty).');
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule3_uuid, 'de', 'Kein "and" bei Hunderten', 'Im Englischen wird "and" nicht verwendet, um Hunderte mit Zehnern zu verbinden (z.B.: one hundred fifty).');

  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule4_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule4_uuid, 'es', 'Contexto: Números de Teléfono', 'Recuerda: Los teléfonos se leen dígito por dígito. El cero suele pronunciarse como la letra "O" (/ou/).');
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule4_uuid, 'de', 'Kontext: Telefonnummern', 'Denke daran: Telefonnummern werden Ziffer für Ziffer genannt. Die Null wird fast immer wie der Buchstabe "O" (/ou/) ausgesprochen.');

  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule5_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule5_uuid, 'es', 'Contexto: Precios y Años', 'Recuerda: Los precios y años se leen dividiéndolos en bloques de dos (ej: $4.50 = four fifty / 1998 = nineteen ninety-eight).');
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule5_uuid, 'de', 'Kontext: Preise und Jahre', 'Denke daran: Preise und Jahre werden in Zweierblöcken gesprochen (z.B.: $4.50 = four fifty / 1998 = nineteen ninety-eight).');
  -- Regla 6: Teens y Tens
  INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_uuid, 'en') RETURNING uuid INTO v_rule6_uuid;
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule6_uuid, 'es', 'Teens y Tens: Ortografía y Acento', 'Los "teens" (13-19) llevan -teen y el acento al FINAL (thir-TEEN). Los "tens" (30-90) llevan -ty y el acento al INICIO (THIR-ty). Ojo: "forty" pierde la ''u'' de "four".');
  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
  VALUES (v_rule6_uuid, 'de', 'Teens und Tens: Schreibung und Betonung', 'Die "Teens" (13-19) enden auf -teen mit Betonung am ENDE (thir-TEEN). Die "Tens" (30-90) enden auf -ty mit Betonung am ANFANG (THIR-ty). Achtung: "forty" verliert das "u" von "four".');

  -- ==============================================================================
  -- TIPO 1: TYPING (Escribir la respuesta)
  -- ==============================================================================

  -- Regla 1: Guiones (21-99) — 6 ejercicios directos, sin contexto narrativo
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 22 en inglés?', '{"type":"typing","correct_answers":["twenty-two"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 22 auf Englisch?', '{"type":"typing","correct_answers":["twenty-two"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 35 en inglés?', '{"type":"typing","correct_answers":["thirty-five"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 35 auf Englisch?', '{"type":"typing","correct_answers":["thirty-five"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 47 en inglés?', '{"type":"typing","correct_answers":["forty-seven"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 47 auf Englisch?', '{"type":"typing","correct_answers":["forty-seven"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 63 en inglés?', '{"type":"typing","correct_answers":["sixty-three"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 63 auf Englisch?', '{"type":"typing","correct_answers":["sixty-three"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 81 en inglés?', '{"type":"typing","correct_answers":["eighty-one"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 81 auf Englisch?', '{"type":"typing","correct_answers":["eighty-one"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 99 en inglés?', '{"type":"typing","correct_answers":["ninety-nine"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 99 auf Englisch?', '{"type":"typing","correct_answers":["ninety-nine"],"case_sensitive":false}'::jsonb);

  -- Regla 2: Cientos/Miles sin "s" — 4 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 300?', '{"type":"typing","correct_answers":["three hundred"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 300?', '{"type":"typing","correct_answers":["three hundred"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 700?', '{"type":"typing","correct_answers":["seven hundred"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 700?', '{"type":"typing","correct_answers":["seven hundred"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 2,000?', '{"type":"typing","correct_answers":["two thousand"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 2.000?', '{"type":"typing","correct_answers":["two thousand"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 5,000?', '{"type":"typing","correct_answers":["five thousand"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 5.000?', '{"type":"typing","correct_answers":["five thousand"],"case_sensitive":false}'::jsonb);

  -- Regla 3: Omisión de "and" — 4 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 105?', '{"type":"typing","correct_answers":["one hundred five"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 105?', '{"type":"typing","correct_answers":["one hundred five"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 250?', '{"type":"typing","correct_answers":["two hundred fifty"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 250?', '{"type":"typing","correct_answers":["two hundred fifty"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 315?', '{"type":"typing","correct_answers":["three hundred fifteen"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 315?', '{"type":"typing","correct_answers":["three hundred fifteen"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 720?', '{"type":"typing","correct_answers":["seven hundred twenty"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 720?', '{"type":"typing","correct_answers":["seven hundred twenty"],"case_sensitive":false}'::jsonb);

  -- Regla 4: Teléfonos — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Dicta «307» dígito a dígito :', '{"type":"typing","correct_answers":["three O seven","three o seven"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Nenne «307» Ziffer für Ziffer:', '{"type":"typing","correct_answers":["three O seven","three o seven"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Dicta «604» dígito a dígito:', '{"type":"typing","correct_answers":["six O four","six o four"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Nenne «604» Ziffer für Ziffer:', '{"type":"typing","correct_answers":["six O four","six o four"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Dicta «502» dígito a dígito:', '{"type":"typing","correct_answers":["five O two","five o two"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Nenne «502» Ziffer für Ziffer:', '{"type":"typing","correct_answers":["five O two","five o two"],"case_sensitive":false}'::jsonb);

  -- Regla 5: Precios y Años — 4 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se dice $7.50 de forma rápida?', '{"type":"typing","correct_answers":["seven fifty"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie sagt man $7.50 schnell?', '{"type":"typing","correct_answers":["seven fifty"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se dice $12.99 de forma rápida?', '{"type":"typing","correct_answers":["twelve ninety-nine"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie sagt man $12.99 schnell?', '{"type":"typing","correct_answers":["twelve ninety-nine"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se lee el año 1985?', '{"type":"typing","correct_answers":["nineteen eighty-five"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie liest man das Jahr 1985?', '{"type":"typing","correct_answers":["nineteen eighty-five"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se lee el año 2022?', '{"type":"typing","correct_answers":["twenty twenty-two"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie liest man das Jahr 2022?', '{"type":"typing","correct_answers":["twenty twenty-two"],"case_sensitive":false}'::jsonb);

  -- Regla 6: Teens y Tens — 3 ejercicios (ortografía irregular)
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 13 en inglés?', '{"type":"typing","correct_answers":["thirteen"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 13 auf Englisch?', '{"type":"typing","correct_answers":["thirteen"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 15 en inglés?', '{"type":"typing","correct_answers":["fifteen"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 15 auf Englisch?', '{"type":"typing","correct_answers":["fifteen"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se escribe 40 en inglés?', '{"type":"typing","correct_answers":["forty"],"case_sensitive":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie schreibt man 40 auf Englisch?', '{"type":"typing","correct_answers":["forty"],"case_sensitive":false}'::jsonb);

  -- ==============================================================================
  -- TIPO 2: MULTIPLE CHOICE (Opción Múltiple)
  -- ==============================================================================

  -- Regla 1: Guiones (21-99) — 5 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la escritura correcta de 25?', '{"type":"multiple_choice","options":["Twenty five","Twenty-five","Twentyfive"],"answer":1}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Schreibweise von 25?', '{"type":"multiple_choice","options":["Twenty five","Twenty-five","Twentyfive"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la escritura correcta de 47?', '{"type":"multiple_choice","options":["Fourty-seven","Forty seven","Forty-seven"],"answer":2}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Schreibweise von 47?', '{"type":"multiple_choice","options":["Fourty-seven","Forty seven","Forty-seven"],"answer":2}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la escritura correcta de 63?', '{"type":"multiple_choice","options":["Sixty-three","Sixty three","Sixtythree"],"answer":0}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Schreibweise von 63?', '{"type":"multiple_choice","options":["Sixty-three","Sixty three","Sixtythree"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la escritura correcta de 82?', '{"type":"multiple_choice","options":["Eighty two","Eight-two","Eighty-two"],"answer":2}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Schreibweise von 82?', '{"type":"multiple_choice","options":["Eighty two","Eight-two","Eighty-two"],"answer":2}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la escritura correcta de 96?', '{"type":"multiple_choice","options":["Ninetysix","Ninety-six","Ninety six"],"answer":1}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Schreibweise von 96?', '{"type":"multiple_choice","options":["Ninetysix","Ninety-six","Ninety six"],"answer":1}'::jsonb);

  -- Regla 2: Cientos/Miles sin "s" — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la forma correcta de 400?', '{"type":"multiple_choice","options":["Four hundred","Four hundreds","Fours hundred"],"answer":0}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Form von 400?', '{"type":"multiple_choice","options":["Four hundred","Four hundreds","Fours hundred"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la forma correcta de 6,000?', '{"type":"multiple_choice","options":["Six thousands","Six thousand","Sixs thousand"],"answer":1}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Form von 6.000?', '{"type":"multiple_choice","options":["Six thousands","Six thousand","Sixs thousand"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la forma correcta de «900 personas»?', '{"type":"multiple_choice","options":["Nine hundreds people","Nine thousand people","Nine hundred people"],"answer":2}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Form von «900 Personen»?', '{"type":"multiple_choice","options":["Nine hundreds people","Nine thousand people","Nine hundred people"],"answer":2}'::jsonb);

  -- Regla 3: Omisión de "and" — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la forma correcta de 115?', '{"type":"multiple_choice","options":["One hundred and fifteen","One hundred fifteen","One hundreds fifteen"],"answer":1}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Form von 115?', '{"type":"multiple_choice","options":["One hundred and fifteen","One hundred fifteen","One hundreds fifteen"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la forma correcta de 430?', '{"type":"multiple_choice","options":["Four hundred and thirty","Four hundreds thirty","Four hundred thirty"],"answer":2}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Form von 430?', '{"type":"multiple_choice","options":["Four hundred and thirty","Four hundreds thirty","Four hundred thirty"],"answer":2}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la forma correcta de 210?', '{"type":"multiple_choice","options":["Two hundred ten","Two hundred and ten","Two hundreds ten"],"answer":0}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Form von 210?', '{"type":"multiple_choice","options":["Two hundred ten","Two hundred and ten","Two hundreds ten"],"answer":0}'::jsonb);

  -- Regla 4: Teléfonos — 2 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se pronuncia el «0» en un número de teléfono?', '{"type":"multiple_choice","options":["Como «zero» siempre","Como la letra «O» (/ou/)","No se pronuncia"],"answer":1}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie wird die «0» in einer Telefonnummer ausgesprochen?', '{"type":"multiple_choice","options":["Como «zero» siempre","Como la letra «O» (/ou/)","No se pronuncia"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se dicta «901» en un número de teléfono?', '{"type":"multiple_choice","options":["Nine hundred one","Nine zero one","Nine O one"],"answer":2}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie nennt man «901» in einer Telefonnummer?', '{"type":"multiple_choice","options":["Nine hundred one","Nine zero one","Nine O one"],"answer":2}'::jsonb);

  -- Regla 5: Precios y Años — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la forma más natural de decir $5.75?', '{"type":"multiple_choice","options":["Five seventy-five","Five dollars and seventy-five cents","Fifty seventy-five"],"answer":0}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die natürlichste Art, $5.75 zu sagen?', '{"type":"multiple_choice","options":["Five seventy-five","Five dollars and seventy-five cents","Fifty seventy-five"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cómo se lee el año 1988?', '{"type":"multiple_choice","options":["Eighty-eight nineteen","Nineteen eighty-eight","One thousand nine hundred eighty-eight"],"answer":1}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Wie liest man das Jahr 1988?', '{"type":"multiple_choice","options":["Eighty-eight nineteen","Nineteen eighty-eight","One thousand nine hundred eighty-eight"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la lectura correcta del año 2024?', '{"type":"multiple_choice","options":["Twenty twenty-four","Two zero two four","Twenty and twenty-four"],"answer":0}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Lesart des Jahres 2024?', '{"type":"multiple_choice","options":["Twenty twenty-four","Two zero two four","Twenty and twenty-four"],"answer":0}'::jsonb);

  -- Regla 6: Teens y Tens — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la escritura correcta de 15?', '{"type":"multiple_choice","options":["Fiveteen","Fifthteen","Fifteen"],"answer":2}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Schreibweise von 15?', '{"type":"multiple_choice","options":["Fiveteen","Fifthteen","Fifteen"],"answer":2}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿Cuál es la escritura correcta de 40?', '{"type":"multiple_choice","options":["Fourty","Forty","Fourtey"],"answer":1}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Was ist die korrekte Schreibweise von 40?', '{"type":"multiple_choice","options":["Fourty","Forty","Fourtey"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '¿En cuál de estas palabras el acento tónico va al FINAL?', '{"type":"multiple_choice","options":["Thirty","Fifty","Thirteen"],"answer":2}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Bei welchem dieser Wörter liegt die Betonung am ENDE?', '{"type":"multiple_choice","options":["Thirty","Fifty","Thirteen"],"answer":2}'::jsonb);

  -- ==============================================================================
  -- TIPO 3: SCRAMBLE (Ordenar fragmentos)
  -- ==============================================================================

  -- Regla 1: Guiones (21-99) — 5 ejercicios (chunks siempre desordenados: [guion, unidad, decena])
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 24:', '{"type":"scramble","chunks":["-","four","twenty"],"correct_order":[2,0,1]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 24 zu schreiben:', '{"type":"scramble","chunks":["-","four","twenty"],"correct_order":[2,0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 37:', '{"type":"scramble","chunks":["-","seven","thirty"],"correct_order":[2,0,1]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 37 zu schreiben:', '{"type":"scramble","chunks":["-","seven","thirty"],"correct_order":[2,0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 56:', '{"type":"scramble","chunks":["-","six","fifty"],"correct_order":[2,0,1]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 56 zu schreiben:', '{"type":"scramble","chunks":["-","six","fifty"],"correct_order":[2,0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 72:', '{"type":"scramble","chunks":["-","two","seventy"],"correct_order":[2,0,1]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 72 zu schreiben:', '{"type":"scramble","chunks":["-","two","seventy"],"correct_order":[2,0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 85:', '{"type":"scramble","chunks":["-","five","eighty"],"correct_order":[2,0,1]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 85 zu schreiben:', '{"type":"scramble","chunks":["-","five","eighty"],"correct_order":[2,0,1]}'::jsonb);

  -- Regla 2: Cientos/Miles sin "s" — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para «cuatrocientos»:', '{"type":"scramble","chunks":["hundred","four"],"correct_order":[1,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne für «vierhundert»:', '{"type":"scramble","chunks":["hundred","four"],"correct_order":[1,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para «seis mil»:', '{"type":"scramble","chunks":["thousand","six"],"correct_order":[1,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne für «sechstausend»:', '{"type":"scramble","chunks":["thousand","six"],"correct_order":[1,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para «novecientas personas»:', '{"type":"scramble","chunks":["people","nine","hundred"],"correct_order":[1,2,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne für «neunhundert Personen»:', '{"type":"scramble","chunks":["people","nine","hundred"],"correct_order":[1,2,0]}'::jsonb);

  -- Regla 3: Omisión de "and" — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 120:', '{"type":"scramble","chunks":["twenty","one","hundred"],"correct_order":[1,2,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 120 zu schreiben:', '{"type":"scramble","chunks":["twenty","one","hundred"],"correct_order":[1,2,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 350:', '{"type":"scramble","chunks":["three","fifty","hundred"],"correct_order":[0,2,1]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 350 zu schreiben:', '{"type":"scramble","chunks":["three","fifty","hundred"],"correct_order":[0,2,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para escribir 614:', '{"type":"scramble","chunks":["fourteen","six","hundred"],"correct_order":[1,2,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um 614 zu schreiben:', '{"type":"scramble","chunks":["fourteen","six","hundred"],"correct_order":[1,2,0]}'::jsonb);

  -- Regla 4: Teléfonos — 2 ejercicios (chunks desordenados)
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para dictar «408»:', '{"type":"scramble","chunks":["O","eight","four"],"correct_order":[2,0,1]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um «408» zu nennen:', '{"type":"scramble","chunks":["O","eight","four"],"correct_order":[2,0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para dictar «305»:', '{"type":"scramble","chunks":["five","three","O"],"correct_order":[1,2,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um «305» zu nennen:', '{"type":"scramble","chunks":["five","three","O"],"correct_order":[1,2,0]}'::jsonb);

  -- Regla 5: Precios y Años — 3 ejercicios (2 chunks intercambiados)
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para decir $9.50:', '{"type":"scramble","chunks":["fifty","nine"],"correct_order":[1,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um $9.50 zu sagen:', '{"type":"scramble","chunks":["fifty","nine"],"correct_order":[1,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para leer el año 1997:', '{"type":"scramble","chunks":["ninety-seven","nineteen"],"correct_order":[1,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um das Jahr 1997 zu lesen:', '{"type":"scramble","chunks":["ninety-seven","nineteen"],"correct_order":[1,0]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Ordena para leer el año 2015:', '{"type":"scramble","chunks":["fifteen","twenty"],"correct_order":[1,0]}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Ordne, um das Jahr 2015 zu lesen:', '{"type":"scramble","chunks":["fifteen","twenty"],"correct_order":[1,0]}'::jsonb);

  -- ==============================================================================
  -- TIPO 4: TRUE/FALSE (Verdadero o Falso)
  -- ==============================================================================

  -- Regla 1: Guiones (21-99) — 5 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«twenty-five» es la forma correcta de escribir 25.', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«twenty-five» ist die korrekte Schreibweise von 25.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«thirty three» (sin guion) es la escritura correcta de 33.', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«thirty three» (ohne Bindestrich) ist die korrekte Schreibweise von 33.', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'El guion (-) es obligatorio al escribir números compuestos del 21 al 99.', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Der Bindestrich (-) ist beim Schreiben zusammengesetzter Zahlen von 21 bis 99 Pflicht.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«sixty-seven» está correctamente escrito con guion.', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«sixty-seven» ist korrekt mit Bindestrich geschrieben.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«eighty four» (sin guion) está bien escrito.', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«eighty four» (ohne Bindestrich) ist korrekt geschrieben.', '{"type":"true_false","answer":false}'::jsonb);

  -- Regla 2: Cientos/Miles sin "s" — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Se dice «three hundreds» para 300.', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Man sagt «three hundreds» für 300.', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«two thousand» es la forma correcta de 2,000.', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«two thousand» ist die korrekte Form von 2.000.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«Hundred» lleva «s» cuando va con un número exacto (ej: two hundreds).', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«Hundred» bekommt ein «s», wenn es mit einer genauen Zahl steht (z.B.: two hundreds).', '{"type":"true_false","answer":false}'::jsonb);

  -- Regla 3: Omisión de "and" — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«one hundred fifty» (sin «and») es la forma correcta de 150.', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«one hundred fifty» (ohne «and») ist die korrekte Form von 150.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'En inglés estándar, el «and» después de «hundred» es obligatorio.', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Im Standardenglisch ist das «and» nach «hundred» Pflicht.', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'La forma correcta de 305 es «three hundred five».', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Die korrekte Form von 305 ist «three hundred five».', '{"type":"true_false","answer":true}'::jsonb);

  -- Regla 4: Teléfonos — 2 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'Los números de teléfono se dictan dígito a dígito, no como un número entero.', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Telefonnummern werden Ziffer für Ziffer genannt, nicht als ganze Zahl.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'El «0» en un teléfono siempre se dice «zero», nunca «O».', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Die «0» in einer Telefonnummer wird immer «zero» ausgesprochen, niemals «O».', '{"type":"true_false","answer":false}'::jsonb);

  -- Regla 5: Precios y Años — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'El precio $6.99 se pronuncia «six ninety-nine» en la vida cotidiana.', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Der Preis $6.99 wird im Alltag «six ninety-nine» ausgesprochen.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'El año 1998 se lee «nineteen ninety-eight».', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Das Jahr 1998 liest man «nineteen ninety-eight».', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'El año 2024 debe decirse obligatoriamente «two thousand twenty-four».', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Das Jahr 2024 muss zwingend «two thousand twenty-four» gesagt werden.', '{"type":"true_false","answer":false}'::jsonb);

  -- Regla 6: Teens y Tens — 3 ejercicios
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', '«Forty» se escribe con «u»: «fourty».', '{"type":"true_false","answer":false}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', '«Forty» wird mit «u» geschrieben: «fourty».', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'En inglés, 15 se escribe «fifteen» (no «fiveteen»).', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Auf Englisch schreibt man 15 «fifteen» (nicht «fiveteen»).', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'es', 'En «thirteen», el acento tónico va al FINAL (thir-TEEN).', '{"type":"true_false","answer":true}'::jsonb);
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_uuid, 'de', 'Bei «thirteen» liegt der Akzent am ENDE (thir-TEEN).', '{"type":"true_false","answer":true}'::jsonb);

END;
$seed$;
