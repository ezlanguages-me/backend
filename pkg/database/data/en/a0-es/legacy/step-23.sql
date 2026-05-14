-- ============================================================
-- Seed: A0 English Path – Grammar – Superlativos (Completo >100)
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
        -- REGLA 1: Superioridad (Adjetivos Cortos: the + -est) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"He is ___ (el más fuerte) man here.", "s":{"type":"typing","correct_answers":["the strongest"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"This is ___ (el más limpio) room in the house.", "s":{"type":"typing","correct_answers":["the cleanest"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Russia is ___ (el más grande) country.", "s":{"type":"typing","correct_answers":["the biggest"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She is ___ (la más rápida) runner.", "s":{"type":"typing","correct_answers":["the fastest"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He is ___ (el más alto) boy in the class.", "s":{"type":"typing","correct_answers":["the tallest"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It is ___ (el más antiguo) building in the city.", "s":{"type":"typing","correct_answers":["the oldest"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"This is ___ (el más corto) way home.", "s":{"type":"typing","correct_answers":["the shortest"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"The Nile is ___ (el más largo) river.", "s":{"type":"typing","correct_answers":["the longest"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cuál es el superlativo correcto de ''clean''?", "s":{"type":"multiple_choice","options":["the cleanest","the most clean","cleanest"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el superlativo correcto de ''strong''?", "s":{"type":"multiple_choice","options":["strongest","the strongest","the most strong"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el superlativo correcto de ''big''?", "s":{"type":"multiple_choice","options":["the bigest","the biggest","the most big"],"answer":1}}'::jsonb,
        '{"r":1, "p":"She is ___ girl in the team.", "s":{"type":"multiple_choice","options":["the fastest","fastest","the most fast"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He is ___ of all my friends.", "s":{"type":"multiple_choice","options":["the tall","the tallest","most tall"],"answer":1}}'::jsonb,
        '{"r":1, "p":"This is ___ tree in the park.", "s":{"type":"multiple_choice","options":["the oldest","the most old","oldest"],"answer":0}}'::jsonb,
        '{"r":1, "p":"It is ___ trip we have ever taken.", "s":{"type":"multiple_choice","options":["long","the longest","the most long"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Para un adjetivo de una sílaba como ''short'', su superlativo es:", "s":{"type":"multiple_choice","options":["the shortest","the most short","shortest"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Para formar el superlativo de un adjetivo de una sílaba, se le agrega -EST y se antepone THE.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El superlativo de ''clean'' es ''the most clean''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Si un adjetivo de una sílaba termina en vocal+consonante (como ''big''), se duplica la consonante (the biggest).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es gramaticalmente correcto decir ''He is tallest boy'', omitiendo el artículo ''the''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''The strongest'' se traduce como ''el más fuerte''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Los superlativos sirven para comparar un elemento con el resto del grupo entero.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El superlativo de ''fast'' es ''the fastest''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Él es el chico más alto.", "s":{"type":"scramble","chunks":["He is","the tallest","boy"],"correct_order":}'::jsonb,
        '{"r":1, "p":"Ordena: Este es el coche más rápido.", "s":{"type":"scramble","chunks":["This is","the fastest","car"],"correct_order":}'::jsonb,
        '{"r":1, "p":"Ordena: Es el río más largo.", "s":{"type":"scramble","chunks":["It is","the longest","river"],"correct_order":}'::jsonb,
        '{"r":1, "p":"Ordena: Eres el hombre más fuerte.", "s":{"type":"scramble","chunks":["You are","the strongest","man"],"correct_order":}'::jsonb,
        '{"r":1, "p":"Ordena: Ese es el edificio más antiguo.", "s":{"type":"scramble","chunks":["That is","the oldest","building"],"correct_order":}'::jsonb,
        '{"r":1, "p":"Ordena: Soy el hermano más joven.", "s":{"type":"scramble","chunks":["I am","the youngest","brother"],"correct_order":}'::jsonb,
        '{"r":1, "p":"Ordena: Es la habitación más limpia.", "s":{"type":"scramble","chunks":["It is","the cleanest","room"],"correct_order":}'::jsonb,

        -- ==========================================
        -- REGLA 2: Superioridad (Adjetivos Largos y de 2 Sílabas) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"This is ___ (el más cómodo) sofa.", "s":{"type":"typing","correct_answers":["the most comfortable"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She is ___ (la más inteligente) student.", "s":{"type":"typing","correct_answers":["the most intelligent"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"That was ___ (la más interesante) book.", "s":{"type":"typing","correct_answers":["the most interesting"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He is ___ (el más listo) boy. (Usa -est)", "s":{"type":"typing","correct_answers":["the cleverest"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It is ___ (el más caro) car in the world.", "s":{"type":"typing","correct_answers":["the most expensive"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"This is ___ (la más hermosa) city.", "s":{"type":"typing","correct_answers":["the most beautiful"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It is ___ (la más importante) decision.", "s":{"type":"typing","correct_answers":["the most important"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"This is ___ (el más difícil) exam.", "s":{"type":"typing","correct_answers":["the most difficult"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cuál es el superlativo correcto de ''comfortable''?", "s":{"type":"multiple_choice","options":["the most comfortable","the comfortablest","most comfortable"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el superlativo correcto de ''intelligent''?", "s":{"type":"multiple_choice","options":["the intelligentest","the most intelligent","most intelligent"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Para el adjetivo de dos sílabas ''clever'', ¿cuál superlativo es correcto?", "s":{"type":"multiple_choice","options":["the cleverest","the most clever","Ambas son correctas"],"answer":2}}'::jsonb,
        '{"r":2, "p":"This is ___ ring in the shop.", "s":{"type":"multiple_choice","options":["the most expensive","the expensivest","the expensive"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She is ___ woman I know.", "s":{"type":"multiple_choice","options":["the most beautiful","the beautifullest","beautifulest"],"answer":0}}'::jsonb,
        '{"r":2, "p":"That was ___ movie ever.", "s":{"type":"multiple_choice","options":["the most interesting","the interestingest","most interesting"],"answer":0}}'::jsonb,
        '{"r":2, "p":"It is ___ rule to follow.", "s":{"type":"multiple_choice","options":["the importantest","the most important","most important"],"answer":1}}'::jsonb,
        '{"r":2, "p":"This is ___ test of the year.", "s":{"type":"multiple_choice","options":["the most difficult","the difficultest","difficultest"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"A los adjetivos de 3 sílabas o más se les antepone THE MOST para formar el superlativo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"El superlativo de ''intelligent'' es ''the intelligentest''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Para el adjetivo de dos sílabas ''clever'', se puede usar tanto ''the cleverest'' como ''the most clever''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''The most expensive'' significa ''el más caro''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para adjetivos largos se debe usar el sufijo -EST al final y además THE MOST al principio.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''The most comfortable'' es la estructura correcta porque ''comfortable'' tiene más de dos sílabas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''The most beautiful'' es gramaticalmente incorrecto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Esta es la ciudad más hermosa.", "s":{"type":"scramble","chunks":["This is","the most","beautiful","city"],"correct_order":}'::jsonb,
        '{"r":2, "p":"Ordena: Ella es la estudiante más inteligente.", "s":{"type":"scramble","chunks":["She is","the most","intelligent","student"],"correct_order":}'::jsonb,
        '{"r":2, "p":"Ordena: Es el coche más caro.", "s":{"type":"scramble","chunks":["It is","the most","expensive","car"],"correct_order":}'::jsonb,
        '{"r":2, "p":"Ordena: Él es el chico más listo.", "s":{"type":"scramble","chunks":["He is","the cleverest","boy"],"correct_order":}'::jsonb,
        '{"r":2, "p":"Ordena: Esa es la regla más importante.", "s":{"type":"scramble","chunks":["That is","the most","important","rule"],"correct_order":}'::jsonb,
        '{"r":2, "p":"Ordena: Fue el examen más difícil.", "s":{"type":"scramble","chunks":["It was","the most","difficult","exam"],"correct_order":}'::jsonb,
        '{"r":2, "p":"Ordena: Este es el sofá más cómodo.", "s":{"type":"scramble","chunks":["This is","the most","comfortable","sofa"],"correct_order":}'::jsonb,

        -- ==========================================
        -- REGLA 3: Inferioridad (the least + adj / adv) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"This is ___ (el menos caro) phone in the shop.", "s":{"type":"typing","correct_answers":["the least expensive"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It is ___ (la menos cómoda) chair.", "s":{"type":"typing","correct_answers":["the least comfortable"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He is ___ (el menos inteligente) in the group.", "s":{"type":"typing","correct_answers":["the least intelligent"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"That is ___ (el menos interesante) book.", "s":{"type":"typing","correct_answers":["the least interesting"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"This is ___ (el menos difícil) exam of all.", "s":{"type":"typing","correct_answers":["the least difficult"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It is ___ (la menos atractiva) option.", "s":{"type":"typing","correct_answers":["the least attractive"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is ___ (la menos popular) girl.", "s":{"type":"typing","correct_answers":["the least popular"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"That is ___ (el menos importante) detail.", "s":{"type":"typing","correct_answers":["the least important"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Cómo dices ''el menos caro''?", "s":{"type":"multiple_choice","options":["the least expensive","the less expensive","least expensive"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cómo dices ''el menos inteligente''?", "s":{"type":"multiple_choice","options":["the least intelligent","the less intelligent","the intelligent least"],"answer":0}}'::jsonb,
        '{"r":3, "p":"This is ___ comfortable chair in the house.", "s":{"type":"multiple_choice","options":["least","the less","the least"],"answer":2}}'::jsonb,
        '{"r":3, "p":"Para expresar el superlativo de inferioridad se utiliza:", "s":{"type":"multiple_choice","options":["the less + adj","the least + adj","the most + adj"],"answer":1}}'::jsonb,
        '{"r":3, "p":"That was ___ interesting movie I''ve seen.", "s":{"type":"multiple_choice","options":["the least","the leastest","less"],"answer":0}}'::jsonb,
        '{"r":3, "p":"It is ___ difficult test.", "s":{"type":"multiple_choice","options":["the least","the less","the leastest"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She is ___ popular student.", "s":{"type":"multiple_choice","options":["the least","the less","the most least"],"answer":0}}'::jsonb,
        '{"r":3, "p":"This is ___ important detail of the plan.", "s":{"type":"multiple_choice","options":["the least","the less","least"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"El superlativo de inferioridad se forma anteponiendo ''the least'' al adjetivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''The least expensive'' significa ''el más caro''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"No es correcto añadir -EST al final del adjetivo si ya hemos puesto ''the least''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para decir ''el menos inteligente'', la frase correcta es ''the less intelligent''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''The least popular'' se traduce como ''el menos popular''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"El superlativo de inferioridad sirve para comparar hacia abajo respecto a un grupo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es obligatorio usar ''than'' después de un superlativo de inferioridad.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Es el teléfono menos caro.", "s":{"type":"scramble","chunks":["It is","the least","expensive","phone"],"correct_order":}'::jsonb,
        '{"r":3, "p":"Ordena: Él es la persona menos inteligente.", "s":{"type":"scramble","chunks":["He is","the least","intelligent","person"],"correct_order":}'::jsonb,
        '{"r":3, "p":"Ordena: Ese fue el libro menos interesante.", "s":{"type":"scramble","chunks":["That was","the least","interesting","book"],"correct_order":}'::jsonb,
        '{"r":3, "p":"Ordena: Esta es la silla menos cómoda.", "s":{"type":"scramble","chunks":["This is","the least","comfortable","chair"],"correct_order":}'::jsonb,
        '{"r":3, "p":"Ordena: Es la prueba menos difícil.", "s":{"type":"scramble","chunks":["It is","the least","difficult","test"],"correct_order":}'::jsonb,
        '{"r":3, "p":"Ordena: Ella es la chica menos popular.", "s":{"type":"scramble","chunks":["She is","the least","popular","girl"],"correct_order":}'::jsonb,
        '{"r":3, "p":"Ordena: Este es el detalle menos importante.", "s":{"type":"scramble","chunks":["This is","the least","important","detail"],"correct_order":}'::jsonb,

        -- ==========================================
        -- REGLA 4: Superlativos Irregulares - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"El superlativo de ''good'' es ___.", "s":{"type":"typing","correct_answers":["the best"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"El superlativo de ''bad'' es ___.", "s":{"type":"typing","correct_answers":["the worst"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"El superlativo de ''far'' es the furthest o ___.", "s":{"type":"typing","correct_answers":["the farthest"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"El superlativo de la cantidad ''little'' es ___.", "s":{"type":"typing","correct_answers":["the least"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"El superlativo de la cantidad ''much'' es ___.", "s":{"type":"typing","correct_answers":["the most"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"El superlativo del adverbio ''well'' es ___.", "s":{"type":"typing","correct_answers":["the best"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"El superlativo del adverbio ''badly'' o ''ill'' es ___.", "s":{"type":"typing","correct_answers":["the worst"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"This is ___ (el mejor) day of my life.", "s":{"type":"typing","correct_answers":["the best"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Cuál es el superlativo de ''good''?", "s":{"type":"multiple_choice","options":["the goodest","the best","the most good"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el superlativo de ''bad''?", "s":{"type":"multiple_choice","options":["the worst","the baddest","the most bad"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el superlativo de ''far''?", "s":{"type":"multiple_choice","options":["the farest","the furthest / the farthest","the most far"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el superlativo de ''little''?", "s":{"type":"multiple_choice","options":["the littlest","the least","the most little"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el superlativo de ''much''?", "s":{"type":"multiple_choice","options":["the most","the muchest","the more"],"answer":0}}'::jsonb,
        '{"r":4, "p":"El superlativo del adverbio ''well'' es:", "s":{"type":"multiple_choice","options":["the wellest","the best","the most well"],"answer":1}}'::jsonb,
        '{"r":4, "p":"El superlativo del adverbio ''badly'' es:", "s":{"type":"multiple_choice","options":["the worst","the badliest","the most badly"],"answer":0}}'::jsonb,
        '{"r":4, "p":"This is ___ idea ever. (La peor)", "s":{"type":"multiple_choice","options":["the baddest","the worst","the least bad"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El superlativo de ''good'' es ''the goodest''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"El superlativo de ''bad'' es ''the worst''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Tanto ''good'' como el adverbio ''well'' comparten el mismo superlativo: ''the best''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Far'' tiene dos formas superlativas válidas: ''the furthest'' y ''the farthest''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El superlativo de la cantidad ''much'' es ''the muchest''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"El superlativo de ''little'' es ''the least''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El superlativo de ''badly'' es ''the worst''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Este es el mejor día.", "s":{"type":"scramble","chunks":["This is","the best","day"],"correct_order":}'::jsonb,
        '{"r":4, "p":"Ordena: Fue la peor película.", "s":{"type":"scramble","chunks":["It was","the worst","movie"],"correct_order":}'::jsonb,
        '{"r":4, "p":"Ordena: Ese es el planeta más lejano.", "s":{"type":"scramble","chunks":["That is","the farthest","planet"],"correct_order":}'::jsonb,
        '{"r":4, "p":"Ordena: Él es el mejor jugador.", "s":{"type":"scramble","chunks":["He is","the best","player"],"correct_order":}'::jsonb,
        '{"r":4, "p":"Ordena: Ella tiene la mayor cantidad de dinero.", "s":{"type":"scramble","chunks":["She has","the most","money"],"correct_order":}'::jsonb,
        '{"r":4, "p":"Ordena: Esta es la menor cantidad de leche.", "s":{"type":"scramble","chunks":["This is","the least","milk"],"correct_order":}'::jsonb,
        '{"r":4, "p":"Ordena: Es la peor idea.", "s":{"type":"scramble","chunks":["It is","the worst","idea"],"correct_order":}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 13, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Superlativos', 
    'Aprende a formar superlativos regulares e irregulares para comparar un elemento destacándolo por encima de todo su grupo.', 
    to_jsonb('## Grammar Lesson: Los Superlativos
Los superlativos se utilizan para destacar un objeto, persona o situación por encima del resto de su grupo (ej. "el más rápido", "el menos caro"). Al igual que con los comparativos, las reglas dependen de la longitud del adjetivo.

##### 1. Superioridad (Adjetivos Cortos)
Se les agrega el sufijo **-EST** y siempre se antepone el artículo **THE**.
*   **Una Sílaba:** *Clean ➔ The cleanest* (El más limpio).
    *   *Nota ortográfica:* Si el adjetivo termina en Vocal + Consonante (VC), se duplica la consonante final. (*Big ➔ The biggest*).

##### 2. Superioridad (Adjetivos Largos)
Se antepone la estructura **THE MOST** sin modificar el adjetivo.
*   **Tres Sílabas o más:** *Comfortable ➔ The most comfortable* (El más cómodo). *Intelligent ➔ The most intelligent* (El más inteligente).
*   **Dos Sílabas:** Estos adjetivos son flexibles y pueden formarse de ambas maneras. (*Clever ➔ The cleverest / The most clever*).

##### 3. Inferioridad
Para formar el superlativo de inferioridad ("el menos..."), sin importar la longitud del adjetivo, siempre se antepone la estructura **THE LEAST**.
*   *Expensive ➔ The least expensive* (El menos caro).
*   *Comfortable ➔ The least comfortable* (El menos cómodo).

##### 4. Superlativos Irregulares
Algunos adjetivos y adverbios cambian completamente su forma y deben memorizarse:
*   **Good / Well:** The best (El mejor)
*   **Bad / Badly / Ill:** The worst (El peor)
*   **Far:** The further / The farthest (El más lejano)
*   **Little:** The least (La menor cantidad)
*   **Much:** The most (La mayor cantidad)'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Superioridad: Cortos (the + -est)', 'Para adjetivos cortos de una sílaba, usa "the" y añade "-est" al final (ej. the biggest, the cleanest). ¡Ojo con doblar consonantes!');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Superioridad: Largos y 2 sílabas', 'Para adjetivos de 3 o más sílabas, antepón "the most" (ej. the most intelligent). Los de 2 sílabas pueden usar cualquiera de las dos reglas.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Inferioridad (the least + adj)', 'Para decir "el menos..." siempre debes anteponer "the least" al adjetivo, sin añadir sufijos al final.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Superlativos Irregulares', 'Recuerda: good -> the best, bad -> the worst, far -> the farthest, little -> the least, much -> the most.');

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