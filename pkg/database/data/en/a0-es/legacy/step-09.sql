-- ============================================================
-- Seed: A0 English Path – STEP 14: Grammar – El Verbo To Be y Preguntas Básicas
-- Source language: Spanish
-- ============================================================

DO $$
DECLARE
  v_path_id  UUID;
  v_grammar14_id UUID;
  v_rule1_id UUID;
  v_rule2_id UUID;
  v_rule3_id UUID;
  v_rule4_id UUID;
  v_ex_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- ── STEP 14: Grammar – El Verbo To Be y Preguntas Básicas ───────────────────
-- ============================================================================

INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 14, 'en', 'grammar') 
RETURNING uuid INTO v_grammar14_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
  v_grammar14_id, 
  'es', 
  'El Verbo To Be y Preguntas Básicas', 
  '', 
  to_jsonb('# El Verbo To Be (Ser o Estar)

El verbo **To Be** es el verbo más importante y utilizado en el idioma inglés. Se traduce al español principalmente como **SER** o **ESTAR**, indistintamente. Además, funciona como un verbo auxiliar que ayuda a formar otros tiempos verbales.

## 1. Conjugación en Presente Simple

| Pronombre | Afirmativa | Negativa | Interrogativa |
| :--- | :--- | :--- | :--- |
| **I** (Yo) | am / ''m | am not / ''m not | Am I? |
| **You** (Tú/Ustedes) | are / ''re | are not / aren''t | Are you? |
| **He/She/It** (Él/Ella/Eso) | is / ''s | is not / isn''t | Is he/she/it? |
| **We/They** (Nosotros/Ellos) | are / ''re | are not / aren''t | Are we/they? |

## 2. Principales Usos

*   **Definiciones y Hechos:** Para expresar verdades o definir cosas. 
    *   *A diamond is a stone.* (Un diamante es una piedra).
*   **Descripciones y Estados:** Para describir características físicas o estados.
    *   *We are French.* (Nosotros somos franceses).
*   **Edad:** A diferencia del español, en inglés se usa el verbo To Be para la edad.
    *   *I am 25 years old.* (Tengo 25 años).
*   **Profesiones:**
    *   *He is a doctor.* (Él es doctor).

## 3. Preguntas Comunes con To Be

El verbo *To Be* se utiliza para estructurar muchas de las preguntas cotidianas:

*   **Edad:** *How old are you?*
*   **Estatura:** *How tall is she?*
*   **Peso:** *How heavy is he?*
*   **Medidas y Distancias:** 
    *   *How wide is the river?*
    *   *How long is the beach?*
    *   *How deep is the lake?*
    *   *How far is the stop?*
*   **Origen:** *Where are they from?*
*   **Información Personal:** 
    *   *What''s his name/surname?*
    *   *What''s your address?*
*   **Descripciones y Estados:** 
    *   *What’s his car like?*
    *   *What''s the matter with her?*'::text) 
);

-- Regla 1: Conjugación
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Conjugación del To Be', 'Recuerda: I am, You/We/They are, He/She/It is.');

-- Regla 2: Usos (Descripciones y Definiciones)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Usos: Definiciones y Descripciones', 'Para definiciones (A diamond is a stone) o descripciones (We are French), el verbo significa Ser o Estar.');

-- Regla 3: Preguntas Comunes
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Preguntas con To Be', 'Usa To Be para edad, peso, distancia, etc. (Ej: How old are you?, How deep is the lake?).');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 20 Ejercicios
-- ==============================================================================

-- (Regla 1)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ a student.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ my friend.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ happy.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ tall.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ a dog.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ ready.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ from Spain.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

-- (Regla 2)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A diamond ___ a stone.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ French.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The house ___ big.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The sky ___ blue.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Cats ___ animals.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Water ___ essential.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The cars ___ fast.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

-- (Regla 3)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How old ___ you?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ they from?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How tall ___ she?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ the matter with her?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How far ___ the stop?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How deep ___ the lake?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 20 Ejercicios
-- ==============================================================================

-- (Regla 1)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ a student.', '{"type":"multiple_choice","options":["am","is","are"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ my best friend.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a doctor.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ very intelligent.', '{"type":"multiple_choice","options":["are","is","am"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ sunny today.', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ not ready.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ happy.', '{"type":"multiple_choice","options":["is","are","am"],"answer":1}'::jsonb);

-- (Regla 2)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A diamond ___ a stone.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ French.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The dog ___ brown.', '{"type":"multiple_choice","options":["are","is","am"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The apples ___ red.', '{"type":"multiple_choice","options":["is","are","am"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The coffee ___ hot.', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My eyes ___ green.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);

-- (Regla 3)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How heavy ___ he?', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How wide ___ the river?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How long ___ the beach?', '{"type":"multiple_choice","options":["are","is","am"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ his name/surname?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ your address?', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ his car like?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ they from?', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);


-- ==============================================================================
-- TIPO 3: SCRAMBLE (Ordenar fragmentos) - 20 Ejercicios
-- ==============================================================================

-- (Regla 1)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Yo soy feliz', '{"type":"scramble","chunks":["am","I","happy"],"correct_order":[1, 0, 2]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Ella es doctora', '{"type":"scramble","chunks":["doctor","is","She","a"],"correct_order":[2, 1, 3, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Ellos son amigos', '{"type":"scramble","chunks":["friends","They","are"],"correct_order":[1, 2, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Nosotros no estamos listos', '{"type":"scramble","chunks":["are","ready","We","not"],"correct_order":[2, 0, 3, 1]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Él es muy alto', '{"type":"scramble","chunks":["tall","He","very","is"],"correct_order":[1, 3, 2, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Tú llegas tarde (Tú estás tarde)', '{"type":"scramble","chunks":["late","You","are"],"correct_order":[1, 2, 0]}'::jsonb);

-- (Regla 2)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Un diamante es una piedra', '{"type":"scramble","chunks":["stone","is","A diamond","a"],"correct_order":[2, 1, 3, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Nosotros somos franceses', '{"type":"scramble","chunks":["French","We","are"],"correct_order":[1, 2, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: La casa es grande', '{"type":"scramble","chunks":["is","The house","big"],"correct_order":[1, 0, 2]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Los gatos son animales', '{"type":"scramble","chunks":["are","animals","Cats"],"correct_order":[2, 0, 1]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: El cielo es azul', '{"type":"scramble","chunks":["blue","is","The sky"],"correct_order":[2, 1, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: El agua es esencial', '{"type":"scramble","chunks":["Water","essential","is"],"correct_order":[0, 2, 1]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Londres es una ciudad', '{"type":"scramble","chunks":["a city","is","London"],"correct_order":[2, 1, 0]}'::jsonb);

-- (Regla 3)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuántos años tienes?', '{"type":"scramble","chunks":["are","How old","you?"],"correct_order":[1, 0, 2]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿De dónde son ellos?', '{"type":"scramble","chunks":["from?","they","Where","are"],"correct_order":[2, 3, 1, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuánto mide ella?', '{"type":"scramble","chunks":["she?","is","How tall"],"correct_order":[2, 1, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuál es tu dirección?', '{"type":"scramble","chunks":["address?","What''s","your"],"correct_order":[1, 2, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Qué tan profundo es el lago?', '{"type":"scramble","chunks":["How deep","the lake?","is"],"correct_order":[0, 2, 1]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuál es su apellido?', '{"type":"scramble","chunks":["surname?","his","What''s"],"correct_order":[2, 1, 0]}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿A qué distancia está la parada?', '{"type":"scramble","chunks":["is","How far","the stop?"],"correct_order":[1, 0, 2]}'::jsonb);


-- ==============================================================================
-- TIPO 4: TRUE/FALSE (Verdadero o Falso) - 20 Ejercicios
-- ==============================================================================

-- (Regla 1)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para I es "I are".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para She es "She is".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para They es "They is".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para We es "We are".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para He es "He are".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para You es "You is".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para It es "It is".', '{"type":"true_false","answer":true}'::jsonb);

-- (Regla 2)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "nosotros somos franceses", usamos "We are French".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "un diamante es una piedra", decimos "A diamond are a stone".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El verbo "To Be" solo significa SER, pero nunca significa ESTAR.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El verbo "To Be" también puede utilizarse como verbo auxiliar.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para describir una casa grande, lo correcto es "The house am big".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Water is essential" es una frase gramaticalmente correcta para definir.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para definir plurales como gatos, usamos "Cats is animals".', '{"type":"true_false","answer":false}'::jsonb);

-- (Regla 3)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta "How old are you?" significa "¿Cuántos años tienes?".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar la altura de alguien decimos "How long is she?".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar de dónde son ellos, lo correcto es "Where is they from?".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta "How wide is the river?" sirve para saber el ancho del río.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '"What''s the matter with her?" significa "¿Qué le pasa a ella?".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar el peso de alguien usamos "How deep is he?".', '{"type":"true_false","answer":false}'::jsonb);


END;
$$;
