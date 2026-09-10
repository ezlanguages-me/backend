-- ============================================================
-- Seed: A0 English Path – Grammar – Expresando Posesión
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
        -- REGLA 1: Genitivo Sajón ('s) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"El coche de Jennifer. ➔ ___ car.", "s":{"type":"typing","correct_answers":["Jennifer''s"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"La pierna del gato. ➔ The ___ leg.", "s":{"type":"typing","correct_answers":["cat''s"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"El libro de John. ➔ ___ book.", "s":{"type":"typing","correct_answers":["John''s"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"La casa de mi hermano. ➔ My ___ house.", "s":{"type":"typing","correct_answers":["brother''s"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"El juguete del perro. ➔ The ___ toy.", "s":{"type":"typing","correct_answers":["dog''s"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"El teléfono de Mary. ➔ ___ phone.", "s":{"type":"typing","correct_answers":["Mary''s"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"La oficina del profesor. ➔ The ___ office.", "s":{"type":"typing","correct_answers":["teacher''s"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"El amigo de mi hermana. ➔ My ___ friend.", "s":{"type":"typing","correct_answers":["sister''s"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cómo se dice ''el coche de Jennifer''?", "s":{"type":"multiple_choice","options":["Jennifer''s car","The car of Jennifer","Jennifers car"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es correcta para personas y animales?", "s":{"type":"multiple_choice","options":["La preposición ''of''","El genitivo sajón (''s)","La preposición ''from''"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Elige la frase correcta:", "s":{"type":"multiple_choice","options":["The leg of the cat","The cats leg","The cat''s leg"],"answer":2}}'::jsonb,
        '{"r":1, "p":"I am driving ___.", "s":{"type":"multiple_choice","options":["my father''s car","the car of my father","my fathers car"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo dirías ''el dormitorio del niño''?", "s":{"type":"multiple_choice","options":["The room of the boy","The boy''s room","The boys room"],"answer":1}}'::jsonb,
        '{"r":1, "p":"El genitivo sajón indica:", "s":{"type":"multiple_choice","options":["Posesión","Origen","Un adjetivo de lugar"],"answer":0}}'::jsonb,
        '{"r":1, "p":"This is ___.", "s":{"type":"multiple_choice","options":["Laura''s house","the house of Laura","Lauras house"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We went to ___.", "s":{"type":"multiple_choice","options":["the restaurant of Peter","Peter''s restaurant","Peters restaurant"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El genitivo sajón (''s) se utiliza para expresar posesión por parte de personas y seres animados.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''The car of John'' para hablar del coche de John.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La estructura ''The cat''s leg'' es gramaticalmente correcta en inglés.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El apóstrofe (''s) se puede usar también con objetos inanimados (ej. The table''s leg).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Jennifer''s car'' significa ''el coche de Jennifer''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Si queremos decir la casa de mi madre, decimos ''My mother''s house''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El genitivo sajón se coloca siempre DESPUÉS del objeto poseído (ej. car''s John).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Este es el coche de Jennifer.", "s":{"type":"scramble","chunks":["This is","Jennifer''s","car"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Curaron la pierna del gato.", "s":{"type":"scramble","chunks":["the cat''s","They healed","leg"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: El nombre de mi hermano es Tom.", "s":{"type":"scramble","chunks":["My brother''s","name","is Tom"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Leí el libro de John.", "s":{"type":"scramble","chunks":["John''s","book","I read"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Dónde está el collar del perro?", "s":{"type":"scramble","chunks":["Where is","the dog''s","collar?"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Encontré las llaves de Mary.", "s":{"type":"scramble","chunks":["I found","keys","Mary''s"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ese es el abrigo de mi padre.", "s":{"type":"scramble","chunks":["That is","coat","my father''s"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Of vs. From - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"The leg ___ (de) the table.", "s":{"type":"typing","correct_answers":["of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She is ___ (de) Paris.", "s":{"type":"typing","correct_answers":["from"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The days ___ (de) the week.", "s":{"type":"typing","correct_answers":["of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Apples ___ (de) London.", "s":{"type":"typing","correct_answers":["from"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The color ___ (de) the wall.", "s":{"type":"typing","correct_answers":["of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Where are you ___? (de).", "s":{"type":"typing","correct_answers":["from"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The end ___ (de) the movie.", "s":{"type":"typing","correct_answers":["of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"A souvenir ___ (de) Spain.", "s":{"type":"typing","correct_answers":["from"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué preposición se usa para objetos inanimados como ''la pata de la mesa''?", "s":{"type":"multiple_choice","options":["of","from","''s"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué preposición indica origen (ej. Ella es de París)?", "s":{"type":"multiple_choice","options":["of","from","''s"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The leg ___ the table is broken.", "s":{"type":"multiple_choice","options":["from","of","in"],"answer":1}}'::jsonb,
        '{"r":2, "p":"These apples are ___ London.", "s":{"type":"multiple_choice","options":["of","from","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The days ___ the week.", "s":{"type":"multiple_choice","options":["from","of","to"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I received a postcard ___ Italy.", "s":{"type":"multiple_choice","options":["of","from","by"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The top ___ the mountain.", "s":{"type":"multiple_choice","options":["of","from","at"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He is ___ Madrid.", "s":{"type":"multiple_choice","options":["of","from","in"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"La preposición ''of'' se utiliza para expresar posesión de objetos inanimados.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''The table''s leg''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''From'' se traduce como ''de'' y sirve para expresar origen o procedencia.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para decir ''Ella es de París'' decimos ''She is of Paris''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''The days of the week'' es la forma correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para objetos inanimados siempre usamos el genitivo sajón.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Las manzanas que provienen de Londres se dicen ''Apples from London''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: La pata de la mesa.", "s":{"type":"scramble","chunks":["The leg","the table","of"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella es de París.", "s":{"type":"scramble","chunks":["from","She is","Paris"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Los días de la semana.", "s":{"type":"scramble","chunks":["the week","The days","of"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Compré manzanas de Londres.", "s":{"type":"scramble","chunks":["I bought","from London","apples"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: El color de la pared es azul.", "s":{"type":"scramble","chunks":["is blue","The color","of the wall"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Mi amigo es de España.", "s":{"type":"scramble","chunks":["from Spain","My friend","is"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: El final de la película.", "s":{"type":"scramble","chunks":["of","the movie","The end"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Whose - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"___ (De quién) coat is it?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (De quiénes) children are they?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (De quién) car is parked outside?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I don''t know ___ (de quién) this is.", "s":{"type":"typing","correct_answers":["whose"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (De quién) keys are these?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (De quién) book is on the table?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (De quién) house did you visit?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Can you tell me ___ (de quién) idea it was?", "s":{"type":"typing","correct_answers":["whose"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué palabra se usa para preguntar ''De quién''?", "s":{"type":"multiple_choice","options":["Who","Whose","Which"],"answer":1}}'::jsonb,
        '{"r":3, "p":"___ coat is it?", "s":{"type":"multiple_choice","options":["Who''s","Whose","Who"],"answer":1}}'::jsonb,
        '{"r":3, "p":"___ children are they?", "s":{"type":"multiple_choice","options":["Whose","Who","Whom"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ car is this?", "s":{"type":"multiple_choice","options":["Which","Who''s","Whose"],"answer":2}}'::jsonb,
        '{"r":3, "p":"¿Cómo traduces ''¿De quiénes son estos niños?''?", "s":{"type":"multiple_choice","options":["Who are these children?","Whose children are they?","Whose are they children?"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I wonder ___ phone is ringing.", "s":{"type":"multiple_choice","options":["who","whose","who''s"],"answer":1}}'::jsonb,
        '{"r":3, "p":"___ idea was this?", "s":{"type":"multiple_choice","options":["Who","Whose","What"],"answer":1}}'::jsonb,
        '{"r":3, "p":"___ jacket is on the chair?", "s":{"type":"multiple_choice","options":["Whose","Who''s","Who"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Whose'' significa ''De quién'' o ''De quiénes''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Who''s'' y ''Whose'' significan exactamente lo mismo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Whose coat is it?'' es la forma correcta de preguntar de quién es un abrigo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para preguntar de quién son unos niños, decimos ''Who children are they?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Whose'' se emplea siempre para preguntar por la pertenencia de algo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Después de ''Whose'' solemos poner el objeto por el que preguntamos (ej. Whose car...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Se debe usar ''Of who'' en lugar de ''Whose'' para preguntar por pertenencia.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: ¿De quién es el abrigo?", "s":{"type":"scramble","chunks":["is it?","coat","Whose"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quiénes son los niños?", "s":{"type":"scramble","chunks":["children","Whose","are they?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién es este coche?", "s":{"type":"scramble","chunks":["car","is this?","Whose"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién son estas llaves?", "s":{"type":"scramble","chunks":["keys","Whose","are these?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: No sé de quién es esto.", "s":{"type":"scramble","chunks":["whose","I don''t know","this is"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién fue la idea?", "s":{"type":"scramble","chunks":["idea","Whose","was it?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién es el libro en la mesa?", "s":{"type":"scramble","chunks":["book is","Whose","on the table?"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: To Have vs. To Have Got - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"___ (Usa auxiliar de USA) you have a car?", "s":{"type":"typing","correct_answers":["Do"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Usa auxiliar Británico) you got a car?", "s":{"type":"typing","correct_answers":["Have"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (no tengo - británico) got a car.", "s":{"type":"typing","correct_answers":["haven''t","have not"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (no tengo - americano) have a car.", "s":{"type":"typing","correct_answers":["don''t","do not"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have ___ (tengo - británico) a car.", "s":{"type":"typing","correct_answers":["got"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Usa auxiliar de USA) he have a dog?", "s":{"type":"typing","correct_answers":["Does"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Usa auxiliar Británico) she got a dog?", "s":{"type":"typing","correct_answers":["Has"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (no tiene - americano) have a pet.", "s":{"type":"typing","correct_answers":["doesn''t","does not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Cómo se pregunta ''¿Tienes coche?'' en inglés norteamericano?", "s":{"type":"multiple_choice","options":["Have you a car?","Do you have a car?","Have you got a car?"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Cómo se pregunta ''¿Tienes coche?'' en inglés británico?", "s":{"type":"multiple_choice","options":["Do you have got a car?","Do you got a car?","Have you got a car?"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Elige la negación correcta en inglés británico:", "s":{"type":"multiple_choice","options":["I don''t have got a car","I haven''t got a car","I don''t got a car"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Elige la negación correcta en inglés americano:", "s":{"type":"multiple_choice","options":["I haven''t a car","I haven''t got a car","I don''t have a car"],"answer":2}}'::jsonb,
        '{"r":4, "p":"En inglés británico se usa:", "s":{"type":"multiple_choice","options":["To have","To have got","Ambos, pero con DO"],"answer":1}}'::jsonb,
        '{"r":4, "p":"En inglés americano (to have), ¿qué verbo auxiliar se usa para preguntas?", "s":{"type":"multiple_choice","options":["Have","Got","Do / Does"],"answer":2}}'::jsonb,
        '{"r":4, "p":"I ___ got a brother.", "s":{"type":"multiple_choice","options":["do","have","has"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ she have a sister?", "s":{"type":"multiple_choice","options":["Has","Have","Does"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''To have got'' es más común en el inglés británico.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para hacer una pregunta con ''To have got'', usamos el auxiliar DO (ej. Do you have got?).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''To have'' (sin got) necesita el auxiliar DO para formar preguntas y negativas en presente simple.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I haven''t got a car'' es una frase correcta en inglés británico.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Do you have a car?'' es la forma más común de preguntar en inglés norteamericano.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I don''t have got a car'' es la estructura negativa correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Tanto ''I have a car'' como ''I have got a car'' expresan posesión de manera afirmativa.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: ¿Tienes un coche? (Americano)", "s":{"type":"scramble","chunks":["have","Do you","a car?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Tengo un coche. (Británico)", "s":{"type":"scramble","chunks":["got","I have","a car"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No tengo coche. (Británico)", "s":{"type":"scramble","chunks":["got","I haven''t","a car"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No tengo coche. (Americano)", "s":{"type":"scramble","chunks":["have","I don''t","a car"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Tienes un coche? (Británico)", "s":{"type":"scramble","chunks":["got","Have you","a car?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella no tiene perro. (Americano)", "s":{"type":"scramble","chunks":["have","She doesn''t","a dog"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él no tiene perro. (Británico)", "s":{"type":"scramble","chunks":["got","He hasn''t","a dog"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 18, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Expresando Posesión', 
    'Aprende a indicar pertenencia con el genitivo sajón, las preposiciones "of" y "from", y descubre las diferencias entre "have" y "have got".', 
    to_jsonb('## Grammar Lesson: Expresando Posesión
En inglés hay diferentes formas de decir que algo le pertenece a alguien o a algo. La elección depende totalmente de **quién o qué** sea el propietario.

##### 1. El Genitivo Sajón (''s)
Se utiliza de forma casi exclusiva para expresar la posesión por parte de **personas y seres animados (animales)**. Para formarlo, al dueño se le añade un apóstrofe y una "s" (''s) y luego se pone el objeto poseído, ¡sin poner ningún artículo delante del objeto!
*   *Jennifer''s car* (El coche de Jennifer).
*   *The cat''s leg* (La pata del gato).

##### 2. Las preposiciones OF y FROM
Cuando el "dueño" es una cosa o un **ser inanimado**, se utiliza la preposición **OF** (de).
*   *The leg of the table* (La pata de la mesa). No se dice *The table''s leg*.
*   *The days of the week* (Los días de la semana).

Por otro lado, **FROM** se traduce también como "de", pero se usa **solo** para expresar origen o procedencia de una persona o cosa.
*   *She is from Paris* (Ella es de París).
*   *Apples from London* (Manzanas de Londres).

##### 3. Pronombre Whose
**Whose** significa "De quién" o "De quiénes", y se emplea justamente para preguntar por la pertenencia de algo. En las preguntas, "whose" suele ir seguido inmediatamente por la cosa por la que preguntamos.
*   *Whose coat is it?* (¿De quién es el abrigo?).
*   *Whose children are they?* (¿De quiénes son los niños?).

##### 4. To Have vs. To Have Got
Para el verbo "tener", el inglés británico y americano usan estructuras ligeramente distintas en el presente.
*   **Inglés Americano (To Have):** Usa "have" como un verbo normal, por lo que necesita el auxiliar DO/DOES para negativas y preguntas.
    *   *Do you have a car?* (¿Tienes un coche?).
    *   *I don''t have a car.* (No tengo un coche).
*   **Inglés Británico (To Have Got):** Usa "have" como si fuera un verbo auxiliar por sí mismo gracias a la partícula "got". ¡No usa el DO!
    *   *I have got a car.* (Tengo un coche).
    *   *Have you got a car?* (¿Tienes un coche?).
    *   *I haven''t got a car.* (No tengo un coche).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'El Genitivo Sajón (''s)', 'Recuerda: El genitivo sajón (''s) va unido al DUEÑO cuando este es una persona o animal. Luego pones la cosa que le pertenece. (ej. Mary''s book).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Uso de OF y FROM', 'Para partes de objetos inanimados usa "of" (The leg of the table). Para hablar de procedencia u origen usa "from" (from Paris).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'El pronombre WHOSE', 'Para preguntar "¿De quién?" siempre utiliza "Whose". La estructura suele ser "Whose + [objeto] + is/are...?"');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Have vs Have got', 'Británico: I have got / I haven''t got / Have you got? || Americano: I have / I don''t have / Do you have? ¡Nunca mezcles "do" con "got"!');

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