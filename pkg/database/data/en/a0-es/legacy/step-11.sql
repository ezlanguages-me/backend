-- ============================================================
-- Seed: A0 English Path – Grammar – Formación -ing (Gerundio)
-- Source language: Spanish
-- ============================================================
DO $$ 
DECLARE 
    v_path_id UUID; 
    v_grammar1_id UUID; 
    v_rule1_id UUID; 
    v_rule2_id UUID; 
    v_rule3_id UUID; 
    v_rule4_id UUID; 
    v_rule5_id UUID; 
    v_rule6_id UUID; 
    v_ex_id UUID; 
BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 2, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Formación -ING (Gerundio)', 
    'Aprende a formar el gerundio separando sus reglas ortográficas, y cuándo utilizarlo correctamente como sustantivo o después de ciertos verbos.', 
    to_jsonb('## Grammar Lesson: Formación -ING (Gerundio)
El gerundio en inglés actúa como un sustantivo y se forma agregando la terminación **-ing** al verbo.

##### 1. Reglas Ortográficas de Formación
Existen tres reglas principales para convertir un verbo en gerundio:
*   **Acaba en E precedida de consonante:** Se quita la E y se agrega -ing.
    *   *take* ➔ *taking*
    *   *make* ➔ *making*
*   **Una sílaba acabada en consonante:** Se dobla la consonante final y se agrega -ing.
    *   *get* ➔ *getting*
    *   *run* ➔ *running*
*   **El resto de verbos:** Se agrega -ing directamente.
    *   *walk* ➔ *walking*
    *   *talk* ➔ *talking*

##### 2. Después de Verbos de Actitud / Preferencia
Se utiliza el gerundio después de verbos que expresan gustos, disgustos o actitud (love, hate, detest, dread, like, feel, fear, enjoy).
*   *I like playing tennis.* (Me gusta jugar al tenis).

##### 3. Como Sujeto de la Frase y en Prohibiciones
El gerundio a menudo es el sujeto principal de la oración. Además, se usa después de la palabra "NO" para prohibiciones generales.
*   **Sujeto:** *Smoking is bad for you.* (Fumar es malo para ti).
*   **Prohibición:** *No smoking.* (Prohibido fumar).

##### 4. Después de Preposiciones y Verbos Específicos
*   **Preposiciones:** Siempre que haya un verbo después de una preposición (in, at, for, etc.), debe ir en -ing.
    *   *I''m interested in learning.*
*   **Verbos Específicos:** Verbos como ADMIT, DENY, AVOID, BE WORTH, BUSY, GO, SUGGEST, REGRET obligan a usar el siguiente verbo con -ing.
    *   *He avoided talking to the reporters.*
    *   *Let''s go shopping.*'::text)
);

-- 3. Insertar las 6 Reglas Gramaticales
-- Regla 1: Ortografía (Termina en E)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Ortografía: Termina en E', 'Cuando el verbo termina en E precedida de consonante, quita la E y agrega -ing (ej. make -> making).');

-- Regla 2: Ortografía (Doblar consonante)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Ortografía: Doblar consonante', 'En verbos de una sílaba que terminan en consonante, dobla la consonante final antes de añadir -ing (ej. run -> running).');

-- Regla 3: Ortografía (El resto)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Ortografía: Resto de verbos', 'Para la mayoría de verbos solo debes añadir -ing directamente (ej. walk -> walking).');

-- Regla 4: Verbos de Actitud
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Verbos de Actitud', 'Después de verbos como like, love, hate o enjoy, el siguiente verbo suele ir con terminación -ing (ej. I like playing).');

-- Regla 5: Sujeto y Prohibiciones
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Sujeto y Prohibiciones', 'Cuando una acción es el sujeto (Smoking is bad) o se usa tras "No" (No smoking), usa el gerundio.');

-- Regla 6: Preposiciones y Verbos Específicos
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule6_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule6_id, 'es', 'Preposiciones y Verbos Específicos', 'Utiliza el gerundio después de preposiciones (in, of, for) y verbos como avoid, suggest o go (ej. go shopping).');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 20 Ejercicios
-- ==============================================================================

-- (R1 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "take".', '{"type":"typing","correct_answers":["taking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "make".', '{"type":"typing","correct_answers":["making"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "dance".', '{"type":"typing","correct_answers":["dancing"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "write".', '{"type":"typing","correct_answers":["writing"],"case_sensitive":false}'::jsonb);

-- (R2 - Dobla consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "run".', '{"type":"typing","correct_answers":["running"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "get".', '{"type":"typing","correct_answers":["getting"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "stop".', '{"type":"typing","correct_answers":["stopping"],"case_sensitive":false}'::jsonb);

-- (R3 - Resto de verbos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "walk".', '{"type":"typing","correct_answers":["walking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "talk".', '{"type":"typing","correct_answers":["talking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el gerundio de "play".', '{"type":"typing","correct_answers":["playing"],"case_sensitive":false}'::jsonb);

-- (R4 - Actitud)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I like ___ (play) tennis.', '{"type":"typing","correct_answers":["playing"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She loves ___ (read).', '{"type":"typing","correct_answers":["reading"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They hate ___ (wait).', '{"type":"typing","correct_answers":["waiting"],"case_sensitive":false}'::jsonb);

-- (R5 - Sujeto/Prohibición)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (smoke) is bad for you.', '{"type":"typing","correct_answers":["Smoking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (swim) is a good exercise.', '{"type":"typing","correct_answers":["Swimming"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'No ___ (smoke) here.', '{"type":"typing","correct_answers":["smoking"],"case_sensitive":false}'::jsonb);

-- (R6 - Preposiciones/Específicos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I am interested in ___ (learn).', '{"type":"typing","correct_answers":["learning"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The politician avoided ___ (talk).', '{"type":"typing","correct_answers":["talking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Let''s go ___ (shop).', '{"type":"typing","correct_answers":["shopping"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I suggest ___ (go) to the cinema.', '{"type":"typing","correct_answers":["going"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 20 Ejercicios
-- ==============================================================================

-- (R1 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el gerundio correcto de "take"?', '{"type":"multiple_choice","options":["taking","takeing","takking"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se forma el gerundio de "make"?', '{"type":"multiple_choice","options":["makeing","makking","making"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el gerundio de "dance":', '{"type":"multiple_choice","options":["dancing","danceing","danccing"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el gerundio de "write":', '{"type":"multiple_choice","options":["writeing","writing","writting"],"answer":1}'::jsonb);

-- (R2 - Dobla consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el gerundio de "run"?', '{"type":"multiple_choice","options":["runing","running","runingg"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el gerundio de "get":', '{"type":"multiple_choice","options":["getting","geting","geteing"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la forma correcta de "stop"?', '{"type":"multiple_choice","options":["stopeing","stoping","stopping"],"answer":2}'::jsonb);

-- (R3 - Resto de verbos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el gerundio de "walk"?', '{"type":"multiple_choice","options":["walking","walkking","walkeing"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el gerundio de "talk":', '{"type":"multiple_choice","options":["talkking","talkeing","talking"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el gerundio de "play"?', '{"type":"multiple_choice","options":["playying","playing","plaing"],"answer":1}'::jsonb);

-- (R4 - Actitud)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I like ___ tennis.', '{"type":"multiple_choice","options":["playing","play","to playing"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She loves ___ books.', '{"type":"multiple_choice","options":["read","to reading","reading"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They hate ___.', '{"type":"multiple_choice","options":["wait","waiting","to waiting"],"answer":1}'::jsonb);

-- (R5 - Sujeto/Prohibición)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is bad for you.', '{"type":"multiple_choice","options":["To smoking","Smoking","Smoke"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Prohibición en cartel: No ___.', '{"type":"multiple_choice","options":["smoke","to smoke","smoking"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is a good exercise.', '{"type":"multiple_choice","options":["Swimming","Swim","To swimming"],"answer":0}'::jsonb);

-- (R6 - Preposiciones/Específicos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I am interested in ___.', '{"type":"multiple_choice","options":["learn","learning","to learn"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He avoided ___ to the reporters.', '{"type":"multiple_choice","options":["talking","talk","to talking"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Let''s go ___ today.', '{"type":"multiple_choice","options":["shop","to shop","shopping"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I suggest ___ to the cinema.', '{"type":"multiple_choice","options":["go","going","to going"],"answer":1}'::jsonb);


-- ==============================================================================
-- TIPO 3: REFUERZO MIXTO (Sin Scramble) - 20 Ejercicios
-- ==============================================================================

-- (R1 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: He is ___ coffee.', '{"type":"typing","correct_answers":["making"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la traducción correcta de "Ella está tomando una foto."', '{"type":"multiple_choice","options":["She is taking a photo.","She is take a photo.","She taking is a photo."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: We are ___.', '{"type":"typing","correct_answers":["dancing"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "They are writing." es correcta.', '{"type":"true_false","answer":true}'::jsonb);

-- (R2 - Dobla consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Ellos están corriendo rápido."', '{"type":"multiple_choice","options":["They are running fast.","They are run fast.","They running are fast."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: She is ___ ready.', '{"type":"typing","correct_answers":["getting"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "The bus is stoping." es correcta.', '{"type":"true_false","answer":false}'::jsonb);

-- (R3 - Resto de verbos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: We are ___ now.', '{"type":"typing","correct_answers":["walking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Ellos están hablando."', '{"type":"multiple_choice","options":["They are talking.","They talking are.","They are talk."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "I am reading a book." es correcta.', '{"type":"true_false","answer":true}'::jsonb);

-- (R4 - Actitud)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Me gusta jugar al tenis."', '{"type":"multiple_choice","options":["I like playing tennis.","I like play tennis.","I like to playing tennis."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: She loves ___ books.', '{"type":"typing","correct_answers":["reading"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "He hates waiting." es correcta.', '{"type":"true_false","answer":true}'::jsonb);

-- (R5 - Sujeto/Prohibición)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: No ___ here.', '{"type":"typing","correct_answers":["smoking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el cartel correcto para "Prohibido fumar aquí."', '{"type":"multiple_choice","options":["No smoking here.","No smoke here.","Don''t smoking here."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "Swimming is a good exercise." es correcta.', '{"type":"true_false","answer":true}'::jsonb);

-- (R6 - Preposiciones/Específicos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Estoy interesado en aprender."', '{"type":"multiple_choice","options":["I am interested in learning.","I am interested in learn.","I am interested to learning."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: He avoided ___.', '{"type":"typing","correct_answers":["talking"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "Let''s go shopping." es correcta.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la opción correcta: I suggest ___ to the cinema.', '{"type":"multiple_choice","options":["going","go","to going"],"answer":0}'::jsonb);


-- ==============================================================================
-- TIPO 4: TRUE/FALSE (Verdadero o Falso) - 20 Ejercicios
-- ==============================================================================

-- (R1 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El gerundio de "take" se escribe "takeing".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El gerundio de "make" se escribe "making" quitando la e.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Al transformar "dance", se quita la "e" y queda "dancing".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El gerundio de "write" es "writting" con doble t.', '{"type":"true_false","answer":false}'::jsonb);

-- (R2 - Dobla consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El gerundio de "run" es "running" doblando la consonante.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El gerundio de "get" se escribe "geting".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para "stop" se dobla la P formando "stopping".', '{"type":"true_false","answer":true}'::jsonb);

-- (R3 - Resto de verbos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El gerundio de "walk" se escribe "walkking" con doble k.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El gerundio de "talk" es "talking".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A la mayoría de verbos solo se les añade -ing directamente (ej: playing).', '{"type":"true_false","answer":true}'::jsonb);

-- (R4 - Actitud)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después del verbo "like", es correcto usar la terminación -ing.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "She loves to reading" es correcta.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '"He hates wait" usa correctamente el verbo.', '{"type":"true_false","answer":false}'::jsonb);

-- (R5 - Sujeto/Prohibición)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Smoking is bad for you" utiliza el gerundio como sujeto.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En los carteles de prohibición se usa "No smoke".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Un gerundio (con terminación -ing) puede ser el sujeto principal de la oración.', '{"type":"true_false","answer":true}'::jsonb);

-- (R6 - Preposiciones/Específicos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Debemos usar -ing después de preposiciones como "in" o "for".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "I suggest to go" es la más correcta.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Es correcto decir "go shopping" en inglés.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule6_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después del verbo "avoid" (evitar), el siguiente verbo se escribe en infinitivo.', '{"type":"true_false","answer":false}'::jsonb);

END $$;