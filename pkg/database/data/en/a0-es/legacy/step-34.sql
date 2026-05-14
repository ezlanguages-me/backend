-- ============================================================
-- Seed: A0 English Path – Grammar – Like vs. As
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
    v_rule_id UUID;
    ex JSONB;
    exercises JSONB[] := ARRAY[
        -- ==========================================
        -- REGLA 1: Like (Similitud y Apariencia) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"She dances ___ (como) a professional.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I look ___ (como) my mother.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It’s so ___ (típico de) Ben to be late.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He eats ___ (como) a pig.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You look just ___ (como) your father.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"This tastes ___ (a / como) chicken.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He acts ___ (como) a child.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It feels ___ (como) plastic.", "s":{"type":"typing","correct_answers":["like"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué palabra usas para decir ''parecerse físicamente a alguien'' (look ___)?", "s":{"type":"multiple_choice","options":["like","as","same"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She swims ___ a fish.", "s":{"type":"multiple_choice","options":["like","as","such as"],"answer":0}}'::jsonb,
        '{"r":1, "p":"It''s so ___ her to forget the keys.", "s":{"type":"multiple_choice","options":["like","as","as if"],"answer":0}}'::jsonb,
        '{"r":1, "p":"''I look like my brother'' significa:", "s":{"type":"multiple_choice","options":["Miro a mi hermano","Me parezco a mi hermano","Trabajo de hermano"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He sleeps ___ a baby.", "s":{"type":"multiple_choice","options":["as","like","how"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Stop acting ___ a fool!", "s":{"type":"multiple_choice","options":["like","as","such as"],"answer":0}}'::jsonb,
        '{"r":1, "p":"That sounds ___ a great idea.", "s":{"type":"multiple_choice","options":["as","like","how"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Cuál expresa ''comportamiento típico de alguien''?", "s":{"type":"multiple_choice","options":["It is so like him","It is as him","It is such as him"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Like'' se usa para expresar que dos cosas o personas son similares o parecidas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''I work like a teacher'' significa que mi profesión real y título es ser profesor.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El verbo ''look like'' significa parecerse físicamente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La expresión ''It is so like Ben'' significa que es muy típico de Ben hacer algo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''He sings as a bird'' es correcta para decir ''canta como un pájaro''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Usamos ''like'' seguido de un sustantivo o pronombre para comparar (ej. like a professional).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''You act like a boss'' significa que realmente eres el jefe de la empresa.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Ella baila como una profesional.", "s":{"type":"scramble","chunks":["She dances","like","a professional"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Me parezco a mi madre.", "s":{"type":"scramble","chunks":["I look","like","my mother"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él come como un cerdo.", "s":{"type":"scramble","chunks":["He eats","like","a pig"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Es tan típico de Ben llegar tarde.", "s":{"type":"scramble","chunks":["It''s so","like Ben","to be late"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él actúa como un niño.", "s":{"type":"scramble","chunks":["He acts","like","a child"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Tú te ves igual que tu padre.", "s":{"type":"scramble","chunks":["You look","just like","your father"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Esto sabe a pollo.", "s":{"type":"scramble","chunks":["This tastes","like","chicken"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: As (Profesión o Función Real) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"She started working ___ (de/como) a teacher.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He works ___ (de/como) a doctor.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I use this room ___ (como) a study.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Don''t use your shirt ___ (como) a towel.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Como) your friend, I must tell you the truth.", "s":{"type":"typing","correct_answers":["As"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She was hired ___ (como) the new manager.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He acts ___ (como/en el papel de) Hamlet in the play.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Use this box ___ (como) a table.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué palabra se usa para indicar el rol o la profesión real de alguien?", "s":{"type":"multiple_choice","options":["as","like","such as"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I work ___ a nurse in the local hospital.", "s":{"type":"multiple_choice","options":["like","as","how"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He used his shoe ___ a hammer.", "s":{"type":"multiple_choice","options":["like","as","so"],"answer":1}}'::jsonb,
        '{"r":2, "p":"La frase ''As a doctor, I recommend this'' significa:", "s":{"type":"multiple_choice","options":["Soy médico y lo recomiendo","Me parezco a un médico","Me gustan los médicos"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She got a job ___ a waiter.", "s":{"type":"multiple_choice","options":["as","like","same as"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué palabra indica la función real para la que se utiliza un objeto?", "s":{"type":"multiple_choice","options":["Like","As","Such"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I am talking to you ___ your mother.", "s":{"type":"multiple_choice","options":["like","as","such as"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He disguised himself ___ a ghost.", "s":{"type":"multiple_choice","options":["as","like","similar"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''As'' se utiliza para expresar el papel, profesión o función que alguien o algo desempeña.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''He works like a waiter'' significa que su profesión real es ser camarero.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Podemos usar ''as'' para indicar la función para la cual estamos usando un objeto (ej. as a table).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''As your boss, I order you to do this'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''She was dressed like a nurse'' y ''She works as a nurse'' significan exactamente lo mismo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Para decir ''Trabajo como ingeniero'' se dice ''I work as an engineer''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Use the towel like a blanket'' es la forma correcta para denotar función.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Ella trabaja de profesora.", "s":{"type":"scramble","chunks":["She works","as","a teacher"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Uso esta caja como mesa.", "s":{"type":"scramble","chunks":["I use this box","as","a table"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Como tu jefe, te ordeno esto.", "s":{"type":"scramble","chunks":["As your boss,","I order you","to do this"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Fui contratado como gerente.", "s":{"type":"scramble","chunks":["I was hired","as","the manager"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él actúa de Hamlet en la obra.", "s":{"type":"scramble","chunks":["He acts","as Hamlet","in the play"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Como estudiante, debes estudiar.", "s":{"type":"scramble","chunks":["As a student,","you must","study"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él trabaja de camarero.", "s":{"type":"scramble","chunks":["He works","as","a waiter"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Comparativas de Igualdad (As... As) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"John can run ___ (tan) fast as Peter.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is as tall ___ (como) her mother.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"This car is not ___ (tan) expensive as that one.", "s":{"type":"typing","correct_answers":["as","so"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It is ___ (tan) cold as ice.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He is as strong ___ (como) an ox.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Read ___ (tanto) much as you can.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I am not ___ (tan) brave as you.", "s":{"type":"typing","correct_answers":["as","so"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Come as soon ___ (como) possible.", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"La estructura para decir ''tan rápido como'' es:", "s":{"type":"multiple_choice","options":["as fast as","like fast like","as fast like"],"answer":0}}'::jsonb,
        '{"r":3, "p":"My house is ___ big as yours.", "s":{"type":"multiple_choice","options":["like","as","so"],"answer":1}}'::jsonb,
        '{"r":3, "p":"He is not ___ tall as his brother.", "s":{"type":"multiple_choice","options":["as","like","than"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I want to be exactly ___ good as him.", "s":{"type":"multiple_choice","options":["as","like","more"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She plays the piano ___ well as her teacher.", "s":{"type":"multiple_choice","options":["as","like","so"],"answer":0}}'::jsonb,
        '{"r":3, "p":"En la frase ''as hot as'', el primer ''as'' se traduce al español como:", "s":{"type":"multiple_choice","options":["como","tan","igual"],"answer":1}}'::jsonb,
        '{"r":3, "p":"He ran as fast ___ he could.", "s":{"type":"multiple_choice","options":["like","as","that"],"answer":1}}'::jsonb,
        '{"r":3, "p":"¿Qué estructura expresa una comparativa de igualdad?", "s":{"type":"multiple_choice","options":["more... than","as... as","less... than"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"La expresión ''as... as'' se usa para comparativas de igualdad o inferioridad (con not).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''She is like tall like me'' es la forma correcta de decir ''Ella es tan alta como yo''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"El segundo ''as'' en la frase ''as big as'' se traduce como ''como''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La expresión ''as soon as possible'' significa ''tan pronto como sea posible''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En oraciones negativas, se puede usar ''not so... as'' en lugar de ''not as... as''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''John can run as fast like Peter'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"La combinación ''as much as'' significa ''tanto como''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: John corre tan rápido como Peter.", "s":{"type":"scramble","chunks":["John can run","as fast as","Peter"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Soy tan alto como tú.", "s":{"type":"scramble","chunks":["I am","as tall as","you"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: No es tan caro como eso.", "s":{"type":"scramble","chunks":["It is not","as expensive as","that"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Hace tanto frío como el hielo.", "s":{"type":"scramble","chunks":["It is","as cold as","ice"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Él es tan fuerte como un toro.", "s":{"type":"scramble","chunks":["He is","as strong as","an ox"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Lee tanto como puedas.", "s":{"type":"scramble","chunks":["Read","as much as","you can"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ven tan pronto como sea posible.", "s":{"type":"scramble","chunks":["Come","as soon as","possible"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Ejemplos (Like vs Such as) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I play many sports, ___ (tales como) football and tennis.", "s":{"type":"typing","correct_answers":["such as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I enjoy sweet food, ___ (como) chocolate and cake.", "s":{"type":"typing","correct_answers":["like","such as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Citrus fruits, ___ (tales como) oranges and lemons, have Vitamin C.", "s":{"type":"typing","correct_answers":["such as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have visited countries ___ (como) Japan and Korea.", "s":{"type":"typing","correct_answers":["like","such as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We sell many things, ___ (tales como) clothes and shoes.", "s":{"type":"typing","correct_answers":["such as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Animals ___ (como) bears sleep all winter.", "s":{"type":"typing","correct_answers":["like","such as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Avoid bad habits ___ (tales como) smoking.", "s":{"type":"typing","correct_answers":["such as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I like classical composers ___ (como) Mozart.", "s":{"type":"typing","correct_answers":["like","such as"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué expresión es ligeramente más formal para introducir ejemplos?", "s":{"type":"multiple_choice","options":["Like","Such as","As"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I enjoy sports ___ basketball and tennis.", "s":{"type":"multiple_choice","options":["such as","as","like as"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Countries ___ Spain and Italy are in Europe.", "s":{"type":"multiple_choice","options":["such as","as","as like"],"answer":0}}'::jsonb,
        '{"r":4, "p":"En la frase ''I play sports like tennis'', la palabra ''like'' significa:", "s":{"type":"multiple_choice","options":["me gusta","por ejemplo / tales como","me parezco"],"answer":1}}'::jsonb,
        '{"r":4, "p":"''Such as'' se traduce comúnmente al español como:", "s":{"type":"multiple_choice","options":["Tal que","Tales como / por ejemplo","Tanto como"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I avoid junk food, ___ burgers and pizza.", "s":{"type":"multiple_choice","options":["such as","as","how"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué palabra o expresión NO sirve para introducir ejemplos?", "s":{"type":"multiple_choice","options":["Like","Such as","As much as"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Pets ___ dogs need a lot of care.", "s":{"type":"multiple_choice","options":["like","as","such"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Such as'' se utiliza para presentar uno o varios ejemplos de una categoría.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Like'' nunca se puede usar para dar ejemplos, solo ''such as''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Such as'' se traduce típicamente como ''tales como'' o ''por ejemplo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La frase ''I like fruits such as apples'' es totalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''I like fruits as apples'' para dar un ejemplo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Tanto ''like'' como ''such as'' sirven para introducir ejemplos en inglés de forma natural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Such as'' se considera un poco más formal o formalmente escrito que usar ''Like'' para dar ejemplos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Juego deportes como el fútbol.", "s":{"type":"scramble","chunks":["I play sports","like","football"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Animales tales como los osos.", "s":{"type":"scramble","chunks":["Animals","such as","bears"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Países tales como Japón.", "s":{"type":"scramble","chunks":["Countries","such as","Japan"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Evita malos hábitos como fumar.", "s":{"type":"scramble","chunks":["Avoid bad habits","such as","smoking"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Me gustan las frutas como la manzana.", "s":{"type":"scramble","chunks":["I like fruits","like","apples"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ropa como zapatos y camisas.", "s":{"type":"scramble","chunks":["Clothes","such as","shoes and shirts"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Deportes tales como el tenis.", "s":{"type":"scramble","chunks":["Sports","such as","tennis"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 25, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Like vs. As', 
    'Aprende a diferenciar el uso de "like" y "as", desde cómo describir tu profesión o roles, hasta dar ejemplos o hacer comparaciones de igualdad.', 
    to_jsonb('## Grammar Lesson: Like vs. As
La diferencia principal entre "Like" y "As" puede resumirse en una frase: **"Like" expresa similitud (parecerse a algo), mientras que "As" expresa realidad (ser o funcionar realmente como algo).**

##### 1. LIKE (Similitud, Apariencia y Comportamiento)
Significa "como" o "parecido a". Se utiliza cuando comparas dos cosas que se parecen o se comportan igual, pero **no son** la misma cosa.
*   **Similitud:** *She dances like a professional.* (Baila como una profesional, aunque no lo es).
*   **Comportamiento típico:** *It’s so like Ben to be late.* (Es tan típico de Ben...).
*   **Apariencia (Look like):** Significa parecerse físicamente. *I look like my mother.* (Me parezco a mi madre).

##### 2. AS (Profesión, Rol o Función Real)
Significa "como" pero referido al papel, título o función que desempeña alguien o algo en la vida real.
*   **Profesiones / Puestos:** *She started working as a teacher.* (Trabaja de profesora; es su trabajo real).
*   **Funciones de objetos:** *I use this room as a study.* (Uso esta habitación como estudio).
*   *Nota:* No es lo mismo decir *As your boss, I tell you to do this* (Soy tu jefe y te lo ordeno) que *You act like a boss* (Te comportas como un jefe, pero no lo eres).

##### 3. AS... AS (Comparativas de Igualdad)
La estructura **as + adjetivo/adverbio + as** se utiliza para expresar que dos cosas tienen el mismo grado de algo ("tan... como").
*   *John can run as fast as Peter.* (John corre tan rápido como Peter).
*   *It is not as expensive as that.* (No es tan caro como eso).

##### 4. Dar Ejemplos (Like vs. Such as)
Para dar listas de ejemplos de una categoría se pueden usar ambos, aunque uno es un poco más formal:
*   **Such as (Tales como):** Es la forma estándar y educada de introducir ejemplos. *I play many sports, such as football, basketball and tennis.*
*   **Like (Como):** Es muy común en inglés hablado para lo mismo. *I play many sports like football and tennis.*'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Like (Similitud / Apariencia)', 'Usa "Like" para comparar similitudes (act like a boss), aspecto (look like my mother) o acciones típicas de alguien (it''s so like him).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'As (Rol, Función o Profesión)', 'Usa "As" para el papel real que alguien o algo desempeña. Se usa para profesiones (work as a teacher) o funciones (use it as a table).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'As... As (Igualdad)', 'La estructura "as + adjetivo + as" significa "tan... como" (ej. as fast as). Para negarlo usa "not as... as".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Such as y Like (Ejemplos)', 'Usa "such as" (tales como) o "like" (como) para dar ejemplos de una categoría. "Such as" es ligeramente más formal que "like".');

-- 4. Bucle optimizado para insertar los 120 ejercicios
FOREACH ex IN ARRAY exercises
LOOP
    -- Determinar el ID de la regla correcta
    IF (ex->>'r')::int = 1 THEN v_rule_id := v_rule1_id;
    ELSIF (ex->>'r')::int = 2 THEN v_rule_id := v_rule2_id;
    ELSIF (ex->>'r')::int = 3 THEN v_rule_id := v_rule3_id;
    ELSE v_rule_id := v_rule4_id;
    END IF;

    -- Insertar el ejercicio base
    INSERT INTO exercise (grammar_id, grammar_rule_id) 
    VALUES (v_grammar1_id, v_rule_id) 
    RETURNING uuid INTO v_ex_id;

    -- Insertar la traducción del ejercicio
    INSERT INTO exercise_translation (exercise_id, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

END LOOP;

END $$;