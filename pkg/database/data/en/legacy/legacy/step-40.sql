-- ============================================================
-- Seed: A0 English Path – Grammar – Big, Large & Great
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
        -- REGLA 1: BIG (Tamaño físico) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"My brother lives in a ___ (grande) house.", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He has a very ___ (grande) dog.", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"This box is too ___ (grande) to carry.", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I saw a ___ (grande) elephant at the zoo.", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Madrid is a ___ (grande) city.", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He is a ___ (grande) boy now.", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"That is a ___ (grande) car.", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Look at that ___ (grande) tree!", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué adjetivo es el más común para referirse EXCLUSIVAMENTE al tamaño físico de algo?", "s":{"type":"multiple_choice","options":["Big","Great","Large"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They bought a ___ TV for the living room.", "s":{"type":"multiple_choice","options":["big","great","large"],"answer":0}}'::jsonb,
        '{"r":1, "p":"That shirt is too ___ for me.", "s":{"type":"multiple_choice","options":["great","big","large"],"answer":1}}'::jsonb,
        '{"r":1, "p":"My feet are very ___.", "s":{"type":"multiple_choice","options":["big","great","large"],"answer":0}}'::jsonb,
        '{"r":1, "p":"El adjetivo ''Big'' sirve para calificar...", "s":{"type":"multiple_choice","options":["Nociones morales o históricas","El tamaño físico","Proporciones matemáticas"],"answer":1}}'::jsonb,
        '{"r":1, "p":"We ate a ___ pizza.", "s":{"type":"multiple_choice","options":["great","large","big"],"answer":2}}'::jsonb,
        '{"r":1, "p":"Elige la opción más coloquial: A ___ apple.", "s":{"type":"multiple_choice","options":["big","large","great"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Elephants are ___ animals.", "s":{"type":"multiple_choice","options":["great","big","large"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Big'' se utiliza casi siempre para calificar el tamaño físico de objetos, animales o personas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Big'' es la palabra más habitual y coloquial para decir ''grande'' en tamaño.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''A big part of the speech'' para hablar de una proporción de un discurso.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Big'' se puede usar para cosas abstractas como en ''a big man'' refiriéndose a un hombre moralmente histórico.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''A big house'' es gramaticalmente correcto para indicar que la casa ocupa mucho espacio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Big'' y ''Large'' significan siempre exactamente lo mismo en cualquier contexto y se pueden intercambiar siempre.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Usamos ''big'' al hablar de la estatura o desarrollo físico de un niño (ej. He is a big boy).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Él vive en una casa grande.", "s":{"type":"scramble","chunks":["He lives in","a big","house"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ese es un perro muy grande.", "s":{"type":"scramble","chunks":["That is","a very big","dog"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Esta caja es demasiado grande para mí.", "s":{"type":"scramble","chunks":["This box","is too big","for me"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Tienen un coche grande.", "s":{"type":"scramble","chunks":["They have","a big","car"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¡Mira ese árbol tan grande!", "s":{"type":"scramble","chunks":["Look at","that big","tree"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Quiero una manzana grande.", "s":{"type":"scramble","chunks":["I want","a big","apple"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Madrid es una ciudad grande.", "s":{"type":"scramble","chunks":["Madrid is","a big","city"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: LARGE (Proporciones y Cantidades) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"He forgot a ___ (gran) part of the speech.", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"A ___ (gran) number of people came to the party.", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I would like a ___ (grande) coffee, please.", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There is a ___ (gran) amount of money on the table.", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The shirt is available in small, medium, and ___ (grande).", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They won the election by a ___ (amplio/gran) margin.", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She has a ___ (grande) collection of stamps.", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"A ___ (gran) proportion of the students failed.", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué adjetivo se usa frecuentemente para hablar de proporciones, cantidades y tallas?", "s":{"type":"multiple_choice","options":["Large","Big","Great"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He forgot a ___ part of the speech.", "s":{"type":"multiple_choice","options":["great","large","big"],"answer":1}}'::jsonb,
        '{"r":2, "p":"A ___ number of students passed the exam.", "s":{"type":"multiple_choice","options":["big","great","large"],"answer":2}}'::jsonb,
        '{"r":2, "p":"We need a ___ amount of water.", "s":{"type":"multiple_choice","options":["large","big","great"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Las tallas de ropa en inglés son: Small, Medium y ___.", "s":{"type":"multiple_choice","options":["Big","Great","Large"],"answer":2}}'::jsonb,
        '{"r":2, "p":"A ___ percentage of the voters were angry.", "s":{"type":"multiple_choice","options":["great","large","big"],"answer":1}}'::jsonb,
        '{"r":2, "p":"They served a ___ quantity of food at the wedding.", "s":{"type":"multiple_choice","options":["large","great","big"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Cuando se habla de áreas extensas o volúmenes, ¿qué adjetivo suena ligeramente más formal que ''big''?", "s":{"type":"multiple_choice","options":["Great","Large","Tall"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Large'' se utiliza a menudo para referirse a cantidades, volúmenes o proporciones de algo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para pedir una talla grande de ropa o de café en una tienda, lo correcto es decir ''A big coffee/size''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La frase ''A large part of the speech'' es la forma correcta de hablar de una porción de un discurso.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La expresión ''Large number of people'' significa ''Una pequeña cantidad de personas''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Large'' puede usarse a veces para tamaño físico (ej. a large house), sonando un poco más formal o enfocado en la amplitud que ''big''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''A large amount'' es la estructura estándar para decir ''una gran cantidad''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En inglés, la palabra ''large'' significa ''largo'' (en longitud).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Él olvidó una gran parte del discurso.", "s":{"type":"scramble","chunks":["He forgot","a large part","of the speech"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Vino un gran número de personas.", "s":{"type":"scramble","chunks":["A large number","of people","came"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Necesito una gran cantidad de dinero.", "s":{"type":"scramble","chunks":["I need","a large amount","of money"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella pidió una pizza grande.", "s":{"type":"scramble","chunks":["She ordered","a large","pizza"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo uso una talla grande.", "s":{"type":"scramble","chunks":["I wear","a large","size"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Un gran porcentaje de estudiantes aprobó.", "s":{"type":"scramble","chunks":["A large percentage","of students","passed"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Tienen una gran colección de arte.", "s":{"type":"scramble","chunks":["They have","a large collection","of art"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: GREAT (Abstracto, Moral e Histórico) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"Alexander the ___ (Grande).", "s":{"type":"typing","correct_answers":["Great"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Gandhi was a ___ (gran) man.", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We had a ___ (genial) time at the party.", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The ___ (Gran) Wall of China.", "s":{"type":"typing","correct_answers":["Great"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"That is a ___ (gran) idea!", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She showed a ___ (gran) courage during the crisis.", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It was a ___ (gran) success.", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Beethoven was a ___ (gran) composer.", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué adjetivo se emplea para nociones abstractas, morales, periodos históricos o para decir que algo es genial?", "s":{"type":"multiple_choice","options":["Great","Big","Large"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Abraham Lincoln was a ___ man.", "s":{"type":"multiple_choice","options":["great","large","big"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Have a ___ weekend!", "s":{"type":"multiple_choice","options":["big","great","large"],"answer":1}}'::jsonb,
        '{"r":3, "p":"The ___ Wall of China is very long.", "s":{"type":"multiple_choice","options":["Large","Great","Big"],"answer":1}}'::jsonb,
        '{"r":3, "p":"Doing that requires ___ courage (coraje).", "s":{"type":"multiple_choice","options":["great","large","big"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Si quieres decir que una fiesta fue ''genial'' o ''estupenda'', usas:", "s":{"type":"multiple_choice","options":["Large","Big","Great"],"answer":2}}'::jsonb,
        '{"r":3, "p":"The play was a ___ success (éxito).", "s":{"type":"multiple_choice","options":["big","large","great"],"answer":2}}'::jsonb,
        '{"r":3, "p":"He was a ___ leader in our history.", "s":{"type":"multiple_choice","options":["great","large","big"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Great'' se usa normalmente para hablar del tamaño físico exacto de objetos como una caja o una mesa.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Usamos ''Great'' para describir a una persona que ha sido moralmente importante o ilustre (ej. A great man).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para monumentos históricos famosos como la ''Gran Muralla'', usamos la palabra ''Great''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La expresión ''That is a great idea'' significa ''Esa es una idea genial/grandiosa''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''A great success'' se usa porque estamos hablando del éxito como un concepto abstracto, no físico.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Decir ''He is a great dog'' significa que el perro pesa 40 kilos y mide un metro.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Great'' a menudo se usa simplemente para expresar entusiasmo o que algo fue excelente (ej. We had a great time).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Él fue un gran hombre.", "s":{"type":"scramble","chunks":["He was","a great","man"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¡Esa es una gran idea!", "s":{"type":"scramble","chunks":["That is","a great","idea"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Lo pasamos genial ayer.", "s":{"type":"scramble","chunks":["We had","a great time","yesterday"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: La Gran Muralla está en China.", "s":{"type":"scramble","chunks":["The Great Wall","is in","China"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Fue un gran éxito.", "s":{"type":"scramble","chunks":["It was","a great","success"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella es una gran líder.", "s":{"type":"scramble","chunks":["She is","a great","leader"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos mostraron un gran coraje.", "s":{"type":"scramble","chunks":["They showed","great","courage"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Contrastes (Big vs Large vs Great) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"A ___ (gran) amount of time. (Cantidad/Proporción)", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"What a ___ (grande) dog! (Tamaño físico coloquial)", "s":{"type":"typing","correct_answers":["big"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He was a ___ (gran) king in history. (Histórico/Moral)", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I need a ___ (grande) box for these books. (Tamaño físico)", "s":{"type":"typing","correct_answers":["big","large"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She won by a ___ (gran) majority. (Proporción)", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We had a ___ (genial) holiday. (Excelente)", "s":{"type":"typing","correct_answers":["great"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"My t-shirt size is ___ (grande). (Talla)", "s":{"type":"typing","correct_answers":["large"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Look at that ___ (grande) building! (Tamaño físico)", "s":{"type":"typing","correct_answers":["big","large"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Completa: ''A ___ part of the speech.'' (Parte/Proporción)", "s":{"type":"multiple_choice","options":["large","great","big"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Completa: ''A ___ man'' (Hombre moralmente grande / históricamente importante).", "s":{"type":"multiple_choice","options":["big","large","great"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Completa: ''A ___ house'' (Tamaño físico, uso muy coloquial).", "s":{"type":"multiple_choice","options":["big","great","large"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Elige la correcta para ''gran cantidad'': a ___ amount.", "s":{"type":"multiple_choice","options":["big","great","large"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Elige la correcta para ''gran idea'': a ___ idea.", "s":{"type":"multiple_choice","options":["large","great","big"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Qué palabra se usa en las etiquetas de ropa para la talla ''L''?", "s":{"type":"multiple_choice","options":["Large","Great","Big"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Completa: ''A ___ success'' (Un éxito abstracto).", "s":{"type":"multiple_choice","options":["great","big","large"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Completa: ''My dog is very ___.'' (Físicamente enorme).", "s":{"type":"multiple_choice","options":["large","great","big"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Decimos ''a big idea'' para decir de forma natural que algo es una idea brillante/genial.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''A large portion'' es la estructura correcta para hablar de una cantidad o porción de comida.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Big'' y ''Large'' pueden referirse al tamaño físico, pero ''large'' se usa mucho más con proporciones, cantidades y tallas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''A great man'' significa necesariamente que el hombre es muy gordo o alto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''A large part of the class'' significa una gran parte/proporción de la clase.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Usamos ''big'' para pedir tallas de ropa en una tienda (ej. I wear a big).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Great'' se asocia profundamente con conceptos abstractos, valores morales o periodos históricos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Él tiene una casa grande.", "s":{"type":"scramble","chunks":["He has","a big","house"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Falta una gran parte del texto.", "s":{"type":"scramble","chunks":["A large part","of the text","is missing"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Esa fue una gran película (genial).", "s":{"type":"scramble","chunks":["That was","a great","movie"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Pedí una pizza grande (talla).", "s":{"type":"scramble","chunks":["I ordered","a large","pizza"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella es una gran persona (moral).", "s":{"type":"scramble","chunks":["She is","a great","person"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Mira ese gran elefante (físico).", "s":{"type":"scramble","chunks":["Look at","that big","elephant"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Gastamos una gran cantidad de dinero.", "s":{"type":"scramble","chunks":["We spent","a large amount","of money"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 31, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Big, Large & Great', 
    'Aprende a diferenciar las distintas maneras de decir "grande" en inglés: desde el tamaño físico hasta las cantidades abstractas o morales.', 
    to_jsonb('## Grammar Lesson: Big, Large & Great
Aunque en español solemos utilizar la palabra "grande" o "gran" para todo, en inglés existen tres palabras distintas dependiendo de si hablamos de tamaño físico, cantidades, o conceptos abstractos e históricos.

##### 1. BIG (Tamaño físico)
Es la palabra más común y coloquial, y **solo sirve para calificar el tamaño físico** de las cosas, animales o personas.
*   *My brother has a **big** dog.* (Mi hermano tiene un perro grande).
*   *He lives in a **big** house.* (Vive en una casa grande).
*   *He is a **big** boy now.* (Ya es un niño grande / ha crecido mucho).

##### 2. LARGE (Proporciones, Cantidades y Tallas)
También puede calificar tamaño, pero su uso principal y más natural es para hablar de **proporciones, cantidades, partes de un todo o tallas**.
*   *He forgot a **large part** of the speech.* (Olvidó una gran parte del discurso).
*   *A **large number** of people.* (Un gran número de personas).
*   *I need a **large amount** of money.* (Necesito una gran cantidad de dinero).
*   *I ordered a **large** coffee.* (Pedí un café grande - *Talla*).

##### 3. GREAT (Nociones abstractas, morales e históricas)
Se emplea para conceptos no físicos, abstracciones, para calificar la grandeza moral de una persona o en expresiones sobre periodos y monumentos históricos. Además, es la forma estándar de decir "genial".
*   *Gandhi was a **great** man.* (Gandhi fue un gran hombre).
*   *The **Great** Wall of China.* (La Gran Muralla China).
*   *That is a **great** idea!* (¡Es una gran/genial idea!).
*   *We had a **great** time.* (Lo pasamos genial).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Big (Tamaño físico)', 'Usa "Big" como la forma estándar y coloquial para referirte al tamaño o volumen físico de las cosas, animales y personas (a big dog, a big house).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Large (Proporciones y cantidades)', 'Usa "Large" cuando hables de cantidades (a large amount), proporciones (a large part) o tallas de cosas comerciales (a large coffee/shirt).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Great (Abstracto, moral o genial)', 'Usa "Great" para nociones abstractas (a great idea), valor moral/histórico (a great man) o para expresar que algo fue genial (a great time).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Contrastes', 'Recuerda: Físico = Big. Proporción/Cantidad/Talla = Large. Abstracto/Moral/Histórico = Great.');

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