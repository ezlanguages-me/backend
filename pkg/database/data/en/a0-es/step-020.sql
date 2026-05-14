-- ============================================================
-- Seed: A0 English Path – STEP 20 – Grammar – El verbo To Be (SER o ESTAR)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_id  UUID;
  v_grammar14_id UUID;
  v_rule1_id UUID;
  v_rule2_id UUID;
  v_rule3_id UUID;
  v_rule4_id UUID;
  v_rule5_id UUID;
  v_ex_id UUID;
BEGIN

  SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- ── STEP 14: Grammar – El Verbo To Be y Preguntas Básicas ───────────────────
-- ============================================================================

INSERT INTO grammar (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 20, 'en', 'grammar') 
RETURNING uuid INTO v_grammar14_id;

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
  v_grammar14_id, 
  'es', 
  'El Verbo To Be', 
  '', 
  to_jsonb('# El Verbo To Be (Ser o Estar)

El verbo **To Be** es el verbo más importante y utilizado en el idioma inglés. Se traduce al español principalmente como **SER** o **ESTAR**, indistintamente. Además, funciona como verbo auxiliar para formar tiempos verbales compuestos.

## 1. Forma Afirmativa y Contracciones

| Pronombre | Forma completa | Contracción | Ejemplo |
| :--- | :--- | :--- | :--- |
| **I** (Yo) | I am | I''m | I''m a student. |
| **You** (Tú / Usted) | You are | You''re | You''re my friend. |
| **He** (Él) | He is | He''s | He''s happy. |
| **She** (Ella) | She is | She''s | She''s tall. |
| **It** (Eso / Ello) | It is | It''s | It''s a dog. |
| **We** (Nosotros) | We are | We''re | We''re ready. |
| **They** (Ellos / Ellas) | They are | They''re | They''re from Spain. |

> Las contracciones son la forma más natural y habitual en la conversación cotidiana.

## 2. Forma Negativa

Para negar, se añade **not** después del verbo. Existen dos contracciones posibles para la mayoría de pronombres:

| Pronombre | Forma completa | Contracción 1 | Contracción 2 |
| :--- | :--- | :--- | :--- |
| **I** | I am not | I''m not | — |
| **You** | You are not | You aren''t | You''re not |
| **He** | He is not | He isn''t | He''s not |
| **She** | She is not | She isn''t | She''s not |
| **It** | It is not | It isn''t | It''s not |
| **We** | We are not | We aren''t | We''re not |
| **They** | They are not | They aren''t | They''re not |

> ⚠️ **Excepción:** "I am not" solo tiene una contracción posible: **I''m not**. No existe "I amn''t".

## 3. Forma Interrogativa y Respuestas Cortas

Para preguntar, se **invierte** el orden: el verbo va antes del sujeto.

| Estructura | Ejemplo | Respuesta corta afirmativa | Respuesta corta negativa |
| :--- | :--- | :--- | :--- |
| Am I ...? | Am I late? | Yes, you are. | No, you aren''t. |
| Are you ...? | Are you okay? | Yes, I am. | No, I''m not. |
| Is he ...? | Is he a doctor? | Yes, he is. | No, he isn''t. |
| Is she ...? | Is she your sister? | Yes, she is. | No, she isn''t. |
| Is it ...? | Is it your bag? | Yes, it is. | No, it isn''t. |
| Are we ...? | Are we late? | Yes, we are. | No, we aren''t. |
| Are they ...? | Are they at school? | Yes, they are. | No, they aren''t. |

> En las respuestas cortas **nunca** se usa contracción en la afirmativa: ✅ *Yes, he is.* ❌ *Yes, he''s.*

## 4. Principales Usos

*   **Definiciones y Hechos:** Para expresar verdades o definir cosas.
    *   *A diamond is a stone.* (Un diamante es una piedra).
*   **Descripciones físicas:** Para describir características o estados.
    *   *She is tall and friendly.*
*   **Nacionalidad y origen:**
    *   *We are French.* / *They are from Spain.*
*   **Profesiones:**
    *   *He is a doctor.* / *I am a teacher.*
*   **Edad** — A diferencia del español, en inglés se usa To Be para la edad:
    *   *I am 25 years old.* (Tengo 25 años).

## 5. Preguntas Comunes con To Be

*   **Edad:** *How old are you?*
*   **Estatura:** *How tall is she?*
*   **Peso:** *How heavy is he?*
*   **Medidas y Distancias:** *How wide / long / deep / far is ...?*
*   **Origen:** *Where are they from?*
*   **Información Personal:** *What''s his name? / What''s your address?*
*   **Estado:** *What''s the matter with her? / What''s his car like?*'::text) 
);

-- Regla 1: Forma Afirmativa y Conjugación
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Forma Afirmativa: Conjugación', 'Recuerda: I am / I''m, You·We·They are / ''re, He·She·It is / ''s.');

-- Regla 2: Forma Negativa
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Forma Negativa', 'Añade "not" después del verbo: is not / isn''t, are not / aren''t. Excepción: solo "I''m not", nunca "I amn''t".');

-- Regla 3: Forma Interrogativa y Respuestas Cortas
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Forma Interrogativa y Respuestas Cortas', 'Invierte el orden: verbo antes del sujeto (Is he...? / Are they...?). En respuestas cortas afirmativas no uses contracción: "Yes, he is." nunca "Yes, he''s."');

-- Regla 4: Usos (Definiciones, Descripciones, Profesiones, Edad)
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Usos: Definiciones, Descripciones y Edad', 'Usa To Be para definir (A diamond is a stone), describir (She is tall), indicar profesión (He is a doctor) o edad (I am 25 years old).');

-- Regla 5: Preguntas con How / Where / What
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Preguntas con How / Where / What', 'Combina To Be con How old, How tall, How far, Where from, What''s ... like, etc. para pedir información concreta.');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ a student.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ my friend.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ happy.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ a nurse.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ ready.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ from Spain.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ a big dog.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ tired. (forma completa)', '{"type":"typing","correct_answers":["am not"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ at home. (contracción)', '{"type":"typing","correct_answers":["isn''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ busy right now. (contracción)', '{"type":"typing","correct_answers":["isn''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ in class today. (contracción)', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ sad. (contracción)', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ cold today. (contracción)', '{"type":"typing","correct_answers":["isn''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ late. (contracción)', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he a doctor?', '{"type":"typing","correct_answers":["Is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they at school?', '{"type":"typing","correct_answers":["Are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ it your bag?', '{"type":"typing","correct_answers":["Is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is he a pilot? — Yes, he ___.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Are they late? — No, they ___.', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you okay?', '{"type":"typing","correct_answers":["Are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is she your sister? — Yes, she ___.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A diamond ___ a stone.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ French.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a doctor.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ 25 years old.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The sky ___ blue.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Cats ___ animals.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ very tall and friendly.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How old ___ you?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ they from?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How tall ___ she?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ the matter with her?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How far ___ the stop?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How deep ___ the lake?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How heavy ___ he?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ a student.', '{"type":"multiple_choice","options":["am","is","are"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ my best friend.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a doctor.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ very intelligent.', '{"type":"multiple_choice","options":["are","is","am"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ sunny today.', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ from Italy.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ happy.', '{"type":"multiple_choice","options":["is","are","am"],"answer":1}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Estoy cansado → Forma negativa correcta: I ___ tired.', '{"type":"multiple_choice","options":["am not","isn''t","aren''t"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ at home. (contracción)', '{"type":"multiple_choice","options":["isn''t","aren''t","am not"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ ready yet. (contracción)', '{"type":"multiple_choice","options":["isn''t","aren''t","am not"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ cold outside. (contracción)', '{"type":"multiple_choice","options":["aren''t","isn''t","am not"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la única contracción posible para "I am not"?', '{"type":"multiple_choice","options":["I''m not","I amn''t","I isn''t"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ in class today. (contracción)', '{"type":"multiple_choice","options":["isn''t","aren''t","am not"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ busy right now. (contracción)', '{"type":"multiple_choice","options":["aren''t","isn''t","am not"],"answer":1}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he a pilot?', '{"type":"multiple_choice","options":["Is","Are","Am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they at school?', '{"type":"multiple_choice","options":["Is","Are","Am"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ you okay?', '{"type":"multiple_choice","options":["Is","Am","Are"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is she your sister? — Yes, ___.', '{"type":"multiple_choice","options":["she is","she''s","yes she"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Are they late? — No, ___.', '{"type":"multiple_choice","options":["they aren''t","they''re not","Ambas son correctas"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ it your bag?', '{"type":"multiple_choice","options":["Am","Are","Is"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is he a doctor? — Yes, ___. (respuesta correcta)', '{"type":"multiple_choice","options":["he is","he''s","he are"],"answer":0}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A diamond ___ a stone.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The apples ___ red.', '{"type":"multiple_choice","options":["is","are","am"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En inglés, para decir "tengo 30 años" usamos: I ___ 30 years old.', '{"type":"multiple_choice","options":["have","am","is"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a pilot. (profesión)', '{"type":"multiple_choice","options":["are","am","is"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The coffee ___ hot.', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My eyes ___ green.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ French. (nacionalidad)', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How wide ___ the river?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How long ___ the beach?', '{"type":"multiple_choice","options":["are","is","am"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ his name?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ your address?', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ his car like?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ they from?', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar la estatura usamos: How ___ is she?', '{"type":"multiple_choice","options":["old","tall","far"],"answer":1}'::jsonb);


-- ==============================================================================
-- TIPO 3: SCRAMBLE (Ordenar fragmentos) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Yo soy feliz.', '{"type":"scramble","chunks":["am","I","happy"],"correct_order":[1,0,2]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Ella es doctora.', '{"type":"scramble","chunks":["doctor","is","She","a"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Ellos son amigos.', '{"type":"scramble","chunks":["friends","They","are"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Él es muy alto.', '{"type":"scramble","chunks":["tall","He","very","is"],"correct_order":[1,3,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Tú llegas tarde.', '{"type":"scramble","chunks":["late","You","are"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Nosotros estamos listos.', '{"type":"scramble","chunks":["We","ready","are"],"correct_order":[0,2,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Es un perro grande.', '{"type":"scramble","chunks":["a","It","big","is","dog"],"correct_order":[1,3,0,2,4]}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Él no está en casa.', '{"type":"scramble","chunks":["home","isn''t","He","at"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Yo no estoy cansado.', '{"type":"scramble","chunks":["not","tired","I","am"],"correct_order":[2,3,0,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Ellos no están tristes.', '{"type":"scramble","chunks":["sad","aren''t","They"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Tú no llegas tarde.', '{"type":"scramble","chunks":["late","You","aren''t"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Ella no está ocupada ahora.', '{"type":"scramble","chunks":["now","She","busy","isn''t"],"correct_order":[1,3,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: No hace frío hoy.', '{"type":"scramble","chunks":["today","It","isn''t","cold"],"correct_order":[1,2,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: No estamos en clase hoy.', '{"type":"scramble","chunks":["class","We","in","today","aren''t"],"correct_order":[1,4,2,0,3]}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Es ella tu hermana?', '{"type":"scramble","chunks":["your","Is","she","sister?"],"correct_order":[1,2,0,3]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Están ellos en el colegio?', '{"type":"scramble","chunks":["school?","they","Are","at"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Es él médico? — Sí, lo es.', '{"type":"scramble","chunks":["he","Is","a","Yes,","doctor?","is","he"],"correct_order":[1,0,2,4,3,6,5]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Estáis vosotros listos?', '{"type":"scramble","chunks":["you","ready?","Are"],"correct_order":[2,0,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Es ese tu bolso?', '{"type":"scramble","chunks":["bag?","Is","your","it"],"correct_order":[1,3,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Están ellos bien? — No, no lo están.', '{"type":"scramble","chunks":["okay?","No,","Are","they","aren''t","they"],"correct_order":[2,3,0,1,5,4]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Llegas tarde? — No, no llego.', '{"type":"scramble","chunks":["late?","No,","Are","you","not","I''m"],"correct_order":[2,3,0,1,5,4]}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Un diamante es una piedra.', '{"type":"scramble","chunks":["stone","is","A diamond","a"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Nosotros somos franceses.', '{"type":"scramble","chunks":["French","We","are"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: El cielo es azul.', '{"type":"scramble","chunks":["blue","is","The sky"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Los gatos son animales.', '{"type":"scramble","chunks":["are","animals","Cats"],"correct_order":[2,0,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Él es un piloto.', '{"type":"scramble","chunks":["is","pilot","He","a"],"correct_order":[2,0,3,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Tengo 25 años.', '{"type":"scramble","chunks":["years old","am","25","I"],"correct_order":[3,1,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Ella es muy alta y simpática.', '{"type":"scramble","chunks":["tall","She","very","is","and friendly"],"correct_order":[1,3,2,0,4]}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuántos años tienes?', '{"type":"scramble","chunks":["are","How old","you?"],"correct_order":[1,0,2]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿De dónde son ellos?', '{"type":"scramble","chunks":["from?","they","Where","are"],"correct_order":[2,3,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuánto mide ella?', '{"type":"scramble","chunks":["she?","is","How tall"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuál es tu dirección?', '{"type":"scramble","chunks":["address?","What''s","your"],"correct_order":[1,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Qué tan profundo es el lago?', '{"type":"scramble","chunks":["How deep","the lake?","is"],"correct_order":[0,2,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuál es su apellido?', '{"type":"scramble","chunks":["surname?","his","What''s"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿A qué distancia está la parada?', '{"type":"scramble","chunks":["is","How far","the stop?"],"correct_order":[1,0,2]}'::jsonb);


-- ==============================================================================
-- TIPO 4: TRUE/FALSE (Verdadero o Falso) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para I es "I are".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para She es "She is".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para They es "They is".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La contracción de "He is" es "He''s".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La contracción de "We are" es "We''re".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La contracción de "I am" es "I''s".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"You are" puede contraerse como "You''re".', '{"type":"true_false","answer":true}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"I amn''t" es una contracción correcta en inglés.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"He isn''t" y "He''s not" significan lo mismo.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para negar con "I" la única forma contraída es "I''m not".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"They aren''t" y "They''re not" son formas negativas equivalentes.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"She not is busy" es la forma negativa correcta.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para negar con "It" podemos decir "It isn''t" o "It''s not".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"We aren''t" es la contracción de "We are not".', '{"type":"true_false","answer":true}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar usamos el mismo orden que en afirmativa: "He is a doctor?" es correcto.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En preguntas, el verbo va antes del sujeto: "Is he a doctor?"', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En respuestas cortas afirmativas, se puede decir "Yes, he''s." en lugar de "Yes, he is."', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Are they at school? — Yes, they are." es una respuesta corta correcta.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Is she your sister? — No, she isn''t." es correcto.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta con "I" en primera persona es "Am I ...?"', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Are you okay? — Yes, I''m." es una respuesta corta correcta.', '{"type":"true_false","answer":false}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "nosotros somos franceses", usamos "We are French".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "un diamante es una piedra", decimos "A diamond are a stone".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El verbo "To Be" solo significa SER, nunca ESTAR.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En inglés, para la edad se usa To Be: "I am 25 years old."', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Water is essential" es una frase gramaticalmente correcta para definir.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para describir plurales como gatos, usamos "Cats is animals".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "Él es médico" en inglés, lo correcto es "He is a doctor."', '{"type":"true_false","answer":true}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta "How old are you?" significa "¿Cuántos años tienes?".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar la altura de alguien decimos "How long is she?"', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar de dónde son ellos, lo correcto es "Where is they from?"', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"How wide is the river?" sirve para preguntar el ancho del río.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"What''s the matter with her?" significa "¿Qué le pasa a ella?"', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar el peso de alguien usamos "How deep is he?"', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"What''s his car like?" se usa para preguntar cómo es su coche.', '{"type":"true_false","answer":true}'::jsonb);

END;
$seed$;
