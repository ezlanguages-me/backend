-- ============================================================
-- Seed: A0 English Path – STEP 90 – Grammar – Artículos (A, An, The)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_grammar1_id UUID; 
    v_rule1_id UUID; 
    v_rule2_id UUID; 
    v_rule3_id UUID; 
    v_rule4_id UUID; 
    v_rule5_id UUID; 
    v_ex_id UUID; 
BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 90, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Los Artículos', 
    '', 
    to_jsonb('## Los Artículos (THE, A, AN)

##### 1. El artículo indefinido: A / AN
Se utiliza para objetos no concretos en singular.
*   **A vs AN:** Usa **A** si la palabra empieza por consonante (*a red car*) y **AN** si empieza por vocal o sonido vocálico (*an apple*).
*   **Profesiones:** Siempre se usa A/AN para hablar de oficios. (*My mother is a doctor*).
*   **Plurales:** El artículo "a/an" se omite cuando hablamos en plural. (*I have a dog* ➔ *I have dogs*).

##### 2. El artículo definido: THE
Se usa para referirse a un objeto concreto o específico. (*The dog is black*).
*   **Instrumentos musicales:** Se coloca "the" delante de los instrumentos. (*I can play the piano*).
*   **Instituciones:** Cuidado con el significado. (*Thomas is in hospital* = es paciente allí. / *Thomas is in the hospital* = está allí pero no como paciente).

##### 3. Omisión del Artículo (Zero Article)
A diferencia del español, en inglés omitimos el artículo en los siguientes casos:
*   **Nombres en general:** No se usa "The" para hablar de cosas en sentido general. (*Water is essential for life*).
*   **Juegos y deportes:** Nunca llevan artículo. (*We like basketball*).

##### 4. Exclamaciones y Medidas
*   **Medidas:** Se utiliza A/AN para expresar unidades de medida. (*20 euros a kilo*).
*   **Exclamaciones con WHAT:** Se usa A/AN después de "What" en exclamaciones singulares. (*What a goal!*).'::text)
);

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'de', 
    'Die Artikel', 
    '', 
    to_jsonb('## Die Artikel (THE, A, AN)

##### 1. Der unbestimmte Artikel: A / AN
Wird für nicht konkrete Objekte im Singular verwendet.
*   **A vs AN:** Verwende **A** wenn das Wort mit einem Konsonantenlaut beginnt (*a red car*) und **AN** wenn es mit einem Vokal oder Vokalklang beginnt (*an apple*).
*   **Berufe:** Bei Berufen wird immer A/AN verwendet. (*My mother is a doctor*).
*   **Plural:** Der Artikel "a/an" entfällt im Plural. (*I have a dog* ➔ *I have dogs*).

##### 2. Der bestimmte Artikel: THE
Wird verwendet, wenn auf ein konkretes oder bestimmtes Objekt Bezug genommen wird. (*The dog is black*).
*   **Musikinstrumente:** Vor Musikinstrumenten wird "the" gesetzt. (*I can play the piano*).
*   **Institutionen:** Vorsicht mit der Bedeutung. (*Thomas is in hospital* = er ist Patient. / *Thomas is in the hospital* = er ist dort, aber nicht als Patient).

##### 3. Weglassen des Artikels (Zero Article)
Im Gegensatz zum Deutschen lassen wir im Englischen den Artikel in folgenden Fällen weg:
*   **Allgemeine Begriffe:** "The" wird nicht für Dinge im allgemeinen Sinne verwendet. (*Water is essential for life*).
*   **Spiele und Sportarten:** Tragen nie einen Artikel. (*We like basketball*).

##### 4. Ausrufe und Maßeinheiten
*   **Maßeinheiten:** A/AN wird für Maßeinheiten verwendet. (*20 euros a kilo*).
*   **Ausrufe mit WHAT:** Nach "What" in Ausrufen im Singular wird A/AN verwendet. (*What a goal!*).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
-- Regla 1: A / AN y Profesiones
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'A / AN y Profesiones', 'Recuerda: usa "a" antes de consonante, "an" antes de vocal, y ponlos siempre delante de las profesiones (ej. I am a doctor).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'de', 'A / AN und Berufe', 'Denke daran: Verwende "a" vor Konsonanten, "an" vor Vokalen, und setze sie immer vor Berufsbezeichnungen (z.B. I am a doctor).');

-- Regla 2: THE e Instrumentos
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'THE e Instrumentos', 'Utiliza "the" para objetos concretos y siempre delante de instrumentos musicales (ej. play the piano).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'de', 'THE und Musikinstrumente', 'Verwende "the" für konkrete Objekte und immer vor Musikinstrumenten (z.B. play the piano).');

-- Regla 3: Omisión (General y Plurales)
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Omisión en General y Plurales', 'No uses "the" para hablar de conceptos generales (Water is essential) ni uses "a/an" para palabras en plural.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'de', 'Weglassen bei Allgemeinem und Plural', 'Verwende "the" nicht für allgemeine Konzepte (Water is essential) und "a/an" nicht für Pluralwörter.');

-- Regla 4: Deportes, Exclamaciones y Medidas
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Deportes, Exclamaciones y Medidas', 'No pongas artículo con deportes (play basketball), pero usa "a" o "an" en medidas (a kilo) y tras "What" (What a goal!).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'de', 'Sport, Ausrufe und Maßeinheiten', 'Kein Artikel bei Sportarten (play basketball), aber verwende "a" oder "an" bei Maßeinheiten (a kilo) und nach "What" (What a goal!).');

-- Regla 5: Primera mención vs Segunda mención
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Primera mención (A/AN) vs Segunda mención (THE)', 'Usa A/AN cuando introduces algo por primera vez y THE cuando ya se mencionó o es conocido para el oyente (ej. I have a dog. The dog is black).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'de', 'Erste Erwähnung (A/AN) vs. Zweite Erwähnung (THE)', 'Verwende A/AN wenn du etwas zum ersten Mal einführst und THE wenn es bereits erwähnt wurde oder dem Hörer bekannt ist (z.B. I have a dog. The dog is black).');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - A / AN / Profesiones)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ doctor.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She is ___ doctor.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I want to eat ___ apple.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I want to eat ___ apple.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He drives ___ red car.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He drives ___ red car.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My father is ___ architect.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My father is ___ architect.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'This is ___ good book.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'This is ___ good book.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ teacher.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He is ___ teacher.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I need ___ umbrella.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I need ___ umbrella.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);

-- (R2 - THE / Instrumentos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I can play ___ piano.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I can play ___ piano.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ dog in my house is black.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ dog in my house is black.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She plays ___ guitar.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She plays ___ guitar.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Look at ___ moon.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Look at ___ moon.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ sun is hot today.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ sun is hot today.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Let''s open ___ window.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Let''s open ___ window.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The book is on ___ table.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'The book is on ___ table.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);

-- (R3 - Omisión General/Plural)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (The/-) water is essential for life.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (The/-) water is essential for life.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I love ___ (the/-) cats in general.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I love ___ (the/-) cats in general.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have ___ (a/-) dogs at home.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I have ___ (a/-) dogs at home.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (The/-) milk is good for you.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (The/-) milk is good for you.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I buy ___ (an/-) apples every day.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I buy ___ (an/-) apples every day.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (The/-) love is beautiful.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (The/-) love is beautiful.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'People need ___ (a/-) sleep.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'People need ___ (a/-) sleep.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);

-- (R4 - Deportes/Exclamaciones/Medidas)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We like ___ (the/-) basketball.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We like ___ (the/-) basketball.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ goal!', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ goal!', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It costs 20 euros ___ kilo.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It costs 20 euros ___ kilo.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I play ___ (the/-) tennis.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I play ___ (the/-) tennis.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ beautiful day!', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ beautiful day!', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They play ___ (a/-) football.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They play ___ (a/-) football.', '{"type":"typing","correct_answers":["-"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We drive 100 miles ___ hour.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We drive 100 miles ___ hour.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);

-- (R5 - Primera vs Segunda mención)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I saw a dog in the park. ___ dog ran away.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I saw a dog in the park. ___ dog ran away.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She bought ___ new book yesterday.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She bought ___ new book yesterday.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There is an apple on the table. Can you pass me ___ apple?', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There is an apple on the table. Can you pass me ___ apple?', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have a sister. ___ sister is a nurse.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I have a sister. ___ sister is a nurse.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He found ___ old letter in the attic.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He found ___ old letter in the attic.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We saw a film last night. ___ film was really good.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We saw a film last night. ___ film was really good.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I need ___ pen. Have you got one?', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I need ___ pen. Have you got one?', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - A / AN / Profesiones)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I want ___ orange.', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I want ___ orange.', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My brother is ___ engineer.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'My brother is ___ engineer.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ teacher.', '{"type":"multiple_choice","options":["a","an","the"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She is ___ teacher.', '{"type":"multiple_choice","options":["a","an","the"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It is ___ umbrella.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'It is ___ umbrella.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We saw ___ movie yesterday.', '{"type":"multiple_choice","options":["a","an","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We saw ___ movie yesterday.', '{"type":"multiple_choice","options":["a","an","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ pilot.', '{"type":"multiple_choice","options":["a","an","the"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He is ___ pilot.', '{"type":"multiple_choice","options":["a","an","the"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have ___ idea.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I have ___ idea.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);

-- (R2 - THE / Instrumentos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I can play ___ violin.', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I can play ___ violin.', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ car parked outside is mine.', '{"type":"multiple_choice","options":["The","A","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ car parked outside is mine.', '{"type":"multiple_choice","options":["The","A","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Did you feed ___ cat?', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Did you feed ___ cat?', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where is ___ kitchen?', '{"type":"multiple_choice","options":["the","a","an"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Where is ___ kitchen?', '{"type":"multiple_choice","options":["the","a","an"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He plays ___ drums very well.', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He plays ___ drums very well.', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is in ___ hospital (como paciente).', '{"type":"multiple_choice","options":["-","the","a"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She is in ___ hospital (als Patientin).', '{"type":"multiple_choice","options":["-","the","a"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Can you close ___ door?', '{"type":"multiple_choice","options":["the","a","an"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Can you close ___ door?', '{"type":"multiple_choice","options":["the","a","an"],"answer":0}'::jsonb);

-- (R3 - Omisión General/Plural)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is essential for life.', '{"type":"multiple_choice","options":["Water","The water","A water"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is essential for life.', '{"type":"multiple_choice","options":["Water","The water","A water"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Do you like ___ ?', '{"type":"multiple_choice","options":["cats","the cats","a cats"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Do you like ___ ?', '{"type":"multiple_choice","options":["cats","the cats","a cats"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is blind.', '{"type":"multiple_choice","options":["Love","The love","A love"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ is blind.', '{"type":"multiple_choice","options":["Love","The love","A love"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have ___ in my house.', '{"type":"multiple_choice","options":["dogs","a dogs","the dogs"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I have ___ in my house.', '{"type":"multiple_choice","options":["dogs","a dogs","the dogs"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'People need ___ .', '{"type":"multiple_choice","options":["sleep","the sleep","a sleep"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'People need ___ .', '{"type":"multiple_choice","options":["sleep","the sleep","a sleep"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ are good pets.', '{"type":"multiple_choice","options":["Dogs","The dogs","A dog"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ are good pets.', '{"type":"multiple_choice","options":["Dogs","The dogs","A dog"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She drinks ___ every morning.', '{"type":"multiple_choice","options":["coffee","the coffee","a coffee"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She drinks ___ every morning.', '{"type":"multiple_choice","options":["coffee","the coffee","a coffee"],"answer":0}'::jsonb);

-- (R4 - Deportes/Exclamaciones/Medidas)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We play ___ on Sundays.', '{"type":"multiple_choice","options":["basketball","the basketball","a basketball"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'We play ___ on Sundays.', '{"type":"multiple_choice","options":["basketball","the basketball","a basketball"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ surprise!', '{"type":"multiple_choice","options":["a","the","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ surprise!', '{"type":"multiple_choice","options":["a","the","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Three euros ___ kilo.', '{"type":"multiple_choice","options":["a","the","an"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Three euros ___ kilo.', '{"type":"multiple_choice","options":["a","the","an"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is very good at ___ .', '{"type":"multiple_choice","options":["tennis","the tennis","a tennis"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He is very good at ___ .', '{"type":"multiple_choice","options":["tennis","the tennis","a tennis"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ amazing car!', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'What ___ amazing car!', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They like to play ___ .', '{"type":"multiple_choice","options":["football","the football","a football"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'They like to play ___ .', '{"type":"multiple_choice","options":["football","the football","a football"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She runs 5 miles ___ day.', '{"type":"multiple_choice","options":["a","the","an"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She runs 5 miles ___ day.', '{"type":"multiple_choice","options":["a","the","an"],"answer":0}'::jsonb);

-- (R5 - Primera vs Segunda mención)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I met a girl at the party. ___ girl was very funny.', '{"type":"multiple_choice","options":["The","A","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I met a girl at the party. ___ girl was very funny.', '{"type":"multiple_choice","options":["The","A","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She has ___ dog at home. It is very cute.', '{"type":"multiple_choice","options":["a","the","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She has ___ dog at home. It is very cute.', '{"type":"multiple_choice","options":["a","the","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I bought a jacket. ___ jacket is blue.', '{"type":"multiple_choice","options":["The","A","An"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I bought a jacket. ___ jacket is blue.', '{"type":"multiple_choice","options":["The","A","An"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I saw ___ old film on television last night.', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I saw ___ old film on television last night.', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He told me about a problem. ___ problem was very serious.', '{"type":"multiple_choice","options":["The","A","-"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'He told me about a problem. ___ problem was very serious.', '{"type":"multiple_choice","options":["The","A","-"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'There is ___ interesting book on my desk.', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'There is ___ interesting book on my desk.', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She found a key. ___ key opened the old box.', '{"type":"multiple_choice","options":["The","A","An"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'She found a key. ___ key opened the old box.', '{"type":"multiple_choice","options":["The","A","An"],"answer":0}'::jsonb);


-- ==============================================================================
-- TIPO 3: TRUE/FALSE (Verdadero o Falso) - 24 Ejercicios (6 por regla)
-- ==============================================================================

-- (R1 - A / AN / Profesiones)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se usa "A" delante de palabras que empiezan por sonido vocálico.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"A" wird vor Wörtern verwendet, die mit einem Vokalklang beginnen.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "soy doctor" lo correcto es "I am doctor".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um "Ich bin Arzt" zu sagen, ist "I am doctor" korrekt.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "an apple" porque la palabra empieza por vocal.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"An apple" ist korrekt, weil das Wort mit einem Vokal beginnt.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Es correcto decir "a car".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Es ist korrekt, "a car" zu sagen.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se usa "AN" para profesiones que empiezan por consonante como teacher.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"AN" wird für Berufsbezeichnungen verwendet, die mit einem Konsonanten beginnen, wie z.B. teacher.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"A teacher" es gramaticalmente correcto.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"A teacher" ist grammatikalisch korrekt.', '{"type":"true_false","answer":true}'::jsonb);

-- (R2 - THE / Instrumentos)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Delante de instrumentos musicales se usa el artículo "the".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Vor Musikinstrumenten wird der Artikel "the" verwendet.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "toco la guitarra" usamos "play guitar" sin artículo.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um "Ich spiele Gitarre" zu sagen, verwenden wir "play guitar" ohne Artikel.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "I play a piano".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Man sagt "I play a piano".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Usamos "the" para referirnos a objetos muy específicos.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir verwenden "the", um auf sehr spezifische Objekte zu verweisen.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "The dog is black" se refiere a un perro concreto.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Satz "The dog is black" bezieht sich auf einen bestimmten Hund.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"The" cambia de forma si la palabra es plural en inglés.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"The" ändert seine Form, wenn das Wort im Englischen im Plural steht.', '{"type":"true_false","answer":false}'::jsonb);

-- (R3 - Omisión General/Plural)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'No se usa "the" con nombres cuando se habla en general.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"The" wird nicht mit Substantiven verwendet, wenn man im Allgemeinen spricht.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "tengo perros" se dice "I have a dogs".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um "Ich habe Hunde" zu sagen, sagt man "I have a dogs".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El artículo A/AN siempre se omite en plural.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Artikel A/AN wird im Plural immer weggelassen.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Es correcto decir "The water is essential for life" hablando en general.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Es ist korrekt, "The water is essential for life" im allgemeinen Sinne zu sagen.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "I like the cats" para hablar de que te gustan todos los gatos del mundo.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Man sagt "I like the cats", um auszudrücken, dass man alle Katzen der Welt mag.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'No se usa "the" antes de "water" si hablamos de todo el agua del mundo.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"The" wird nicht vor "water" verwendet, wenn man über alles Wasser der Welt spricht.', '{"type":"true_false","answer":true}'::jsonb);

-- (R4 - Deportes/Exclamaciones/Medidas)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se usa el artículo "the" con los deportes (ej. We play the basketball).', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Artikel "the" wird bei Sportarten verwendet (z.B. We play the basketball).', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después de "What" en exclamaciones singulares, se suele usar "A/AN".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Nach "What" in singulären Ausrufen wird normalerweise "A/AN" verwendet.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para las unidades de medida se usa el artículo "A" o "AN" (ej. 20 euros a kilo).', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Für Maßeinheiten wird der Artikel "A" oder "AN" verwendet (z.B. 20 euros a kilo).', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "I play tennis" sin poner ningún artículo delante.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Man sagt "I play tennis" ohne einen Artikel davor.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para exclamar "¡Qué gol!" se dice "What goal!" omitiendo la "a".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um "Was für ein Tor!" auszurufen, sagt man "What goal!" und lässt das "a" weg.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los juegos y deportes nunca llevan artículo "the" o "a".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Spiele und Sportarten tragen nie den Artikel "the" oder "a".', '{"type":"true_false","answer":true}'::jsonb);

-- (R5 - Primera vs Segunda mención)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Cuando mencionamos algo por primera vez, debemos usar THE.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wenn wir etwas zum ersten Mal erwähnen, müssen wir THE verwenden.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para la segunda mención de un objeto usamos THE.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Für die zweite Erwähnung eines Objekts verwenden wir THE.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"I saw a dog. The dog was big." usa correctamente los artículos.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"I saw a dog. The dog was big." verwendet die Artikel korrekt.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"I have a cat. A cat is called Luna." es correcto.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"I have a cat. A cat is called Luna." ist korrekt.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Podemos usar A/AN en la segunda mención si la palabra empieza por vocal.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir können A/AN bei der zweiten Erwähnung verwenden, wenn das Wort mit einem Vokal beginnt.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"There is an apple. The apple looks fresh." usa bien los artículos.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"There is an apple. The apple looks fresh." verwendet die Artikel richtig.', '{"type":"true_false","answer":true}'::jsonb);

END;
$seed$;
