-- ============================================================
-- Seed: A0 English Path – STEP 140 – Grammar – Demostrativos (This, That, These, Those)
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
VALUES (v_path_id, 140, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Los Demostrativos', 
    '', 
    to_jsonb('## Los Demostrativos
Los demostrativos en inglés indican la distancia (cercana o lejana) a la que se encuentra el objeto o persona de quien habla. Además, cambian dependiendo de si nos referimos a algo en singular o en plural.

##### 1. THIS (Singular, Cerca)
Significa "este, esta, esto". Se utiliza cuando el objeto que se menciona es uno solo y está **cercano**.
*   *This car is green.* (Este coche es verde).

##### 2. THESE (Plural, Cerca)
Significa "estos, estas". Se utiliza cuando los objetos que se mencionan son varios (plural) y están **cercanos**.
*   *These apples are not good.* (Estas manzanas no son buenas).

##### 3. THAT (Singular, Lejos)
Significa "ese, esa, eso, aquel, aquella, aquello". Se utiliza cuando el objeto es uno solo y está o se percibe **lejano**.
*   *That is my house.* (Esa es mi casa).

##### 4. THOSE (Plural, Lejos)
Significa "esos, esas, aquellos, aquellas". Se utiliza cuando los objetos son varios (plural) y están o se perciben **lejanos**.
*   *Look at those birds.* (Mira a esos pájaros).

##### 5. THIS/THAT como Pronombres
Los demostrativos también se usan **solos, sin sustantivo**, especialmente en presentaciones y por teléfono.
*   **Presentaciones:** Usamos *This is...* / *These are...* para presentar a alguien.
    *   *This is my friend Ana.* (Esta es mi amiga Ana).
    *   *These are my parents.* (Estos son mis padres).
*   **Por teléfono:** Para identificarse se usa *This is...*; para preguntar por alguien, *Is that...?*
    *   *Hello, this is Carlos speaking.* (Hola, habla Carlos).
    *   *Is that Maria?* (¿Es María?/¿Habla con María?).'::text)
);

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
VALUES (
    v_grammar1_id,
    'de',
    'Die Demonstrativpronomen',
    '',
    to_jsonb('## Die Demonstrativpronomen
Die englischen Demonstrativpronomen zeigen die Entfernung an (nah oder fern) und ändern sich je nachdem, ob wir über etwas im Singular oder Plural sprechen.

##### 1. THIS (Singular, Nah)
Bedeutet "dieser, diese, dieses". Wird für ein einzelnes Objekt in **der Nähe** verwendet.
*   *This car is green.* (Dieses Auto ist grün).

##### 2. THESE (Plural, Nah)
Bedeutet "diese". Wird für mehrere Objekte in **der Nähe** verwendet.
*   *These apples are not good.* (Diese Äpfel sind nicht gut).

##### 3. THAT (Singular, Fern)
Bedeutet "jener, jene, jenes" oder "der/die/das da". Wird für ein einzelnes Objekt verwendet, das **weiter entfernt** ist.
*   *That is my house.* (Das ist mein Haus).

##### 4. THOSE (Plural, Fern)
Bedeutet "jene" oder "die da". Wird für mehrere Objekte verwendet, die **weiter entfernt** sind.
*   *Look at those birds.* (Schau dir die Vögel da an).

##### 5. THIS/THAT als Pronomen
Die Demonstrativpronomen können auch **allein, ohne Nomen** verwendet werden, besonders bei Vorstellungen und am Telefon.
*   **Vorstellungen:** *This is...* / *These are...* zum Vorstellen einer Person.
    *   *This is my friend Ana.* (Das ist meine Freundin Ana).
    *   *These are my parents.* (Das sind meine Eltern).
*   **Am Telefon:** Zur Identifikation: *This is...*; um nach jemandem zu fragen: *Is that...?*
    *   *Hello, this is Carlos speaking.* (Hallo, hier spricht Carlos).
    *   *Is that Maria?* (Ist das Maria?)'::text)
);

-- 3. Insertar las 5 Reglas Gramaticales
-- Regla 1: THIS
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'THIS (Singular, Cerca)', 'Usa "This" (este/esta) para referirte a un solo objeto que tienes cerca.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'de', 'THIS (Singular, Nah)', 'Verwende "This" (dieser/diese/dieses) für ein einzelnes Objekt in deiner Nähe.');

-- Regla 2: THESE
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'THESE (Plural, Cerca)', 'Usa "These" (estos/estas) para referirte a varios objetos que tienes cerca.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'de', 'THESE (Plural, Nah)', 'Verwende "These" (diese) für mehrere Objekte in deiner Nähe.');

-- Regla 3: THAT
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'THAT (Singular, Lejos)', 'Usa "That" (ese/aquel) para referirte a un solo objeto que se encuentra lejos.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'de', 'THAT (Singular, Fern)', 'Verwende "That" (jener/jene) für ein einzelnes Objekt, das weiter entfernt ist.');

-- Regla 4: THOSE
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'THOSE (Plural, Lejos)', 'Usa "Those" (esos/aquellos) para referirte a varios objetos que se encuentran lejos.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'de', 'THOSE (Plural, Fern)', 'Verwende "Those" (jene) für mehrere Objekte, die weiter entfernt sind.');

-- Regla 5: THIS/THAT como Pronombres
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'THIS/THAT como Pronombres', 'Los demostrativos pueden usarse solos. En presentaciones: "This is my friend." / "These are my parents.". Por telefono: "This is John." / "Is that Maria?"');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'de', 'THIS/THAT als Pronomen', 'Demonstrativpronomen können allein stehen. Bei Vorstellungen: "This is my friend." / "These are my parents.". Am Telefon: "This is John." / "Is that Maria?"');


-- ==============================================================================
-- TIPO 1: TYPING (Escribir la respuesta) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - THIS)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Este) car is green.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Dieser) car is green.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I like ___ (este) book.', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I like ___ (dieser) book.', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Esta) apple is good.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) apple is good.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is ___ (este) your pen?', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Is ___ (dieser) your pen?', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Look at ___ (esto).', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Look at ___ (das).', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Esta) is my mother.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) is my mother.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I bought ___ (esta) shirt.', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I bought ___ (diese) shirt.', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);

-- (R2 - THESE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Estas) apples are not good.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) apples are not good.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I want ___ (estos) shoes.', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I want ___ (diese) shoes.', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Are ___ (estos) your keys?', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Are ___ (diese) your keys?', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Look at ___ (estas) flowers.', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Look at ___ (diese) flowers.', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Estos) books are heavy.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) books are heavy.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I love ___ (estos) pants.', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I love ___ (diese) pants.', '{"type":"typing","correct_answers":["these"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Estas) are my friends.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) are my friends.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);

-- (R3 - THAT)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Ese) is my car.', '{"type":"typing","correct_answers":["That"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Jener) is my car.', '{"type":"typing","correct_answers":["That"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Who is ___ (aquel) man?', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Who is ___ (jener) man?', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I don''t like ___ (esa) movie.', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I don''t like ___ (jene) movie.', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is ___ (ese) your house?', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Is ___ (jener) your house?', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Aquel) building is tall.', '{"type":"typing","correct_answers":["That"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Jener) building is tall.', '{"type":"typing","correct_answers":["That"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Look at ___ (esa) star.', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Look at ___ (jene) star.', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I want ___ (ese) cake.', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I want ___ (jener) cake.', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);

-- (R4 - THOSE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Esos) children are playing.', '{"type":"typing","correct_answers":["Those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Jene) children are playing.', '{"type":"typing","correct_answers":["Those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I want ___ (aquellas) apples.', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I want ___ (jene) apples.', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Are ___ (esos) your shoes?', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Are ___ (jene) your shoes?', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Look at ___ (aquellas) clouds.', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Look at ___ (jene) clouds.', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Esos) dogs are barking.', '{"type":"typing","correct_answers":["Those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Jene) dogs are barking.', '{"type":"typing","correct_answers":["Those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'I like ___ (aquellos) cars.', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'I like ___ (jene) cars.', '{"type":"typing","correct_answers":["those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Esos) are my parents.', '{"type":"typing","correct_answers":["Those"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Jene) are my parents.', '{"type":"typing","correct_answers":["Those"],"case_sensitive":false}'::jsonb);

-- (R5 - THIS/THAT como Pronombres)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Esta) is my sister, Laura.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) is my sister, Laura.', '{"type":"typing","correct_answers":["This"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Estos) are my parents.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) are my parents.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Hello, ___ (esta) is Carlos speaking.', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Hello, ___ (diese) is Carlos speaking.', '{"type":"typing","correct_answers":["this"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Is ___ (esa/ese) Maria? (por telefono)', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Is ___ (jener/jene) Maria? (am Telefon)', '{"type":"typing","correct_answers":["that"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Aquello) is the Eiffel Tower!', '{"type":"typing","correct_answers":["That"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Das/Jenes) is the Eiffel Tower!', '{"type":"typing","correct_answers":["That"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '___ (Estas) are the documents you asked for.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '___ (Diese) are the documents you asked for.', '{"type":"typing","correct_answers":["These"],"case_sensitive":false}'::jsonb);


-- ==============================================================================
-- TIPO 2: MULTIPLE CHOICE (Opción Múltiple) - 28 Ejercicios (7 por regla)
-- ==============================================================================

-- (R1 - THIS)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Este) dog is friendly."', '{"type":"multiple_choice","options":["This","That","These"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Dieser) dog is friendly."', '{"type":"multiple_choice","options":["This","That","These"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "I love ___ (esta) city."', '{"type":"multiple_choice","options":["These","This","Those"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "I love ___ (diese) city."', '{"type":"multiple_choice","options":["These","This","Those"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Esto) is beautiful."', '{"type":"multiple_choice","options":["That","Those","This"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Das) is beautiful."', '{"type":"multiple_choice","options":["That","Those","This"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Have you seen ___ (esta) movie?"', '{"type":"multiple_choice","options":["this","that","these"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Have you seen ___ (diese) movie?"', '{"type":"multiple_choice","options":["this","that","these"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Este) problem is difficult."', '{"type":"multiple_choice","options":["That","This","These"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Dieser) problem is difficult."', '{"type":"multiple_choice","options":["That","This","These"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Read ___ (este) email."', '{"type":"multiple_choice","options":["this","these","those"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Read ___ (dieser) email."', '{"type":"multiple_choice","options":["this","these","those"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Esta) girl is my sister."', '{"type":"multiple_choice","options":["That","These","This"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Diese) girl is my sister."', '{"type":"multiple_choice","options":["That","These","This"],"answer":2}'::jsonb);

-- (R2 - THESE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Estas) shirts are new."', '{"type":"multiple_choice","options":["These","This","Those"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Diese) shirts are new."', '{"type":"multiple_choice","options":["These","This","Those"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Look at ___ (estos) cats."', '{"type":"multiple_choice","options":["this","these","that"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Look at ___ (diese) cats."', '{"type":"multiple_choice","options":["this","these","that"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Are ___ (estos) your glasses?"', '{"type":"multiple_choice","options":["those","this","these"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Are ___ (diese) your glasses?"', '{"type":"multiple_choice","options":["those","this","these"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Estos) days are very hot."', '{"type":"multiple_choice","options":["These","Those","This"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Diese) days are very hot."', '{"type":"multiple_choice","options":["These","Those","This"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "I like ___ (estas) pictures."', '{"type":"multiple_choice","options":["this","these","those"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "I like ___ (diese) pictures."', '{"type":"multiple_choice","options":["this","these","those"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Estos) are my favorite toys."', '{"type":"multiple_choice","options":["These","That","This"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Diese) are my favorite toys."', '{"type":"multiple_choice","options":["These","That","This"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Take ___ (estos) books to the library."', '{"type":"multiple_choice","options":["this","that","these"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Take ___ (diese) books to the library."', '{"type":"multiple_choice","options":["this","that","these"],"answer":2}'::jsonb);

-- (R3 - THAT)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Aquel) mountain is high."', '{"type":"multiple_choice","options":["That","This","Those"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Jener) mountain is high."', '{"type":"multiple_choice","options":["That","This","Those"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Who lives in ___ (esa) house?"', '{"type":"multiple_choice","options":["this","that","these"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Who lives in ___ (jene) house?"', '{"type":"multiple_choice","options":["this","that","these"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Esa) idea is brilliant."', '{"type":"multiple_choice","options":["Those","These","That"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Jene) idea is brilliant."', '{"type":"multiple_choice","options":["Those","These","That"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Can you see ___ (aquel) bird?"', '{"type":"multiple_choice","options":["that","this","those"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Can you see ___ (jener) bird?"', '{"type":"multiple_choice","options":["that","this","those"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "I will never forget ___ (ese) day."', '{"type":"multiple_choice","options":["this","that","these"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "I will never forget ___ (jener) day."', '{"type":"multiple_choice","options":["this","that","these"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Ese) is the right answer."', '{"type":"multiple_choice","options":["That","This","Those"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Jener) is the right answer."', '{"type":"multiple_choice","options":["That","This","Those"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Bring me ___ (aquel) bag."', '{"type":"multiple_choice","options":["this","these","that"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Bring me ___ (jener) bag."', '{"type":"multiple_choice","options":["this","these","that"],"answer":2}'::jsonb);

-- (R4 - THOSE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Esos) boys are tall."', '{"type":"multiple_choice","options":["Those","That","These"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Jene) boys are tall."', '{"type":"multiple_choice","options":["Those","That","These"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "I remember ___ (aquellos) years."', '{"type":"multiple_choice","options":["that","those","these"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "I remember ___ (jene) years."', '{"type":"multiple_choice","options":["that","those","these"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Look at ___ (esas) stars!"', '{"type":"multiple_choice","options":["that","this","those"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Look at ___ (jene) stars!"', '{"type":"multiple_choice","options":["that","this","those"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Aquellos) are my cousins."', '{"type":"multiple_choice","options":["Those","These","That"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Jene) are my cousins."', '{"type":"multiple_choice","options":["Those","These","That"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "Can you pass me ___ (esos) papers?"', '{"type":"multiple_choice","options":["that","those","this"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "Can you pass me ___ (jene) papers?"', '{"type":"multiple_choice","options":["that","those","this"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "I don''t like ___ (esos) shoes."', '{"type":"multiple_choice","options":["those","these","that"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "I don''t like ___ (jene) shoes."', '{"type":"multiple_choice","options":["those","these","that"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Elige el demostrativo correcto: "___ (Esas) trees are very old."', '{"type":"multiple_choice","options":["That","These","Those"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wähle den richtigen Demonstrativpronomen: "___ (Jene) trees are very old."', '{"type":"multiple_choice","options":["That","These","Those"],"answer":2}'::jsonb);

-- (R5 - THIS/THAT como Pronombres)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para presentar a tu amigo dices: "___ (Esta) is my friend Ana."', '{"type":"multiple_choice","options":["This","That","These"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um deinen Freund vorzustellen, sagst du: "___ (Diese) is my friend Ana."', '{"type":"multiple_choice","options":["This","That","These"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Al telefono dices: "Hello, ___ (esta) is Maria."', '{"type":"multiple_choice","options":["These","This","Those"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Am Telefon sagst du: "Hello, ___ (diese) is Maria."', '{"type":"multiple_choice","options":["These","This","Those"],"answer":1}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar por alguien al telefono: "Is ___ (ese) John?"', '{"type":"multiple_choice","options":["this","these","that"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um am Telefon nach jemandem zu fragen: "Is ___ (jener) John?"', '{"type":"multiple_choice","options":["this","these","that"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Presentas a tus padres: "___ (Estos) are my parents."', '{"type":"multiple_choice","options":["Those","That","These"],"answer":2}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Du stellst deine Eltern vor: "___ (Diese) are my parents."', '{"type":"multiple_choice","options":["Those","That","These"],"answer":2}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Senalando algo lejos: "___ (Aquello) is amazing!"', '{"type":"multiple_choice","options":["That","This","These"],"answer":0}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Auf etwas Weit entferntes zeigend: "___ (Das/Jenes) is amazing!"', '{"type":"multiple_choice","options":["That","This","These"],"answer":0}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Ensenando unos documentos que tienes: "___ (Estas) are the files."', '{"type":"multiple_choice","options":["Those","These","That"],"answer":1}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Du zeigst Dokumente, die du hast: "___ (Diese) are the files."', '{"type":"multiple_choice","options":["Those","These","That"],"answer":1}'::jsonb);


-- ==============================================================================
-- TIPO 3: TRUE/FALSE (Verdadero o Falso) - 24 Ejercicios (6 por regla)
-- ==============================================================================

-- (R1 - THIS)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"This" se utiliza para referirse a objetos singulares y cercanos.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"This" wird für einzelne, nahe Objekte verwendet.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"This car" significa "Ese coche" en español.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"This car" bedeutet "Jenes Auto" auf Deutsch.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Usamos "This" cuando el objeto de la frase está muy lejos.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir verwenden "This", wenn das Objekt im Satz sehr weit entfernt ist.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La palabra "This" significa "este, esta o esto".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Wort "This" bedeutet "dieser, diese oder dieses".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "This apples are good" es gramaticalmente correcta.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Satz "This apples are good" ist grammatikalisch korrekt.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule1_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"This" es la forma singular de "These".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"This" ist die Singularform von "These".', '{"type":"true_false","answer":true}'::jsonb);

-- (R2 - THESE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"These" se usa para objetos en plural que se encuentran cerca.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"These" wird für mehrere Objekte verwendet, die sich in der Nähe befinden.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El demostrativo "These" significa "esos" o "aquellos".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Demonstrativpronomen "These" bedeutet "jene" oder "jene dort".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "These apples are not good" utiliza correctamente el demostrativo plural.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Satz "These apples are not good" verwendet das Plural-Demonstrativpronomen korrekt.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"These" es la forma plural de "That".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"These" ist die Pluralform von "That".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Usamos "These" para referirnos a un solo objeto que tenemos en la mano.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir verwenden "These", um uns auf ein einzelnes Objekt in unserer Hand zu beziehen.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule2_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El demostrativo "These" significa "estos" o "estas".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Demonstrativpronomen "These" bedeutet "diese" (Plural, Nah).', '{"type":"true_false","answer":true}'::jsonb);

-- (R3 - THAT)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"That" se utiliza para objetos en singular que se perciben lejanos.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"That" wird für einzelne Objekte verwendet, die als weit entfernt wahrgenommen werden.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"That" significa "este" o "esta" en español.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"That" bedeutet "dieser" oder "diese" auf Deutsch.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para decir "aquel hombre", lo correcto en inglés es "That man".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um "jener Mann" zu sagen, ist auf Englisch "That man" korrekt.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Usamos "That" para hablar de varios objetos lejanos al mismo tiempo.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Wir verwenden "That", um über mehrere weit entfernte Objekte gleichzeitig zu sprechen.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"That" es la forma singular de "Those".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"That" ist die Singularform von "Those".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule3_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"That" solo significa "eso", pero nunca puede significar "aquel" o "aquella".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"That" bedeutet nur "das", kann aber niemals "jener" oder "jene" bedeuten.', '{"type":"true_false","answer":false}'::jsonb);

-- (R4 - THOSE)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Those" se emplea cuando los objetos que se mencionan son varios y están lejanos.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Those" wird verwendet, wenn mehrere Objekte erwähnt werden und sie weit entfernt sind.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'El demostrativo "Those" significa "estos" o "estas".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Das Demonstrativpronomen "Those" bedeutet "diese" oder "diese hier".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para referirnos a "aquellas montañas", decimos "Those mountains".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um "jene Berge" zu sagen, verwenden wir "Those mountains".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Those" es el singular de "That".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Those" ist der Singular von "That".', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Those" se utiliza únicamente para referirse a objetos cercanos al hablante.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Those" wird ausschließlich für Objekte verwendet, die sich in der Nähe des Sprechers befinden.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule4_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"Those" es la forma plural de "That".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"Those" ist die Pluralform von "That".', '{"type":"true_false","answer":true}'::jsonb);

-- (R5 - THIS/THAT como Pronombres)
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para presentar a alguien decimos "This is my friend" (no "He/She is my friend").', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um jemanden vorzustellen, sagen wir "This is my friend" (nicht "He/She is my friend").', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Al telefono, para identificarte dices "This is [tu nombre]".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Am Telefon sagst du zur Identifikation "This is [dein Name]".', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Los demostrativos solo se pueden usar delante de un sustantivo, nunca solos como pronombres.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Demonstrativpronomen können nur vor einem Nomen stehen, niemals allein als Pronomen.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'Para preguntar por alguien al telefono se dice "Is that [nombre]?" (no "Are you [nombre]?").', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Um am Telefon nach jemandem zu fragen, sagt man "Is that [Name]?" (nicht "Are you [Name]?").', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', '"These are my parents" es la forma correcta de presentar a tus padres en ingles.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', '"These are my parents" ist die korrekte Art, seine Eltern auf Englisch vorzustellen.', '{"type":"true_false","answer":true}'::jsonb);
INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_grammar1_id, v_rule5_id) RETURNING uuid INTO v_ex_id; INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', 'La frase "That is incredible!" es incorrecta porque "that" necesita un sustantivo despues.', '{"type":"true_false","answer":false}'::jsonb);
INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', 'Der Satz "That is incredible!" ist falsch, weil "that" ein Nomen danach benötigt.', '{"type":"true_false","answer":false}'::jsonb);

END;
$seed$;
