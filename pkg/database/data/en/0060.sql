-- ============================================================
-- Seed: English Path – Step 0060 – Grammar
-- Title:       Verbo To Be
-- Description: Conjugación y uso del verbo "to be" en presente.
-- Source language: en  |  Translation: es
-- ============================================================

DO $seed$
DECLARE
  v_path_uuid UUID;
  v_grammar_uuid UUID;
  v_rule1_uuid UUID;
  v_rule2_uuid UUID;
  v_rule3_uuid UUID;
  v_rule4_uuid UUID;
  v_rule5_uuid UUID;
  v_rule6_uuid UUID;
  v_ex_uuid UUID;
BEGIN
  -- Path (idempotente)
  SELECT uuid INTO v_path_uuid
  FROM path
  WHERE source_language = 'en'
  LIMIT 1;

  IF v_path_uuid IS NULL THEN
    INSERT INTO path (source_language)
    VALUES ('en')
    RETURNING uuid INTO v_path_uuid;
  END IF;

  -- Evitar duplicado del step 60
  DELETE FROM grammar
  WHERE path_uuid = v_path_uuid
    AND step_order = 60
    AND source_language = 'en';

  INSERT INTO grammar (path_uuid, source_language, step_order, type)
  VALUES (v_path_uuid, 'en', 60, 'grammar')
  RETURNING uuid INTO v_grammar_uuid;

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
  VALUES (
    v_grammar_uuid,
    'es',
    'Verbo To Be',
    'Conjugación y uso del verbo "to be" en presente.',
    to_jsonb($$
El verbo **To Be** es el verbo más importante y utilizado en el idioma inglés. Se traduce al español principalmente como **SER** o **ESTAR**, indistintamente. Además, funciona como verbo auxiliar para formar tiempos verbales compuestos.

## 1. Forma Afirmativa y Contracciones

| Pronombre | Forma completa | Contracción | Ejemplo |
| :--- | :--- | :--- | :--- |
| **I** (Yo) | I am | I'm | I'm a student. |
| **You** (Tú / Usted) | You are | You're | You're my friend. |
| **He** (Él) | He is | He's | He's happy. |
| **She** (Ella) | She is | She's | She's tall. |
| **It** (Eso / Ello) | It is | It's | It's a dog. |
| **We** (Nosotros) | We are | We're | We're ready. |
| **They** (Ellos / Ellas) | They are | They're | They're from Spain. |

> Las contracciones son la forma más natural y habitual en la conversación cotidiana.

## 2. Forma Negativa

Para negar, se añade **not** después del verbo. Existen dos contracciones posibles para la mayoría de pronombres:

| Pronombre | Forma completa | Contracción 1 | Contracción 2 |
| :--- | :--- | :--- | :--- |
| **I** | I am not | I'm not | — |
| **You** | You are not | You aren't | You're not |
| **He** | He is not | He isn't | He's not |
| **She** | She is not | She isn't | She's not |
| **It** | It is not | It isn't | It's not |
| **We** | We are not | We aren't | We're not |
| **They** | They are not | They aren't | They're not |

> ⚠️ **Excepción:** "I am not" solo tiene una contracción posible: **I'm not**. No existe "I amn't".

## 3. Forma Interrogativa y Respuestas Cortas

Para preguntar, se **invierte** el orden: el verbo va antes del sujeto.

| Estructura | Ejemplo | Respuesta corta afirmativa | Respuesta corta negativa |
| :--- | :--- | :--- | :--- |
| Am I ...? | Am I late? | Yes, you are. | No, you aren't. |
| Are you ...? | Are you okay? | Yes, I am. | No, I'm not. |
| Is he ...? | Is he a doctor? | Yes, he is. | No, he isn't. |
| Is she ...? | Is she your sister? | Yes, she is. | No, she isn't. |
| Is it ...? | Is it your bag? | Yes, it is. | No, it isn't. |
| Are we ...? | Are we late? | Yes, we are. | No, we aren't. |
| Are they ...? | Are they at school? | Yes, they are. | No, they aren't. |

> En respuestas cortas **nunca** se usa contracción en la afirmativa: ✅ *Yes, he is.* ❌ *Yes, he's.*

## 4. Principales Usos

* **Definiciones y Hechos:** Para expresar verdades o definir cosas.
  * *A diamond is a stone.* (Un diamante es una piedra).
* **Descripciones físicas:** Para describir características o estados.
  * *She is tall and friendly.*
* **Nacionalidad y origen:**
  * *We are French.* / *They are from Spain.*
* **Profesiones:**
  * *He is a doctor.* / *I am a teacher.*
* **Edad** — A diferencia del español, en inglés se usa To Be para la edad:
  * *I am 25 years old.* (Tengo 25 años).

## 5. Preguntas Comunes con To Be

* **Edad:** *How old are you?*
* **Estatura:** *How tall is she?*
* **Peso:** *How heavy is he?*
* **Medidas y Distancias:** *How wide / long / deep / far is ...?*
* **Origen:** *Where are they from?*
* **Información Personal:** *What's his name? / What's your address?*
* **Estado:** *What's the matter with her? / What's his car like?*

$$::text)
  );

  -- Regla 1: Conjugación básica afirmativa
  INSERT INTO grammar_rule (source_language, grammar_uuid)
  VALUES ('en', v_grammar_uuid)
  RETURNING uuid INTO v_rule1_uuid;

  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (
    v_rule1_uuid,
    'es',
    'Conjugación básica afirmativa',
    'Usa am con I, is con he/she/it y are con you/we/they.'
  );

  -- Regla 2: Contracciones afirmativas
  INSERT INTO grammar_rule (source_language, grammar_uuid)
  VALUES ('en', v_grammar_uuid)
  RETURNING uuid INTO v_rule2_uuid;

  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (
    v_rule2_uuid,
    'es',
    'Contracciones afirmativas',
    'Contracciones correctas: I''m, you''re, he''s, she''s, it''s, we''re, they''re.'
  );

  -- Regla 3: Forma negativa
  INSERT INTO grammar_rule (source_language, grammar_uuid)
  VALUES ('en', v_grammar_uuid)
  RETURNING uuid INTO v_rule3_uuid;

  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (
    v_rule3_uuid,
    'es',
    'Forma negativa',
    'Negativa: am not, is not/isn''t, are not/aren''t. No existe "I amn''t".'
  );

  -- Regla 4: Forma interrogativa y respuestas cortas
  INSERT INTO grammar_rule (source_language, grammar_uuid)
  VALUES ('en', v_grammar_uuid)
  RETURNING uuid INTO v_rule4_uuid;

  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (
    v_rule4_uuid,
    'es',
    'Interrogativa y respuestas cortas',
    'En pregunta se invierte orden (Are you...? Is he...?). En afirmativa corta no se contrae: "Yes, he is."'
  );

  -- Regla 5: Usos principales (ser/estar, profesión, edad, origen)
  INSERT INTO grammar_rule (source_language, grammar_uuid)
  VALUES ('en', v_grammar_uuid)
  RETURNING uuid INTO v_rule5_uuid;

  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (
    v_rule5_uuid,
    'es',
    'Usos principales',
    'Usa to be para definiciones, descripción, nacionalidad/origen, profesión y edad (I am 25 years old).'
  );

  -- Regla 6: Preguntas comunes con to be
  INSERT INTO grammar_rule (source_language, grammar_uuid)
  VALUES ('en', v_grammar_uuid)
  RETURNING uuid INTO v_rule6_uuid;

  INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
  VALUES (
    v_rule6_uuid,
    'es',
    'Preguntas comunes',
    'Estructuras clave: How old are...?, How tall is...?, Where are ... from?, What''s ...?'
  );


  -- =============================================
  -- EJERCICIOS (79)
  -- =============================================

  -- ---------------------------------------------------------------------------
  -- Regla 1: Conjugación básica afirmativa (15)
  -- ---------------------------------------------------------------------------
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: I ___ a student.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: You ___ my friend.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: He ___ happy.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: She ___ tall.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: It ___ a dog.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: We ___ ready.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: They ___ from Spain.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige opción correcta: I ___ 25 years old.', '{"type":"multiple_choice","options":["am","is","are"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige opción correcta: He and she ___ at school.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige opción correcta: The books ___ on the table.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "We is ready" es correcto.', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "It are cold" es correcto.', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena para formar oración correcta.', '{"type":"scramble","chunks":["I","am","late"],"correct_order":[0,1,2]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena para formar oración correcta.', '{"type":"scramble","chunks":["They","are","doctors"],"correct_order":[0,1,2]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule1_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: My name ___ Ana.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  -- ---------------------------------------------------------------------------
  -- Regla 2: Contracciones afirmativas (12)
  -- ---------------------------------------------------------------------------
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe contracción de "I am".', '{"type":"typing","correct_answers":["I''m"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe contracción de "You are".', '{"type":"typing","correct_answers":["you''re"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe contracción de "He is".', '{"type":"typing","correct_answers":["he''s"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe contracción de "She is".', '{"type":"typing","correct_answers":["she''s"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe contracción de "It is".', '{"type":"typing","correct_answers":["it''s"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe contracción de "We are".', '{"type":"typing","correct_answers":["we''re"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Escribe contracción de "They are".', '{"type":"typing","correct_answers":["they''re"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige forma completa de "we''re".', '{"type":"multiple_choice","options":["we are","we is","we am"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige forma completa de "it''s".', '{"type":"multiple_choice","options":["it is","it are","it has"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: Las contracciones son habituales al hablar.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena para formar contracción correcta.', '{"type":"scramble","chunks":["she","''s"],"correct_order":[0,1]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule2_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige versión más natural en conversación.', '{"type":"multiple_choice","options":["I am tired.","I''m tired.","I tired."],"answer":1}'::jsonb);

  -- ---------------------------------------------------------------------------
  -- Regla 3: Forma negativa (12)
  -- ---------------------------------------------------------------------------
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Pasa a negativa: "He is late".', '{"type":"typing","correct_answers":["he is not late","he isn''t late","he''s not late"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Pasa a negativa: "We are ready".', '{"type":"typing","correct_answers":["we are not ready","we aren''t ready","we''re not ready"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Pasa a negativa: "It is my bag".', '{"type":"typing","correct_answers":["it is not my bag","it isn''t my bag","it''s not my bag"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige opción correcta: I ___ not tired.', '{"type":"multiple_choice","options":["am","is","are"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige negativa correcta de "You are tired".', '{"type":"multiple_choice","options":["You aren''t tired.","You isn''t tired.","You am not tired."],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige negativa correcta de "She is tall".', '{"type":"multiple_choice","options":["She isn''t tall.","She aren''t tall.","She am not tall."],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "I amn''t" es forma estándar general.', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "He isn''t" y "He is not" son válidas.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena para formar negativa correcta.', '{"type":"scramble","chunks":["They","are","not","here"],"correct_order":[0,1,2,3]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena para formar negativa correcta.', '{"type":"scramble","chunks":["I","am","not","a","doctor"],"correct_order":[0,1,2,3,4]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: They ___ not at school.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule3_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: He ___ not my brother.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  -- ---------------------------------------------------------------------------
  -- Regla 4: Interrogativa y respuestas cortas (12)
  -- ---------------------------------------------------------------------------
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena para formar pregunta correcta.', '{"type":"scramble","chunks":["Are","you","okay","?"],"correct_order":[0,1,2,3]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena para formar pregunta correcta.', '{"type":"scramble","chunks":["Is","he","a","doctor","?"],"correct_order":[0,1,2,3,4]}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Transforma a pregunta: "You are late."', '{"type":"typing","correct_answers":["are you late?"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Transforma a pregunta: "She is your sister."', '{"type":"typing","correct_answers":["is she your sister?"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige pregunta correcta para "They are at school".', '{"type":"multiple_choice","options":["Are they at school?","They are at school?","Is they at school?"],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Responde corto (afirmativo): Is it your bag?', '{"type":"typing","correct_answers":["yes, it is","yes it is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Responde corto (negativo): Are they at school?', '{"type":"typing","correct_answers":["no, they aren''t","no they aren''t","no, they are not","no they are not"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Responde corto (negativo): Are you okay?', '{"type":"typing","correct_answers":["no, i''m not","no i''m not","no, i am not","no i am not"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige respuesta afirmativa corta correcta: Are we late?', '{"type":"multiple_choice","options":["Yes, we are.","Yes, we''re.","Yes, we be."],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: En afirmativa corta se puede decir "Yes, he''s."', '{"type":"true_false","answer":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: ___ I late?', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule4_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: ___ she your sister?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  -- ---------------------------------------------------------------------------
  -- Regla 5: Usos principales (10)
  -- ---------------------------------------------------------------------------
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: A diamond ___ a stone.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: She ___ tall and friendly.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: We ___ French.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: They ___ from Spain.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: He ___ a doctor.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: I ___ a teacher.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: I ___ 25 years old.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige opción correcta sobre edad en inglés.', '{"type":"multiple_choice","options":["I am 25 years old.","I have 25 years.","I is 25 years old."],"answer":0}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: To be se usa para profesión y nacionalidad.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule5_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena oración correcta.', '{"type":"scramble","chunks":["She","is","tall","and","friendly"],"correct_order":[0,1,2,3,4]}'::jsonb);

  -- ---------------------------------------------------------------------------
  -- Regla 6: Preguntas comunes (10)
  -- ---------------------------------------------------------------------------
  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: How old ___ you?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: How tall ___ she?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: How heavy ___ he?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: Where ___ they from?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: What ___ his name?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: What ___ your address?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Completa: How far ___ the station?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Elige opción correcta: How long ___ the class?', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Verdadero o Falso: "Where are they from?" es estructura correcta.', '{"type":"true_false","answer":true}'::jsonb);

  INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar_uuid, v_rule6_uuid) RETURNING uuid INTO v_ex_uuid;
  INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
  VALUES (v_ex_uuid, 'es', 'Ordena pregunta correcta.', '{"type":"scramble","chunks":["What","is","his","name","?"],"correct_order":[0,1,2,3,4]}'::jsonb);
END;
$seed$;
