-- ============================================================
-- Seed: A0 English Path – Grammar – Present Continuous
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
        -- REGLA 1: Acciones en el momento de hablar - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"It ___ (está) raining right now.", "s":{"type":"typing","correct_answers":["is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (estoy) listening to you.", "s":{"type":"typing","correct_answers":["am"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We are ___ (jugando) football.", "s":{"type":"typing","correct_answers":["playing"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (están) watching TV.", "s":{"type":"typing","correct_answers":["are"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (¿Está) it raining?", "s":{"type":"typing","correct_answers":["Is"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She is ___ (hablando) on the phone.", "s":{"type":"typing","correct_answers":["talking"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (no está) eating.", "s":{"type":"typing","correct_answers":["isn''t","is not"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Are you ___ (trabajando) now?", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Para qué se usa principalmente el Presente Continuo?", "s":{"type":"multiple_choice","options":["Para cosas que están sucediendo en el momento de hablar","Para rutinas y hábitos diarios","Para acciones que finalizaron ayer"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se forma la estructura básica del Presente Continuo?", "s":{"type":"multiple_choice","options":["Verbo TO BE + verbo en pasado","Verbo TO BE + verbo terminado en -ing","Auxiliar DO/DOES + verbo normal"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ it raining outside?", "s":{"type":"multiple_choice","options":["Is","Does","Are"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ my breakfast right now.", "s":{"type":"multiple_choice","options":["am eating","eating","is eating"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ listening to the teacher.", "s":{"type":"multiple_choice","options":["are","is","do"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Please be quiet, the baby ___.", "s":{"type":"multiple_choice","options":["is sleeping","sleeps","sleeping"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ paying attention to the class.", "s":{"type":"multiple_choice","options":["isn''t","doesn''t","not"],"answer":0}}'::jsonb,
        '{"r":1, "p":"What ___ you doing?", "s":{"type":"multiple_choice","options":["are","do","is"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Presente Continuo se utiliza para expresar acciones que están sucediendo en el instante en que se habla.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''It is raining'' es un ejemplo del Presente Continuo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para hacer una pregunta en Presente Continuo, se utiliza el auxiliar ''DO''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La estructura correcta es usar siempre el verbo TO BE seguido de otro verbo acabado en -ing.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''I playing football'' sin el verbo TO BE.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''She is talking'' se traduce como ''Ella está hablando''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"En las negaciones, se añade ''not'' al verbo terminado en -ing (ej. I am working not).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Está lloviendo ahora.", "s":{"type":"scramble","chunks":["raining","now","It is"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Yo te estoy escuchando.", "s":{"type":"scramble","chunks":["listening","I am","to you"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Estás tú trabajando?", "s":{"type":"scramble","chunks":["working?","Are","you"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos están viendo la televisión.", "s":{"type":"scramble","chunks":["They","watching TV","are"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él no está comiendo.", "s":{"type":"scramble","chunks":["isn''t","eating","He"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Está lloviendo?", "s":{"type":"scramble","chunks":["raining?","Is","it"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros estamos jugando.", "s":{"type":"scramble","chunks":["are","playing","We"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Reglas de Ortografía (-ING) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"Make ➔ ___ (haciendo)", "s":{"type":"typing","correct_answers":["making"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Take ➔ ___ (tomando/cogiendo)", "s":{"type":"typing","correct_answers":["taking"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Run ➔ ___ (corriendo)", "s":{"type":"typing","correct_answers":["running"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Get ➔ ___ (consiguiendo/obteniendo)", "s":{"type":"typing","correct_answers":["getting"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Walk ➔ ___ (caminando)", "s":{"type":"typing","correct_answers":["walking"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Talk ➔ ___ (hablando)", "s":{"type":"typing","correct_answers":["talking"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Stop ➔ ___ (parando)", "s":{"type":"typing","correct_answers":["stopping"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Dance ➔ ___ (bailando)", "s":{"type":"typing","correct_answers":["dancing"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"Si un verbo acaba en ''E'' precedida de consonante (ej. take), ¿cómo se forma el gerundio?", "s":{"type":"multiple_choice","options":["Se quita la E y se agrega ING (taking)","Se mantiene la E y se añade ING (takeing)","Se dobla la consonante (takking)"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Si un verbo tiene una sílaba y acaba en consonante-vocal-consonante (ej. run), ¿qué sucede?", "s":{"type":"multiple_choice","options":["Se dobla la última consonante y se agrega ING (running)","Se añade solo ING (runing)","Se añade EING (runeing)"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el gerundio correcto de ''make''?", "s":{"type":"multiple_choice","options":["making","makeing","makking"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el gerundio correcto de ''get''?", "s":{"type":"multiple_choice","options":["getting","geting","geteitng"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el gerundio correcto de ''walk''?", "s":{"type":"multiple_choice","options":["walking","walkking","walkeing"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el gerundio correcto de ''sit'' (sentarse, 1 sílaba)?", "s":{"type":"multiple_choice","options":["sitting","siting","siteng"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el gerundio correcto de ''write'' (escribir)?", "s":{"type":"multiple_choice","options":["writing","writeing","writting"],"answer":0}}'::jsonb,
        '{"r":2, "p":"En general, para la mayoría de los verbos (el resto), ¿qué se añade?", "s":{"type":"multiple_choice","options":["Se agrega ING sin cambiar nada más","Se dobla la última letra siempre","Se añade -ED"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Si un verbo acaba en ''E'' precedida de consonante, simplemente le añadimos ''-ing'' sin borrar nada (ej. makeing).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Para el verbo ''take'', la forma correcta del gerundio es ''taking''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Los verbos de una sílaba acabados en consonante (tras una vocal) doblan la consonante (ej. run -> running).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"El verbo ''get'' se convierte en ''geting'' (con una sola ''t'').", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Para verbos normales que no cumplen excepciones como ''talk'', solo agregamos ''-ing'' (talking).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"El verbo ''walk'' debe doblar la ''k'' formando ''walkking''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"El gerundio de ''dance'' (bailar) es ''dancing''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Él está corriendo rápido.", "s":{"type":"scramble","chunks":["running","He is","fast"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella está haciendo un pastel (make).", "s":{"type":"scramble","chunks":["making","a cake","She is"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Me estoy preparando (get ready).", "s":{"type":"scramble","chunks":["ready","getting","I am"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ellos están tomando fotos (take).", "s":{"type":"scramble","chunks":["taking","are","They","photos"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Nosotros estamos caminando (walk).", "s":{"type":"scramble","chunks":["We","walking","are"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él está nadando (swim -> swimming).", "s":{"type":"scramble","chunks":["swimming","is","He"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Estoy escribiendo una carta (write).", "s":{"type":"scramble","chunks":["writing","I am","a letter"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Acciones no acabadas o temporales - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"He is ___ (leyendo) a book this week.", "s":{"type":"typing","correct_answers":["reading"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (están) studying French this year.", "s":{"type":"typing","correct_answers":["are"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I am ___ (trabajando) on a new project.", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is ___ (viviendo) with her parents temporarily.", "s":{"type":"typing","correct_answers":["living"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We are ___ (escribiendo) a novel.", "s":{"type":"typing","correct_answers":["writing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Are you ___ (aprendiendo) to drive?", "s":{"type":"typing","correct_answers":["learning"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"My English is ___ (mejorando).", "s":{"type":"typing","correct_answers":["improving"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (no está) sleeping well lately.", "s":{"type":"typing","correct_answers":["isn''t","is not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"El Presente Continuo también sirve para...", "s":{"type":"multiple_choice","options":["Acciones no acabadas o procesos temporales (ej. He is reading a book)","Verdades científicas universales","Hábitos de cuando eras niño"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He ___ a very interesting book these days.", "s":{"type":"multiple_choice","options":["is reading","read","reads"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ with my brother until I find a flat.", "s":{"type":"multiple_choice","options":["am living","live","living"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She is ___ to pass her driving test this month.", "s":{"type":"multiple_choice","options":["trying","tries","try"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They are ___ a house in the mountains (acción en progreso temporal).", "s":{"type":"multiple_choice","options":["building","builds","build"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We ___ hard to finish the project this week.", "s":{"type":"multiple_choice","options":["are working","works","work"],"answer":0}}'::jsonb,
        '{"r":3, "p":"My brother ___ physics at the university.", "s":{"type":"multiple_choice","options":["is studying","studies","study"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ a great television series.", "s":{"type":"multiple_choice","options":["am watching","watches","watch"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"El Presente Continuo se puede usar para hablar de acciones en curso o no acabadas, aunque no estén sucediendo en este mismo segundo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La oración ''He is reading a book'' solo puede significar que lo tiene abierto en las manos ahora mismo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Puedes usar el Presente Continuo para situaciones temporales, como ''I am living with my parents this month''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para hablar de rutinas permanentes o hechos generales, preferimos el Presente Continuo antes que el Presente Simple.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''They are studying English this year'' para referirse a un proceso temporal no acabado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''My English is improving'' (mi inglés está mejorando) es un ejemplo de una situación que cambia y está en progreso.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Si un escritor está trabajando en un libro durante todo el año, no podemos usar el Presente Continuo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Él está leyendo un libro.", "s":{"type":"scramble","chunks":["reading","He is","a book"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Estoy viviendo en Londres este mes.", "s":{"type":"scramble","chunks":["in London","I am living","this month"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella está estudiando derecho (law).", "s":{"type":"scramble","chunks":["She is","law","studying"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Estamos trabajando en un proyecto.", "s":{"type":"scramble","chunks":["We are","on a project","working"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos están construyendo un hospital.", "s":{"type":"scramble","chunks":["a hospital","building","They are"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Mi hermano está aprendiendo a conducir.", "s":{"type":"scramble","chunks":["learning","My brother is","to drive"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: No estoy durmiendo bien últimamente.", "s":{"type":"scramble","chunks":["sleeping well","I am not","lately"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Futuro Planeado - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I am ___ (tomando/haciendo) my exam next Friday.", "s":{"type":"typing","correct_answers":["taking"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We ___ (estamos) flying to Paris tomorrow.", "s":{"type":"typing","correct_answers":["are"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She is ___ (visitando) her grandmother this weekend.", "s":{"type":"typing","correct_answers":["visiting"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They are ___ (llegando) tonight.", "s":{"type":"typing","correct_answers":["arriving"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (no está) working tomorrow.", "s":{"type":"typing","correct_answers":["isn''t","is not"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Are you ___ (saliendo) later?", "s":{"type":"typing","correct_answers":["going out","leaving"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (estoy) meeting John at 8 o''clock.", "s":{"type":"typing","correct_answers":["am"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We are ___ (teniendo) a party next Saturday.", "s":{"type":"typing","correct_answers":["having"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"El Presente Continuo puede usarse para hablar del futuro cuando se trata de...", "s":{"type":"multiple_choice","options":["Un futuro planeado o una cita confirmada","Una predicción sobre el clima","Una decisión espontánea de último momento"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ my exam next Friday.", "s":{"type":"multiple_choice","options":["am taking","takes","take"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We ___ to Paris tomorrow morning.", "s":{"type":"multiple_choice","options":["are flying","flies","fly"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ the doctor this afternoon (tiene cita confirmada).", "s":{"type":"multiple_choice","options":["is seeing","sees","seeing"],"answer":0}}'::jsonb,
        '{"r":4, "p":"What ___ you doing tonight?", "s":{"type":"multiple_choice","options":["are","do","will"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They ___ a party next weekend.", "s":{"type":"multiple_choice","options":["are having","have","having"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He ___ tomorrow because it is a holiday.", "s":{"type":"multiple_choice","options":["isn''t working","doesn''t work","not working"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ my friends for lunch at 1:00 PM.", "s":{"type":"multiple_choice","options":["am meeting","meets","meet"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El Presente Continuo nunca se puede utilizar para hablar de planes futuros.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La oración ''I am taking my exam next Friday'' significa que tienes planeado y organizado hacer un examen ese día.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Usar el Presente Continuo para el futuro (Futuro Planeado) transmite mucha seguridad de que el evento va a suceder porque ya está organizado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Se dice ''I taking my exam next Friday'' sin el verbo TO BE.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''We are flying to Paris tomorrow'' es una forma muy común y correcta de expresar una cita o vuelo futuro.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para expresar que te vas a reunir con alguien más tarde, puedes decir ''I am meeting him later''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El Presente Continuo es ideal para predicciones inciertas, como ''I think it is raining tomorrow''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Haré mi examen el próximo viernes.", "s":{"type":"scramble","chunks":["next Friday","my exam","I am taking"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Volamos a París mañana.", "s":{"type":"scramble","chunks":["We are","tomorrow","flying to Paris"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella visitará a su abuela este fin de semana.", "s":{"type":"scramble","chunks":["this weekend","visiting her grandmother","She is"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Me reúno con John a las 8.", "s":{"type":"scramble","chunks":["at 8 o''clock","meeting John","I am"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ellos no trabajan mañana.", "s":{"type":"scramble","chunks":["aren''t working","tomorrow","They"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Qué harás esta noche?", "s":{"type":"scramble","chunks":["doing","What are you","tonight?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Tendremos una fiesta el sábado.", "s":{"type":"scramble","chunks":["a party","We are having","on Saturday"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 33, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Presente Continuo', 
    'Aprende a formar y usar el Presente Continuo (TO BE + verbo -ing) para hablar de lo que está sucediendo ahora, acciones en curso y tus planes de futuro.', 
    to_jsonb('## Grammar Lesson: Presente Continuo
El **Presente Continuo** se forma utilizando el verbo auxiliar **TO BE** (am, is, are) seguido del verbo principal con la terminación **-ing**. Es fundamental para hablar de acciones en curso o planes cerrados para el futuro.

##### 1. Acciones en el momento de hablar
El uso principal del presente continuo es expresar cosas que están sucediendo exactamente en el instante en que hablamos.
*   *It is raining right now.* (Está lloviendo ahora mismo).
*   *I am working.* (Estoy trabajando).
*   *Are they playing football?* (¿Están jugando al fútbol?).

##### 2. Reglas de Ortografía (-ING)
Al agregar la terminación "-ing" a los verbos, debes seguir estas reglas ortográficas:
*   **Si acaba en E precedida de consonante:** Quita la "E" y añade "ING". (*take -> taking*, *make -> making*).
*   **Una sílaba acabada en consonante-vocal-consonante:** Dobla la consonante final y añade "ING". (*get -> getting*, *run -> running*).
*   **El resto de verbos:** Añade simplemente "ING". (*walk -> walking*, *talk -> talking*).

##### 3. Acciones no acabadas (Temporales)
Se usa también para procesos, situaciones temporales o acciones largas que están sucediendo en este periodo de tu vida, aunque no lo estés haciendo literalmente en este segundo.
*   *He is reading a book.* (Él está leyendo un libro [estos días]).
*   *I am studying English this year.* (Estoy estudiando inglés este año).
*   *They are building a hospital.* (Están construyendo un hospital).

##### 4. Futuro Planeado
Podemos usar el Presente Continuo para hablar del futuro cuando se trata de una cita, arreglo o plan que ya está 100% confirmado y organizado.
*   *I am taking my exam next Friday.* (Voy a hacer mi examen el próximo viernes).
*   *We are flying to Paris tomorrow.* (Volamos a París mañana).
*   *What are you doing tonight?* (¿Qué haces/harás esta noche?).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Acciones en el Momento', 'Recuerda: Utiliza el verbo TO BE (am/is/are) seguido de otro verbo acabado en -ing para hablar de lo que está sucediendo ahora mismo.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Ortografía -ING', 'Regla de oro: Quita la "E" final antes de poner -ing (take/taking), y dobla la última consonante en verbos cortos (get/getting, run/running).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Acciones No Acabadas', 'Usa este tiempo también para proyectos en progreso o situaciones temporales actuales, como "He is reading a book" o "I am studying this year".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Futuro Planeado', 'Puedes usar el Presente Continuo para planes de futuro que ya están cerrados u organizados (ej. I am taking my exam next Friday).');

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