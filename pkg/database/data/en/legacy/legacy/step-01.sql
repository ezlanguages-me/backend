-- ============================================================
-- Seed: A0 English Path – STEP 1: Grammar – Números en Inglés
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id  UUID;
  v_grammar1_id UUID;
  v_rule1_id UUID;
  v_rule2_id UUID;
  v_rule3_id UUID;
  v_rule4_id UUID;
  v_rule5_id UUID;
  v_ex_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO grammar (path_id, step_order, source_language, type)
  VALUES (
    v_path_id,
    1,
    'en',
    'grammar'
  )
  RETURNING uuid INTO v_grammar1_id;

  INSERT INTO grammar_translation (grammar_id, language, title, description, content)
VALUES (
  v_grammar1_id,
  'es',
  'Números en Inglés',
  '',
  to_jsonb('## Grammar Lesson: Los Números (0 al 100+)

¡Domina los números en inglés americano para manejar dinero, dar tu edad o compartir tu teléfono! Aprenderemos los patrones clave para que puedas construirlos lógicamente sin tener que memorizarlos todos de golpe.

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
| Veinte | Twen**ty** | /**tué**-ni/ (Los americanos suelen enmudecer la ''t'') |
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
* **Omitir el "and":** En el inglés americano formal, **no** se usa "and" para conectar las centenas con las decenas.
    * ✅ One hundred fifty (Ciento cincuenta)
    * ❌ One hundred **and** fifty (Ciento cincuenta - *Más común en inglés británico*)

### Excepciones Importantes

> **El truco de la "T" americana (Flap T) 🇺🇸:**
> En inglés americano, la terminación **-ty** (30, 40, 50, etc.) suena más como una "r" suave en español (como en la palabra "pe**r**o") o una "d" muy rápida. 
> *Ejemplo:* **Forty** suena como /**fór**-di/.
> 
> **¡Cuidado con la sílaba tónica!**
> Es la única forma de distinguir si dices 13 o 30:
> 13: Thir-**TEEN** (Sube al final) 🆚 30: **THIR**-ty (Sube al inicio).

### Real-life Context (Usos Prácticos)

* **Números de teléfono:** Se dictan dígito por dígito. El cero casi siempre se pronuncia como la letra **O** (/ou/). 
    * *555-0198* = "Five five five, **O** one nine eight."
* **Precios:** Para hacerlo más rápido, los americanos dividen los precios con decimales en dos partes, ignorando la palabra "dollars" y "cents". 
    * *$4.50* = "Four fifty."
    * *$12.99* = "Twelve ninety-nine."
* **Años:** Se leen en bloques de dos dígitos. 
    * *1998* = "Nineteen ninety-eight."
    * *2024* = "Twenty twenty-four."
'::text)
);

  -- Regla 1: Guion en números compuestos
  INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id;
  INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
  VALUES (v_rule1_id, 'es', 'Regla del Guion (21-99)', 'Recuerda usar un guion (-) para números compuestos entre 21 y 99 (ej: thirty-five).');

  -- Regla 2: Plural en cientos y miles
  INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id;
  INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
  VALUES (v_rule2_id, 'es', 'Cientos y Miles Invariables', 'Las palabras "hundred" y "thousand" no llevan "s" cuando van acompañadas de una cantidad exacta (ej: two hundred).');

  -- Regla 3: Uso del "and" en cientos
  INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id;
  INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
  VALUES (v_rule3_id, 'es', 'Omisión de "and" (Inglés Americano)', 'En inglés americano formal, no se usa "and" para conectar las centenas con las decenas (ej: one hundred fifty).');

  INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id;
  INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
  VALUES (v_rule4_id, 'es', 'Contexto: Números de Teléfono', 'Recuerda: Los teléfonos se leen dígito por dígito. El cero suele pronunciarse como la letra "O" (/ou/).');

  INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id;
  INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
  VALUES (v_rule5_id, 'es', 'Contexto: Precios y Años', 'Recuerda: Los precios y años se leen dividiéndolos en bloques de dos (ej: $4.50 = four fifty / 1998 = nineteen ninety-eight).');
  -- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 20 Ejercicios
-- ==============================================================================

-- Regla 1: Guiones (21-99)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 22', '{"type":"typing","correct_answers":["twenty-two"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 35', '{"type":"typing","correct_answers":["thirty-five"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 58', '{"type":"typing","correct_answers":["fifty-eight"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 61', '{"type":"typing","correct_answers":["sixty-one"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 74', '{"type":"typing","correct_answers":["seventy-four"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 89', '{"type":"typing","correct_answers":["eighty-nine"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 93', '{"type":"typing","correct_answers":["ninety-three"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 27', '{"type":"typing","correct_answers":["twenty-seven"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 39', '{"type":"typing","correct_answers":["thirty-nine"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 52', '{"type":"typing","correct_answers":["fifty-two"],"case_sensitive":false}'::jsonb);

-- Regla 2: Cientos/Miles sin "s"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras "doscientos"', '{"type":"typing","correct_answers":["two hundred"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras "quinientos"', '{"type":"typing","correct_answers":["five hundred"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras "ochocientos"', '{"type":"typing","correct_answers":["eight hundred"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras "tres mil"', '{"type":"typing","correct_answers":["three thousand"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras "novecientos"', '{"type":"typing","correct_answers":["nine hundred"],"case_sensitive":false}'::jsonb);

-- Regla 3: Omisión de "and"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 105', '{"type":"typing","correct_answers":["one hundred five"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 150', '{"type":"typing","correct_answers":["one hundred fifty"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 120', '{"type":"typing","correct_answers":["one hundred twenty"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 230', '{"type":"typing","correct_answers":["two hundred thirty"],"case_sensitive":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe en palabras el número 810', '{"type":"typing","correct_answers":["eight hundred ten"],"case_sensitive":false}'::jsonb);

-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 20 Ejercicios
-- ==============================================================================

-- Regla 1: Guiones (21-99)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la forma correcta de escribir 25?', '{"type":"multiple_choice","options":["Twenty five","Twenty-five","Twentiefive"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe 33?', '{"type":"multiple_choice","options":["Thirty-three","Thirty three","Thirti-three"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la forma correcta de escribir 51?', '{"type":"multiple_choice","options":["Fifty-one","Fifty one","Fivety-one"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe 79?', '{"type":"multiple_choice","options":["Seventy nine","Seventy-nine","Seventynine"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la escritura correcta para 99:', '{"type":"multiple_choice","options":["Ninety-nine","Ninty-nine","Ninety nine"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Selecciona 28 correctamente:', '{"type":"multiple_choice","options":["Twenty eight","Twenty-eight","Twentyeight"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe 36?', '{"type":"multiple_choice","options":["Thirty-six","Thirty six","Thirty-sixt"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál está escrito correctamente (54)?', '{"type":"multiple_choice","options":["Fifty four","Fifti-four","Fifty-four"],"answer":2}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo escribes 82?', '{"type":"multiple_choice","options":["Eighty two","Eighty-two","Eight-two"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Selecciona el correcto para 91:', '{"type":"multiple_choice","options":["Ninety-one","Ninty-one","Ninety one"],"answer":0}'::jsonb);

-- Regla 2: Cientos/Miles sin "s"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo dices "trescientos"?', '{"type":"multiple_choice","options":["Three hundreds","Three hundred","Threes hundred"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la forma correcta de "quinientos"?', '{"type":"multiple_choice","options":["Five hundred","Five hundreds","Fives hundred"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe 800?', '{"type":"multiple_choice","options":["Eight hundreds","Eight hundred","Eights hundred"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta (seiscientos):', '{"type":"multiple_choice","options":["Six hundred","Six hundreds","Sixs hundred"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe 7000?', '{"type":"multiple_choice","options":["Seven thousands","Seven thousand","Sevens thousand"],"answer":1}'::jsonb);

-- Regla 3: Omisión de "and"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se dice 150 en inglés americano?', '{"type":"multiple_choice","options":["One hundred and fifty","One hundred fifty","One hundreds fifty"],"answer":1}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Selecciona la forma americana correcta para 102:', '{"type":"multiple_choice","options":["One hundred two","One hundred and two","One hundreds two"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe 220?', '{"type":"multiple_choice","options":["Two hundred and twenty","Two hundreds twenty","Two hundred twenty"],"answer":2}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la opción correcta para 305:', '{"type":"multiple_choice","options":["Three hundred five","Three hundred and five","Three hundreds five"],"answer":0}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo escribes 110?', '{"type":"multiple_choice","options":["One hundred and ten","One hundred ten","A hundred and tens"],"answer":1}'::jsonb);

-- ==============================================================================
-- TIPO 3: SCRAMBLE (Ordenar fragmentos) - 20 Ejercicios
-- ==============================================================================

-- Regla 1: Guiones (21-99)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 24:', '{"type":"scramble","chunks":["four","twenty","-"],"correct_order":[1,2,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 37:', '{"type":"scramble","chunks":["-","seven","thirty"],"correct_order":[2,0,1]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 56:', '{"type":"scramble","chunks":["six","-","fifty"],"correct_order":[2,1,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 68:', '{"type":"scramble","chunks":["-","sixty","eight"],"correct_order":[1,0,2]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 72:', '{"type":"scramble","chunks":["two","seventy","-"],"correct_order":[1,2,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 85:', '{"type":"scramble","chunks":["-","five","eighty"],"correct_order":[2,0,1]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 96:', '{"type":"scramble","chunks":["six","ninety","-"],"correct_order":[1,2,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 23:', '{"type":"scramble","chunks":["three","-","twenty"],"correct_order":[2,1,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 31:', '{"type":"scramble","chunks":["-","one","thirty"],"correct_order":[2,0,1]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los fragmentos para formar el número 59:', '{"type":"scramble","chunks":["nine","fifty","-"],"correct_order":[1,2,0]}'::jsonb);

-- Regla 2: Cientos/Miles sin "s"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar "doscientos dólares":', '{"type":"scramble","chunks":["dollars","hundred","two"],"correct_order":[2,1,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar "quinientas personas":', '{"type":"scramble","chunks":["people","five","hundred"],"correct_order":[1,2,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar "ochocientos":', '{"type":"scramble","chunks":["hundred","eight"],"correct_order":[1,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar "trescientos":', '{"type":"scramble","chunks":["hundred","three"],"correct_order":[1,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar "nueve mil":', '{"type":"scramble","chunks":["thousand","nine"],"correct_order":[1,0]}'::jsonb);

-- Regla 3: Omisión de "and"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar 105 (Inglés Americano):', '{"type":"scramble","chunks":["five","one","hundred"],"correct_order":[1,2,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar 150 (Inglés Americano):', '{"type":"scramble","chunks":["fifty","hundred","one"],"correct_order":[2,1,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar 120 (Inglés Americano):', '{"type":"scramble","chunks":["hundred","twenty","one"],"correct_order":[2,0,1]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar 230 (Inglés Americano):', '{"type":"scramble","chunks":["thirty","two","hundred"],"correct_order":[1,2,0]}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; 
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para formar 810 (Inglés Americano):', '{"type":"scramble","chunks":["ten","hundred","eight"],"correct_order":[2,1,0]}'::jsonb);

-- ==============================================================================
-- TIPO 4: TRUE/FALSE (Verdadero o Falso) - 20 Ejercicios
-- ==============================================================================

-- Regla 1: Guiones (21-99)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 25 es twenty-five.', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 33 es thirty three (sin guion).', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 52 es fifty-two.', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 78 es seventy eight.', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 99 es ninety-nine.', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 21 es twenty one.', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 38 es thirty-eight.', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 57 es fifty seven.', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 84 es eighty-four.', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 92 es ninety two.', '{"type":"true_false","answer":false}'::jsonb);

-- Regla 2: Cientos/Miles sin "s"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "two hundreds" para referirse a 200.', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 500 dólares es "five hundred dollars".', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "three thousands" para referirse a 3000.', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La palabra "hundred" nunca lleva "s" si va con un número específico.', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta de 800 personas es "eight hundreds people".', '{"type":"true_false","answer":false}'::jsonb);

-- Regla 3: Omisión de "and"
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En inglés americano formal, se dice "one hundred and fifty".', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma preferida en EE. UU. para 105 es "one hundred five".', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Es correcto decir "two hundred and twenty" en inglés americano.', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta americana para 305 es "three hundred five".', '{"type":"true_false","answer":true}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id;
INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En inglés americano se usa siempre "and" después de "hundred".', '{"type":"true_false","answer":false}'::jsonb);

INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe cómo dictarías estos dígitos usando la letra "O" para el cero: 404', '{"type":"typing","correct_answers":["four o four","four O four"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe cómo dictarías el inicio de este teléfono: 505', '{"type":"typing","correct_answers":["five o five","five O five"],"case_sensitive":false}'::jsonb);

  -- Regla 6 (Precios y Años)
  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe cómo se dice este precio de forma rápida: $8.50', '{"type":"typing","correct_answers":["eight fifty"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe cómo se dice este precio de forma rápida: $12.99', '{"type":"typing","correct_answers":["twelve ninety-nine"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe cómo se lee el año 1985', '{"type":"typing","correct_answers":["nineteen eighty-five"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe cómo se lee el año 2023', '{"type":"typing","correct_answers":["twenty twenty-three"],"case_sensitive":false}'::jsonb);

  -- ==============================================================================
  -- TIPO 2: MULTIPLE CHOICE (Opción Múltiple)
  -- ==============================================================================

  -- Regla 5 (Teléfonos)
  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Al dictar tu número de teléfono, ¿cómo se pronuncia el "0" comúnmente?', '{"type":"multiple_choice","options":["Como la palabra /zero/ siempre","Como la letra O (/ou/)","No se pronuncia, se hace una pausa"],"answer":1}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo leería un americano el número "901" en un teléfono?', '{"type":"multiple_choice","options":["Nine hundred one","Nine zero one","Nine O one"],"answer":2}'::jsonb);

  -- Regla 6 (Precios y Años)
  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la forma más natural y rápida de decir $5.75?', '{"type":"multiple_choice","options":["Five seventy-five","Five dollars and seventy-five cents","Fifty seventy-five"],"answer":0}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo dirías que algo cuesta $15.99?', '{"type":"multiple_choice","options":["Fifteen nine nine","Fifty ninety-nine","Fifteen ninety-nine"],"answer":2}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se lee comúnmente el año 1990?', '{"type":"multiple_choice","options":["One thousand nine hundred ninety","Nineteen ninety","Ninety nineteen"],"answer":1}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Selecciona la lectura correcta para el año 2024:', '{"type":"multiple_choice","options":["Twenty twenty-four","Two zero two four","Twenty and twenty-four"],"answer":0}'::jsonb);

  -- ==============================================================================
  -- TIPO 3: SCRAMBLE (Ordenar fragmentos)
  -- ==============================================================================

  -- Regla 5 (Teléfonos)
  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para dictar los dígitos "707":', '{"type":"scramble","chunks":["seven","O","seven"],"correct_order":[0,1,2]}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para dictar los dígitos "206":', '{"type":"scramble","chunks":["two","O","six"],"correct_order":[0,1,2]}'::jsonb);

  -- Regla 6 (Precios y Años)
  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para decir el precio $9.50 de forma rápida:', '{"type":"scramble","chunks":["nine","fifty"],"correct_order":[0,1]}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena para decir el precio $22.99:', '{"type":"scramble","chunks":["twenty-two","ninety-nine"],"correct_order":[0,1]}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los bloques para leer el año 1992:', '{"type":"scramble","chunks":["nineteen","ninety-two"],"correct_order":[0,1]}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; 
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena los bloques para leer el año 2020:', '{"type":"scramble","chunks":["twenty","twenty"],"correct_order":[0,1]}'::jsonb);

  -- ==============================================================================
  -- TIPO 4: TRUE/FALSE (Verdadero o Falso)
  -- ==============================================================================

  -- Regla 5 (Teléfonos)
  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En un número de teléfono, es muy común pronunciar el cero como la letra "O" (/ou/).', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id;
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los números de teléfono en inglés se agrupan en decenas, como "fifty-five" para 55.', '{"type":"true_false","answer":false}'::jsonb);

  -- Regla 6 (Precios y Años)
  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir $7.50 en la vida diaria, los americanos prefieren decir "seven fifty" en lugar de "seven dollars and fifty cents".', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El año 1998 se lee como un solo número gigante: "One thousand nine hundred ninety-eight".', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El precio $6.99 se pronuncia "six ninety-nine".', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id;
  INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El año 2025 debe leerse obligatoriamente como "twenty and twenty-five" usando "and".', '{"type":"true_false","answer":false}'::jsonb);

END;
$$;
