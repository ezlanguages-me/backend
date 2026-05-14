-- ============================================================
-- Seed: A0 English Path – Grammar – Adverbios (Completo >100)
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
        -- REGLA 1: Formación de Adverbios (Sufijos) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"Escribe el adverbio de ''gentle'':", "s":{"type":"typing","correct_answers":["gently"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Escribe el adverbio de ''tidy'':", "s":{"type":"typing","correct_answers":["tidily"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Escribe el adverbio de ''apathetic'':", "s":{"type":"typing","correct_answers":["apathetically"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Escribe el adverbio de ''full'':", "s":{"type":"typing","correct_answers":["fully"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Escribe el adverbio de ''easy'':", "s":{"type":"typing","correct_answers":["easily"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Escribe el adverbio de ''terrible'':", "s":{"type":"typing","correct_answers":["terribly"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Escribe el adverbio de ''automatic'':", "s":{"type":"typing","correct_answers":["automatically"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Escribe el adverbio de ''happy'':", "s":{"type":"typing","correct_answers":["happily"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''gentle''?", "s":{"type":"multiple_choice","options":["Gently","Gentlely","Gentily"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''tidy''?", "s":{"type":"multiple_choice","options":["Tidyly","Tidily","Tidally"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''apathetic''?", "s":{"type":"multiple_choice","options":["Apathetically","Apatheticly","Apatheticilly"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''full''?", "s":{"type":"multiple_choice","options":["Fully","Fullly","Fulily"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''easy''?", "s":{"type":"multiple_choice","options":["Easyly","Easily","Easally"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''terrible''?", "s":{"type":"multiple_choice","options":["Terribly","Terriblely","Terribily"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''automatic''?", "s":{"type":"multiple_choice","options":["Automatically","Automaticly","Automaticaly"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el adverbio correcto de ''basic''?", "s":{"type":"multiple_choice","options":["Basically","Basicly","Basicaly"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Los adjetivos que terminan en -Y cambian la Y por -ILY para formar el adverbio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para formar un adverbio a partir de ''gentle'', se le añade -ly quedando ''gentlely''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Fully'' es el adverbio correcto para el adjetivo ''full''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Los adjetivos que terminan en -IC añaden -ALLY para formar el adverbio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Tidyly'' es la forma correcta de escribir el adverbio de ''tidy''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Si un adjetivo termina en -LE, debes quitar la E y añadir una Y (ej. terrible -> terribly).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El adverbio de ''happy'' se escribe ''happyly''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Ella cerró la puerta suavemente.", "s":{"type":"scramble","chunks":["closed","the door","She","gently"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él guardó su ropa ordenadamente.", "s":{"type":"scramble","chunks":["his clothes","tidily","He","packed"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: La máquina funciona automáticamente.", "s":{"type":"scramble","chunks":["works","automatically","The machine"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Entiendo el problema completamente.", "s":{"type":"scramble","chunks":["the problem","I","fully","understand"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos sonrieron felizmente.", "s":{"type":"scramble","chunks":["happily","smiled","They"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él conduce terriblemente mal.", "s":{"type":"scramble","chunks":["drives","terribly","He"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Resolvieron el problema fácilmente.", "s":{"type":"scramble","chunks":["solved","easily","They","it"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Colocación de Tiempo, Modo y Lugar - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I go to London ___ (mañana).", "s":{"type":"typing","correct_answers":["tomorrow"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She paints very ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I can''t find my dog ___ (en ninguna parte).", "s":{"type":"typing","correct_answers":["anywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He arrived ___ (ayer).", "s":{"type":"typing","correct_answers":["yesterday"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Please put the box ___ (aquí).", "s":{"type":"typing","correct_answers":["here"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They speak English ___ (perfectamente).", "s":{"type":"typing","correct_answers":["perfectly"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We left the bags ___ (afuera).", "s":{"type":"typing","correct_answers":["outside"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He answered the question ___ (correctamente).", "s":{"type":"typing","correct_answers":["correctly"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Tiempo)?", "s":{"type":"multiple_choice","options":["I go to London tomorrow","Tomorrow I go London to","I go tomorrow to London"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Modo)?", "s":{"type":"multiple_choice","options":["She paints very well","She very well paints","Paints she very well"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Lugar)?", "s":{"type":"multiple_choice","options":["I can''t find my dog anywhere","I can''t anywhere find my dog","Anywhere I can''t find my dog"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Tiempo)?", "s":{"type":"multiple_choice","options":["He arrived yesterday","He yesterday arrived","Arrived he yesterday"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Modo)?", "s":{"type":"multiple_choice","options":["They speak English perfectly","They speak perfectly English","Perfectly they speak English"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Lugar)?", "s":{"type":"multiple_choice","options":["Please put the box here","Please here put the box","Please put here the box"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Tiempo)?", "s":{"type":"multiple_choice","options":["We play tennis on Sundays","We play on Sundays tennis","On Sundays play we tennis"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál tiene el orden correcto (Lugar)?", "s":{"type":"multiple_choice","options":["Leave your shoes outside","Outside leave your shoes","Leave outside your shoes"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Los adverbios de tiempo generalmente se colocan al final de la oración.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es gramaticalmente correcto decir: ''I play tomorrow football''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Los adverbios de modo se colocan siempre delante del verbo principal.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Un adverbio de lugar suele ir detrás del complemento directo o del verbo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''She paints very well'' es el orden sintáctico correcto en inglés.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Los adverbios de tiempo nunca pueden colocarse al final de la frase.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''I can''t find my dog anywhere'' tiene el adverbio colocado correctamente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena (Tiempo): Iré a Londres mañana.", "s":{"type":"scramble","chunks":["am going","tomorrow","to London","I"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena (Modo): Ella toca el piano maravillosamente.", "s":{"type":"scramble","chunks":["the piano","beautifully","plays","She"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena (Lugar): Ellos dejaron sus bolsas afuera.", "s":{"type":"scramble","chunks":["their bags","outside","left","They"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena (Tiempo): Vimos una película ayer.", "s":{"type":"scramble","chunks":["yesterday","We","a movie","saw"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena (Modo): Él respondió la pregunta correctamente.", "s":{"type":"scramble","chunks":["correctly","answered","the question","He"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena (Lugar): Puedes sentarte en cualquier lugar.", "s":{"type":"scramble","chunks":["anywhere","can sit","You"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena (Modo): Ella canta muy bien.", "s":{"type":"scramble","chunks":["very well","sings","She"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Colocación de Frecuencia e Intensidad - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I ___ play football. (A menudo)", "s":{"type":"typing","correct_answers":["often"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is ___ happy. (Siempre)", "s":{"type":"typing","correct_answers":["always"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I am ___ hungry. (Muy)", "s":{"type":"typing","correct_answers":["very"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He can ___ swim. (Nunca)", "s":{"type":"typing","correct_answers":["never"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It is ___ cold. (Extremadamente)", "s":{"type":"typing","correct_answers":["extremely"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We ___ go to the cinema. (Usualmente)", "s":{"type":"typing","correct_answers":["usually"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She paints ___ well. (Realmente)", "s":{"type":"typing","correct_answers":["really"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They are ___ late. (Siempre)", "s":{"type":"typing","correct_answers":["always"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Cuál tiene el orden correcto (Frecuencia)?", "s":{"type":"multiple_choice","options":["I often play football","I play often football","Often I play football"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál tiene el orden correcto (Frecuencia con to be)?", "s":{"type":"multiple_choice","options":["She is always happy","She always is happy","Always she is happy"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál tiene el orden correcto (Intensidad)?", "s":{"type":"multiple_choice","options":["I am very hungry","I am hungry very","Very I am hungry"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál tiene el orden correcto (Frecuencia con modal)?", "s":{"type":"multiple_choice","options":["He can never swim","He never can swim","Can never he swim"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál tiene el orden correcto (Frecuencia)?", "s":{"type":"multiple_choice","options":["I usually wake up early","I wake up usually early","I wake usually up early"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál tiene el orden correcto (Intensidad)?", "s":{"type":"multiple_choice","options":["It is extremely cold","It is cold extremely","Extremely it is cold"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál tiene el orden correcto (Intensidad)?", "s":{"type":"multiple_choice","options":["She paints really well","She really paints well","She paints well really"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál tiene el orden correcto?", "s":{"type":"multiple_choice","options":["We sometimes read books","We read sometimes books","Sometimes we read books"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Los adverbios de frecuencia se colocan delante del verbo principal.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Con el verbo ''to be'', el adverbio de frecuencia se coloca siempre antes de este verbo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''I often play football'' muestra el orden sintáctico correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"El adverbio de frecuencia ''Sometimes'' es flexible y puede ir al principio o al final.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Los adverbios de intensidad (very, extremely) van después del adjetivo al que modifican.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"En ''I am very hungry'', el adverbio de intensidad va delante del adjetivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''They always are late'' es la posición gramaticalmente correcta para ''always''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena (Frecuencia): Yo a menudo juego al fútbol.", "s":{"type":"scramble","chunks":["often","I","football","play"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena (To be + Frecuencia): Ella siempre está feliz.", "s":{"type":"scramble","chunks":["happy","She","always","is"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena (Intensidad): Ellos están muy cansados.", "s":{"type":"scramble","chunks":["tired","very","They","are"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena (Modal + Frecuencia): Él nunca puede entender.", "s":{"type":"scramble","chunks":["He","understand","never","can"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena (Frecuencia): Normalmente vamos al cine.", "s":{"type":"scramble","chunks":["usually","go","We","to the cinema"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena (Intensidad): El examen fue extremadamente difícil.", "s":{"type":"scramble","chunks":["difficult","The test","extremely","was"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena (Frecuencia): Siempre llego tarde.", "s":{"type":"scramble","chunks":["always","am","late","I"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Adverbios Especiales (Enough, Still, Yet) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"She is clever ___ (suficiente).", "s":{"type":"typing","correct_answers":["enough"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She can ___ swim. (Todavía)", "s":{"type":"typing","correct_answers":["still"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They are ___ studying. (Todavía)", "s":{"type":"typing","correct_answers":["still"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Have you read the book ___? (Ya/Todavía)", "s":{"type":"typing","correct_answers":["yet"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Is the coffee hot ___? (Suficiente)", "s":{"type":"typing","correct_answers":["enough"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ love you. (Todavía)", "s":{"type":"typing","correct_answers":["still"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I haven''t finished ___. (Aún)", "s":{"type":"typing","correct_answers":["yet"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He is not fast ___. (Suficiente)", "s":{"type":"typing","correct_answers":["enough"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Cuál tiene el orden correcto (Enough)?", "s":{"type":"multiple_choice","options":["She is clever enough","She is enough clever","Clever enough she is"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál tiene el orden correcto (Still con modal)?", "s":{"type":"multiple_choice","options":["She can still swim","She still can swim","She can swim still"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál tiene el orden correcto (Still con to be)?", "s":{"type":"multiple_choice","options":["They are still studying","They still are studying","Still they are studying"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál tiene el orden correcto (Yet)?", "s":{"type":"multiple_choice","options":["Have you read the book yet?","Have you read yet the book?","Have yet you read the book?"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál tiene el orden correcto (Enough)?", "s":{"type":"multiple_choice","options":["Is the coffee hot enough?","Is the coffee enough hot?","Is enough hot the coffee?"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál tiene el orden correcto (Still con verbo normal)?", "s":{"type":"multiple_choice","options":["I still love you","I love still you","I love you still"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál tiene el orden correcto (Yet en negativa)?", "s":{"type":"multiple_choice","options":["I haven''t finished yet","I haven''t yet finished","I yet haven''t finished"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál tiene el orden correcto?", "s":{"type":"multiple_choice","options":["He is tall enough","He is enough tall","Tall enough is he"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El adverbio ''enough'' (suficiente) se coloca siempre DESPUÉS de los adjetivos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El adverbio ''still'' (todavía) se coloca siempre al final de la oración.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''She is clever enough'' es una estructura gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El adverbio ''yet'' (ya/todavía) se utiliza normalmente al final de la frase.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Have you read the book yet?'' es una pregunta escrita en el orden correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''They still are studying'' es correcto porque ''still'' siempre va antes de ''to be''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Still'' va después del verbo ''to be'' y modales, pero DELANTE de otro verbo principal.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena (Enough): Ella es lo suficientemente lista.", "s":{"type":"scramble","chunks":["clever","is","enough","She"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena (Still): Ellos todavía están estudiando.", "s":{"type":"scramble","chunks":["are","studying","They","still"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena (Yet): ¿Ya has terminado?", "s":{"type":"scramble","chunks":["you","Have","yet?","finished"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena (Enough): Él no es lo suficientemente rápido.", "s":{"type":"scramble","chunks":["fast","enough","is not","He"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena (Still): Todavía podemos ganar.", "s":{"type":"scramble","chunks":["win","still","We","can"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena (Yet): Aún no lo he visto.", "s":{"type":"scramble","chunks":["seen him","haven''t","yet","I"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena (Enough): ¿Es el agua lo suficientemente caliente?", "s":{"type":"scramble","chunks":["the water","hot","Is","enough?"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 11, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Los Adverbios (Formación y Colocación)', 
    'Aprende a transformar adjetivos en adverbios y conoce el lugar exacto en el que deben ir dentro de la oración según su tipo.', 
    to_jsonb('## Grammar Lesson: Los Adverbios
Los adverbios son palabras que describen cómo, cuándo, dónde o con qué frecuencia ocurre una acción. Modifican a los verbos, a los adjetivos o a otros adverbios.

##### 1. Formación de Adverbios
A muchos adjetivos se les añade simplemente un sufijo para convertirlos en adverbios (que responden a la pregunta "¿cómo?"):
*   Si terminan en **-LE**, cambia a **-LY**: *Gentle* ➔ *Gently* (Suavemente)
*   Si terminan en **-Y**, cambia a **-ILY**: *Tidy* ➔ *Tidily* (Ordenadamente)
*   Si terminan en **-IC**, cambia a **-ICALLY**: *Apathetic* ➔ *Apathetically*
*   Si terminan en **-LL**, cambia a **-LLY**: *Full* ➔ *Fully* (Completamente)

##### 2. Colocación general (Tiempo, Modo, Lugar)
A diferencia del español, el inglés es muy estricto con el lugar donde pones el adverbio en la oración:
*   **Tiempo** (Cuándo): Suelen ir **al final** de la frase. (*I go to London tomorrow*).
*   **Modo** (Cómo): Van **al final**, después del verbo o del complemento directo. Nunca entre el verbo y el objeto. (*She paints very well*).
*   **Lugar** (Dónde): Detrás del complemento directo o del verbo. (*I can’t find my dog anywhere*).

##### 3. Frecuencia e Intensidad
*   **Frecuencia** (A menudo, siempre...): Van **delante** del verbo principal. Pero atención, si hay un verbo *to be*, auxiliar o modal, se colocan **después**. (*I often play football* / *He is always late*). "Sometimes" es flexible y puede ir al principio o al final.
*   **Intensidad** (Muy, verdaderamente...): Se colocan justo **delante** del adjetivo u otro adverbio al que están intensificando. (*I am very hungry*).

##### 4. Adverbios Especiales
*   **Enough** (Suficiente): Es un rebelde y se coloca siempre **después** de los adjetivos. (*She is clever enough*).
*   **Still** (Todavía): Se coloca **delante** del verbo normal, pero **después** de *to be* y modales. (*She can still swim* / *They are still studying*).
*   **Yet** (Aún/Ya): Siempre va **al final** de la frase en negativas e interrogativas. (*Have you read the book yet?*).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Formación y Sufijos (-ly)', 'Recuerda las reglas de ortografía: Los terminados en -Y cambian a -ILY (tidy->tidily), los de -LE cambian a -LY (gentle->gently), y los de -IC a -ICALLY.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Colocación: Tiempo, Modo, Lugar', 'Los adverbios de Tiempo (tomorrow), Modo (well) y Lugar (anywhere) suelen ir al FINAL de la oración o después del complemento directo.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Colocación: Frecuencia e Intensidad', 'La frecuencia va ANTES del verbo normal, pero DESPUÉS del verbo "to be". La intensidad (very, extremely) siempre ANTES del adjetivo.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Especiales: Enough, Still, Yet', 'Memoriza esto: "Enough" va DESPUÉS del adjetivo. "Still" va ANTES del verbo (pero después del "to be/modal"). "Yet" va SIEMPRE al final de la oración.');

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