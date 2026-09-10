-- ============================================================
-- Seed: A0 English Path – Grammar – Past Perfect
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
        -- REGLA 1: Formación y el Pasado del Pasado - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (había) finished my homework.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She had ___ (comido) all the pizza.", "s":{"type":"typing","correct_answers":["eaten"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (habían) already left.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We had ___ (estudiado) English before.", "s":{"type":"typing","correct_answers":["studied"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He had ___ (visto) the movie twice.", "s":{"type":"typing","correct_answers":["seen"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I had ___ (olvidado) his name completely.", "s":{"type":"typing","correct_answers":["forgotten"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"The train ___ (había) departed early.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She had ___ (ido) home.", "s":{"type":"typing","correct_answers":["gone"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Para qué se utiliza el Pasado Perfecto según tus apuntes?", "s":{"type":"multiple_choice","options":["Para mencionar acontecimientos anteriores a un hecho pasado","Para hablar de hábitos en el presente","Para predecir el futuro lejano"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el auxiliar que se utiliza en el Pasado Perfecto?", "s":{"type":"multiple_choice","options":["Had","Have / Has","Did"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué forma toma el verbo principal en este tiempo?", "s":{"type":"multiple_choice","options":["Terminación -ed o 3ra columna (Participio)","Terminación -ing (Gerundio)","Infinitivo sin to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He studied German, but before that he ___ studied English.", "s":{"type":"multiple_choice","options":["had","have","was"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I had ___ to Paris before 2010.", "s":{"type":"multiple_choice","options":["been","was","be"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They had ___ the match.", "s":{"type":"multiple_choice","options":["won","win","winning"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She had ___ all the water.", "s":{"type":"multiple_choice","options":["drunk","drank","drink"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We ___ finished the project on time.", "s":{"type":"multiple_choice","options":["had","has","were"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Pasado Perfecto utiliza el auxiliar HAD para todas las personas (I, You, He, They...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El Pasado Perfecto se usa para indicar un hecho que ocurrió antes que otro hecho en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La oración ''I had eat pizza'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Los verbos irregulares utilizan la forma de la 3ª columna en el Pasado Perfecto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''We had lived there'' se traduce como ''Nosotros habíamos vivido allí''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Este tiempo verbal se utiliza frecuentemente para dar órdenes en el presente.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Los verbos regulares añaden ''-ed'' en el Pasado Perfecto, igual que en el Pasado Simple.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Yo había terminado mi trabajo.", "s":{"type":"scramble","chunks":["I had","finished","my work"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella había comido una manzana.", "s":{"type":"scramble","chunks":["She had","eaten","an apple"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros habíamos visto esa película.", "s":{"type":"scramble","chunks":["We had","seen","that movie"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos habían llegado temprano.", "s":{"type":"scramble","chunks":["They had","arrived","early"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él había estudiado alemán.", "s":{"type":"scramble","chunks":["He had","studied","German"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Yo había perdido mis llaves.", "s":{"type":"scramble","chunks":["I had","lost","my keys"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: El tren había salido.", "s":{"type":"scramble","chunks":["The train","had","left"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Negativas e Interrogativas - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I ___ (no había) finished the book.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (no había) slept well the night before.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Habías) you seen him before?", "s":{"type":"typing","correct_answers":["Had"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (no habíamos) eaten anything.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Había) she left the party early?", "s":{"type":"typing","correct_answers":["Had"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (no habían) arrived on time.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"What ___ (habías) you done?", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (no había) studied enough.", "s":{"type":"typing","correct_answers":["hadn''t","had not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cómo se forma la negación en el Pasado Perfecto?", "s":{"type":"multiple_choice","options":["Hadn''t (o Had not) + Participio","Didn''t + Participio","Haven''t + Participio"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué auxiliar usamos para hacer una pregunta en Pasado Perfecto?", "s":{"type":"multiple_choice","options":["Had delante del sujeto","Did delante del sujeto","Was delante del sujeto"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ___ seen that movie before yesterday.", "s":{"type":"multiple_choice","options":["hadn''t","didn''t","haven''t"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ you finished the book before the exam?", "s":{"type":"multiple_choice","options":["Had","Have","Did"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She ___ slept well the night before.", "s":{"type":"multiple_choice","options":["hadn''t","didn''t","wasn''t"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Where ___ they gone before we arrived?", "s":{"type":"multiple_choice","options":["had","have","did"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We ___ visited London before our trip in 2015.", "s":{"type":"multiple_choice","options":["hadn''t","haven''t","don''t"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ he eaten lunch when you called?", "s":{"type":"multiple_choice","options":["Had","Did","Has"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Para negar en Pasado Perfecto se utiliza el auxiliar ''didn''t''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Hadn''t'' es la contracción correcta de ''had not''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En las preguntas de Pasado Perfecto, el auxiliar ''Had'' siempre se coloca al final de la frase.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''She hadn''t finished'' es una estructura correcta en Pasado Perfecto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Had you seen her?'' se traduce al español como ''¿La habías visto?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Al negar con ''hadn''t'', el verbo principal debe volver a su forma en infinitivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La oración ''I no had eaten'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Yo no había terminado el libro.", "s":{"type":"scramble","chunks":["I hadn''t","finished","the book"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Habías visto la película?", "s":{"type":"scramble","chunks":["Had you","seen","the movie?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no había dormido bien.", "s":{"type":"scramble","chunks":["She hadn''t","slept","well"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Habían llegado a tiempo?", "s":{"type":"scramble","chunks":["Had they","arrived","on time?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Nosotros no habíamos comido nada.", "s":{"type":"scramble","chunks":["We hadn''t","eaten","anything"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Qué habías hecho?", "s":{"type":"scramble","chunks":["What","had you","done?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él no había estudiado para el examen.", "s":{"type":"scramble","chunks":["He hadn''t","studied","for the exam"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Conectores (Because, Before, After) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"She was tired ___ (porque) she hadn''t slept.", "s":{"type":"typing","correct_answers":["because"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Antes de) that, he had studied English.", "s":{"type":"typing","correct_answers":["Before"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ate ___ (después de que) I had finished.", "s":{"type":"typing","correct_answers":["after"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He was hungry ___ (porque) he hadn''t eaten.", "s":{"type":"typing","correct_answers":["because"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Antes de que) he arrived, she had left.", "s":{"type":"typing","correct_answers":["Before"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They left ___ (después de que) they had paid.", "s":{"type":"typing","correct_answers":["after"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I passed ___ (porque) I had studied.", "s":{"type":"typing","correct_answers":["because"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Antes de) the exam, I had practiced.", "s":{"type":"typing","correct_answers":["Before"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué conector se usa para justificar un hecho dando una razón anterior en Pasado Perfecto?", "s":{"type":"multiple_choice","options":["Because (porque)","Before (antes)","After (después)"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She was sad ___ she hadn''t won the prize.", "s":{"type":"multiple_choice","options":["because","before","after"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ I went to bed, I had read a book.", "s":{"type":"multiple_choice","options":["Before","Because","After"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I played tennis ___ I had finished my homework.", "s":{"type":"multiple_choice","options":["after","before","because"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He was tired ___ he had worked hard.", "s":{"type":"multiple_choice","options":["because","before","when"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué conector significa ''antes (de)'' y ayuda a organizar la línea temporal?", "s":{"type":"multiple_choice","options":["Before","After","Because"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué conector significa ''después (de)''?", "s":{"type":"multiple_choice","options":["After","Before","While"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They were late ___ they hadn''t taken the bus.", "s":{"type":"multiple_choice","options":["because","before","after"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Because'' se usa muy a menudo con el Pasado Perfecto para explicar la causa de una situación pasada.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La palabra ''Before'' se traduce al español como ''después''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Podemos usar ''after'' seguido de Pasado Perfecto para indicar la acción más antigua que ya se había completado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La frase ''Because she hadn''t slept, she was tired'' tiene sentido gramatical.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La palabra ''After'' significa ''antes de''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Before that, he had studied English'' sirve para mencionar un acontecimiento claramente anterior.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Because'' nunca se puede utilizar con el tiempo Pasado Perfecto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Estaba cansada porque no había dormido.", "s":{"type":"scramble","chunks":["She was tired","because","she hadn''t slept"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Antes de eso, había estudiado inglés.", "s":{"type":"scramble","chunks":["Before that,","he had studied","English"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Salí después de haber comido.", "s":{"type":"scramble","chunks":["I went out","after","I had eaten"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él falló porque no había estudiado.", "s":{"type":"scramble","chunks":["He failed","because","he hadn''t studied"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Antes de que llegara, habíamos terminado.", "s":{"type":"scramble","chunks":["Before he arrived,","we had","finished"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Se fueron después de haber pagado.", "s":{"type":"scramble","chunks":["They left","after","they had paid"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Estaba feliz porque había ganado.", "s":{"type":"scramble","chunks":["I was happy","because","I had won"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Contraste con el Pasado Simple - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"When I arrived (simple), they ___ (habían) left.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She had eaten before I ___ (llegué).", "s":{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (fui) to the store after I had finished.", "s":{"type":"typing","correct_answers":["went"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He didn''t eat because he ___ (había) already eaten.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They had left when we ___ (llegamos).", "s":{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I couldn''t enter because I ___ (había) lost my keys.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (estaba) tired because she hadn''t slept.", "s":{"type":"typing","correct_answers":["was"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"When he woke up, it ___ (había) stopped raining.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Cuando hay dos acciones en el pasado, ¿cuál se pone en Pasado Perfecto?", "s":{"type":"multiple_choice","options":["La acción más antigua (la que ocurrió primero en el tiempo)","La acción más reciente","Ambas van en Pasado Perfecto"],"answer":0}}'::jsonb,
        '{"r":4, "p":"When I got to the station, the train ___ left.", "s":{"type":"multiple_choice","options":["had","has","was"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ the movie perfectly because I had read the book.", "s":{"type":"multiple_choice","options":["understood","understand","understanding"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She didn''t pass the exam because she ___ studied.", "s":{"type":"multiple_choice","options":["hadn''t","didn''t","doesn''t"],"answer":0}}'::jsonb,
        '{"r":4, "p":"After they had eaten, they ___ home.", "s":{"type":"multiple_choice","options":["went","go","gone"],"answer":0}}'::jsonb,
        '{"r":4, "p":"When we arrived, the party ___ already started.", "s":{"type":"multiple_choice","options":["had","have","was"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He ___ tired because he had run 10 kilometers.", "s":{"type":"multiple_choice","options":["was","were","had"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They had already left when I ___ them on the phone.", "s":{"type":"multiple_choice","options":["called","call","had called"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"En un contexto narrativo, la acción más reciente se escribe en Pasado Simple.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La acción más antigua o remota se escribe en Pasado Perfecto para indicar que es el ''pasado del pasado''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Si digo ''I ate because I had cooked'', significa que la acción de cocinar (cooked) pasó antes que la de comer (ate).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En oraciones con dos acciones pasadas, ambas deben ir siempre obligatoriamente en Pasado Perfecto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En la frase ''When I arrived, she had left'', entendemos que ella se fue antes de que yo llegara.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El Pasado Perfecto se utiliza a menudo de forma aislada sin ningún contexto de otra acción pasada.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En la frase de tus apuntes ''He studied German but before he had studied English'', el estudio del inglés es la acción más antigua.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Cuando llegué, ellos se habían ido.", "s":{"type":"scramble","chunks":["When I arrived,","they had","left"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella se había ido antes de que yo llamara.", "s":{"type":"scramble","chunks":["She had left","before","I called"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Salí después de haber comido.", "s":{"type":"scramble","chunks":["I went out","after I","had eaten"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él estaba cansado porque había trabajado.", "s":{"type":"scramble","chunks":["He was tired","because","he had worked"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: El tren había salido cuando llegamos.", "s":{"type":"scramble","chunks":["The train had left","when","we arrived"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Lo entendí porque lo había leído.", "s":{"type":"scramble","chunks":["I understood","because I","had read it"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella no cenó porque ya había comido.", "s":{"type":"scramble","chunks":["She didn''t eat","because she","had eaten"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 38, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Pasado Perfecto', 
    'Aprende a usar el Pasado Perfecto (HAD + participio) para hablar del "pasado del pasado", expresando acciones anteriores a otro evento que ya finalizó.', 
    to_jsonb('## Grammar Lesson: Pasado Perfecto
El **Pasado Perfecto** se utiliza principalmente cuando se habla de un hecho pasado y se quiere hacer mención a acontecimientos que ocurrieron **antes** de este hecho. Es conocido como el "pasado del pasado".

##### 1. Formación y el Pasado del Pasado
Se forma siempre con el verbo auxiliar **HAD** (para todos los sujetos) seguido del verbo principal en participio (terminación **-ed** o la **3ª columna** de los irregulares).
*   *He studied German when he was twenty-five, but before that he **had studied** English.* (Estudió alemán a los 25, pero antes de eso **había estudiado** inglés).
*   *The train **had left**.* (El tren había salido).

##### 2. Negativas e Interrogativas
La negación se forma añadiendo *not* al auxiliar, contrayéndose habitualmente como **hadn''t**. Para preguntar, **Had** se coloca delante del sujeto.
*   *She was tired because she **hadn''t slept** the night before.* (Estaba cansada porque **no había dormido** la noche anterior).
*   ***Had** you seen the movie?* (¿Habías visto la película?).

##### 3. Conectores Temporales (Because, Before, After)
Este tiempo verbal casi nunca funciona solo; siempre necesita conectores temporales que ayuden a organizar qué acción ocurrió primero y cuál después.
*   **Because (Porque):** Para dar una justificación usando la acción más antigua. *(She was tired **because** she hadn''t slept).*
*   **Before (Antes de):** Para indicar lo que pasó de manera previa. *(He had studied English **before**).*
*   **After (Después de):** Para indicar lo que pasó posteriormente. *(I went out **after** I had eaten).*

##### 4. Contraste con el Pasado Simple
El uso más avanzado e importante es en oraciones con dos acciones pasadas: la acción más reciente se pone en **Pasado Simple**, mientras que la acción cronológicamente más antigua se pone en **Pasado Perfecto**.
*   *When I arrived* (Pasado Simple - Reciente), *the train had left.* (Pasado Perfecto - Antiguo).
*   *She didn''t eat* (Pasado Simple - Reciente) *because she had already eaten.* (Pasado Perfecto - Antiguo).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Formación y el "Pasado del Pasado"', 'Utiliza el auxiliar HAD (para todas las personas) seguido del verbo en participio (3ª columna o -ed) para indicar un hecho anterior a otro.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Negativas e Interrogativas', 'Usa "hadn''t" para negar (no había) y coloca "Had" delante del sujeto para formar las interrogativas (¿Habías...?).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Conectores', 'Conectores como "Because", "Before" y "After" son fundamentales para darle contexto a la acción en Pasado Perfecto.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Contraste Pasado Simple', 'Recuerda: Si hay dos acciones pasadas en la oración, la más antigua se escribe en Pasado Perfecto y la más reciente en Pasado Simple.');

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