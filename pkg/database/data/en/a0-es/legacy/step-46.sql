-- ============================================================
-- Seed: A0 English Path – Grammar – Present Perfect Continuous
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
        -- REGLA 1: Formación y Uso Continuado - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (he estado) working all morning.", "s":{"type":"typing","correct_answers":["have been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (ha estado) reading a book.", "s":{"type":"typing","correct_answers":["has been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We have been ___ (estudiando) for hours.", "s":{"type":"typing","correct_answers":["studying"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It has ___ (estado) raining all day.", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They have been ___ (esperando) since 2 PM.", "s":{"type":"typing","correct_answers":["waiting"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (ha) been listening to music.", "s":{"type":"typing","correct_answers":["has"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I have been ___ (viviendo) here for a long time.", "s":{"type":"typing","correct_answers":["living"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You have been ___ (durmiendo) all morning.", "s":{"type":"typing","correct_answers":["sleeping"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cómo se forma el Presente Perfecto Continuo?", "s":{"type":"multiple_choice","options":["Have/Has + been + verbo terminado en -ing","Have/Has + verbo en participio","Am/Is/Are + verbo terminado en -ing"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Para qué se utiliza principalmente el Presente Perfecto Continuo?", "s":{"type":"multiple_choice","options":["Para acciones que empezaron en el pasado y continúan en el presente de forma continuada","Para rutinas diarias que siempre hacemos igual","Para acciones que terminaron en un momento específico del pasado"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He ___ listening to the same music all day.", "s":{"type":"multiple_choice","options":["has been","have been","is been"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We ___ working on this project since Monday.", "s":{"type":"multiple_choice","options":["have been","has been","are being"],"answer":0}}'::jsonb,
        '{"r":1, "p":"It has been ___ heavily since last night.", "s":{"type":"multiple_choice","options":["raining","rained","rain"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I have ___ waiting for you for two hours.", "s":{"type":"multiple_choice","options":["been","being","be"],"answer":0}}'::jsonb,
        '{"r":1, "p":"The dog ___ barking all morning.", "s":{"type":"multiple_choice","options":["has been","have been","had been"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She has been ___ English for three years.", "s":{"type":"multiple_choice","options":["studying","studied","studies"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Presente Perfecto Continuo expresa acciones que empezaron en el pasado y han seguido realizándose hasta el presente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La estructura correcta es utilizar ''Have/Has + been + verbo en -ing''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''He has been listen to music'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Se utiliza ''has been'' exclusivamente para los pronombres I, You, We, y They.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La oración ''It has been raining all day'' indica que la lluvia empezó antes y sigue lloviendo ahora.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El Presente Perfecto Continuo da mucha importancia a la duración o la continuidad de la acción.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''They have been playing tennis'' se traduce como ''Ellos jugaron al tenis y terminaron''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Él ha estado escuchando música todo el día.", "s":{"type":"scramble","chunks":["He has been","listening to music","all day"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Yo he estado trabajando aquí.", "s":{"type":"scramble","chunks":["I have been","working","here"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ha estado lloviendo fuertemente.", "s":{"type":"scramble","chunks":["It has been","raining","heavily"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros hemos estado estudiando inglés.", "s":{"type":"scramble","chunks":["We have been","studying","English"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella ha estado leyendo un libro.", "s":{"type":"scramble","chunks":["She has been","reading","a book"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos han estado jugando al tenis.", "s":{"type":"scramble","chunks":["They have been","playing","tennis"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: El perro ha estado ladrando toda la mañana.", "s":{"type":"scramble","chunks":["The dog has been","barking","all morning"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Negativas - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I ___ (no he estado) feeling well lately.", "s":{"type":"typing","correct_answers":["haven''t been","have not been"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (no ha estado) sleeping much.", "s":{"type":"typing","correct_answers":["hasn''t been","has not been"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We haven''t ___ (estado) watching TV.", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He hasn''t been ___ (comiendo) properly.", "s":{"type":"typing","correct_answers":["eating"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (no han estado) practicing enough.", "s":{"type":"typing","correct_answers":["haven''t been","have not been"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It hasn''t been ___ (lloviendo) this week.", "s":{"type":"typing","correct_answers":["raining"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You haven''t been ___ (prestando) attention.", "s":{"type":"typing","correct_answers":["paying"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"John ___ (no ha estado) working hard.", "s":{"type":"typing","correct_answers":["hasn''t been","has not been"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cómo se forma la negación en Presente Perfecto Continuo?", "s":{"type":"multiple_choice","options":["Haven''t/Hasn''t + been + verbo en -ing","Don''t/Doesn''t + have been + -ing","Am not/Isn''t/Aren''t + been + -ing"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ___ feeling well recently.", "s":{"type":"multiple_choice","options":["haven''t been","hasn''t been","haven''t being"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She ___ paying attention in class.", "s":{"type":"multiple_choice","options":["hasn''t been","haven''t been","isn''t been"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We haven''t been ___ to the radio.", "s":{"type":"multiple_choice","options":["listening","listened","listen"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He hasn''t ___ doing his homework.", "s":{"type":"multiple_choice","options":["been","being","be"],"answer":0}}'::jsonb,
        '{"r":2, "p":"It ___ raining much this month.", "s":{"type":"multiple_choice","options":["hasn''t been","haven''t been","isn''t being"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They haven''t been ___ well lately.", "s":{"type":"multiple_choice","options":["sleeping","slept","sleep"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué significa ''I haven''t been working''?", "s":{"type":"multiple_choice","options":["No he estado trabajando","No trabajé nunca","No trabajo habitualmente"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Para hacer la negación, simplemente añadimos ''not'' al auxiliar Have o Has (haven''t / hasn''t).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''I haven''t been feeling well''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''She don''t have been working'' es la forma correcta de negar.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"En las oraciones negativas, el verbo principal sigue llevando la terminación -ing.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''We hasn''t been studying'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''It hasn''t been raining'' significa que no ha estado lloviendo últimamente o en un periodo reciente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La negación del Presente Perfecto Continuo requiere el uso de DIDN''T.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Yo no me he estado sintiendo bien.", "s":{"type":"scramble","chunks":["I haven''t been","feeling","well"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no ha estado durmiendo mucho.", "s":{"type":"scramble","chunks":["She hasn''t been","sleeping","much"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Nosotros no hemos estado viendo la televisión.", "s":{"type":"scramble","chunks":["We haven''t been","watching","TV"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él no ha estado comiendo en todo el día.", "s":{"type":"scramble","chunks":["He hasn''t been","eating","all day"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ellos no han estado prestando atención.", "s":{"type":"scramble","chunks":["They haven''t been","paying","attention"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No ha estado funcionando correctamente.", "s":{"type":"scramble","chunks":["It hasn''t been","working","properly"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Tú no has estado practicando lo suficiente.", "s":{"type":"scramble","chunks":["You haven''t been","practicing","enough"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Preguntas y How Long - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"___ (Cuánto tiempo) have you been waiting?", "s":{"type":"typing","correct_answers":["How long"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"How long ___ (ha) she been sleeping?", "s":{"type":"typing","correct_answers":["has"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Has) you been crying?", "s":{"type":"typing","correct_answers":["Have"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"How long have they ___ (estado) playing?", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Han) they been working?", "s":{"type":"typing","correct_answers":["Have"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"How long has it been ___ (lloviendo)?", "s":{"type":"typing","correct_answers":["raining"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"What have you ___ (estado haciendo)?", "s":{"type":"typing","correct_answers":["been doing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Ha) he been studying all day?", "s":{"type":"typing","correct_answers":["Has"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué expresión se utiliza junto al Presente Perfecto Continuo para preguntar ''Cuánto tiempo'' lleva sucediendo algo?", "s":{"type":"multiple_choice","options":["How long","How much","Since when"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Sorry I’m late. ___ have you been waiting?", "s":{"type":"multiple_choice","options":["How long","What time","When"],"answer":0}}'::jsonb,
        '{"r":3, "p":"How long ___ she been living here?", "s":{"type":"multiple_choice","options":["has","have","is"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ you been crying? Your eyes are red.", "s":{"type":"multiple_choice","options":["Have","Has","Are"],"answer":0}}'::jsonb,
        '{"r":3, "p":"How long have they ___ playing football?", "s":{"type":"multiple_choice","options":["been","being","be"],"answer":0}}'::jsonb,
        '{"r":3, "p":"What ___ you been doing all morning?", "s":{"type":"multiple_choice","options":["have","has","are"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el orden correcto para una pregunta en este tiempo verbal?", "s":{"type":"multiple_choice","options":["Have/Has + Sujeto + been + verbo en -ing","Sujeto + have/has + been + verbo en -ing","Have/Has + been + Sujeto + verbo en -ing"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Has it been ___ all day?", "s":{"type":"multiple_choice","options":["raining","rained","rain"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"La expresión ''How long'' es muy común con el Presente Perfecto Continuo para preguntar por la duración de una acción en progreso.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En las preguntas, el auxiliar ''have'' o ''has'' se coloca delante del sujeto (ej. Have you been...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La pregunta ''How long you have been waiting?'' tiene el orden de palabras correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Have you been crying?'' significa ''¿Has estado llorando?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Solo podemos usar ''How long'' con el Presente Simple, nunca con los tiempos continuos.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"En una pregunta, la palabra ''been'' siempre va justo antes del verbo terminado en -ing.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''What have you been doing?'' es la forma natural de preguntar ''¿Qué has estado haciendo?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: ¿Cuánto tiempo llevas esperando?", "s":{"type":"scramble","chunks":["How long","have you been","waiting?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Cuánto tiempo ha estado ella estudiando?", "s":{"type":"scramble","chunks":["How long","has she been","studying?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Has estado llorando?", "s":{"type":"scramble","chunks":["Have","you been","crying?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Ha estado lloviendo todo el día?", "s":{"type":"scramble","chunks":["Has it been","raining","all day?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Cuánto tiempo han estado ellos jugando?", "s":{"type":"scramble","chunks":["How long","have they been","playing?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Hemos estado yendo por el camino equivocado?", "s":{"type":"scramble","chunks":["Have we been","going","the wrong way?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Qué has estado haciendo?", "s":{"type":"scramble","chunks":["What","have you been","doing?"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Acciones Temporales / No Permanentes - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I have been ___ (quedándome/alojándome) with my sister this week.", "s":{"type":"typing","correct_answers":["staying"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She has been ___ (usando) my car temporarily.", "s":{"type":"typing","correct_answers":["using"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We have been ___ (alquilando) a flat until we buy a house.", "s":{"type":"typing","correct_answers":["renting"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He has been ___ (durmiendo) on the sofa lately.", "s":{"type":"typing","correct_answers":["sleeping"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They have been ___ (tomando) the bus this month.", "s":{"type":"typing","correct_answers":["taking"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have been ___ (trabajando) from home this week.", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She has been ___ (viviendo) in a hotel since the fire.", "s":{"type":"typing","correct_answers":["living"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We have been ___ (comiendo) out a lot lately.", "s":{"type":"typing","correct_answers":["eating"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Según los apuntes, el Presente Perfecto Continuo es ideal para expresar...", "s":{"type":"multiple_choice","options":["Acciones temporales o no permanentes que siguen realizándose","Verdades científicas universales","Hechos históricos del siglo pasado"],"answer":0}}'::jsonb,
        '{"r":4, "p":"My car is broken, so I ___ using my sister''s car this week.", "s":{"type":"multiple_choice","options":["have been","has been","am been"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He usually works in London, but this month he ___ working in Paris.", "s":{"type":"multiple_choice","options":["has been","have been","is been"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They are looking for a house. Meanwhile, they ___ renting a flat.", "s":{"type":"multiple_choice","options":["have been","has been","are being"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ sleeping on the sofa because my bed is broken.", "s":{"type":"multiple_choice","options":["have been","has been","am been"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We ___ eating out a lot lately because our kitchen is being renovated.", "s":{"type":"multiple_choice","options":["have been","has been","have"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué expresa la frase ''She has been living in a hotel''?", "s":{"type":"multiple_choice","options":["Que es una situación temporal y probablemente no permanente","Que vivirá en el hotel para siempre","Que vivió en un hotel hace muchos años"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ taking the bus to work this month because I sold my car.", "s":{"type":"multiple_choice","options":["have been","has been","having been"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El Presente Perfecto Continuo a menudo resalta que una situación es temporal, a diferencia del Presente Perfecto Simple que puede sonar más permanente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I have been living in a hotel'' indica una situación definitiva y permanente para el resto de la vida.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Podemos usar este tiempo para acciones que han estado sucediendo repetidamente últimamente (ej. We have been eating out a lot lately).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Si digo ''I have been using his car'', implica que es un préstamo temporal y no mi coche definitivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El Presente Perfecto Continuo no sirve para hablar de acciones temporales.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Este tiempo subraya la idea de que la acción ha estado ''en progreso'' recientemente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''She has been staying with me'' se usa comúnmente para invitados que se alojan temporalmente en tu casa.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Yo me he estado quedando con mis amigos.", "s":{"type":"scramble","chunks":["I have been","staying","with my friends"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella ha estado usando mi coche.", "s":{"type":"scramble","chunks":["She has been","using","my car"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Nosotros hemos estado alojándonos en un hotel.", "s":{"type":"scramble","chunks":["We have been","staying","at a hotel"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él ha estado trabajando en Londres temporalmente.", "s":{"type":"scramble","chunks":["He has been","working in London","temporarily"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ellos han estado alquilando una casa.", "s":{"type":"scramble","chunks":["They have been","renting","a house"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Yo he estado tomando el autobús esta semana.", "s":{"type":"scramble","chunks":["I have been","taking the bus","this week"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella ha estado durmiendo en el sofá.", "s":{"type":"scramble","chunks":["She has been","sleeping","on the sofa"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 37, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Presente Perfecto Continuo', 
    'Aprende a expresar acciones temporales que comenzaron en el pasado y han continuado desarrollándose ininterrumpidamente hasta el presente.', 
    to_jsonb('## Grammar Lesson: Presente Perfecto Continuo
El **Presente Perfecto Continuo** se utiliza para expresar acciones temporales o no permanentes que empezaron en el pasado y han seguido realizándose de forma continuada hasta el presente. A menudo da más énfasis a la "duración" y al proceso de la acción que al resultado final.

##### 1. Formación y Uso Continuado
Se forma utilizando el verbo auxiliar **HAVE o HAS + BEEN** seguido del verbo principal terminado en **-ing**.
*   *He **has been listening** to the same music all day.* (Él ha estado escuchando la misma música todo el día).
*   *It **has been raining** heavily.* (Ha estado lloviendo fuertemente).

##### 2. Oraciones Negativas
Para formar la negación, simplemente añadimos "not" al primer auxiliar (have/has), formando habitualmente las contracciones **haven''t** o **hasn''t**.
*   *I **haven''t been feeling** well lately.* (No me he estado sintiendo bien últimamente).
*   *She **hasn''t been sleeping** much.* (Ella no ha estado durmiendo mucho).

##### 3. Preguntas y "How Long"
Este tiempo verbal es la herramienta perfecta para preguntar "cuánto tiempo" lleva ocurriendo una acción que todavía está en progreso. La estructura estrella es **How long + have/has + sujeto + been + verbo-ing**.
*   *Sorry I’m late. **How long have you been waiting?*** (Siento llegar tarde. ¿Cuánto tiempo llevas esperando?).
*   *What **have you been doing?*** (¿Qué has estado haciendo?).
*   ***Have you been crying?*** (¿Has estado llorando?).

##### 4. Acciones Temporales y No Permanentes
A diferencia del Presente Perfecto Simple (que puede sonar más a una situación definitiva o un logro alcanzado), el Presente Perfecto Continuo es ideal para remarcar que una situación es **temporal o provisional**.
*   *I **have been taking** the bus this week because my car is broken.* (He estado tomando el bus esta semana porque mi coche está roto).
*   *They **have been renting** a flat until they find a house.* (Han estado alquilando un piso hasta que encuentren una casa).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Formación y Uso Continuado', 'Recuerda: Utiliza HAVE/HAS + BEEN + verbo en -ing para expresar una acción que empezó en el pasado y sigue ocurriendo ahora mismo de manera continuada.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Negativas', 'Para negar, utiliza "haven''t been" o "hasn''t been" seguido del verbo en -ing. ¡No utilices los auxiliares don''t ni didn''t!');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Preguntas con How Long', 'Usa "How long have you been...?" para preguntar por la duración exacta de una acción que sigue en progreso (¿Cuánto tiempo llevas...?).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Acciones Temporales', 'Este tiempo es ideal para expresar que algo es solo "por el momento" (ej. I have been sleeping on the sofa this week).');

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