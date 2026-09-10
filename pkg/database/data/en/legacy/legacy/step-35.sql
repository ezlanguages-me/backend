-- ============================================================
-- Seed: A0 English Path – Grammar – So vs Such
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
        -- REGLA 1: SO + Adjetivo / Adverbio - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I am ___ (tan) tired!", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He drives ___ (tan) fast.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You are ___ (tan) beautiful.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She sings ___ (tan) well.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It is ___ (tan) cold today.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Why is this ___ (tan) expensive?", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He arrived ___ (tan) late.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Don''t walk ___ (tan) slowly.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"The movie was ___ boring.", "s":{"type":"multiple_choice","options":["so","such","such a"],"answer":0}}'::jsonb,
        '{"r":1, "p":"You play the guitar ___ beautifully.", "s":{"type":"multiple_choice","options":["such","so","such a"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Qué palabra acompaña únicamente a adjetivos o adverbios (sin sustantivo)?", "s":{"type":"multiple_choice","options":["Such","So","As"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I was ___ happy when I heard the news.", "s":{"type":"multiple_choice","options":["such","such a","so"],"answer":2}}'::jsonb,
        '{"r":1, "p":"The test was ___ difficult.", "s":{"type":"multiple_choice","options":["so","such","such a"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They speak English ___ quickly.", "s":{"type":"multiple_choice","options":["such","so","much"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Why are you ___ angry?", "s":{"type":"multiple_choice","options":["so","such","such an"],"answer":0}}'::jsonb,
        '{"r":1, "p":"The water is ___ hot.", "s":{"type":"multiple_choice","options":["such a","such","so"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Utilizamos ''so'' seguido exclusivamente de un adjetivo o adverbio para enfatizar.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''She is so a beautiful girl''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''I am so tired'' significa ''Estoy tan cansado/a''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''So'' también se puede usar para modificar directamente sustantivos como en ''I have so cars''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"En la frase ''He runs so fast'', ''fast'' es un adverbio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''So'' expresa sentimientos o efectos extremos de las cosas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La expresión ''so late'' significa ''demasiado tarde''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: ¡Estoy tan cansado!", "s":{"type":"scramble","chunks":["I am","so","tired!"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella conduce tan rápido.", "s":{"type":"scramble","chunks":["She","drives","so fast"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Eres tan hermosa.", "s":{"type":"scramble","chunks":["You are","so","beautiful"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Hace tanto frío hoy.", "s":{"type":"scramble","chunks":["It is","so cold","today"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Por qué es tan caro?", "s":{"type":"scramble","chunks":["Why is","it","so expensive?"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: La película fue tan aburrida.", "s":{"type":"scramble","chunks":["The movie","was","so boring"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Llegaste tan tarde.", "s":{"type":"scramble","chunks":["You","arrived","so late"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: SUCH + (Adjetivo) + Sustantivo - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"It is ___ (un tan) beautiful day.", "s":{"type":"typing","correct_answers":["such a"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They are ___ (unas tan) nice people.", "s":{"type":"typing","correct_answers":["such"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You are ___ (un tan) clown!", "s":{"type":"typing","correct_answers":["such a"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It was ___ (un tan) good book.", "s":{"type":"typing","correct_answers":["such a"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She has ___ (unos tan) beautiful eyes.", "s":{"type":"typing","correct_answers":["such"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"This is ___ (un tan) big problem.", "s":{"type":"typing","correct_answers":["such a"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He is ___ (un tan) idiot.", "s":{"type":"typing","correct_answers":["such an"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We had ___ (un tan) bad weather.", "s":{"type":"typing","correct_answers":["such"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"It was ___ amazing experience.", "s":{"type":"multiple_choice","options":["such an","so","such a"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué palabra se utiliza para dar énfasis cuando hay un sustantivo al final de la expresión?", "s":{"type":"multiple_choice","options":["So","Such","Very"],"answer":1}}'::jsonb,
        '{"r":2, "p":"They are ___ good friends.", "s":{"type":"multiple_choice","options":["such a","so","such"],"answer":2}}'::jsonb,
        '{"r":2, "p":"You are ___ clown! Are you ever serious?", "s":{"type":"multiple_choice","options":["so","such a","such"],"answer":1}}'::jsonb,
        '{"r":2, "p":"That is ___ long story.", "s":{"type":"multiple_choice","options":["such a","so","such"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She bought ___ beautiful dress.", "s":{"type":"multiple_choice","options":["so","such a","such"],"answer":1}}'::jsonb,
        '{"r":2, "p":"We had ___ fun at the party (fun = incontable).", "s":{"type":"multiple_choice","options":["such","such a","so"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He is ___ intelligent boy.", "s":{"type":"multiple_choice","options":["such a","such an","so"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Such'' se usa para dar énfasis cuando el núcleo de la expresión es un sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Si el sustantivo es singular y contable, debemos poner ''a/an'' después de ''such'' (ej. such a day).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para sustantivos plurales (ej. friends), decimos ''such a friends''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Weather'' es incontable, por eso decimos ''such bad weather'' y no ''such a bad weather''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''You are such a clown'' se traduce como ''Eres tan payaso''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''It was so a good movie''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"En español, las expresiones con ''such'' a menudo se traducen como una exclamación con ''¡Qué...!'' (¡Qué buen día!).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Es un día tan hermoso.", "s":{"type":"scramble","chunks":["It is","such a","beautiful day"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Son unas personas tan agradables.", "s":{"type":"scramble","chunks":["They are","such","nice people"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¡Eres tan payaso!", "s":{"type":"scramble","chunks":["You are","such a","clown!"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Fue una experiencia tan increíble.", "s":{"type":"scramble","chunks":["It was","such an","amazing experience"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Tuvimos tan mal clima.", "s":{"type":"scramble","chunks":["We had","such","bad weather"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Fue un libro tan bueno.", "s":{"type":"scramble","chunks":["It was","such a","good book"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él es un idiota.", "s":{"type":"scramble","chunks":["He is","such an","idiot"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: SO + Cuantificadores (much, many, etc.) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I have ___ (tantas) things to do.", "s":{"type":"typing","correct_answers":["so many"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"There is ___ (tanto) noise here.", "s":{"type":"typing","correct_answers":["so much"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Teresa has ___ (tantos) talents.", "s":{"type":"typing","correct_answers":["so many"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We have ___ (tan poco) time left.", "s":{"type":"typing","correct_answers":["so little"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ate ___ (tanta) food.", "s":{"type":"typing","correct_answers":["so much"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Why are there ___ (tantas) people?", "s":{"type":"typing","correct_answers":["so many"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I have ___ (tan pocos) friends in this city.", "s":{"type":"typing","correct_answers":["so few"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She drank ___ (tanta) water.", "s":{"type":"typing","correct_answers":["so much"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"Los cuantificadores (many, much, few, little) se intensifican siempre con la palabra...", "s":{"type":"multiple_choice","options":["So","Such","Very"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I have ___ money right now.", "s":{"type":"multiple_choice","options":["such much","so much","so many"],"answer":1}}'::jsonb,
        '{"r":3, "p":"There are ___ cars on the street today.", "s":{"type":"multiple_choice","options":["so much","such many","so many"],"answer":2}}'::jsonb,
        '{"r":3, "p":"He has ___ little patience.", "s":{"type":"multiple_choice","options":["so","such","such a"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Teresa has ___ talents!", "s":{"type":"multiple_choice","options":["so many","such many","so much"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I bought ___ books.", "s":{"type":"multiple_choice","options":["so much","so many","such many"],"answer":1}}'::jsonb,
        '{"r":3, "p":"There is ___ pollution in big cities.", "s":{"type":"multiple_choice","options":["so much","such much","so many"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Why do you have ___ few followers?", "s":{"type":"multiple_choice","options":["so","such","so much"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Es totalmente incorrecto decir ''such much'' o ''such many''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Los cuantificadores SIEMPRE van precedidos de ''So'' para expresar cantidades extremas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''So many'' se traduce como ''tanto'' (para sustantivos incontables).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Para expresar ''tan poco tiempo'', decimos ''so little time''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En ''Teresa has so many talents'', usamos ''many'' porque ''talents'' es contable y plural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''So few'' significa ''tantos''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Aunque ''people'' no lleva ''s'', es plural y contable, por lo que usamos ''so many people''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Tengo tantas cosas que hacer.", "s":{"type":"scramble","chunks":["I have","so many things","to do"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Hay tanto ruido.", "s":{"type":"scramble","chunks":["There is","so much","noise"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Tenemos tan poco tiempo.", "s":{"type":"scramble","chunks":["We have","so little","time"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Teresa tiene tantos talentos.", "s":{"type":"scramble","chunks":["Teresa has","so many","talents"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Él comió tanta comida.", "s":{"type":"scramble","chunks":["He ate","so much","food"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Por qué hay tantas personas?", "s":{"type":"scramble","chunks":["Why are there","so many","people?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Tengo tan pocos amigos.", "s":{"type":"scramble","chunks":["I have","so few","friends"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Consecuencias (THAT) y el significado de "Tal" - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"He was ___ (tan) fast that he won.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"It was ___ (un tan) cold day that it snowed.", "s":{"type":"typing","correct_answers":["such a"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We very rarely listen to ___ (tal) music.", "s":{"type":"typing","correct_answers":["such"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I am ___ (tan) lucky that I survived.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"It is ___ (tal) honor to meet you.", "s":{"type":"typing","correct_answers":["such an"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She was ___ (tan) tired that she slept immediately.", "s":{"type":"typing","correct_answers":["so"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They were ___ (unos tan) good players that they won.", "s":{"type":"typing","correct_answers":["such"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"There is no ___ (tal) thing as ghosts.", "s":{"type":"typing","correct_answers":["such"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"He was driving ___ fast that he had an accident.", "s":{"type":"multiple_choice","options":["such","so","such a"],"answer":1}}'::jsonb,
        '{"r":4, "p":"It was ___ beautiful day that we decided to go to the beach.", "s":{"type":"multiple_choice","options":["so","such a","such"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Qué palabra se añade para mostrar el resultado o la consecuencia de un extremo?", "s":{"type":"multiple_choice","options":["Then","That","Than"],"answer":1}}'::jsonb,
        '{"r":4, "p":"We very rarely listen to ___ music (ese tipo de música).", "s":{"type":"multiple_choice","options":["so","such","such a"],"answer":1}}'::jsonb,
        '{"r":4, "p":"It was ___ an expensive car that I didn''t buy it.", "s":{"type":"multiple_choice","options":["so","such","such a"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I was ___ angry that I couldn''t speak.", "s":{"type":"multiple_choice","options":["such","so","such a"],"answer":1}}'::jsonb,
        '{"r":4, "p":"There is no ___ thing as a free lunch.", "s":{"type":"multiple_choice","options":["so","such a","such"],"answer":2}}'::jsonb,
        '{"r":4, "p":"They had ___ terrible weather that they stayed inside.", "s":{"type":"multiple_choice","options":["such a","such","so"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"La estructura ''so / such ... that'' sirve para indicar la consecuencia de una exageración.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''It was so a cold day that it snowed'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Cuando ''such'' va seguido directamente de un sustantivo, significa ''tal'' o ''este tipo de''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La frase ''He was driving so fast that he had an accident'' expresa causa y consecuencia.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para decir ''Es un honor (tal honor)'' decimos ''It is so an honor''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Such music'' significa ''tal música'' o ''ese tipo de música''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En la estructura de consecuencia, no importa si usamos ''so'' o ''such'', siempre que esté presente ''that''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Conducía tan rápido que tuvo un accidente.", "s":{"type":"scramble","chunks":["He was driving so fast","that","he had an accident"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Hacía un día tan bonito que fuimos a la playa.", "s":{"type":"scramble","chunks":["It was such a beautiful day","that","we went to the beach"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Rara vez escuchamos tal música.", "s":{"type":"scramble","chunks":["We very rarely","listen to","such music"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Estaba tan cansado que durmió.", "s":{"type":"scramble","chunks":["He was so tired","that","he slept"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Es tal honor conocerte.", "s":{"type":"scramble","chunks":["It is","such an honor","to meet you"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Estaba tan enojado que grité.", "s":{"type":"scramble","chunks":["I was so angry","that","I yelled"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No hay tal cosa como fantasmas.", "s":{"type":"scramble","chunks":["There is no","such thing","as ghosts"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 26, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'So vs. Such', 
    'Aprende a exagerar y dar énfasis en inglés correctamente. Descubre la regla de oro para no volver a confundir "so" con "such".', 
    to_jsonb('## Grammar Lesson: SO vs. SUCH
Ambas palabras se utilizan para exagerar o dar énfasis a nuestras frases (para decir "tan" o "qué"), pero sus estructuras gramaticales son completamente diferentes. La clave está en mirar qué palabra viene justo después.

##### 1. SO + Adjetivo / Adverbio
Utilizamos **so** (tan) seguido de un adjetivo o un adverbio, **sin** un sustantivo detrás. Se usa para mostrar sentimientos o efectos extremos.
*   *I’m so tired!* (¡Estoy tan cansado!)
*   *He was driving so fast.* (Conducía tan rápido.)
*   *You are so beautiful.* (Eres tan hermosa).

##### 2. SUCH + (Adjetivo) + Sustantivo
Utilizamos **such** cuando el centro de nuestra exageración incluye un **sustantivo**. A menudo se traduce como "¡Qué...!" o "Un tan...".
*   *I have such wonderful friends!* (¡Tengo unos amigos tan maravillosos! / ¡Qué amigos maravillosos tengo!)
*   *You are such a clown!* (¡Eres tan payaso! / ¡Qué payaso eres!)
*   **La Regla de A/AN:** Si el sustantivo es singular y se puede contar, la palabra "such" debe ir seguida obligatoriamente por "a/an". (Ej. *It is such a beautiful day*).

##### 3. SO con Cuantificadores
A la hora de exagerar cantidades extremas con los cuantificadores *much, many, little* y *few*, **siempre se utiliza SO**, nunca *Such*.
*   *Teresa has so many talents!* (¡Teresa tiene tantos talentos!)
*   *There is so much noise.* (Hay tanto ruido.)
*   *We have so little time.* (Tenemos tan poco tiempo.)

##### 4. Consecuencias (THAT) y el uso de "Tal"
*   **Expresar Resultado:** Podemos añadir la palabra **that** a una frase con "so" o "such" para mostrar la consecuencia de ese extremo.
    *   *He was driving so fast that he had an accident.* (Conducía tan rápido que tuvo un accidente).
    *   *It was such a beautiful day that we decided to go to the beach.* (Hacía un día tan bonito que decidimos ir a la playa).
*   **Such como "Tal":** Cuando "such" va seguido directamente de un sustantivo (sin énfasis ni exclamaciones), significa "tal" o "este tipo de".
    *   *We very rarely listen to such music.* (Rara vez escuchamos tal música / ese tipo de música).
    *   *There is no such thing.* (No existe tal cosa).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'SO + Adjetivo / Adverbio', 'Usa "So" cuando solamente hay un adjetivo o adverbio después, sin ningún sustantivo. (Ej: You are so beautiful / He runs so fast).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'SUCH + Sustantivo', 'Usa "Such" si hay un sustantivo al final de la expresión. Si el sustantivo es singular y contable, pon "a / an" (Ej: Such a beautiful day).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'SO + Cuantificadores', 'Nunca uses "such" con palabras de cantidad. Siempre di: so much, so many, so little, so few (Ej: I have so many things to do).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Consecuencias y "Tal"', 'Conecta un extremo con su resultado usando "THAT" (So fast that...). Recuerda que "Such + sustantivo" significa "tal cosa" (such music).');

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