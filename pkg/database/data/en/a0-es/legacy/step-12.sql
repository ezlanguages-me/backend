-- ============================================================
-- Seed: A0 English Path – Grammar – Formación -ED (Pasado Regular)
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
    v_ex_id UUID; 
BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 3, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Formación -ED (Pasado y Participio)', 
    'Aprende las reglas ortográficas para añadir -ed a los verbos regulares para formar el pasado simple y el participio.', 
    to_jsonb('## Grammar Lesson: Formación -ED
Para formar el pasado simple y el participio de los verbos regulares, usamos la terminación **-ed**.

##### 1. Regla General
A la gran mayoría de los verbos simplemente se les añade **-ed**.
*   *work* ➔ *worked*
*   *play* ➔ *played*

##### 2. Terminación en E
Si el verbo ya acaba en **E**, solo se agrega una **-D**.
*   *love* ➔ *loved*
*   *dance* ➔ *danced*

##### 3. Terminación en Consonante + Y
Si el verbo acaba en **Y** precedida de una consonante, se quita la Y y se agrega **-IED**.
*   *study* ➔ *studied*
*   *carry* ➔ *carried*

##### 4. Doblar la Consonante Final
Para verbos cortos de una sílaba que acaban en vocal + consonante, se **duplica la consonante** y se agrega **-ED**.
*   *stop* ➔ *stopped*
*   *plan* ➔ *planned*'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
-- Regla 1: Regla General (-ed)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Regla General (-ed)', 'A la mayoría de verbos solo debes añadir -ed directamente (ej. work -> worked).');

-- Regla 2: Ortografía (Termina en E)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Ortografía: Termina en E', 'Si el verbo termina en E, solamente tienes que añadir una "d" (ej. love -> loved).');

-- Regla 3: Ortografía (Termina en Consonante + Y)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Ortografía: Consonante + Y', 'Si el verbo acaba en Y tras una consonante, quita la Y y añade -ied (ej. study -> studied).');

-- Regla 4: Ortografía (Doblar consonante final)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Ortografía: Doblar Consonante', 'En verbos cortos que terminan en vocal+consonante, dobla la consonante final antes de añadir -ed (ej. stop -> stopped).');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 20 Ejercicios
-- ==============================================================================

-- (R1 - General)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "work".', '{"type":"typing","correct_answers":["worked"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "play".', '{"type":"typing","correct_answers":["played"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "watch".', '{"type":"typing","correct_answers":["watched"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "wash".', '{"type":"typing","correct_answers":["washed"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "jump".', '{"type":"typing","correct_answers":["jumped"],"case_sensitive":false}'::jsonb);

-- (R2 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "love".', '{"type":"typing","correct_answers":["loved"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "dance".', '{"type":"typing","correct_answers":["danced"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "like".', '{"type":"typing","correct_answers":["liked"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "arrive".', '{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "bake".', '{"type":"typing","correct_answers":["baked"],"case_sensitive":false}'::jsonb);

-- (R3 - Consonante + Y)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "study".', '{"type":"typing","correct_answers":["studied"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "carry".', '{"type":"typing","correct_answers":["carried"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "cry".', '{"type":"typing","correct_answers":["cried"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "try".', '{"type":"typing","correct_answers":["tried"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "copy".', '{"type":"typing","correct_answers":["copied"],"case_sensitive":false}'::jsonb);

-- (R4 - Doblar Consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "stop".', '{"type":"typing","correct_answers":["stopped"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "plan".', '{"type":"typing","correct_answers":["planned"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "grab".', '{"type":"typing","correct_answers":["grabbed"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "drop".', '{"type":"typing","correct_answers":["dropped"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el pasado de "hug".', '{"type":"typing","correct_answers":["hugged"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 20 Ejercicios
-- ==============================================================================

-- (R1 - General)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el pasado correcto de "work"?', '{"type":"multiple_choice","options":["worked","workked","workied"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se forma el pasado de "play"?', '{"type":"multiple_choice","options":["plaied","played","playyed"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "watch":', '{"type":"multiple_choice","options":["watchied","watchhed","watched"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "wash":', '{"type":"multiple_choice","options":["washhed","washed","washied"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el pasado correcto de "jump"?', '{"type":"multiple_choice","options":["jumped","jumpped","jumpied"],"answer":0}'::jsonb);

-- (R2 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el pasado de "love"?', '{"type":"multiple_choice","options":["loveed","loved","lovied"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "dance":', '{"type":"multiple_choice","options":["danced","danceed","dancced"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es la forma correcta de "like"?', '{"type":"multiple_choice","options":["likeed","likied","liked"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se forma el pasado de "arrive"?', '{"type":"multiple_choice","options":["arriveed","arrived","arrivied"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "bake":', '{"type":"multiple_choice","options":["baked","bakeed","bakied"],"answer":0}'::jsonb);

-- (R3 - Consonante + Y)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el pasado de "study"?', '{"type":"multiple_choice","options":["studyed","studyied","studied"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "carry":', '{"type":"multiple_choice","options":["carryed","carried","carriyed"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el pasado correcto de "cry"?', '{"type":"multiple_choice","options":["cried","cryed","cryied"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "try":', '{"type":"multiple_choice","options":["tryed","tryied","tried"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se forma el pasado de "copy"?', '{"type":"multiple_choice","options":["copyed","copied","coppied"],"answer":1}'::jsonb);

-- (R4 - Doblar Consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el pasado de "stop"?', '{"type":"multiple_choice","options":["stoped","stopped","stoppied"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "plan":', '{"type":"multiple_choice","options":["planned","planed","plannied"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el pasado correcto de "grab"?', '{"type":"multiple_choice","options":["grabed","grabyed","grabbed"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el pasado de "drop":', '{"type":"multiple_choice","options":["droped","dropped","droppeid"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se forma el pasado de "hug"?', '{"type":"multiple_choice","options":["hugged","huged","huggied"],"answer":0}'::jsonb);


-- ==============================================================================
-- TIPO 3: REFUERZO MIXTO (Sin Scramble) - 20 Ejercicios
-- ==============================================================================

-- (R1 - General)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: He ___ yesterday.', '{"type":"typing","correct_answers":["worked"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Nosotros jugamos al fútbol."', '{"type":"multiple_choice","options":["We played football.","We play football.","We plaied football."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: I ___ TV.', '{"type":"typing","correct_answers":["watched"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Ella lavó el coche."', '{"type":"multiple_choice","options":["She washed the car.","She washd the car.","She washied the car."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta es "They jumpied high."', '{"type":"true_false","answer":false}'::jsonb);

-- (R2 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: She ___ yesterday.', '{"type":"typing","correct_answers":["danced"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Él amaba a su perro."', '{"type":"multiple_choice","options":["He loved his dog.","He loveed his dog.","He loveded his dog."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: We ___ late.', '{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Yo horneé un pastel."', '{"type":"multiple_choice","options":["I baked a cake.","I bakeed a cake.","I bakied a cake."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta es "They likeed the movie."', '{"type":"true_false","answer":false}'::jsonb);

-- (R3 - Consonante + Y)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: He ___ math.', '{"type":"typing","correct_answers":["studied"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Ella llevó la bolsa."', '{"type":"multiple_choice","options":["She carried the bag.","She carryed the bag.","She carryied the bag."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: The baby ___ a lot.', '{"type":"typing","correct_answers":["cried"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Nosotros lo intentamos de nuevo."', '{"type":"multiple_choice","options":["We tried again.","We tryed again.","We tryied again."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta es "I copyed the notes."', '{"type":"true_false","answer":false}'::jsonb);

-- (R4 - Doblar Consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: The bus ___.', '{"type":"typing","correct_answers":["stopped"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Ellos planearon un viaje."', '{"type":"multiple_choice","options":["They planned a trip.","They planed a trip.","They plannied a trip."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Completa: He ___ the glass.', '{"type":"typing","correct_answers":["dropped"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige la frase correcta para "Ella abrazó a su madre."', '{"type":"multiple_choice","options":["She hugged her mother.","She huged her mother.","She huggied her mother."],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La forma correcta es "We grabed the bags."', '{"type":"true_false","answer":false}'::jsonb);


-- ==============================================================================
-- TIPO 4: TRUE/FALSE (Verdadero o Falso) - 20 Ejercicios
-- ==============================================================================

-- (R1 - General)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado regular de "work" es "workked".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A la gran mayoría de los verbos simplemente se les añade -ed al final.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "watch" se escribe "watched".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "jump" es "jumpied".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "play" es "played", ya que cumple la regla general.', '{"type":"true_false","answer":true}'::jsonb);

-- (R2 - Termina en E)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para transformar "love" en pasado, solo hay que agregar una "d".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "dance" se escribe "danceed".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "bake" es "baked".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A todos los verbos terminados en "E" se les dobla la vocal (ej: likeed).', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "arrive" se escribe "arrived".', '{"type":"true_false","answer":true}'::jsonb);

-- (R3 - Consonante + Y)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "study" se escribe "studyed".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Cuando el verbo acaba en Y precedida de consonante, la Y cambia por IED.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "carry" es "carried".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "cry" es "cryed".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "try" se escribe "tried".', '{"type":"true_false","answer":true}'::jsonb);

-- (R4 - Doblar Consonante)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "stop" se escribe "stoped".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El verbo "plan" en pasado se escribe "planned", con doble N.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'En verbos cortos que terminan en vocal+consonante, nunca se dobla la consonante final.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "drop" es "dropped".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El pasado de "grab" se escribe "grabed".', '{"type":"true_false","answer":false}'::jsonb);

END $$;