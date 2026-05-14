-- ============================================================
-- Seed: A0 English Path – Grammar – Artículos (THE, A, AN)
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
VALUES (v_path_id, 4, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Artículos: THE, A, AN (y omisión)', 
    'Aprende a diferenciar cuándo utilizar artículos definidos, indefinidos, o cuándo omitirlos por completo en inglés.', 
    to_jsonb('## Grammar Lesson: Artículos (THE, A, AN)

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

-- 3. Insertar las 4 Reglas Gramaticales
-- Regla 1: A / AN y Profesiones
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'A / AN y Profesiones', 'Recuerda: usa "a" antes de consonante, "an" antes de vocal, y ponlos siempre delante de las profesiones (ej. I am a doctor).');

-- Regla 2: THE e Instrumentos
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'THE e Instrumentos', 'Utiliza "the" para objetos concretos y siempre delante de instrumentos musicales (ej. play the piano).');

-- Regla 3: Omisión (General y Plurales)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Omisión en General y Plurales', 'No uses "the" para hablar de conceptos generales (Water is essential) ni uses "a/an" para palabras en plural.');

-- Regla 4: Deportes, Exclamaciones y Medidas
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Deportes, Exclamaciones y Medidas', 'No pongas artículo con deportes (play basketball), pero usa "a" o "an" en medidas (a kilo) y tras "What" (What a goal!).');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - A / AN / Profesiones)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ doctor.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I want to eat ___ apple.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He drives ___ red car.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My father is ___ architect.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'This is ___ good book.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ teacher.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I need ___ umbrella.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);

-- (R2 - THE / Instrumentos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I can play ___ piano.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ dog in my house is black.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She plays ___ guitar.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Look at ___ moon.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ sun is hot today.', '{"type":"typing","correct_answers":["The"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Let''s open ___ window.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'The book is on ___ table.', '{"type":"typing","correct_answers":["the"],"case_sensitive":false}'::jsonb);

-- (R3 - Omisión General/Plural)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (The/-) water is essential for life.', '{"type":"typing","correct_answers":["Water"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I love ___ (the/-) cats in general.', '{"type":"typing","correct_answers":["cats"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have ___ (a/-) dogs at home.', '{"type":"typing","correct_answers":["dogs"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (The/-) milk is good for you.', '{"type":"typing","correct_answers":["Milk"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I buy ___ (an/-) apples every day.', '{"type":"typing","correct_answers":["apples"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (The/-) love is beautiful.', '{"type":"typing","correct_answers":["Love"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'People need ___ (a/-) sleep.', '{"type":"typing","correct_answers":["sleep"],"case_sensitive":false}'::jsonb);

-- (R4 - Deportes/Exclamaciones/Medidas)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We like ___ (the/-) basketball.', '{"type":"typing","correct_answers":["basketball"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ goal!', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It costs 20 euros ___ kilo.', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I play ___ (the/-) tennis.', '{"type":"typing","correct_answers":["tennis"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ beautiful day!', '{"type":"typing","correct_answers":["a"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They play ___ (a/-) football.', '{"type":"typing","correct_answers":["football"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We drive 100 miles ___ hour.', '{"type":"typing","correct_answers":["an"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - A / AN / Profesiones)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I want ___ orange.', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'My brother is ___ engineer.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is ___ teacher.', '{"type":"multiple_choice","options":["a","an","the"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'It is ___ umbrella.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We saw ___ movie yesterday.', '{"type":"multiple_choice","options":["a","an","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is ___ pilot.', '{"type":"multiple_choice","options":["a","an","the"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have ___ idea.', '{"type":"multiple_choice","options":["an","a","-"],"answer":0}'::jsonb);

-- (R2 - THE / Instrumentos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I can play ___ violin.', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ car parked outside is mine.', '{"type":"multiple_choice","options":["The","A","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Did you feed ___ cat?', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Where is ___ kitchen?', '{"type":"multiple_choice","options":["the","a","an"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He plays ___ drums very well.', '{"type":"multiple_choice","options":["the","a","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She is in ___ hospital (como paciente).', '{"type":"multiple_choice","options":["-","the","a"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Can you close ___ door?', '{"type":"multiple_choice","options":["the","a","an"],"answer":0}'::jsonb);

-- (R3 - Omisión General/Plural)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is essential for life.', '{"type":"multiple_choice","options":["Water","The water","A water"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Do you like ___ ?', '{"type":"multiple_choice","options":["cats","the cats","a cats"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ is blind.', '{"type":"multiple_choice","options":["Love","The love","A love"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I have ___ in my house.', '{"type":"multiple_choice","options":["dogs","a dogs","the dogs"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'People need ___ .', '{"type":"multiple_choice","options":["sleep","the sleep","a sleep"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ are good pets.', '{"type":"multiple_choice","options":["Dogs","The dogs","A dog"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She drinks ___ every morning.', '{"type":"multiple_choice","options":["coffee","the coffee","a coffee"],"answer":0}'::jsonb);

-- (R4 - Deportes/Exclamaciones/Medidas)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'We play ___ on Sundays.', '{"type":"multiple_choice","options":["basketball","the basketball","a basketball"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ surprise!', '{"type":"multiple_choice","options":["a","the","-"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Three euros ___ kilo.', '{"type":"multiple_choice","options":["a","the","an"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'He is very good at ___ .', '{"type":"multiple_choice","options":["tennis","the tennis","a tennis"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'What ___ amazing car!', '{"type":"multiple_choice","options":["an","a","the"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'They like to play ___ .', '{"type":"multiple_choice","options":["football","the football","a football"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'She runs 5 miles ___ day.', '{"type":"multiple_choice","options":["a","the","an"],"answer":0}'::jsonb);


-- ==============================================================================
-- TIPO 3: TRUE/FALSE (Verdadero o Falso) - 24 Ejercicios (6 por regla)
-- ==============================================================================

-- (R1 - A / AN / Profesiones)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se usa "A" delante de palabras que empiezan por sonido vocálico.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "soy doctor" lo correcto es "I am doctor".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "an apple" porque la palabra empieza por vocal.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Es correcto decir "a car".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se usa "AN" para profesiones que empiezan por consonante como teacher.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '"A teacher" es gramaticalmente correcto.', '{"type":"true_false","answer":true}'::jsonb);

-- (R2 - THE / Instrumentos)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Delante de instrumentos musicales se usa el artículo "the".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "toco la guitarra" usamos "play guitar" sin artículo.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "I play a piano".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Usamos "the" para referirnos a objetos muy específicos.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "The dog is black" se refiere a un perro concreto.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '"The" cambia de forma si la palabra es plural en inglés.', '{"type":"true_false","answer":false}'::jsonb);

-- (R3 - Omisión General/Plural)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'No se usa "the" con nombres cuando se habla en general.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "tengo perros" se dice "I have a dogs".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El artículo A/AN siempre se omite en plural.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Es correcto decir "The water is essential for life" hablando en general.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "I like the cats" para hablar de que te gustan todos los gatos del mundo.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'No se usa "the" antes de "water" si hablamos de todo el agua del mundo.', '{"type":"true_false","answer":true}'::jsonb);

-- (R4 - Deportes/Exclamaciones/Medidas)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se usa el artículo "the" con los deportes (ej. We play the basketball).', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Después de "What" en exclamaciones singulares, se suele usar "A/AN".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para las unidades de medida se usa el artículo "A" o "AN" (ej. 20 euros a kilo).', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Se dice "I play tennis" sin poner ningún artículo delante.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para exclamar "¡Qué gol!" se dice "What goal!" omitiendo la "a".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los juegos y deportes nunca llevan artículo "the" o "a".', '{"type":"true_false","answer":true}'::jsonb);

END $$;