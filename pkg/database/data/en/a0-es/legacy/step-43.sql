-- ============================================================
-- Seed: A0 English Path – Grammar – Past Simple
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
        -- REGLA 1: Acciones Terminadas y Complementos - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"He ___ (bebió) coffee last night.", "s":{"type":"typing","correct_answers":["drank"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (jugué) tennis yesterday.", "s":{"type":"typing","correct_answers":["played"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (visitó) London two months ago.", "s":{"type":"typing","correct_answers":["visited"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (fuimos) to Paris in 2003.", "s":{"type":"typing","correct_answers":["went"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (compraron) a house last year.", "s":{"type":"typing","correct_answers":["bought"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (vi) a great movie last night.", "s":{"type":"typing","correct_answers":["saw"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (llegó) three days ago.", "s":{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (trabajó) hard during the war.", "s":{"type":"typing","correct_answers":["worked"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Para qué se utiliza principalmente el Pasado Simple?", "s":{"type":"multiple_choice","options":["Para acciones pasadas, acabadas y localizadas en el tiempo","Para acciones que siguen ocurriendo en el presente","Para rutinas en el futuro"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He ___ coffee last night.", "s":{"type":"multiple_choice","options":["drank","drink","drinked"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I moved to this city two years ___ (hace dos años).", "s":{"type":"multiple_choice","options":["ago","last","during"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We travelled to Italy ___ year (el año pasado).", "s":{"type":"multiple_choice","options":["last","ago","during"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They worked together ___ the war (durante la guerra).", "s":{"type":"multiple_choice","options":["during","ago","last"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Dónde se coloca la palabra ''ago'' (hace) en una frase?", "s":{"type":"multiple_choice","options":["Después de la cantidad de tiempo (ej. two months ago)","Antes de la cantidad de tiempo (ej. ago two months)","Delante del verbo principal"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ a new car yesterday.", "s":{"type":"multiple_choice","options":["bought","buyed","buys"],"answer":0}}'::jsonb,
        '{"r":1, "p":"En verbos regulares, ¿qué terminación marca el pasado simple?", "s":{"type":"multiple_choice","options":["-ed","-ing","-s"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Pasado Simple expresa acciones pasadas y terminadas, a menudo localizadas con expresiones como ''yesterday'' o ''last night''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para verbos regulares en afirmación, añadimos ''-ed'' al final del verbo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La palabra ''ago'' significa ''hace'' y se coloca antes del tiempo (ej. ago two months).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Last year'' significa el año pasado o el último año.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''He drinked coffee last night''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''During'' significa ''durante'' y se usa para situar una acción (ej. during the war).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Los verbos irregulares no añaden ''-ed''; usan su propia forma de la 2ª columna.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Fui a Londres el año pasado.", "s":{"type":"scramble","chunks":["I went","to London","last year"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él bebió café anoche.", "s":{"type":"scramble","chunks":["He drank","coffee","last night"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Compramos una casa hace dos años.", "s":{"type":"scramble","chunks":["We bought","a house","two years ago"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella terminó su trabajo durante la guerra.", "s":{"type":"scramble","chunks":["She finished","her work","during the war"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Jugaron al tenis ayer.", "s":{"type":"scramble","chunks":["They played","tennis","yesterday"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Lo vi hace una hora.", "s":{"type":"scramble","chunks":["I saw him","an hour","ago"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Llegó el mes pasado.", "s":{"type":"scramble","chunks":["He arrived","last","month"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Negativas e Interrogativas (DID) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"___ (Auxiliar) you like the movie?", "s":{"type":"typing","correct_answers":["Did"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (no) see him yesterday.", "s":{"type":"typing","correct_answers":["didn''t","did not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Auxiliar) she call you last night?", "s":{"type":"typing","correct_answers":["Did"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (no) buy the car.", "s":{"type":"typing","correct_answers":["didn''t","did not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Where ___ (auxiliar) they go?", "s":{"type":"typing","correct_answers":["did"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (no) know the answer.", "s":{"type":"typing","correct_answers":["didn''t","did not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"What time ___ (auxiliar) you arrive?", "s":{"type":"typing","correct_answers":["did"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (no) sleep well.", "s":{"type":"typing","correct_answers":["didn''t","did not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cuál es el auxiliar del Pasado Simple para todas las personas?", "s":{"type":"multiple_choice","options":["Did","Do / Does","Was / Were"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ you go to the party last night?", "s":{"type":"multiple_choice","options":["Did","Do","Were"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She ___ the email yesterday.", "s":{"type":"multiple_choice","options":["didn''t send","didn''t sent","doesn''t send"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Cuando utilizamos el auxiliar ''DID'' o ''DIDN''T'', ¿qué le ocurre al verbo principal?", "s":{"type":"multiple_choice","options":["Vuelve a su forma base (infinitivo)","Se le añade -ed","Se mantiene en la forma de la 2da columna"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He ___ understand the lesson.", "s":{"type":"multiple_choice","options":["didn''t","don''t","wasn''t"],"answer":0}}'::jsonb,
        '{"r":2, "p":"What ___ you do last weekend?", "s":{"type":"multiple_choice","options":["did","are","do"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Where did they ___?", "s":{"type":"multiple_choice","options":["go","went","going"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I didn''t ___ pizza last night.", "s":{"type":"multiple_choice","options":["eat","ate","eated"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"El auxiliar del pasado simple es DID y es el mismo para todas las personas (I, You, He, She...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''Did you went to the party?''", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Cuando usamos DID o DIDN''T, el verbo principal pierde su terminación -ed y vuelve a su forma base.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La negación en pasado simple se forma con ''didn''t + verbo en pasado''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''He didn''t drink coffee'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En una pregunta, el auxiliar ''Did'' se coloca delante del sujeto (ej. Did she call?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''I no played yesterday'' es la traducción correcta de ''Yo no jugué ayer''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: ¿Fuiste a la fiesta?", "s":{"type":"scramble","chunks":["Did you","go to","the party?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no compró el libro.", "s":{"type":"scramble","chunks":["She","didn''t buy","the book"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No vimos la película.", "s":{"type":"scramble","chunks":["We","didn''t see","the movie"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Dónde viviste?", "s":{"type":"scramble","chunks":["Where","did","you live?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él no sabía la respuesta.", "s":{"type":"scramble","chunks":["He didn''t","know","the answer"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Cuándo llegaron?", "s":{"type":"scramble","chunks":["When","did they","arrive?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo no jugué ayer.", "s":{"type":"scramble","chunks":["I didn''t","play","yesterday"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Interrupciones en el Pasado - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"While we were eating, the phone ___ (sonó).", "s":{"type":"typing","correct_answers":["rang"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I was reading when he ___ (llamó).", "s":{"type":"typing","correct_answers":["called"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Someone ___ (llamó/golpeó) the door while I was sleeping.", "s":{"type":"typing","correct_answers":["knocked"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It was raining when I ___ (llegué).", "s":{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They were playing when it ___ (empezó) to rain.", "s":{"type":"typing","correct_answers":["started"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The car ___ (se rompió/averió) while we were driving.", "s":{"type":"typing","correct_answers":["broke","broke down"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (caí) when I was running.", "s":{"type":"typing","correct_answers":["fell"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We were talking when the music ___ (paró).", "s":{"type":"typing","correct_answers":["stopped"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"El Pasado Simple se utiliza para expresar acciones que...", "s":{"type":"multiple_choice","options":["Interrumpen una acción que estaba sucediendo en el pasado (Pasado Continuo)","Ocurren todos los días","Nunca han sucedido"],"answer":0}}'::jsonb,
        '{"r":3, "p":"While we were eating, the phone ___.", "s":{"type":"multiple_choice","options":["rang","was ringing","ring"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I was walking to the station when I ___ John.", "s":{"type":"multiple_choice","options":["met","meet","meeting"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She was watching TV when the lights ___ out.", "s":{"type":"multiple_choice","options":["went","go","was going"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ you sleeping when I knocked the door?", "s":{"type":"multiple_choice","options":["Were","Did","Was"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ my finger while I was cooking.", "s":{"type":"multiple_choice","options":["cut","cutting","was cutting"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They were driving when they ___ an accident.", "s":{"type":"multiple_choice","options":["saw","see","seeing"],"answer":0}}'::jsonb,
        '{"r":3, "p":"When I ___ up, it was raining.", "s":{"type":"multiple_choice","options":["woke","wake","was waking"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Utilizamos el Pasado Simple para la acción puntual que interrumpe una acción más larga en progreso.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En la frase ''While we were eating, the phone rang'', ''rang'' es el Pasado Simple.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La acción que estaba en progreso se escribe en Pasado Continuo (was/were + -ing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto decir: ''While I cooked, the phone was ringing'' para decir que el teléfono interrumpió.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''When'' a menudo introduce la frase en Pasado Simple que funciona como interrupción (ej. when I arrived).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"El Pasado Simple describe situaciones de fondo en el pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"La acción que interrumpe se considera acabada y finalizada en ese momento del pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: El teléfono sonó mientras comíamos.", "s":{"type":"scramble","chunks":["The phone rang","while","we were eating"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Llovía cuando llegué.", "s":{"type":"scramble","chunks":["It was raining","when","I arrived"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Me llamó mientras yo leía.", "s":{"type":"scramble","chunks":["He called me","while","I was reading"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Qué hacías cuando la viste?", "s":{"type":"scramble","chunks":["What were you doing","when","you saw her?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Alguien llamó a la puerta mientras dormía.", "s":{"type":"scramble","chunks":["Someone knocked","while","I was sleeping"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Me caí cuando corría.", "s":{"type":"scramble","chunks":["I fell","when","I was running"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: El coche se rompió mientras conducíamos.", "s":{"type":"scramble","chunks":["The car broke","while","we were driving"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Preguntas sobre el Sujeto (Excepción Sin Auxiliar) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"___ (Quién) painted ''Las meninas''?", "s":{"type":"typing","correct_answers":["Who"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"What ___ (pasó) last night?", "s":{"type":"typing","correct_answers":["happened"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Quién) told you that?", "s":{"type":"typing","correct_answers":["Who"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Who ___ (pintó) that picture?", "s":{"type":"typing","correct_answers":["painted"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Who ___ (rompió) the window?", "s":{"type":"typing","correct_answers":["broke"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Qué) hit you?", "s":{"type":"typing","correct_answers":["What"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Who ___ (ganó) the match?", "s":{"type":"typing","correct_answers":["won"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"What ___ (hizo) you change your mind?", "s":{"type":"typing","correct_answers":["made"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Cuando la incógnita (la palabra WH) es el propio sujeto de la acción...", "s":{"type":"multiple_choice","options":["No se utiliza el auxiliar DID","Se debe usar siempre el auxiliar DID","El verbo principal desaparece"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ painted ''Las meninas''?", "s":{"type":"multiple_choice","options":["Who","Who did","Did who"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ happened?", "s":{"type":"multiple_choice","options":["What","What did","What does"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Who ___ the window?", "s":{"type":"multiple_choice","options":["broke","did break","did broke"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es correcta gramaticalmente?", "s":{"type":"multiple_choice","options":["Who told you that?","Who did tell you that?","Who did told you that?"],"answer":0}}'::jsonb,
        '{"r":4, "p":"What ___ you change your mind?", "s":{"type":"multiple_choice","options":["made","did make","make"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Who ___ the match?", "s":{"type":"multiple_choice","options":["won","did win","win"],"answer":0}}'::jsonb,
        '{"r":4, "p":"En la pregunta ''What happened?'', la palabra ''What'' es:", "s":{"type":"multiple_choice","options":["El sujeto de la oración","El verbo auxiliar","El complemento directo"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"La regla de oro dicta que NO se utiliza el auxiliar DID cuando la pregunta recae sobre el sujeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es totalmente correcto decir ''Who did paint Las Meninas?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En las preguntas por el sujeto (ej. Who broke the window?), el verbo principal se escribe directamente en pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''What happened?'' (¿Qué pasó?) no lleva auxiliar porque no sabemos el sujeto (la cosa) que causó la acción.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Cualquier pregunta en inglés con la palabra ''Who'' siempre elimina el auxiliar DID.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Si preguntas ''¿A quién viste?'' el sujeto eres tú (you), por tanto, sí se usa DID: ''Who did you see?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Who won the match?'' es gramaticalmente incorrecto, debería ser ''Who did win the match?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: ¿Quién pintó Las Meninas?", "s":{"type":"scramble","chunks":["Who","painted","Las Meninas?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Qué pasó anoche?", "s":{"type":"scramble","chunks":["What","happened","last night?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Quién te dijo eso?", "s":{"type":"scramble","chunks":["Who","told","you that?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Quién rompió la ventana?", "s":{"type":"scramble","chunks":["Who","broke","the window?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Qué te hizo cambiar de opinión?", "s":{"type":"scramble","chunks":["What","made you","change your mind?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Quién ganó el partido?", "s":{"type":"scramble","chunks":["Who","won","the match?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Qué te golpeó?", "s":{"type":"scramble","chunks":["What","hit","you?"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 34, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Pasado Simple', 
    'Aprende a narrar acciones terminadas en el pasado, utilizar correctamente el auxiliar DID, y dominar las preguntas directas sobre el sujeto.', 
    to_jsonb('## Grammar Lesson: Pasado Simple
El **Pasado Simple** es el tiempo verbal por excelencia para expresar acciones pasadas que ya han finalizado y están a menudo situadas y localizadas en el tiempo.

##### 1. Acciones Terminadas y Complementos de Tiempo
Para oraciones afirmativas, se añade **-ed** a los verbos regulares, o se utiliza la forma de la **segunda columna** para los verbos irregulares. Suele ir acompañado de palabras que anclan la acción en el pasado:
*   *He drank coffee last night.* (Él bebió café anoche).
*   **Complementos de tiempo clave:**
    *   **Ago:** Significa "hace" y se coloca siempre *después* de la cantidad de tiempo (*two months ago* = hace dos meses).
    *   **Last:** Significa "pasado" o "último" (*last year* = el año pasado).
    *   **During:** Significa "durante" o "en" (*during the war* = durante la guerra).

##### 2. Negativas e Interrogativas (Auxiliar DID)
Para hacer preguntas y oraciones negativas en el pasado, usamos el auxiliar **DID** (para todas las personas). Al usar el auxiliar, **el verbo principal vuelve a su forma base o infinitivo**, perdiendo la terminación -ed.
*   *Did you go to the party?* (¿Fuiste a la fiesta?).
*   *She didn''t buy the car.* (Ella no compró el coche).
*   *Where did they live?* (¿Dónde vivían ellos?).

##### 3. Interrupciones en el pasado
El Pasado Simple se utiliza habitualmente junto al Pasado Continuo para expresar **la acción puntual que interrumpe** a una acción más larga que estaba en desarrollo.
*   *While we were eating, the phone **rang**.* (Mientras estábamos comiendo, el teléfono sonó).
*   *I was reading when he **called**.* (Estaba leyendo cuando me llamó).

##### 4. Preguntas sobre el Sujeto (Excepción Vital)
Existe una regla de oro en inglés: **NO se utiliza auxiliar** cuando la incógnita (la palabra de pregunta) se encuentra en el propio sujeto. Es decir, si preguntas "Quién" o "Qué" hizo la acción, el verbo va directamente en pasado.
*   *Who painted "Las meninas"?* (¿Quién pintó Las Meninas?) -> NO se dice *Who did paint*.
*   *What happened?* (¿Qué pasó?) -> NO se dice *What did happen*.'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Acciones Terminadas', 'Usa la forma en pasado del verbo (+ed o irregular) para afirmativas y colócalas en el tiempo correcto. Recuerda que "Ago" va detrás del tiempo (two months ago).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Auxiliar DID', 'Usa "Did" o "Didn''t" para preguntas y negaciones. ¡Cuidado! Cuando el auxiliar está, el verbo principal debe estar en su forma normal, sin "-ed".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Interrupciones en el Pasado', 'Utiliza el Pasado Simple para escribir la acción corta y repentina que interrumpe algo que ya estaba ocurriendo (ej. the phone rang).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Preguntas sobre el Sujeto', 'Recuerda la excepción de oro: Nunca uses "DID" cuando preguntes Quién (Who) o Qué (What) realizó la acción directamente (ej. What happened?).');

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