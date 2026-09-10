-- ============================================================
-- Seed: A0 English Path – Grammar – Past Perfect Continuous
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
        -- REGLA 1: Formación y Acciones Temporales - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (había estado) waiting for hours.", "s":{"type":"typing","correct_answers":["had been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She had been ___ (trabajando) all morning.", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They had ___ (estado) playing tennis.", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (habíamos) been studying.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It had been ___ (lloviendo) heavily.", "s":{"type":"typing","correct_answers":["raining"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He had been ___ (leyendo) a book.", "s":{"type":"typing","correct_answers":["reading"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (habías estado) sleeping.", "s":{"type":"typing","correct_answers":["had been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I had been ___ (corriendo) in the park.", "s":{"type":"typing","correct_answers":["running"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cómo se forma el Pasado Perfecto Continuo según los apuntes?", "s":{"type":"multiple_choice","options":["Had been + verbo en -ing","Had + verbo en participio (-ed/3ra columna)","Was/Were + verbo en -ing"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Para qué se utiliza principalmente el Pasado Perfecto Continuo?", "s":{"type":"multiple_choice","options":["Para hablar de acciones temporales antes de otro momento en el pasado","Para hablar de rutinas presentes","Para describir el futuro"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ waiting for two hours before she arrived.", "s":{"type":"multiple_choice","options":["had been","have been","was being"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ studying English for years before moving to London.", "s":{"type":"multiple_choice","options":["had been","had be","have been"],"answer":0}}'::jsonb,
        '{"r":1, "p":"It had been ___ all night.", "s":{"type":"multiple_choice","options":["raining","rained","rain"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He had ___ working there since 2010.", "s":{"type":"multiple_choice","options":["been","being","be"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ reading that book for weeks.", "s":{"type":"multiple_choice","options":["had been","had being","was been"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We had been ___ football when it started to rain.", "s":{"type":"multiple_choice","options":["playing","played","play"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Pasado Perfecto Continuo se forma con el auxiliar HAD BEEN para todos los sujetos (I, You, He...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El verbo principal debe escribirse en participio (-ed) en este tiempo verbal.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Sirve para hablar de acciones temporales que estuvieron en progreso antes de otro momento en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La oración ''I had been work'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''She had been reading'' se traduce como ''Ella había estado leyendo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Este tiempo da énfasis a la duración o al proceso temporal de la acción.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''It had been raining'' significa que llueve ahora mismo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Yo había estado esperando.", "s":{"type":"scramble","chunks":["I had","been","waiting"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella había estado trabajando duro.", "s":{"type":"scramble","chunks":["She had","been working","hard"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Había estado lloviendo.", "s":{"type":"scramble","chunks":["It had","been","raining"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros habíamos estado estudiando.", "s":{"type":"scramble","chunks":["We had","been","studying"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos habían estado jugando al tenis.", "s":{"type":"scramble","chunks":["They had","been playing","tennis"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él había estado conduciendo.", "s":{"type":"scramble","chunks":["He had","been","driving"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Tú habías estado durmiendo.", "s":{"type":"scramble","chunks":["You had","been","sleeping"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Negativas e Interrogativas - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I ___ (no había) been sleeping.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (no había) been feeling well.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Habías) you been crying?", "s":{"type":"typing","correct_answers":["Had"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We hadn''t ___ (estado) listening.", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Había) he been working late?", "s":{"type":"typing","correct_answers":["Had"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They hadn''t been ___ (prestando) attention.", "s":{"type":"typing","correct_answers":["paying"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"How long ___ (habías) you been waiting?", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It ___ (no había) been raining.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cómo se forma la negación en el Pasado Perfecto Continuo?", "s":{"type":"multiple_choice","options":["Hadn''t been + verbo en -ing","Didn''t be + verbo en -ing","Wasn''t been + verbo en -ing"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Dónde se coloca el auxiliar ''Had'' en una pregunta?", "s":{"type":"multiple_choice","options":["Delante del sujeto (ej. Had you been...)","Al final de la frase","Después del verbo principal"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She ___ been sleeping well before the exam.", "s":{"type":"multiple_choice","options":["hadn''t","didn''t","haven''t"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ they been living there for a long time?", "s":{"type":"multiple_choice","options":["Had","Have","Were"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I hadn''t ___ practicing enough.", "s":{"type":"multiple_choice","options":["been","be","being"],"answer":0}}'::jsonb,
        '{"r":2, "p":"How long ___ she been waiting?", "s":{"type":"multiple_choice","options":["had","was","did"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We ___ been watching TV, we were studying.", "s":{"type":"multiple_choice","options":["hadn''t","haven''t","weren''t"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ he been feeling sick?", "s":{"type":"multiple_choice","options":["Had","Did","Was"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Para hacer oraciones negativas, usamos la contracción ''hadn''t been''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Had you been waiting?'' significa ''¿Habías estado esperando?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''She didn''t had been working''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"En las preguntas, el orden es: Had + Sujeto + been + verbo en -ing.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Podemos usar ''How long'' con este tiempo para preguntar ''¿Cuánto tiempo habías estado...?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La negación elimina el ''been'' de la oración.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''I hadn''t been sleeping'' indica que no estuve en proceso de dormir antes de un suceso.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Yo no había estado prestando atención.", "s":{"type":"scramble","chunks":["I hadn''t been","paying","attention"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Habías estado llorando?", "s":{"type":"scramble","chunks":["Had","you been","crying?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no se había estado sintiendo bien.", "s":{"type":"scramble","chunks":["She hadn''t been","feeling","well"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Cuánto tiempo habías estado esperando?", "s":{"type":"scramble","chunks":["How long","had you been","waiting?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Nosotros no habíamos estado escuchando.", "s":{"type":"scramble","chunks":["We hadn''t","been","listening"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Habían estado ellos trabajando?", "s":{"type":"scramble","chunks":["Had they","been","working?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él no había estado practicando.", "s":{"type":"scramble","chunks":["He hadn''t","been","practicing"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Causa y Efecto en el Pasado - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"He wasn''t hungry ___ (porque) he had been eating sweets.", "s":{"type":"typing","correct_answers":["because"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She was tired because she ___ (había) been running.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The road was wet because it had ___ (estado) raining.", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He failed because he ___ (no había) been studying.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They were exhausted because they had been ___ (conduciendo) all night.", "s":{"type":"typing","correct_answers":["driving"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She had red eyes because she had been ___ (llorando).", "s":{"type":"typing","correct_answers":["crying"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I was sweating because I had been ___ (haciendo ejercicio).", "s":{"type":"typing","correct_answers":["exercising","working out"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The children were dirty because they had been ___ (jugando) in the mud.", "s":{"type":"typing","correct_answers":["playing"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"Según los apuntes, ¿para qué se utiliza también el Pasado Perfecto Continuo?", "s":{"type":"multiple_choice","options":["Para demostrar causa y efecto en el pasado","Para hablar de eventos que sucederán pronto","Para describir la ropa de alguien"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He wasn''t hungry ___ he had been eating sweets all morning.", "s":{"type":"multiple_choice","options":["because","before","when"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She was tired because she ___ working all day.", "s":{"type":"multiple_choice","options":["had been","has been","was being"],"answer":0}}'::jsonb,
        '{"r":3, "p":"His hands were dirty because he ___ fixing the car.", "s":{"type":"multiple_choice","options":["had been","have been","was"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We were thirsty because we ___ running in the sun.", "s":{"type":"multiple_choice","options":["had been","had be","were been"],"answer":0}}'::jsonb,
        '{"r":3, "p":"El conector más común para expresar esta relación de causa y efecto es:", "s":{"type":"multiple_choice","options":["Because (porque)","Although (aunque)","If (si)"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She had red eyes because she ___ crying.", "s":{"type":"multiple_choice","options":["had been","has been","was"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I was out of breath because I ___ running.", "s":{"type":"multiple_choice","options":["had been","have been","did"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"El Pasado Perfecto Continuo se usa frecuentemente para explicar la causa visible de una situación en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En ''He wasn''t hungry because he had been eating sweets'', el no tener hambre es el efecto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es incorrecto usar la palabra ''because'' con el Pasado Perfecto Continuo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"La causa continua (had been eating) sucedió antes del efecto (wasn''t hungry).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Si alguien estaba sudando porque había estado corriendo, se dice ''because he had been running''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para causa y efecto en el pasado, la causa siempre va en futuro.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''The street was wet because it had been raining'' es un ejemplo perfecto de esta regla.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Él no tenía hambre porque había estado comiendo dulces.", "s":{"type":"scramble","chunks":["He wasn''t hungry","because he had been","eating sweets"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella estaba cansada porque había estado trabajando.", "s":{"type":"scramble","chunks":["She was tired","because she had been","working"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: La calle estaba mojada porque había estado lloviendo.", "s":{"type":"scramble","chunks":["The street was wet","because it had been","raining"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Estábamos sudando porque habíamos estado corriendo.", "s":{"type":"scramble","chunks":["We were sweating","because we had been","running"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él falló porque no había estado estudiando.", "s":{"type":"scramble","chunks":["He failed","because he hadn''t been","studying"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Sus ojos estaban rojos porque había estado llorando.", "s":{"type":"scramble","chunks":["Her eyes were red","because she had been","crying"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Estaban sucios porque habían estado jugando en el barro.", "s":{"type":"scramble","chunks":["They were dirty","because they had been","playing in the mud"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Acciones Previas (Before that) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"She went to work, but ___ (antes) that she had been picking strawberries.", "s":{"type":"typing","correct_answers":["before"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I moved to London, but before that I ___ (había) been living in Paris.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Before that, they had ___ (estado) playing outside.", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He became a teacher, but before that he had been ___ (trabajando) in a bank.", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She bought a car, but before that she had been ___ (tomando) the bus.", "s":{"type":"typing","correct_answers":["taking"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We went out, but before that we had been ___ (viendo) TV.", "s":{"type":"typing","correct_answers":["watching"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I fell asleep, but before that I had been ___ (leyendo).", "s":{"type":"typing","correct_answers":["reading"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He won the race, but before that he had been ___ (entrenando) hard.", "s":{"type":"typing","correct_answers":["training"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué frase de tus apuntes sirve para contrastar con una acción temporal previa?", "s":{"type":"multiple_choice","options":["...but before that she had been picking strawberries","...but after that she had been...","...but tomorrow she had been..."],"answer":0}}'::jsonb,
        '{"r":4, "p":"She went to work, but ___ that she had been picking strawberries.", "s":{"type":"multiple_choice","options":["before","after","during"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He became a doctor, but before that he ___ studying for years.", "s":{"type":"multiple_choice","options":["had been","has been","was"],"answer":0}}'::jsonb,
        '{"r":4, "p":"La primera parte (la acción más reciente) de ''She went to work, but before that she had been...'' va en:", "s":{"type":"multiple_choice","options":["Pasado Simple (went)","Pasado Continuo","Presente Simple"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I moved to Spain, but before that I ___ living in Italy.", "s":{"type":"multiple_choice","options":["had been","have been","am"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We finally bought the house, but before that we ___ renting a flat.", "s":{"type":"multiple_choice","options":["had been","has been","were been"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He fell asleep, but before that he ___ watching a movie.", "s":{"type":"multiple_choice","options":["had been","have been","did"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They stopped playing, but before that they ___ running for two hours.", "s":{"type":"multiple_choice","options":["had been","had be","has been"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"La expresión ''before that'' (antes de eso) es muy útil para introducir el Pasado Perfecto Continuo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En ''She went to work but before that she had been picking strawberries'', recoger fresas sucedió primero.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La acción de ''ir a trabajar'' (went) se pone en Pasado Simple porque es más reciente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El Pasado Perfecto Continuo no sirve para establecer una línea de tiempo cronológica.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Before that I had been working'' significa ''Antes de eso, había estado trabajando''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es obligatorio usar ''after that'' para referirse al pasado más antiguo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"El Pasado Perfecto Continuo contrasta perfectamente con el Pasado Simple para contar historias.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Fue al trabajo, pero antes de eso había estado recogiendo fresas.", "s":{"type":"scramble","chunks":["She went to work,","but before that she had been","picking strawberries"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Antes de eso, había estado viviendo en París.", "s":{"type":"scramble","chunks":["Before that,","I had been","living in Paris"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Pero antes de eso, él había estado trabajando en un banco.", "s":{"type":"scramble","chunks":["But before that,","he had been working","in a bank"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Antes de eso, habíamos estado viendo la televisión.", "s":{"type":"scramble","chunks":["Before that,","we had been","watching TV"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Antes de eso, ella había estado tomando el autobús.", "s":{"type":"scramble","chunks":["Before that,","she had been","taking the bus"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Me quedé dormido, pero antes de eso había estado leyendo.", "s":{"type":"scramble","chunks":["I fell asleep,","but before that I had been","reading"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él ganó, pero antes de eso había estado entrenando.", "s":{"type":"scramble","chunks":["He won,","but before that he had been","training"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 39, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Pasado Perfecto Continuo', 
    'Aprende a expresar acciones temporales que ocurrieron antes de otro evento pasado y a justificar causas y efectos en el pasado.', 
    to_jsonb('## Grammar Lesson: Pasado Perfecto Continuo
El **Pasado Perfecto Continuo** es igual que el pasado perfecto, pero se utiliza para hablar específicamente de **acciones temporales** o para enfatizar la duración de un evento anterior a otro. Es la herramienta definitiva para demostrar **causa y efecto en el pasado**.

##### 1. Formación y Acciones Temporales
Se forma utilizando el auxiliar compuesto **HAD BEEN** (para todas las personas) seguido del verbo principal con terminación **-ing**.
*   *I **had been waiting** for hours.* (Había estado esperando durante horas).
*   *It **had been raining**.* (Había estado lloviendo).

##### 2. Oraciones Negativas e Interrogativas
Para negar, añadimos *not* formando **hadn''t been**. En las preguntas, el auxiliar *Had* pasa delante del sujeto.
*   *I **hadn''t been sleeping**.* (No había estado durmiendo).
*   ***Had** you **been waiting** long?* (¿Habías estado esperando mucho?).

##### 3. Causa y Efecto en el Pasado
Uno de sus usos principales es justificar el estado físico o emocional de alguien en el pasado, dando la "causa continua" previa, casi siempre unido con *because*.
*   *He wasn''t hungry **because he had been eating sweets** all morning.* (No tenía hambre porque había estado comiendo dulces toda la mañana).
*   *She was tired **because she had been running**.* (Estaba cansada porque había estado corriendo).

##### 4. Acciones Previas (Before that)
Contrasta de maravilla con el Pasado Simple para relatar qué se estuvo haciendo temporalmente antes de realizar una acción definitiva.
*   *She went to work at nine, but **before that she had been picking strawberries** in her garden.* (Fue a trabajar a las nueve, pero antes de eso había estado recogiendo fresas en su jardín).
*   *I moved to Madrid, but **before that I had been living** in London.* (Me mudé a Madrid, pero antes de eso había estado viviendo en Londres).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Formación (Had been + ing)', 'Recuerda: Utiliza "HAD BEEN" + el verbo en "-ing" para hablar de una acción temporal en desarrollo antes de otro punto en el pasado.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Negativas e Interrogativas', 'Para negar, usa "hadn''t been". Para preguntar, coloca "Had" delante del sujeto (ej. Had you been...).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Causa y Efecto (Because)', 'Usa el Pasado Perfecto Continuo para dar la causa de un estado pasado (ej. He wasn''t hungry because he had been eating).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Acciones Previas (Before that)', 'Usa "before that" seguido de Had been + -ing para contar lo que estuviste haciendo justo antes de otra acción.');

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