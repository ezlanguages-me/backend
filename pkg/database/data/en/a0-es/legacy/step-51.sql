-- ============================================================
-- Seed: A0 English Path – Grammar – Be going to
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
        -- REGLA 1: Intenciones en el futuro - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (voy a) be a pilot.", "s":{"type":"typing","correct_answers":["am going to","''m going to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (va a) travel to London.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (vamos a) buy a house.", "s":{"type":"typing","correct_answers":["are going to","''re going to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (va a) study medicine.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (van a) sell their car.", "s":{"type":"typing","correct_answers":["are going to","''re going to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (no voy a) give up.", "s":{"type":"typing","correct_answers":["am not going to","''m not going to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (¿Vas a) call her?", "s":{"type":"typing","correct_answers":["Are you going to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"What ___ (va a) he do?", "s":{"type":"typing","correct_answers":["is he going to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cómo se forma la estructura principal de ''be going to''?", "s":{"type":"multiple_choice","options":["Am/Is/Are + going to + verbo en infinitivo","Am/Is/Are + going to + verbo en -ing","Will + going to + verbo en infinitivo"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Según los apuntes, ''be going to'' se utiliza para expresar...", "s":{"type":"multiple_choice","options":["La intención de realizar una acción en el futuro","Cosas que ocurrían habitualmente en el pasado","Obligaciones personales en el presente"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ be a pilot when I grow up.", "s":{"type":"multiple_choice","options":["am going to","going to","will going to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ study architecture at university.", "s":{"type":"multiple_choice","options":["is going to","are going to","am going to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We ___ buy a new television next month.", "s":{"type":"multiple_choice","options":["are going to","is going to","am going to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"What ___ you going to do this weekend?", "s":{"type":"multiple_choice","options":["are","is","do"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ going to visit us tomorrow. (No van a)", "s":{"type":"multiple_choice","options":["aren''t","isn''t","don''t"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ she going to learn French?", "s":{"type":"multiple_choice","options":["Is","Are","Does"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"La estructura ''be going to'' sirve para expresar que existe una intención previa de realizar una acción en el futuro.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es gramaticalmente correcto decir ''I going to be a pilot''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Después de la expresión ''going to'', el verbo principal debe estar siempre en infinitivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''He is going to play'' se traduce como ''Él va a jugar''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"En las oraciones interrogativas, la palabra ''going'' se coloca delante del sujeto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Se utiliza ''are going to'' para los pronombres We, You, y They.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para negar, usamos ''don''t'' o ''doesn''t'' delante de going to.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Yo voy a ser piloto.", "s":{"type":"scramble","chunks":["I am","going to be","a pilot"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella va a viajar a Londres.", "s":{"type":"scramble","chunks":["She is","going to travel","to London"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros vamos a comprar una casa.", "s":{"type":"scramble","chunks":["We are","going to buy","a house"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él no va a estudiar.", "s":{"type":"scramble","chunks":["He","isn''t going to","study"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Qué vas a hacer?", "s":{"type":"scramble","chunks":["What","are you","going to do?"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos van a vender su coche.", "s":{"type":"scramble","chunks":["They are","going to sell","their car"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Yo no me voy a rendir.", "s":{"type":"scramble","chunks":["I am not","going to","give up"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Acciones futuras seguras (Evidencias) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"It''s cloudy. It ___ (va a) rain.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Look out! You ___ (vas a) fall.", "s":{"type":"typing","correct_answers":["are going to","''re going to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He is running fast. He ___ (va a) win.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The boat is full of water. It ___ (se va a) sink.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Watch out! The glass ___ (se va a) break.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It is 8:30. We ___ (vamos a) be late.", "s":{"type":"typing","correct_answers":["are going to","''re going to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The sky is dark. It ___ (va a) storm.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She hasn''t studied. She ___ (va a) fail.", "s":{"type":"typing","correct_answers":["is going to","''s going to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"Además de intenciones, ¿para qué más se utiliza ''be going to'' según los apuntes?", "s":{"type":"multiple_choice","options":["Para expresar acciones futuras seguras que se ven venir","Para expresar decisiones tomadas justo en el momento de hablar","Para expresar deseos imposibles en el presente"],"answer":0}}'::jsonb,
        '{"r":2, "p":"It''s cloudy. It ___ rain.", "s":{"type":"multiple_choice","options":["is going to","are going to","will"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Watch out! You ___ drop those plates.", "s":{"type":"multiple_choice","options":["are going to","is going to","am going to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He is driving too fast! He ___ have an accident.", "s":{"type":"multiple_choice","options":["is going to","are going to","is going"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Look at the time! We ___ be late for the meeting.", "s":{"type":"multiple_choice","options":["are going to","is going to","am going to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"The sun is shining brightly. It ___ be a beautiful day.", "s":{"type":"multiple_choice","options":["is going to","are going to","is go to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They haven''t practiced at all. They ___ lose the match.", "s":{"type":"multiple_choice","options":["are going to","is going to","will going to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I feel terrible. I think I ___ be sick.", "s":{"type":"multiple_choice","options":["am going to","is going to","are going to"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Se utiliza ''be going to'' cuando tenemos una prueba o evidencia visual en el presente de lo que va a ocurrir.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''It''s cloudy. It is going to rain'' es el ejemplo exacto de tus apuntes para una acción futura segura.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Si ves que un jarrón está a punto de caerse, es correcto decir ''It is going to fall''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Be going to'' se usa para predecir cosas sin ninguna evidencia, solo por intuición.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''He is running very fast, he is going to win'' expresa un futuro que se ve venir claramente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Las acciones futuras seguras utilizan una estructura gramatical distinta a las intenciones.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''It are going to rain'' si llueve mucho.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Está nublado. Va a llover.", "s":{"type":"scramble","chunks":["It''s cloudy.","It is","going to rain"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¡Cuidado! Te vas a caer.", "s":{"type":"scramble","chunks":["Watch out!","You are","going to fall"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él está corriendo rápido. Va a ganar.", "s":{"type":"scramble","chunks":["He is running fast.","He is","going to win"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Son las 8. Vamos a llegar tarde.", "s":{"type":"scramble","chunks":["It is 8 o''clock.","We are","going to be late"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: El barco se va a hundir.", "s":{"type":"scramble","chunks":["The boat","is going to","sink"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: El vaso se va a romper.", "s":{"type":"scramble","chunks":["The glass","is going to","break"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella va a suspender.", "s":{"type":"scramble","chunks":["She","is going to","fail"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Excepción con GO y COME - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I ___ (voy a ir) to the cinema tonight.", "s":{"type":"typing","correct_answers":["am going","''m going"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___ (va a venir) to the party.", "s":{"type":"typing","correct_answers":["is coming","''s coming"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We ___ (vamos a ir) to Paris next week.", "s":{"type":"typing","correct_answers":["are going","''re going"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (van a venir) tomorrow.", "s":{"type":"typing","correct_answers":["are coming","''re coming"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (va a ir) home now.", "s":{"type":"typing","correct_answers":["is going","''s going"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Are you ___ (vas a venir) to my house?", "s":{"type":"typing","correct_answers":["coming"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I am ___ (voy a ir) to bed.", "s":{"type":"typing","correct_answers":["going"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"My parents ___ (van a venir) next month.", "s":{"type":"typing","correct_answers":["are coming","''re coming"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"Según los apuntes, ¿qué ocurre gramaticalmente cuando usamos el verbo GO en futuro con la estructura ''going to''?", "s":{"type":"multiple_choice","options":["''Going to go'' se simplifica y se escribe simplemente ''going to''","Se añade una -s al final: ''going to goes''","No se puede utilizar el verbo GO en futuro"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿En qué se transforma la expresión ''going to come'' (va a venir) según la regla de tus apuntes?", "s":{"type":"multiple_choice","options":["En ''coming''","En ''come to''","En ''going come''"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ to the cinema tonight. (Voy a ir).", "s":{"type":"multiple_choice","options":["am going","am going to go","am go"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She ___ to my house later. (Va a venir).", "s":{"type":"multiple_choice","options":["is coming","is going to come","is come"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They ___ to Madrid tomorrow. (Van a ir).", "s":{"type":"multiple_choice","options":["are going","are going to go","go to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We ___ to the party. (Vamos a venir).", "s":{"type":"multiple_choice","options":["are coming","are going to come","come"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es la forma más natural y correcta según tus apuntes?", "s":{"type":"multiple_choice","options":["I am going home","I am going to go home","I go to home tomorrow"],"answer":0}}'::jsonb,
        '{"r":3, "p":"My friends ___ to visit me. (Van a venir).", "s":{"type":"multiple_choice","options":["are coming","are going to come","are come"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Para evitar la redundancia, ''going to go'' se acorta en inglés a simplemente ''going to'' seguido del lugar.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Tus apuntes dictan claramente que ''GOING TO COME'' se transforma en ''COMING''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''I am going to go to the supermarket'' es la forma que aconsejan los libros en vez de ''I am going to the supermarket''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''She is coming to my house'' es la forma correcta de decir ''Ella va a venir a mi casa''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Esta regla solo aplica al verbo TO BE, y a ningún otro verbo de movimiento.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''We are going to Paris'' significa ''Nosotros vamos a ir a París''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''They are coming'' se traduce en este contexto de futuro como ''Ellos van a venir''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Voy a ir al cine.", "s":{"type":"scramble","chunks":["I am going","to","the cinema"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella va a venir a la fiesta.", "s":{"type":"scramble","chunks":["She is","coming","to the party"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Vamos a ir a París.", "s":{"type":"scramble","chunks":["We are","going","to Paris"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Van a venir mañana.", "s":{"type":"scramble","chunks":["They are","coming","tomorrow"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él va a ir a casa.", "s":{"type":"scramble","chunks":["He is","going","home"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Vas a venir a mi casa?", "s":{"type":"scramble","chunks":["Are you","coming","to my house?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Voy a ir a la cama.", "s":{"type":"scramble","chunks":["I am","going","to bed"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: To be about to (Estar a punto de) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"Stop it, I ___ (estoy a punto de) lose my patience.", "s":{"type":"typing","correct_answers":["am about to","''m about to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"The movie ___ (está a punto de) start.", "s":{"type":"typing","correct_answers":["is about to","''s about to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We ___ (estamos a punto de) leave.", "s":{"type":"typing","correct_answers":["are about to","''re about to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Hurry up! The train ___ (está a punto de) depart.", "s":{"type":"typing","correct_answers":["is about to","''s about to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (está a punto de) cry.", "s":{"type":"typing","correct_answers":["is about to","''s about to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (están a punto de) arrive.", "s":{"type":"typing","correct_answers":["are about to","''re about to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"The game ___ (está a punto de) finish.", "s":{"type":"typing","correct_answers":["is about to","''s about to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (estaba a punto de) call you.", "s":{"type":"typing","correct_answers":["was about to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Según tus apuntes, ¿qué significa la expresión ''To be about to''?", "s":{"type":"multiple_choice","options":["Estar a punto de... (futuro inmediato)","Estar pensando en...","Estar hablando de..."],"answer":0}}'::jsonb,
        '{"r":4, "p":"Stop it, I ___ lose my patience.", "s":{"type":"multiple_choice","options":["am about to","am going to about","about to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"The movie ___ start. Grab the popcorn!", "s":{"type":"multiple_choice","options":["is about to","is about","about to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We ___ leave when the phone rang.", "s":{"type":"multiple_choice","options":["were about to","are about to","about to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Hurry up! The bus ___ leave.", "s":{"type":"multiple_choice","options":["is about to","is about for","about to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué verbo sigue a la expresión ''be about to''?", "s":{"type":"multiple_choice","options":["Un verbo en infinitivo","Un verbo terminado en -ing","Un participio pasado"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They ___ announce the winner.", "s":{"type":"multiple_choice","options":["are about to","is about to","am about to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ cry when she heard the news.", "s":{"type":"multiple_choice","options":["was about to","is about to","about to"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"La expresión ''To be about to'' se utiliza para referirse a cosas que van a ocurrir de forma inminente (estar a punto de).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I am about to lose my patience'' es el ejemplo textual de tus apuntes para esta regla.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para usar esta expresión, debes conjugar el verbo TO BE (am/is/are) y añadir ''about to''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''I am about to going''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"También puedes usarlo en pasado: ''I was about to leave'' (Estaba a punto de irme).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''To be about to'' significa ''estar pensando acerca de''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"El verbo principal tras ''about to'' se escribe siempre en infinitivo (forma base).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Estoy a punto de perder la paciencia.", "s":{"type":"scramble","chunks":["I am about to","lose","my patience"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: La película está a punto de empezar.", "s":{"type":"scramble","chunks":["The movie","is about to","start"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Estamos a punto de salir.", "s":{"type":"scramble","chunks":["We are","about to","leave"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: El tren está a punto de salir.", "s":{"type":"scramble","chunks":["The train","is about to","leave"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella está a punto de llorar.", "s":{"type":"scramble","chunks":["She","is about to","cry"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Están a punto de llegar.", "s":{"type":"scramble","chunks":["They are","about to","arrive"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Yo estaba a punto de llamarte.", "s":{"type":"scramble","chunks":["I was","about to","call you"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 42, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Be going to y futuros inminentes', 
    'Aprende a expresar intenciones, acciones futuras seguras que se ven venir y la expresión "estar a punto de".', 
    to_jsonb('## Grammar Lesson: Be going to
Esta estructura es fundamental en inglés para expresar acciones futuras que "se ven venir" o que ya tenemos la clara intención de hacer. 

##### 1. Intención en el futuro
Se forma utilizando el auxiliar **AM / IS / ARE** seguido de **going to** y el verbo principal en infinitivo. Su uso principal es expresar que existe la intención previa de realizar una acción en el futuro.
*   *I **''m going to be** a pilot.* (Voy a ser piloto).
*   *She **is going to study** architecture.* (Ella va a estudiar arquitectura).

##### 2. Acciones futuras seguras
El segundo uso clave es para predecir cosas en el futuro basándonos en **evidencias claras que vemos en el presente**. Es decir, acciones futuras que "se ven venir" irremediablemente.
*   *It''s cloudy. It **is going to rain**.* (Está nublado. Va a llover).
*   *Watch out! You **are going to fall**.* (¡Cuidado! Te vas a caer).

##### 3. Excepción de los verbos Go y Come
Existe una regla de estilo muy importante: para evitar decir algo tan repetitivo como "voy a ir" (*going to go*), en inglés esto se simplifica.
*   **Going to go** ➡ Se cambia por simplemente **Going to**. (*I am going to Paris* = Voy a ir a París).
*   **Going to come** ➡ Se cambia por simplemente **Coming**. (*She is coming to my house* = Ella va a venir a mi casa).

##### 4. To be about to (Estar a punto de)
Otra forma de expresar el futuro inminente es usar la expresión **"to be about to"**. Significa literalmente "estar a punto de" que algo suceda. Al igual que la anterior, necesitas conjugar el verbo To Be.
*   *Stop it, I **''m about to lose** my patience.* (Para, estoy a punto de perder mi paciencia).
*   *The movie **is about to start**.* (La película está a punto de empezar).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Intenciones en el futuro', 'Utiliza Am/Is/Are + going to + verbo en infinitivo para decir "voy a..." expresar una intención premeditada para el futuro.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Acciones futuras seguras', 'Usa "be going to" para predecir acciones futuras seguras, basándote en la evidencia visual del presente (ej. Está nublado. It''s going to rain).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Excepción: Go y Come', 'Recuerda: No digas "going to go", acórtalo a "going to" (I am going home). Y no digas "going to come", acórtalo a "coming".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'To be about to', 'Usa el verbo To Be + about to + verbo en infinitivo para expresar que algo "está a punto de" suceder inminentemente.');

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