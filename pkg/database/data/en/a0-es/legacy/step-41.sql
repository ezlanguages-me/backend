-- ============================================================
-- Seed: A0 English Path – Grammar – Present Simple
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
        -- REGLA 1: Hechos y Situaciones Permanentes (Afirmativas) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (vivo) in Spain.", "s":{"type":"typing","correct_answers":["live"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (vive) in London.", "s":{"type":"typing","correct_answers":["lives"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Water ___ (hierve) at 100 degrees.", "s":{"type":"typing","correct_answers":["boils"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (juegan) tennis on Sundays.", "s":{"type":"typing","correct_answers":["play"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (trabaja) in a hospital.", "s":{"type":"typing","correct_answers":["works"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (hablamos) English very well.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"My dog ___ (come) a lot of meat.", "s":{"type":"typing","correct_answers":["eats"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (lees) many books.", "s":{"type":"typing","correct_answers":["read"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Para qué se utiliza principalmente el Presente Simple?", "s":{"type":"multiple_choice","options":["Para expresar hechos generales y situaciones permanentes","Para cosas que están sucediendo en este mismo instante","Para acciones que ocurrieron en el pasado"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ in Spain (situación permanente).", "s":{"type":"multiple_choice","options":["live","lives","living"],"answer":0}}'::jsonb,
        '{"r":1, "p":"My brother ___ in a bank.", "s":{"type":"multiple_choice","options":["work","works","working"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Water ___ at 100 degrees (hecho general).", "s":{"type":"multiple_choice","options":["boil","boils","boiling"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Qué terminación se añade generalmente a los verbos en 3ª persona del singular (He, She, It)?", "s":{"type":"multiple_choice","options":["-ing","-ed","-s / -es"],"answer":2}}'::jsonb,
        '{"r":1, "p":"They ___ a lot of coffee.", "s":{"type":"multiple_choice","options":["drinks","drink","drinking"],"answer":1}}'::jsonb,
        '{"r":1, "p":"The earth ___ around the sun.", "s":{"type":"multiple_choice","options":["go","goes","going"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He ___ Spanish perfectly.", "s":{"type":"multiple_choice","options":["speak","speaks","speaking"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Presente Simple se usa para expresar cosas que ocurren necesariamente en el preciso momento de hablar.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Para hablar de situaciones permanentes, como ''I live in Spain'', utilizamos el Presente Simple.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Los verbos en tercera persona del singular (He, She, It) añaden una ''-s'' o ''-es'' al final en oraciones afirmativas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La oración ''She play tennis'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El Presente Simple es ideal para describir hechos generales y científicos (ej. El agua hierve a 100 grados).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''We works hard'' es correcto porque ''We'' es plural.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''He goes to school'' tiene la terminación -es porque el verbo termina en ''o''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Yo vivo en España.", "s":{"type":"scramble","chunks":["I","live","in Spain"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él trabaja en un banco.", "s":{"type":"scramble","chunks":["He","works","in a bank"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros jugamos al tenis.", "s":{"type":"scramble","chunks":["We","play","tennis"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: El agua hierve a 100 grados.", "s":{"type":"scramble","chunks":["Water boils","at","100 degrees"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: A ella le gusta la música.", "s":{"type":"scramble","chunks":["She","likes","music"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos hablan inglés.", "s":{"type":"scramble","chunks":["They","speak","English"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: La Tierra gira alrededor del sol.", "s":{"type":"scramble","chunks":["The earth","goes around","the sun"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Negativas e Interrogativas (Do / Does) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"___ (Auxiliar) you like pizza?", "s":{"type":"typing","correct_answers":["Do"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Auxiliar) she play the piano?", "s":{"type":"typing","correct_answers":["Does"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (no) live in London.", "s":{"type":"typing","correct_answers":["don''t","do not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (no) like coffee.", "s":{"type":"typing","correct_answers":["doesn''t","does not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Auxiliar) they speak Spanish?", "s":{"type":"typing","correct_answers":["Do"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"My cat ___ (no) drink milk.", "s":{"type":"typing","correct_answers":["doesn''t","does not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Auxiliar) your brother work here?", "s":{"type":"typing","correct_answers":["Does"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (no) know the answer.", "s":{"type":"typing","correct_answers":["don''t","do not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cuáles son los auxiliares del Presente Simple?", "s":{"type":"multiple_choice","options":["Do / Does","Am / Is / Are","Have / Has"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ you live in Spain?", "s":{"type":"multiple_choice","options":["Does","Are","Do"],"answer":2}}'::jsonb,
        '{"r":2, "p":"___ she like chocolate?", "s":{"type":"multiple_choice","options":["Do","Does","Is"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I ___ like horror movies.", "s":{"type":"multiple_choice","options":["not","don''t","doesn''t"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He ___ want to go to the park.", "s":{"type":"multiple_choice","options":["don''t","isn''t","doesn''t"],"answer":2}}'::jsonb,
        '{"r":2, "p":"Cuando usamos ''Does'' en una pregunta o negativa, ¿qué le pasa al verbo principal?", "s":{"type":"multiple_choice","options":["Se le añade -s o -es","Vuelve a su forma normal (infinitivo sin to)","Se le añade -ing"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Where ___ they live?", "s":{"type":"multiple_choice","options":["do","does","are"],"answer":0}}'::jsonb,
        '{"r":2, "p":"What time ___ the train leave?", "s":{"type":"multiple_choice","options":["do","does","is"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"El auxiliar ''Do'' se utiliza para los pronombres I, You, We y They.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"El auxiliar ''Does'' se utiliza exclusivamente para la 3ª persona del singular (He, She, It).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''She doesn''t likes coffee'' (con la ''s'' en el verbo).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"En las oraciones interrogativas, el auxiliar (Do/Does) se coloca delante del sujeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Don''t'' es la contracción de ''Do not''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para decir ''Yo no sé'', la traducción correcta es ''I no know''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Si la pregunta empieza con una palabra WH- (ej. Where), el auxiliar se coloca después de ella: ''Where do you live?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: ¿Te gusta la pizza?", "s":{"type":"scramble","chunks":["Do","you like","pizza?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no vive aquí.", "s":{"type":"scramble","chunks":["She","doesn''t live","here"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Juega él al tenis?", "s":{"type":"scramble","chunks":["Does","he play","tennis?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo no hablo francés.", "s":{"type":"scramble","chunks":["I","don''t speak","French"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Dónde viven ellos?", "s":{"type":"scramble","chunks":["Where","do","they live?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Nosotros no sabemos la respuesta.", "s":{"type":"scramble","chunks":["We","don''t know","the answer"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: El gato no bebe leche.", "s":{"type":"scramble","chunks":["The cat","doesn''t drink","milk"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Acciones Habituales (Rutinas y Adverbios) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I go to the cinema ___ (cada) week.", "s":{"type":"typing","correct_answers":["every"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___ (siempre) gets up early.", "s":{"type":"typing","correct_answers":["always"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (nunca) eats meat.", "s":{"type":"typing","correct_answers":["never"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (a veces) play football on Sundays.", "s":{"type":"typing","correct_answers":["sometimes"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We ___ (a menudo/frecuentemente) visit our grandparents.", "s":{"type":"typing","correct_answers":["often"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They read a book every ___ (día).", "s":{"type":"typing","correct_answers":["day"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I brush my teeth every ___ (mañana).", "s":{"type":"typing","correct_answers":["morning"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___ (usualmente) finishes work at 5.", "s":{"type":"typing","correct_answers":["usually"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Con qué tipo de expresiones temporales suele ir el Presente Simple?", "s":{"type":"multiple_choice","options":["Sometimes, often, always, never...","Yesterday, last night...","Tomorrow, next week..."],"answer":0}}'::jsonb,
        '{"r":3, "p":"I go to the cinema ___ week.", "s":{"type":"multiple_choice","options":["every","all","always"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She ___ drinks coffee in the morning.", "s":{"type":"multiple_choice","options":["sometimes","everyday","every"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He ___ late for work. (Él nunca llega tarde)", "s":{"type":"multiple_choice","options":["is never","never is","never does"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We play tennis every ___.", "s":{"type":"multiple_choice","options":["weekend","often","always"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Dónde se coloca habitualmente un adverbio de frecuencia como ''always'' o ''never''?", "s":{"type":"multiple_choice","options":["Al final de la frase","Delante del verbo principal","Delante del sujeto"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I ___ wake up at 7 a.m.", "s":{"type":"multiple_choice","options":["usually","every","today"],"answer":0}}'::jsonb,
        '{"r":3, "p":"My parents travel to Paris every ___.", "s":{"type":"multiple_choice","options":["year","sometimes","often"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"El Presente Simple es el tiempo verbal perfecto para expresar acciones habituales o rutinas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La palabra ''never'' significa siempre.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Las expresiones ''every day'' o ''every week'' suelen ir al final de la frase.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''I go to the cinema every week'' es un ejemplo claro de acción habitual.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Los adverbios de frecuencia (always, often) van siempre después del verbo principal (ej. I play always).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Sometimes'' significa ''a veces''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Usamos el Presente Simple si algo ocurre con regularidad, como por ejemplo un hábito.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Voy al cine cada semana.", "s":{"type":"scramble","chunks":["I go","to the cinema","every week"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella siempre se levanta temprano.", "s":{"type":"scramble","chunks":["She","always","gets up early"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Él nunca come carne.", "s":{"type":"scramble","chunks":["He","never","eats meat"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: A veces juego al tenis.", "s":{"type":"scramble","chunks":["I","sometimes play","tennis"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: A menudo visitamos a nuestros abuelos.", "s":{"type":"scramble","chunks":["We","often visit","our grandparents"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Leo un libro todos los días.", "s":{"type":"scramble","chunks":["I read","a book","every day"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Usualmente terminamos a las 5.", "s":{"type":"scramble","chunks":["We","usually finish","at 5"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Horarios Futuros e Imperativos - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"The train ___ (sale) at quarter past five.", "s":{"type":"typing","correct_answers":["leaves"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Abre) the window, please.", "s":{"type":"typing","correct_answers":["Open"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"The movie ___ (empieza/comienza) at 8:00 tonight.", "s":{"type":"typing","correct_answers":["starts","begins"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Cierra) the door.", "s":{"type":"typing","correct_answers":["Close","Shut"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Our flight ___ (llega) tomorrow morning.", "s":{"type":"typing","correct_answers":["arrives"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (No) sit on the table!", "s":{"type":"typing","correct_answers":["Don''t","Do not"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"The match ___ (termina/acaba) in ten minutes.", "s":{"type":"typing","correct_answers":["finishes","ends"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Lee) the instructions carefully.", "s":{"type":"typing","correct_answers":["Read"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"El Presente Simple puede usarse para hablar del futuro cuando...", "s":{"type":"multiple_choice","options":["Tienen una fecha u horario asignado (horarios de trenes, vuelos...)","Es una decisión espontánea","Es una promesa personal"],"answer":0}}'::jsonb,
        '{"r":4, "p":"The train ___ at quarter past five.", "s":{"type":"multiple_choice","options":["leaves","leaving","left"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cómo se forma el imperativo para dar una orden afirmativa?", "s":{"type":"multiple_choice","options":["Usando el verbo en infinitivo sin ''to'' (ej. Open the window)","Usando el verbo con -ing (ej. Opening the window)","Añadiendo el pronombre ''You'' (ej. You open the window)"],"answer":0}}'::jsonb,
        '{"r":4, "p":"The supermarket ___ at 9:00 p.m. tonight.", "s":{"type":"multiple_choice","options":["closes","close","is closing"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ the door, please.", "s":{"type":"multiple_choice","options":["Close","Closes","Closing"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Para hacer un imperativo negativo (una prohibición), utilizamos:", "s":{"type":"multiple_choice","options":["Don''t + verbo","Doesn''t + verbo","Not + verbo"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ smoke in this room!", "s":{"type":"multiple_choice","options":["Don''t","No","Not"],"answer":0}}'::jsonb,
        '{"r":4, "p":"What time ___ the class start tomorrow?", "s":{"type":"multiple_choice","options":["does","do","is"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El Presente Simple puede utilizarse perfectamente para hablar de eventos en el futuro si estos tienen un horario oficial (como un vuelo o un tren).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''The train leaves at quarter past five'' es un ejemplo del uso de Presente Simple para horarios futuros.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para dar una orden, se utiliza el sujeto explícito: ''You open the window''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"El imperativo utiliza la forma base del verbo (infinitivo sin to).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para dar una orden negativa o reprender, decimos ''Don''t sit on the table!''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La oración ''Our flight arrives tomorrow'' usa el Presente Simple porque está hablando de un horario programado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Los imperativos también siguen la regla de la tercera persona y añaden ''-s''. (ej. Opens the door!).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: El tren sale a las cinco.", "s":{"type":"scramble","chunks":["The train","leaves","at five"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Abre la ventana, por favor.", "s":{"type":"scramble","chunks":["Open","the window,","please"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: La película empieza a las ocho.", "s":{"type":"scramble","chunks":["The movie","starts","at eight"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Cierra la puerta.", "s":{"type":"scramble","chunks":["Close","the","door"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Nuestro vuelo llega mañana.", "s":{"type":"scramble","chunks":["Our flight","arrives","tomorrow"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No te sientes en la mesa.", "s":{"type":"scramble","chunks":["Don''t","sit","on the table"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: La clase termina pronto.", "s":{"type":"scramble","chunks":["The class","finishes","soon"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 32, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Presente Simple', 
    'Aprende a usar el Presente Simple para hablar de hechos generales, hábitos, horarios futuros y dar órdenes de forma nativa.', 
    to_jsonb('## Grammar Lesson: Presente Simple
El **Presente Simple** se usa para expresar cosas que ocurren habitualmente, hechos generales y situaciones permanentes, y **no** necesariamente lo que está sucediendo en el instante de hablar.

##### 1. Hechos Generales y Situaciones Permanentes
Utilizamos este tiempo para describir realidades o situaciones que son verdades a lo largo del tiempo.
*   **Regla de Oro (Afirmativa):** En la tercera persona del singular (*He, She, It*), al verbo principal se le añade una **-s** o **-es**.
*   *Water boils at 100 degrees.* (El agua hierve a 100 grados - Hecho general).
*   *I live in Spain.* (Vivo en España - Situación permanente).
*   *My brother works in a bank.* (Mi hermano trabaja en un banco).

##### 2. Negativas e Interrogativas (Do / Does)
Para formular preguntas o negar en el Presente Simple, necesitamos obligatoriamente los auxiliares **DO** y **DOES**. Al usar el auxiliar, el verbo principal pierde su terminación "-s" o "-es".
*   **DO / DON''T:** Para *I, You, We, They*.
*   **DOES / DOESN''T:** Para *He, She, It*.
*   *Do you like pizza?* (¿Te gusta la pizza?).
*   *Does she play the piano?* (¿Toca ella el piano?).
*   *He doesn''t live here.* (Él no vive aquí).

##### 3. Acciones Habituales y Frecuencia
Es el tiempo ideal para hablar de nuestra rutina. Suele ir acompañado de expresiones de tiempo como: *sometimes* (a veces), *often* (a menudo), *always* (siempre), *never* (nunca), o secuencias como *every week* (cada semana).
*   *I go to the cinema every week.* (Voy al cine todas las semanas).
*   *She always gets up early.* (Ella siempre se levanta temprano).
*   *He never eats meat.* (Él nunca come carne).

##### 4. Horarios Futuros e Imperativos
Existen dos usos clave del Presente Simple que no refieren exactamente a hábitos presentes:
*   **Horarios futuros (Timetables):** Acciones que pasarán en el futuro porque tienen una fecha u horario oficial asignado.
    *   *The train leaves at quarter past five.* (El tren sale a las cinco y cuarto).
    *   *The movie starts at 8:00.* (La película empieza a las 8).
*   **Dar Órdenes (Imperativos):** El verbo base en el presente sin sujeto (o con *Don''t* para prohibir).
    *   *Open the window.* (Abre la ventana).
    *   *Don''t sit on the table!* (¡No te sientes en la mesa!).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Hechos y Situaciones Permanentes', 'Recuerda: Usa este tiempo para verdades generales (Water boils...) o permanentes (I live in...). ¡Añade una "s/es" al verbo si el sujeto es He, She, o It!');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Auxiliares (Do/Does)', 'Usa "Do/Don''t" para I/You/We/They. Usa "Does/Doesn''t" para He/She/It. Cuando el auxiliar está presente, el verbo principal NO lleva "s".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Acciones Habituales', 'El Presente Simple es tu herramienta para hablar de rutinas. Se acompaña de palabras como always, never, sometimes, often, o every week.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Horarios e Imperativos', 'Usa este tiempo para hablar de eventos futuros que tienen un horario oficial programado (The train leaves...) y para dar órdenes directas (Open the window).');

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