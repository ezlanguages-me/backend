-- ============================================================
-- Seed: A0 English Path – Grammar – Formación del Plural
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
VALUES (v_path_id, 5, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Formación del Plural', 
    'Aprende las reglas ortográficas fundamentales y las excepciones irregulares para formar el plural de los sustantivos en inglés.', 
    to_jsonb('## Grammar Lesson: Formación del Plural
En inglés, el plural de los sustantivos se forma generalmente añadiendo una "S", pero existen varias reglas ortográficas importantes y algunas excepciones irregulares que cambian la palabra por completo.

##### 1. Regla General y terminación en O
*   **Resto de palabras:** A la gran mayoría se les agrega **-S**.
    *   *book* ➔ *books*
    *   *table* ➔ *tables*
*   **Terminadas en O:** Agregan **-ES** o **-S**.
    *   *domino* ➔ *dominoes* / *dominos*
    *   *hero* ➔ *heroes* / *heros*

##### 2. Terminaciones en S, X, Z, CH o SH
Si la palabra termina en estos sonidos, se añade **-ES**.
*   *box* ➔ *boxes*
*   *watch* ➔ *watches*

##### 3. Terminaciones en Y, F, FE o FF
*   **Consonante + Y:** Se cambia la Y por **-IES**.
    *   *city* ➔ *cities*
    *   *baby* ➔ *babies*
*   **Acaba en F, FE o FF:** Se cambia por **-VES**.
    *   *knife* ➔ *knives*
    *   *half* ➔ *halves*

##### 4. Plurales Irregulares
No siguen las reglas de la "S" y cambian su forma por completo. ¡Debes memorizarlos!
*   *man* ➔ *men*
*   *woman* ➔ *women*
*   *child* ➔ *children*
*   *person* ➔ *people*
*   *tooth* ➔ *teeth*
*   *foot* ➔ *feet*
*   *mouse* ➔ *mice*'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
-- Regla 1: Regla General y terminación en O
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Regla General y terminación en O', 'A la mayoría de palabras se les añade -S (book -> books). Si acaban en O, suelen agregar -ES (hero -> heroes).');

-- Regla 2: Sibilantes (S, X, Z, CH, SH)
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Terminaciones en S, X, Z, CH o SH', 'Si la palabra termina en s, x, z, ch o sh, debes añadir -ES para formar el plural (ej. box -> boxes).');

-- Regla 3: Terminaciones en Y, F, FE
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Terminaciones Y, F, FE', 'Si acaba en consonante+Y, cambia a -IES (baby->babies). Si acaba en F/FE, cambia a -VES (knife->knives).');

-- Regla 4: Plurales Irregulares
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Plurales Irregulares', 'Recuerda que estas palabras cambian por completo: man->men, child->children, person->people, tooth->teeth.');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - General y terminación en O)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "book".', '{"type":"typing","correct_answers":["books"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "table".', '{"type":"typing","correct_answers":["tables"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "car".', '{"type":"typing","correct_answers":["cars"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "pen".', '{"type":"typing","correct_answers":["pens"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "hero".', '{"type":"typing","correct_answers":["heroes","heros"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "domino".', '{"type":"typing","correct_answers":["dominoes","dominos"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "apple".', '{"type":"typing","correct_answers":["apples"],"case_sensitive":false}'::jsonb);

-- (R2 - S, X, Z, CH, SH)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "box".', '{"type":"typing","correct_answers":["boxes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "watch".', '{"type":"typing","correct_answers":["watches"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "bus".', '{"type":"typing","correct_answers":["buses"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "class".', '{"type":"typing","correct_answers":["classes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "brush".', '{"type":"typing","correct_answers":["brushes"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "match".', '{"type":"typing","correct_answers":["matches"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "fox".', '{"type":"typing","correct_answers":["foxes"],"case_sensitive":false}'::jsonb);

-- (R3 - Y, F, FE)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "city".', '{"type":"typing","correct_answers":["cities"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "baby".', '{"type":"typing","correct_answers":["babies"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "knife".', '{"type":"typing","correct_answers":["knives"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "half".', '{"type":"typing","correct_answers":["halves"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "lady".', '{"type":"typing","correct_answers":["ladies"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "wife".', '{"type":"typing","correct_answers":["wives"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "leaf".', '{"type":"typing","correct_answers":["leaves"],"case_sensitive":false}'::jsonb);

-- (R4 - Irregulares)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "man".', '{"type":"typing","correct_answers":["men"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "woman".', '{"type":"typing","correct_answers":["women"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "child".', '{"type":"typing","correct_answers":["children"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "person".', '{"type":"typing","correct_answers":["people"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "tooth".', '{"type":"typing","correct_answers":["teeth"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "foot".', '{"type":"typing","correct_answers":["feet"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Escribe el plural de "mouse".', '{"type":"typing","correct_answers":["mice"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - General y terminación en O)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "book"?', '{"type":"multiple_choice","options":["books","bookes","bookies"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "table"?', '{"type":"multiple_choice","options":["tablees","tables","tabls"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural de "hero":', '{"type":"multiple_choice","options":["heroes","heries","hereos"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "car"?', '{"type":"multiple_choice","options":["cars","cares","carries"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "domino"?', '{"type":"multiple_choice","options":["dominoes","dominies","domin"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural correcto de "pen":', '{"type":"multiple_choice","options":["pennes","pens","penes"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "apple"?', '{"type":"multiple_choice","options":["apples","applees","applys"],"answer":0}'::jsonb);

-- (R2 - S, X, Z, CH, SH)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "box"?', '{"type":"multiple_choice","options":["boxs","boxes","boxies"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "watch"?', '{"type":"multiple_choice","options":["watchs","watchies","watches"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural de "bus":', '{"type":"multiple_choice","options":["buses","bus","busies"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "class"?', '{"type":"multiple_choice","options":["classs","classes","class"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "brush"?', '{"type":"multiple_choice","options":["brushes","brushs","brushies"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural de "match":', '{"type":"multiple_choice","options":["mathces","matchs","matches"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "fox"?', '{"type":"multiple_choice","options":["foxes","foxs","foxxes"],"answer":0}'::jsonb);

-- (R3 - Y, F, FE)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "city"?', '{"type":"multiple_choice","options":["cityes","citys","cities"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "baby"?', '{"type":"multiple_choice","options":["babies","babys","babyes"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural de "knife":', '{"type":"multiple_choice","options":["knifes","knives","knivs"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "half"?', '{"type":"multiple_choice","options":["halfs","halfes","halves"],"answer":2}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "lady"?', '{"type":"multiple_choice","options":["ladys","ladies","ladyes"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural de "wife":', '{"type":"multiple_choice","options":["wives","wifes","wiffes"],"answer":0}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "leaf"?', '{"type":"multiple_choice","options":["leafs","leaffs","leaves"],"answer":2}'::jsonb);

-- (R4 - Irregulares)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "man"?', '{"type":"multiple_choice","options":["mans","men","mens"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "woman"?', '{"type":"multiple_choice","options":["womans","women","womens"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural de "child":', '{"type":"multiple_choice","options":["childs","children","childrens"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "person"?', '{"type":"multiple_choice","options":["persons","people","peoples"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cómo se escribe el plural de "tooth"?', '{"type":"multiple_choice","options":["tooths","teeth","teeths"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el plural de "foot":', '{"type":"multiple_choice","options":["foots","feet","feets"],"answer":1}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '¿Cuál es el plural de "mouse"?', '{"type":"multiple_choice","options":["mouses","mice","mices"],"answer":1}'::jsonb);


-- ==============================================================================
-- TIPO 3: TRUE/FALSE (Verdadero o Falso) - 24 Ejercicios (6 por regla)
-- ==============================================================================

-- (R1 - General y terminación en O)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "book" es "bookes".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A la mayoría de las palabras simplemente se les añade "-s".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "hero" se escribe "heroes".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "table" es "tables".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Las palabras que acaban en "o" siempre cambian la vocal a "i" (ej: heries).', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Heros" es también una forma ortográfica aceptada para el plural de "hero".', '{"type":"true_false","answer":true}'::jsonb);

-- (R2 - S, X, Z, CH, SH)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Si una palabra termina en X, añadimos -es para su plural.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "box" es "boxs".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "watch" se escribe "watches".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'A las palabras terminadas en CH se les añade solo una -s.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "class" es "classes".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Las palabras que terminan en SH agregan -es para formar el plural (ej: brushes).', '{"type":"true_false","answer":true}'::jsonb);

-- (R3 - Y, F, FE)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Si una palabra termina en consonante + Y, la Y se cambia por -ies.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "baby" es "babys".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "city" es "cities".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Si una palabra termina en F o FE, cambiamos esa terminación por -ves.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "knife" es "knifes".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "half" es "halves".', '{"type":"true_false","answer":true}'::jsonb);

-- (R4 - Irregulares)
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "man" se escribe "mans".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "child" es "children".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "person" es "people".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "tooth" es "teeth".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El plural de "mouse" se escribe "mouses".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (grammar_id, grammar_rule_id) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_id, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los plurales irregulares cambian su forma por completo en lugar de añadir -s o -es.', '{"type":"true_false","answer":true}'::jsonb);

END $$;