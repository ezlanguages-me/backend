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
  'Verbo To Be', 
  '', 
  to_jsonb('# Verbo To Be (Ser o Estar)

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

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
  v_grammar14_id, 
  'de', 
  'Das Verb To Be', 
  '', 
  to_jsonb('# Das Verb To Be (Sein oder Sein/Sich befinden)

Das Verb **To Be** ist das wichtigste und am häufigsten verwendete Verb der englischen Sprache. Es wird ins Deutsche als **SEIN** übersetzt. Es dient auch als Hilfsverb zur Bildung zusammengesetzter Zeitformen.

## 1. Bejahende Form und Kurzformen

| Pronomen | Vollform | Kurzform | Beispiel |
| :--- | :--- | :--- | :--- |
| **I** (Ich) | I am | I''m | I''m a student. |
| **You** (Du / Sie) | You are | You''re | You''re my friend. |
| **He** (Er) | He is | He''s | He''s happy. |
| **She** (Sie/weibl.) | She is | She''s | She''s tall. |
| **It** (Es) | It is | It''s | It''s a dog. |
| **We** (Wir) | We are | We''re | We''re ready. |
| **They** (Sie/pl.) | They are | They''re | They''re from Spain. |

> Kurzformen sind die natürlichste und gebräuchlichste Form im Alltag.

## 2. Verneinung

Zur Verneinung wird **not** nach dem Verb hinzugefügt. Für die meisten Pronomen gibt es zwei mögliche Kurzformen:

| Pronomen | Vollform | Kurzform 1 | Kurzform 2 |
| :--- | :--- | :--- | :--- |
| **I** | I am not | I''m not | — |
| **You** | You are not | You aren''t | You''re not |
| **He** | He is not | He isn''t | He''s not |
| **She** | She is not | She isn''t | She''s not |
| **It** | It is not | It isn''t | It''s not |
| **We** | We are not | We aren''t | We''re not |
| **They** | They are not | They aren''t | They''re not |

> ⚠️ **Ausnahme:** "I am not" hat nur eine Kurzform: **I''m not**. "I amn''t" existiert nicht.

## 3. Frageform und Kurzantworten

Für Fragen wird die Reihenfolge **umgekehrt**: das Verb steht vor dem Subjekt.

| Struktur | Beispiel | Kurze bejahende Antwort | Kurze verneinende Antwort |
| :--- | :--- | :--- | :--- |
| Am I ...? | Am I late? | Yes, you are. | No, you aren''t. |
| Are you ...? | Are you okay? | Yes, I am. | No, I''m not. |
| Is he ...? | Is he a doctor? | Yes, he is. | No, he isn''t. |
| Is she ...? | Is she your sister? | Yes, she is. | No, she isn''t. |
| Is it ...? | Is it your bag? | Yes, it is. | No, it isn''t. |
| Are we ...? | Are we late? | Yes, we are. | No, we aren''t. |
| Are they ...? | Are they at school? | Yes, they are. | No, they aren''t. |

> In kurzen bejahenden Antworten wird **nie** eine Kurzform verwendet: ✅ *Yes, he is.* ❌ *Yes, he''s.*

## 4. Hauptverwendungen

*   **Definitionen und Fakten:** Wahrheiten ausdrücken oder Dinge definieren.
    *   *A diamond is a stone.* (Ein Diamant ist ein Stein).
*   **Körperliche Beschreibungen:** Eigenschaften oder Zustände beschreiben.
    *   *She is tall and friendly.*
*   **Nationalität und Herkunft:**
    *   *We are German.* / *They are from Spain.*
*   **Berufe:**
    *   *He is a doctor.* / *I am a teacher.*
*   **Alter** — Im Gegensatz zum Deutschen wird im Englischen To Be für das Alter verwendet:
    *   *I am 25 years old.* (Ich bin 25 Jahre alt.)

## 5. Häufige Fragen mit To Be

*   **Alter:** *How old are you?*
*   **Größe:** *How tall is she?*
*   **Gewicht:** *How heavy is he?*
*   **Maße und Entfernungen:** *How wide / long / deep / far is ...?*
*   **Herkunft:** *Where are they from?*
*   **Persönliche Informationen:** *What''s his name? / What''s your address?*
*   **Zustand:** *What''s the matter with her? / What''s his car like?*
'::text) 
);

-- Regla 1: Forma Afirmativa y Conjugación
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Forma Afirmativa: Conjugación', 'Recuerda: I am / I''m, You·We·They are / ''re, He·She·It is / ''s.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'de', 'Bejahende Form: Konjugation', 'Denke daran: I am / I''m, You·We·They are / ''re, He·She·It is / ''s.');

-- Regla 2: Forma Negativa
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Forma Negativa', 'Añade "not" después del verbo: is not / isn''t, are not / aren''t. Excepción: solo "I''m not", nunca "I amn''t".');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'de', 'Verneinung', 'Füge "not" nach dem Verb hinzu: is not / isn''t, are not / aren''t. Ausnahme: nur "I''m not", niemals "I amn''t".');

-- Regla 3: Forma Interrogativa y Respuestas Cortas
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Forma Interrogativa y Respuestas Cortas', 'Invierte el orden: verbo antes del sujeto (Is he...? / Are they...?). En respuestas cortas afirmativas no uses contracción: "Yes, he is." nunca "Yes, he''s."');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'de', 'Frageform und Kurzantworten', 'Kehre die Reihenfolge um: Verb vor Subjekt (Is he...? / Are they...?). In kurzen bejahenden Antworten keine Kurzform verwenden: "Yes, he is." niemals "Yes, he''s."');

-- Regla 4: Usos (Definiciones, Descripciones, Profesiones, Edad)
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Usos: Definiciones, Descripciones y Edad', 'Usa To Be para definir (A diamond is a stone), describir (She is tall), indicar profesión (He is a doctor) o edad (I am 25 years old).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'de', 'Verwendungen: Definitionen, Beschreibungen und Alter', 'Verwende To Be zum Definieren (A diamond is a stone), Beschreiben (She is tall), für Berufe (He is a doctor) oder Alter (I am 25 years old).');

-- Regla 5: Preguntas con How / Where / What
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar14_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Preguntas con How / Where / What', 'Combina To Be con How old, How tall, How far, Where from, What''s ... like, etc. para pedir información concreta.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'de', 'Fragen mit How / Where / What', 'Kombiniere To Be mit How old, How tall, How far, Where from, What''s ... like usw., um konkrete Informationen zu erfragen.');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ a student.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ a student.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ my friend.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ my friend.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ happy.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ happy.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ from Spain.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ from Spain.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ tired. (forma completa)', '{"type":"typing","correct_answers":["am not"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ tired. (Vollform)', '{"type":"typing","correct_answers":["am not"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ at home. (contracción)', '{"type":"typing","correct_answers":["isn''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ at home. (Kurzform)', '{"type":"typing","correct_answers":["isn''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ in class today. (contracción)', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ in class today. (Kurzform)', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It ___ cold today. (contracción)', '{"type":"typing","correct_answers":["isn''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It ___ cold today. (Kurzform)', '{"type":"typing","correct_answers":["isn''t"],"case_sensitive":false}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he a doctor?', '{"type":"typing","correct_answers":["Is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he a doctor?', '{"type":"typing","correct_answers":["Is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they at school?', '{"type":"typing","correct_answers":["Are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they at school?', '{"type":"typing","correct_answers":["Are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is he a pilot? — Yes, he ___.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Is he a pilot? — Yes, he ___.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Are they late? — No, they ___.', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Are they late? — No, they ___.', '{"type":"typing","correct_answers":["aren''t"],"case_sensitive":false}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A diamond ___ a stone.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'A diamond ___ a stone.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ French.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ French.', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ 25 years old.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ 25 years old.', '{"type":"typing","correct_answers":["am"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She ___ very tall and friendly.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She ___ very tall and friendly.', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How old ___ you?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How old ___ you?', '{"type":"typing","correct_answers":["are"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How tall ___ she?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How tall ___ she?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ the matter with her?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ the matter with her?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How far ___ the stop?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How far ___ the stop?', '{"type":"typing","correct_answers":["is"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I ___ a student.', '{"type":"multiple_choice","options":["am","is","are"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I ___ a student.', '{"type":"multiple_choice","options":["am","is","are"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'You ___ my best friend.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'You ___ my best friend.', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a doctor.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ a doctor.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ happy.', '{"type":"multiple_choice","options":["is","are","am"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ happy.', '{"type":"multiple_choice","options":["is","are","am"],"answer":1}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Estoy cansado → Forma negativa correcta: I ___ tired.', '{"type":"multiple_choice","options":["am not","isn''t","aren''t"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ich bin müde → Korrekte Verneinung: I ___ tired.', '{"type":"multiple_choice","options":["am not","isn''t","aren''t"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ at home. (contracción)', '{"type":"multiple_choice","options":["isn''t","aren''t","am not"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ at home. (Kurzform)', '{"type":"multiple_choice","options":["isn''t","aren''t","am not"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They ___ ready yet. (contracción)', '{"type":"multiple_choice","options":["isn''t","aren''t","am not"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They ___ ready yet. (Kurzform)', '{"type":"multiple_choice","options":["isn''t","aren''t","am not"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la única contracción posible para "I am not"?', '{"type":"multiple_choice","options":["I''m not","I amn''t","I isn''t"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Was ist die einzig mögliche Kurzform für "I am not"?', '{"type":"multiple_choice","options":["I''m not","I amn''t","I isn''t"],"answer":0}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ he a pilot?', '{"type":"multiple_choice","options":["Is","Are","Am"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ he a pilot?', '{"type":"multiple_choice","options":["Is","Are","Am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ they at school?', '{"type":"multiple_choice","options":["Is","Are","Am"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ they at school?', '{"type":"multiple_choice","options":["Is","Are","Am"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is she your sister? — Yes, ___.', '{"type":"multiple_choice","options":["she is","she''s","yes she"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Is she your sister? — Yes, ___.', '{"type":"multiple_choice","options":["she is","she''s","yes she"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Are they late? — No, ___.', '{"type":"multiple_choice","options":["they aren''t","they''re not","Ambas son correctas"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Are they late? — No, ___.', '{"type":"multiple_choice","options":["they aren''t","they''re not","Ambas son correctas"],"answer":2}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A diamond ___ a stone.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'A diamond ___ a stone.', '{"type":"multiple_choice","options":["am","is","are"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En inglés, para decir "tengo 30 años" usamos: I ___ 30 years old.', '{"type":"multiple_choice","options":["have","am","is"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Im Englischen sagt man für "ich bin 30 Jahre alt": I ___ 30 years old.', '{"type":"multiple_choice","options":["have","am","is"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He ___ a pilot. (profesión)', '{"type":"multiple_choice","options":["are","am","is"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He ___ a pilot. (Beruf)', '{"type":"multiple_choice","options":["are","am","is"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We ___ French. (nacionalidad)', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We ___ French. (Nationalität)', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'How wide ___ the river?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'How wide ___ the river?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ his name?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ his name?', '{"type":"multiple_choice","options":["is","are","am"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where ___ they from?', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where ___ they from?', '{"type":"multiple_choice","options":["am","is","are"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar la estatura usamos: How ___ is she?', '{"type":"multiple_choice","options":["old","tall","far"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um nach der Größe zu fragen, verwenden wir: How ___ is she?', '{"type":"multiple_choice","options":["old","tall","far"],"answer":1}'::jsonb);


-- ==============================================================================
-- TIPO 3: SCRAMBLE (Ordenar fragmentos) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Yo soy feliz.', '{"type":"scramble","chunks":["am","I","happy"],"correct_order":[1,0,2]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne den Satz: Ich bin glücklich.', '{"type":"scramble","chunks":["am","I","happy"],"correct_order":[1,0,2]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Ella es doctora.', '{"type":"scramble","chunks":["doctor","is","She","a"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne den Satz: Sie ist Ärztin.', '{"type":"scramble","chunks":["doctor","is","She","a"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Él es muy alto.', '{"type":"scramble","chunks":["tall","He","very","is"],"correct_order":[1,3,2,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne den Satz: Er ist sehr groß.', '{"type":"scramble","chunks":["tall","He","very","is"],"correct_order":[1,3,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena la frase: Es un perro grande.', '{"type":"scramble","chunks":["a","It","big","is","dog"],"correct_order":[1,3,0,2,4]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne den Satz: Es ist ein großer Hund.', '{"type":"scramble","chunks":["a","It","big","is","dog"],"correct_order":[1,3,0,2,4]}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Él no está en casa.', '{"type":"scramble","chunks":["home","isn''t","He","at"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Er ist nicht zu Hause.', '{"type":"scramble","chunks":["home","isn''t","He","at"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Yo no estoy cansado.', '{"type":"scramble","chunks":["not","tired","I","am"],"correct_order":[2,3,0,1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Ich bin nicht müde.', '{"type":"scramble","chunks":["not","tired","I","am"],"correct_order":[2,3,0,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Ellos no están tristes.', '{"type":"scramble","chunks":["sad","aren''t","They"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Sie sind nicht traurig.', '{"type":"scramble","chunks":["sad","aren''t","They"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: No estamos en clase hoy.', '{"type":"scramble","chunks":["class","We","in","today","aren''t"],"correct_order":[1,4,2,0,3]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Wir sind heute nicht im Unterricht.', '{"type":"scramble","chunks":["class","We","in","today","aren''t"],"correct_order":[1,4,2,0,3]}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Es ella tu hermana?', '{"type":"scramble","chunks":["your","Is","she","sister?"],"correct_order":[1,2,0,3]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Ist sie deine Schwester?', '{"type":"scramble","chunks":["your","Is","she","sister?"],"correct_order":[1,2,0,3]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Están ellos en el colegio?', '{"type":"scramble","chunks":["school?","they","Are","at"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Sind sie in der Schule?', '{"type":"scramble","chunks":["school?","they","Are","at"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Es él médico? — Sí, lo es.', '{"type":"scramble","chunks":["he","Is","a","Yes,","doctor?","is","he"],"correct_order":[1,0,2,4,3,6,5]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Ist er Arzt? — Ja, er ist es.', '{"type":"scramble","chunks":["he","Is","a","Yes,","doctor?","is","he"],"correct_order":[1,0,2,4,3,6,5]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Llegas tarde? — No, no llego.', '{"type":"scramble","chunks":["late?","No,","Are","you","not","I''m"],"correct_order":[2,3,0,1,5,4]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Kommst du zu spät? — Nein, ich nicht.', '{"type":"scramble","chunks":["late?","No,","Are","you","not","I''m"],"correct_order":[2,3,0,1,5,4]}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Un diamante es una piedra.', '{"type":"scramble","chunks":["stone","is","A diamond","a"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Ein Diamant ist ein Stein.', '{"type":"scramble","chunks":["stone","is","A diamond","a"],"correct_order":[2,1,3,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Los gatos son animales.', '{"type":"scramble","chunks":["are","animals","Cats"],"correct_order":[2,0,1]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Katzen sind Tiere.', '{"type":"scramble","chunks":["are","animals","Cats"],"correct_order":[2,0,1]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Tengo 25 años.', '{"type":"scramble","chunks":["years old","am","25","I"],"correct_order":[3,1,2,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Ich bin 25 Jahre alt.', '{"type":"scramble","chunks":["years old","am","25","I"],"correct_order":[3,1,2,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: Ella es muy alta y simpática.', '{"type":"scramble","chunks":["tall","She","very","is","and friendly"],"correct_order":[1,3,2,0,4]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Sie ist sehr groß und freundlich.', '{"type":"scramble","chunks":["tall","She","very","is","and friendly"],"correct_order":[1,3,2,0,4]}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuántos años tienes?', '{"type":"scramble","chunks":["are","How old","you?"],"correct_order":[1,0,2]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Wie alt bist du?', '{"type":"scramble","chunks":["are","How old","you?"],"correct_order":[1,0,2]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿De dónde son ellos?', '{"type":"scramble","chunks":["from?","they","Where","are"],"correct_order":[2,3,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Woher kommen sie?', '{"type":"scramble","chunks":["from?","they","Where","are"],"correct_order":[2,3,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿Cuánto mide ella?', '{"type":"scramble","chunks":["she?","is","How tall"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Wie groß ist sie?', '{"type":"scramble","chunks":["she?","is","How tall"],"correct_order":[2,1,0]}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ordena: ¿A qué distancia está la parada?', '{"type":"scramble","chunks":["is","How far","the stop?"],"correct_order":[1,0,2]}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Ordne: Wie weit ist die Haltestelle?', '{"type":"scramble","chunks":["is","How far","the stop?"],"correct_order":[1,0,2]}'::jsonb);


-- ==============================================================================
-- TIPO 4: TRUE/FALSE (Verdadero o Falso) - 35 Ejercicios (7 por regla)
-- ==============================================================================

-- (Regla 1 - Afirmativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para I es "I are".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die korrekte Konjugation für I ist "I are".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La conjugación correcta para They es "They is".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die korrekte Konjugation für They ist "They is".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La contracción de "He is" es "He''s".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Kurzform von "He is" ist "He''s".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La contracción de "I am" es "I''s".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Kurzform von "I am" ist "I''s".', '{"type":"true_false","answer":false}'::jsonb);

-- (Regla 2 - Negativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"I amn''t" es una contracción correcta en inglés.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"I amn''t" ist eine korrekte Kurzform im Englischen.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"He isn''t" y "He''s not" significan lo mismo.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"He isn''t" und "He''s not" bedeuten dasselbe.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para negar con "I" la única forma contraída es "I''m not".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die einzige Kurzform der Verneinung mit "I" ist "I''m not".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"She not is busy" es la forma negativa correcta.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"She not is busy" ist die korrekte Verneinung.', '{"type":"true_false","answer":false}'::jsonb);

-- (Regla 3 - Interrogativa)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar usamos el mismo orden que en afirmativa: "He is a doctor?" es correcto.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Bei Fragen verwenden wir dieselbe Reihenfolge wie bei der Bejahung: "He is a doctor?" ist korrekt.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En respuestas cortas afirmativas, se puede decir "Yes, he''s." en lugar de "Yes, he is."', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'In kurzen bejahenden Antworten kann man "Yes, he''s." statt "Yes, he is." sagen.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Are they at school? — Yes, they are." es una respuesta corta correcta.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Are they at school? — Yes, they are." ist eine korrekte Kurzantwort.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta con "I" en primera persona es "Am I ...?"', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Frage mit "I" in der ersten Person ist "Am I ...?"', '{"type":"true_false","answer":true}'::jsonb);

-- (Regla 4 - Usos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "nosotros somos franceses", usamos "We are French".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um "wir sind Franzosen" zu sagen, verwenden wir "We are French".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El verbo "To Be" solo significa SER, nunca ESTAR.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Verb "To Be" bedeutet nur SEIN, niemals SICH BEFINDEN.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En inglés, para la edad se usa To Be: "I am 25 years old."', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Im Englischen wird To Be für das Alter verwendet: "I am 25 years old."', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para describir plurales como gatos, usamos "Cats is animals".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um Plurale wie Katzen zu beschreiben, sagen wir "Cats is animals".', '{"type":"true_false","answer":false}'::jsonb);

-- (Regla 5 - Preguntas How/Where/What)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La pregunta "How old are you?" significa "¿Cuántos años tienes?".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Die Frage "How old are you?" bedeutet "Wie alt bist du?".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar la altura de alguien decimos "How long is she?"', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um nach der Größe von jemandem zu fragen, sagen wir "How long is she?"', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"What''s the matter with her?" significa "¿Qué le pasa a ella?"', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"What''s the matter with her?" bedeutet "Was ist mit ihr los?"', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar14_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar el peso de alguien usamos "How deep is he?"', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um nach dem Gewicht von jemandem zu fragen, verwenden wir "How deep is he?"', '{"type":"true_false","answer":false}'::jsonb);

END;
$seed$;
