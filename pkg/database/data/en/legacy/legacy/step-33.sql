-- ============================================================
-- Seed: A0 English Path – Grammar – To y For (Completo >100)
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
        -- REGLA 1: TO (Movimiento, Hora y Distancia) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"We’re going ___ (a/hacia) Paris.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It’s a quarter ___ (para las) 2.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It’s ten miles from my house ___ (hasta) the university.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I travel ___ (a) London every month.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Welcome ___ (a) Miami.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It is five minutes ___ (para las) ten.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We walked from the hotel ___ (hasta) the beach.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She drove ___ (a) the hospital.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"We are traveling ___ Italy next week.", "s":{"type":"multiple_choice","options":["to","for","in"],"answer":0}}'::jsonb,
        '{"r":1, "p":"It is a quarter ___ three (2:45).", "s":{"type":"multiple_choice","options":["for","to","past"],"answer":1}}'::jsonb,
        '{"r":1, "p":"It is 5 kilometers from here ___ the park.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué preposición se usa para indicar movimiento HACIA un lugar?", "s":{"type":"multiple_choice","options":["for","at","to"],"answer":2}}'::jsonb,
        '{"r":1, "p":"I walk ___ work every morning.", "s":{"type":"multiple_choice","options":["to","for","in"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Welcome ___ our house!", "s":{"type":"multiple_choice","options":["for","to","in"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He ran from the door ___ the window.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":0}}'::jsonb,
        '{"r":1, "p":"It is twenty ___ eight (7:40).", "s":{"type":"multiple_choice","options":["for","to","past"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"La preposición ''TO'' se utiliza para expresar movimiento hacia un lugar (ej. We are going to Paris).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para decir ''un cuarto para las dos'' se dice ''a quarter for 2''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Se utiliza ''TO'' para hablar de la distancia de un lugar a otro (ej. from my house to the university).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''Welcome for Miami'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''TO'' sirve para conectar un punto de inicio con un destino: From [A] to [B].", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Al dar la hora, ''TO'' significa ''para las'' (minutos restantes para la siguiente hora).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''I am going at London''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Vamos a París.", "s":{"type":"scramble","chunks":["going","We are","to Paris"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Es un cuarto para las 2.", "s":{"type":"scramble","chunks":["a quarter","It''s","to 2"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Conduje al hospital.", "s":{"type":"scramble","chunks":["to","I drove","the hospital"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: De mi casa a la universidad.", "s":{"type":"scramble","chunks":["from my house","to","the university"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Bienvenido a España.", "s":{"type":"scramble","chunks":["to","Welcome","Spain"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Son diez para las cinco.", "s":{"type":"scramble","chunks":["ten","It is","to five"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Fueron al parque.", "s":{"type":"scramble","chunks":["They went","the park","to"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: TO (Dar a alguien y Preferencias) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I gave the book ___ (a) my sister.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I prefer sleeping ___ (que) working.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He sent a letter ___ (a) his mother.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I prefer tea ___ (que) coffee.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Please, give it ___ (a) me.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She prefers reading ___ (antes que) studying.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Show this picture ___ (a) your father.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They prefer cats ___ (antes que) dogs.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"I gave the keys ___ John.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I prefer apples ___ oranges.", "s":{"type":"multiple_choice","options":["for","to","than"],"answer":1}}'::jsonb,
        '{"r":2, "p":"She sold her car ___ a friend.", "s":{"type":"multiple_choice","options":["to","for","in"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He prefers walking ___ driving.", "s":{"type":"multiple_choice","options":["for","than","to"],"answer":2}}'::jsonb,
        '{"r":2, "p":"Please, explain this ___ me.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I prefer summer ___ winter.", "s":{"type":"multiple_choice","options":["to","for","more"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They sent a package ___ our office.", "s":{"type":"multiple_choice","options":["for","at","to"],"answer":2}}'::jsonb,
        '{"r":2, "p":"¿Con qué preposición se completan las comparaciones con el verbo PREFER?", "s":{"type":"multiple_choice","options":["Than","For","To"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Usamos ''TO'' para indicar quién recibe algo (ej. I gave the book to my sister).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para decir ''Prefiero dormir que trabajar'', usamos ''I prefer sleeping than working''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Prefer [A] TO [B]'' es la estructura correcta para comparar preferencias.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Se dice ''I sent an email for him'' si él es el destinatario directo al que le llega.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Give it to me'' significa ''Dámelo a mí''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Al transferir o entregar algo, el destinatario va introducido por ''TO''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''I prefer tea to coffee'' es gramaticalmente incorrecta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Le di el libro a mi hermana.", "s":{"type":"scramble","chunks":["I gave","the book","to my sister"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Prefiero dormir que trabajar.", "s":{"type":"scramble","chunks":["I prefer","sleeping","to working"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Dámelo a mí.", "s":{"type":"scramble","chunks":["it","Give","to me"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Prefiero el té que el café.", "s":{"type":"scramble","chunks":["to coffee","I prefer","tea"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella le envió una carta a él.", "s":{"type":"scramble","chunks":["She sent","to him","a letter"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Prefiero los gatos a los perros.", "s":{"type":"scramble","chunks":["cats","I prefer","to dogs"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Muéstrale esto a tu padre.", "s":{"type":"scramble","chunks":["Show this","to","your father"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Propósito y Motivo (TO verbo vs FOR sustantivo) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I went to London ___ (para) study English.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Let’s go out ___ (a/por) a drink.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She called ___ (para) ask a question.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We stopped ___ (para/por) lunch.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I read books ___ (para) learn.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I bought this gift ___ (para) your birthday.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He runs every day ___ (para) stay fit.", "s":{"type":"typing","correct_answers":["to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They went to the pub ___ (a/por) some beers.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"I went to the supermarket ___ buy some milk (verbo).", "s":{"type":"multiple_choice","options":["for","to","at"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I went to the supermarket ___ some milk (sustantivo).", "s":{"type":"multiple_choice","options":["to","for","in"],"answer":1}}'::jsonb,
        '{"r":3, "p":"She is studying hard ___ pass the exam.", "s":{"type":"multiple_choice","options":["for","to","about"],"answer":1}}'::jsonb,
        '{"r":3, "p":"Let''s go out ___ dinner.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I use this app ___ learn English.", "s":{"type":"multiple_choice","options":["for","to","in"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I am looking ___ a job.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":1}}'::jsonb,
        '{"r":3, "p":"¿Qué forma es más formal para expresar propósito en lugar de un simple ''TO''?", "s":{"type":"multiple_choice","options":["in order to / so as to","in order for","for to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I need my glasses ___ read this book.", "s":{"type":"multiple_choice","options":["for","to","at"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Para explicar el propósito de una acción seguido de un VERBO, usamos ''TO'' (ej. I went to London to study).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para explicar la intención seguida de un SUSTANTIVO, usamos ''FOR'' (ej. Let''s go out for a drink).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''I went to London for study English''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''In order to'' y ''So as to'' significan lo mismo que ''To'' pero suenan más formales.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La frase ''We stopped for lunch'' es correcta porque lunch es un sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para responder por qué haces algo (Why?), siempre debes responder con ''For + verbo''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''To'' nunca se puede usar con verbos.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Fui a Londres para estudiar inglés.", "s":{"type":"scramble","chunks":["I went to London","to study","English"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Salgamos a tomar algo (a por una bebida).", "s":{"type":"scramble","chunks":["Let''s go out","for","a drink"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Paramos para almorzar.", "s":{"type":"scramble","chunks":["We stopped","for","lunch"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella llamó para hacer una pregunta.", "s":{"type":"scramble","chunks":["She called","to ask","a question"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Fui formalmente para aprender (in order to).", "s":{"type":"scramble","chunks":["I went","in order to","learn"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Salimos a cenar.", "s":{"type":"scramble","chunks":["dinner","We went out","for"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Corro para mantenerme en forma.", "s":{"type":"scramble","chunks":["I run","to stay","fit"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: FOR (Favores y Función de un objeto) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"Could you carry these books ___ (por) me?", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"A ladle is used ___ (para) serving soup.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Can you open the door ___ (por) me?", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"A knife is used ___ (para) cutting.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I will do the dishes ___ (por) you today.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"A pen is used ___ (para) writing.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She bought a coffee ___ (para/por) her boss.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Scissors are used ___ (para) cutting paper.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Could you translate this email ___ me? (Pedir un favor)", "s":{"type":"multiple_choice","options":["for","to","at"],"answer":0}}'::jsonb,
        '{"r":4, "p":"A camera is used ___ taking pictures.", "s":{"type":"multiple_choice","options":["to","for","in"],"answer":1}}'::jsonb,
        '{"r":4, "p":"My mom cooked dinner ___ us tonight.", "s":{"type":"multiple_choice","options":["to","for","about"],"answer":1}}'::jsonb,
        '{"r":4, "p":"A thermometer is used ___ measuring temperature.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I carry this bag ___ my grandma.", "s":{"type":"multiple_choice","options":["to","for","in"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Qué estructura describe la FUNCIÓN GENERAL de un objeto?", "s":{"type":"multiple_choice","options":["used to + infinitivo","used for + verbo-ing","used to + sustantivo"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Can you pick up the phone ___ me?", "s":{"type":"multiple_choice","options":["to","at","for"],"answer":2}}'::jsonb,
        '{"r":4, "p":"A key is used ___ opening doors.", "s":{"type":"multiple_choice","options":["for","to","in"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Para pedir que alguien haga un favor por ti, usas ''FOR'' (ej. Could you carry these books for me?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''Could you do this TO me?'' cuando le pides un favor a un amigo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Para describir la función general de un objeto usamos ''FOR + verbo en -ING''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La frase ''A ladle is used for serving soup'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Se dice ''A knife is used to cutting'' en lugar de ''for cutting''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Si haces una tarea en beneficio o ayuda de alguien, dices que lo haces ''FOR'' ellos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para explicar el uso de un bolígrafo, decimos ''A pen is used for writing''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: ¿Podrías llevar estos libros por mí?", "s":{"type":"scramble","chunks":["Could you carry","these books","for me?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Un cucharón se usa para servir sopa.", "s":{"type":"scramble","chunks":["A ladle is used","for","serving soup"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Puedes abrir la puerta por mí?", "s":{"type":"scramble","chunks":["open the door","Can you","for me?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Un cuchillo se usa para cortar.", "s":{"type":"scramble","chunks":["for cutting","A knife","is used"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Un bolígrafo se usa para escribir.", "s":{"type":"scramble","chunks":["A pen","is used","for writing"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Lo haré por ti.", "s":{"type":"scramble","chunks":["do it","I will","for you"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Una llave sirve (se usa) para abrir puertas.", "s":{"type":"scramble","chunks":["for opening doors","is used","A key"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 23, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Preposiciones: TO vs. FOR', 
    'Descubre las reglas definitivas para no volver a confundir "to" y "for". Aprende a expresar destinos, propósitos, funciones y favores correctamente.', 
    to_jsonb('## Grammar Lesson: TO vs. FOR
Las preposiciones **TO** y **FOR** suelen confundir mucho porque ambas pueden traducirse como "para". Sin embargo, en inglés tienen usos muy diferenciados y estrictos.

##### 1. Cuándo usar TO (Dirección, Hora, Destinatario)
Utiliza **TO** en las siguientes situaciones:
*   **Movimiento hacia un lugar (Dirección):** *We’re going to Paris.* (Vamos a París).
*   **Distancia de un lugar a otro:** *It’s about ten miles from my house to the university.* (De mi casa a la universidad).
*   **Decir la hora (Faltan... "para" las...):** *It’s a quarter to 2.* (Es un cuarto para las 2).
*   **Dar algo a alguien (Destinatario):** *I gave the book to my sister.* (Le di el libro a mi hermana).
*   **Comparar preferencias (Prefer... to...):** *I prefer sleeping to working.* (Prefiero dormir que trabajar).

##### 2. Cuándo usar FOR (Favores y Función)
Utiliza **FOR** en estas situaciones:
*   **Pedir un favor o hacer algo en beneficio de otro:** *Could you carry these books for me?* (¿Podrías llevar estos libros por/para mí?).
*   **Describir la función general de un objeto:** En este caso se utiliza la estructura **FOR + verbo acabado en -ING**. *A ladle is a big spoon used for serving soup.* (Un cucharón se usa para servir sopa).

##### 3. Propósito e Intención (La gran diferencia)
Cuando explicas el *porqué* o *para qué* saliste o hiciste algo, presta mucha atención a la palabra que sigue:
*   **TO + VERBO INFINITIVO:** Úsalo cuando la razón es una acción. 
    *   *I went to London **to study** English.* (Fui a Londres para estudiar).
    *   *Nota formal:* A veces verás *in order to* o *so as to* en lugar de *to*. (Ej. I went to London in order to study).
*   **FOR + SUSTANTIVO:** Úsalo cuando la razón es una cosa o evento.
    *   *Let’s go out **for a drink**.* (Salgamos a por una bebida / a tomar algo).
    *   *We stopped **for lunch**.* (Paramos para el almuerzo).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Movimiento, Hora y Distancia (TO)', 'Usa TO para indicar destino o movimiento (going to London), distancia (from here to there) o al dar la hora (a quarter to 2).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Destinatarios y Preferencias (TO)', 'Usa TO cuando transfieres algo a alguien (give it to me) y en la estructura "prefer [A] to [B]".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Propósito: TO vs. FOR', 'Regla de oro: usa TO si va seguido de un VERBO (to study) y usa FOR si va seguido de un SUSTANTIVO (for a drink).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Favores y Función de objetos (FOR)', 'Usa FOR para favores (do it for me). Para explicar la función de un objeto, usa FOR + VERBO EN -ING (used for cutting).');

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