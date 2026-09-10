-- ============================================================
-- Seed: A0 English Path – Grammar – Past Continuous
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
        -- REGLA 1: Formación y Momento Preciso (Was/Were) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (estaba) sleeping at 10 PM.", "s":{"type":"typing","correct_answers":["was"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (estaban) playing football yesterday.", "s":{"type":"typing","correct_answers":["were"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (no estaba) watching TV.", "s":{"type":"typing","correct_answers":["wasn''t","was not"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (no estábamos) studying.", "s":{"type":"typing","correct_answers":["weren''t","were not"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (¿Estaba) he working late?", "s":{"type":"typing","correct_answers":["Was"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"What ___ (estaban) you doing at 8 o''clock?", "s":{"type":"typing","correct_answers":["were"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It ___ (estaba) raining yesterday evening.", "s":{"type":"typing","correct_answers":["was"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"The dog ___ (estaba) barking all night.", "s":{"type":"typing","correct_answers":["was"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cuál es el auxiliar del Pasado Continuo?", "s":{"type":"multiple_choice","options":["Was / Were","Did / Didn''t","Am / Is / Are"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se forma el verbo principal en el Pasado Continuo?", "s":{"type":"multiple_choice","options":["Añadiendo -ing","Añadiendo -ed","En infinitivo"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ studying at 5 PM yesterday.", "s":{"type":"multiple_choice","options":["was","were","did"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ listening to the radio.", "s":{"type":"multiple_choice","options":["were","was","are"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ sleeping when I arrived.", "s":{"type":"multiple_choice","options":["wasn''t","weren''t","didn''t"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ you playing video games all night?", "s":{"type":"multiple_choice","options":["Were","Was","Did"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Con qué pronombres se utiliza WAS?", "s":{"type":"multiple_choice","options":["I, He, She, It","You, We, They","Con todos"],"answer":0}}'::jsonb,
        '{"r":1, "p":"What ___ he doing at that moment?", "s":{"type":"multiple_choice","options":["was","were","is"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Pasado Continuo se utiliza para expresar lo que estaba ocurriendo en un preciso momento del pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se utiliza ''were'' con los pronombres I, He, She, e It.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El verbo principal en Pasado Continuo siempre debe llevar la terminación -ing.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La oración ''We was eating pizza'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Para hacer una pregunta, el auxiliar (was/were) se coloca delante del sujeto (ej. Was she reading?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Wasn''t'' es la contracción correcta de ''Was not''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El Pasado Continuo indica acciones del pasado que terminaron en un segundo y no tuvieron duración.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Yo estaba durmiendo a las 10.", "s":{"type":"scramble","chunks":["I was","sleeping","at 10"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos estaban jugando al tenis.", "s":{"type":"scramble","chunks":["They were","playing","tennis"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella no estaba viendo la televisión.", "s":{"type":"scramble","chunks":["She","wasn''t watching","TV"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Estabas tú trabajando ayer?", "s":{"type":"scramble","chunks":["Were you","working","yesterday?"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Estaba lloviendo a las 5.", "s":{"type":"scramble","chunks":["It was","raining","at 5"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros no estábamos estudiando.", "s":{"type":"scramble","chunks":["We","weren''t","studying"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Qué estaba haciendo él?", "s":{"type":"scramble","chunks":["What","was he","doing?"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Acciones no acabadas por interrupción - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I ___ (estaba caminando) to the station when I met John.", "s":{"type":"typing","correct_answers":["was walking"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"While we ___ (estábamos comiendo), the phone rang.", "s":{"type":"typing","correct_answers":["were eating"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (estaba durmiendo) when the alarm went off.", "s":{"type":"typing","correct_answers":["was sleeping"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (estaban conduciendo) when they saw the accident.", "s":{"type":"typing","correct_answers":["were driving"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He was reading when suddenly the lights ___ (se apagaron).", "s":{"type":"typing","correct_answers":["went out"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (estaba tomando) a shower when you called.", "s":{"type":"typing","correct_answers":["was having","was taking"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We were playing cards when it ___ (empezó) to rain.", "s":{"type":"typing","correct_answers":["started"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She was cooking dinner when he ___ (llegó).", "s":{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Para qué se utiliza la combinación de Pasado Continuo y Pasado Simple?", "s":{"type":"multiple_choice","options":["Para indicar una acción en desarrollo (continua) que es interrumpida por una acción corta (simple)","Para dos acciones que pasaron en siglos diferentes","Para hablar del futuro"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ___ to the station when I met John.", "s":{"type":"multiple_choice","options":["was walking","walked","am walking"],"answer":0}}'::jsonb,
        '{"r":2, "p":"While we were eating, the phone ___.", "s":{"type":"multiple_choice","options":["rang","was ringing","is ringing"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They were playing football when it ___ to rain.", "s":{"type":"multiple_choice","options":["started","was starting","starts"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He ___ TV when his mother called.", "s":{"type":"multiple_choice","options":["was watching","watched","is watching"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué palabra suele acompañar a la acción en Pasado Continuo (la acción larga)?", "s":{"type":"multiple_choice","options":["While (mientras)","When (cuando)","Ago (hace)"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué palabra suele introducir la acción corta que interrumpe en Pasado Simple?", "s":{"type":"multiple_choice","options":["When (cuando)","While (mientras)","During (durante)"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I was reading a book when she ___ the room.", "s":{"type":"multiple_choice","options":["entered","was entering","enters"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"El Pasado Continuo se utiliza para la acción de fondo que estaba en progreso antes de ser interrumpida.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En ''I was walking to the station when I met John'', la interrupción es ''was walking''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La acción que interrumpe (la corta) se escribe siempre en Pasado Simple.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La palabra ''While'' (mientras) se utiliza a menudo seguida del Pasado Continuo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''When I was eating, the phone was ringing'' es la forma correcta de expresar una interrupción.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Se usa Pasado Continuo para expresar acciones pasadas que NO fueron acabadas debido a una interrupción.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"El evento que corta la acción principal (ej. sonó el teléfono) se pone con was/were + ing.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Estaba caminando cuando conocí a John.", "s":{"type":"scramble","chunks":["I was walking","when I","met John"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Mientras comíamos, el teléfono sonó.", "s":{"type":"scramble","chunks":["While we","were eating,","the phone rang"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella estaba durmiendo cuando llegué.", "s":{"type":"scramble","chunks":["She was sleeping","when","I arrived"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ellos conducían cuando vieron el accidente.", "s":{"type":"scramble","chunks":["They were driving","when they saw","the accident"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Estábamos hablando cuando la música paró.", "s":{"type":"scramble","chunks":["We were talking","when the music","stopped"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo estaba leyendo cuando me llamó.", "s":{"type":"scramble","chunks":["I was reading","when","he called me"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Llovía cuando me desperté.", "s":{"type":"scramble","chunks":["It was raining","when I","woke up"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Descripciones del Pasado (Ropa y Ambiente) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"She ___ (llevaba puesto) a pink dress.", "s":{"type":"typing","correct_answers":["was wearing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The sun ___ (estaba brillando) in the sky.", "s":{"type":"typing","correct_answers":["was shining"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (llevaba puesto) a black suit.", "s":{"type":"typing","correct_answers":["was wearing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The birds ___ (estaban cantando) in the trees.", "s":{"type":"typing","correct_answers":["were singing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (llevaban puesto) hats.", "s":{"type":"typing","correct_answers":["were wearing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The wind ___ (estaba soplando) strongly.", "s":{"type":"typing","correct_answers":["was blowing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (llevaba puesto) my favourite jacket.", "s":{"type":"typing","correct_answers":["was wearing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Everyone ___ (estaba sonriendo) at the party.", "s":{"type":"typing","correct_answers":["was smiling"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"El Pasado Continuo se utiliza al principio de las historias para...", "s":{"type":"multiple_choice","options":["Describir el ambiente del pasado (el clima, lo que hacía la gente)","Explicar el final de la historia","Mencionar acciones que no importan"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She ___ a beautiful pink dress.", "s":{"type":"multiple_choice","options":["was wearing","wear","was wear"],"answer":0}}'::jsonb,
        '{"r":3, "p":"It was a beautiful morning. The sun ___.", "s":{"type":"multiple_choice","options":["was shining","shined","shines"],"answer":0}}'::jsonb,
        '{"r":3, "p":"What ___ you wearing at the party?", "s":{"type":"multiple_choice","options":["were","was","did"],"answer":0}}'::jsonb,
        '{"r":3, "p":"When I arrived at the cafe, Mary ___ for me.", "s":{"type":"multiple_choice","options":["was waiting","waited","is waiting"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He ___ a funny hat when I saw him.", "s":{"type":"multiple_choice","options":["was wearing","wore","wearing"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Para describir qué ropa llevaba alguien en el pasado, usamos Pasado Simple o Continuo?", "s":{"type":"multiple_choice","options":["Pasado Continuo (was/were wearing)","Pasado Simple (wore)","Ninguno"],"answer":0}}'::jsonb,
        '{"r":3, "p":"The children ___ in the garden and the dog was barking.", "s":{"type":"multiple_choice","options":["were playing","played","was playing"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Para describir cómo iba vestida una persona en el pasado, lo correcto es usar el Pasado Continuo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''She was wearing a pink dress'' significa que ella se estaba comprando un vestido rosa.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Los escritores usan el Pasado Continuo para establecer el ambiente al principio de una historia (ej. The birds were singing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''I was wearing a jacket'' se traduce como ''Yo llevaba puesta una chaqueta''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"No se puede utilizar el Pasado Continuo para describir el clima en el pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''He was wearing glasses'' indica una descripción visual en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Las descripciones del entorno (background) en las novelas casi siempre van en Pasado Continuo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Ella llevaba puesto un vestido rosa.", "s":{"type":"scramble","chunks":["She","was wearing","a pink dress"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: El sol estaba brillando.", "s":{"type":"scramble","chunks":["The sun","was","shining"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él llevaba gafas.", "s":{"type":"scramble","chunks":["He","was wearing","glasses"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Los pájaros estaban cantando.", "s":{"type":"scramble","chunks":["The birds","were","singing"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Qué llevabas puesto?", "s":{"type":"scramble","chunks":["What","were you","wearing?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Todos estaban sonriendo.", "s":{"type":"scramble","chunks":["Everyone","was","smiling"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Llevaban abrigos negros.", "s":{"type":"scramble","chunks":["They were","wearing","black coats"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Hábitos del Pasado e Intenciones - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"When I was a child, I ___ (siempre estaba jugando) outside.", "s":{"type":"typing","correct_answers":["was always playing"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (iba) to buy the book, but they didn''t have it.", "s":{"type":"typing","correct_answers":["was going"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (siempre se estaba quejando) when he worked here.", "s":{"type":"typing","correct_answers":["was always complaining"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (iba) to call you, but she forgot.", "s":{"type":"typing","correct_answers":["was going"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We ___ (siempre estábamos peleando) when we were teenagers.", "s":{"type":"typing","correct_answers":["were always fighting"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (iban) to travel, but the flight was cancelled.", "s":{"type":"typing","correct_answers":["were going"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"My brother ___ (siempre estaba llorando) as a baby.", "s":{"type":"typing","correct_answers":["was always crying"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (iba) to tell you the truth.", "s":{"type":"typing","correct_answers":["was going"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué verbo se usa en Pasado Continuo para indicar que tenías la intención de hacer algo (pero no lo hiciste)?", "s":{"type":"multiple_choice","options":["was/were going to...","was/were doing...","was/were playing..."],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ to buy the book, but they didn''t have it.", "s":{"type":"multiple_choice","options":["was going","were going","went"],"answer":0}}'::jsonb,
        '{"r":4, "p":"When I was a child, I ___ outside.", "s":{"type":"multiple_choice","options":["was always playing","always playing","played always"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ to invite him, but she lost his number.", "s":{"type":"multiple_choice","options":["was going","is going","was"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He ___ complaining about the food at the old office.", "s":{"type":"multiple_choice","options":["was always","always was","were always"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They ___ to visit us, but it rained heavily.", "s":{"type":"multiple_choice","options":["were going","was going","went"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué adverbio se añade frecuentemente entre el verbo to be y el verbo -ing para hablar de hábitos repetitivos o molestos del pasado?", "s":{"type":"multiple_choice","options":["always","never","yet"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ to say sorry, but you left.", "s":{"type":"multiple_choice","options":["was going","went","was say"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Podemos usar el Pasado Continuo para hablar de intenciones que tuvimos en el pasado pero que no se cumplieron.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I was going to buy the book'' significa ''Estuve yendo a comprar el libro durante horas''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La estructura ''was/were going to'' equivale a decir ''iba a...'' o ''tenía la intención de...''", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Si añades ''always'' al pasado continuo (ej. I was always playing), expresa un hábito recurrente que solías hacer de joven.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''She was going to call you'' indica que ella finalmente te llamó con éxito.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"El Pasado Continuo se utiliza frecuentemente para quejarse de hábitos repetitivos del pasado (ej. He was always talking in class).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I was going to do it'' se traduce como ''Iba a hacerlo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: De niño siempre estaba jugando fuera.", "s":{"type":"scramble","chunks":["When I was a child,","I was always","playing outside"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Iba a comprar el libro.", "s":{"type":"scramble","chunks":["I was","going to buy","the book"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él siempre se estaba quejando.", "s":{"type":"scramble","chunks":["He was","always","complaining"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella iba a llamarte.", "s":{"type":"scramble","chunks":["She was","going to","call you"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Iban a viajar.", "s":{"type":"scramble","chunks":["They were","going","to travel"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Yo iba a decírtelo.", "s":{"type":"scramble","chunks":["I was","going to","tell you"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Siempre nos estábamos peleando.", "s":{"type":"scramble","chunks":["We were","always","fighting"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 35, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Pasado Continuo', 
    'Aprende a usar el Pasado Continuo para hablar de acciones en progreso en el pasado, describir escenas, narrar interrupciones y hablar de intenciones frustradas.', 
    to_jsonb('## Grammar Lesson: Pasado Continuo
El **Pasado Continuo** se utiliza principalmente para expresar lo que estaba ocurriendo en un momento muy preciso del pasado. Se forma con el verbo auxiliar en pasado **WAS / WERE** más el verbo principal terminado en **-ing**.

##### 1. Formación y Momento Preciso
Sirve para indicar acciones que estaban en desarrollo en un punto específico del ayer.
*   **WAS:** *I, He, She, It*
*   **WERE:** *You, We, They*
*   *I was sleeping at 10 PM.* (Estaba durmiendo a las 10 de la noche).
*   *What were you doing at 8 o''clock?* (¿Qué estabas haciendo a las 8 en punto?).

##### 2. Acciones Interrumpidas (con Pasado Simple)
Este es el uso más famoso en inglés: Una acción larga o de fondo en **Pasado Continuo** es interrumpida repentinamente por una acción corta en **Pasado Simple**.
*   *I **was walking** to the station when I **met** John.* (Estaba caminando hacia la estación cuando me encontré a John).
*   *While we **were eating**, the phone **rang**.* (Mientras estábamos comiendo, el teléfono sonó).

##### 3. Descripciones del Pasado
Cuando contamos una historia o anécdota, el Pasado Continuo es fundamental para **establecer la escena** y describir el ambiente de fondo, así como para indicar la ropa que alguien llevaba puesta.
*   *She **was wearing** a pink dress.* (Ella llevaba puesto un vestido rosa).
*   *It was a beautiful morning. The sun **was shining** and the birds **were singing**.* (Era una mañana hermosa. El sol brillaba y los pájaros cantaban).

##### 4. Hábitos e Intenciones en el Pasado
*   **Hábitos del pasado:** Acompañado de palabras como "always", indica costumbres repetitivas o molestas de otra época.
    *   *When I was a child, I **was always playing** outside.* (Cuando era niño, siempre estaba jugando en la calle).
*   **Intenciones (Going to en pasado):** Se usa "was/were going to" para expresar algo que tenías la intención de hacer, pero que finalmente no hiciste.
    *   *I **was going to buy** the book, but they didn’t have it.* (Iba a comprar el libro, pero no lo tenían).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Formación (Was/Were)', 'Recuerda: Usa WAS para I/He/She/It y WERE para We/You/They, seguido siempre del verbo en -ing para cosas que estaban pasando.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Acciones Interrumpidas', 'Usa el Pasado Continuo (was/were + ing) para la acción larga que estaba ocurriendo, y el Pasado Simple para la corta que la interrumpe (when the phone rang).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Descripciones del Pasado', 'Utiliza el Pasado Continuo para describir la ropa que alguien llevaba (She was wearing) o el ambiente de una historia (The sun was shining).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Intenciones y Hábitos', 'Usa "was/were going to" para decir "iba a hacerlo pero no pude", y "was always -ing" para hábitos recurrentes del pasado.');

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