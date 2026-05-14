-- ============================================================
-- Seed: A0 English Path – Grammar – Comparativos (Completo >100)
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
        -- REGLA 1: Superioridad (-ER vs MORE + than) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"My car is ___ (más limpio) than yours.", "s":{"type":"typing","correct_answers":["cleaner"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He is ___ (más fuerte) than his brother.", "s":{"type":"typing","correct_answers":["stronger"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"This chair is ___ (más cómoda) than that one.", "s":{"type":"typing","correct_answers":["more comfortable"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She is ___ (más inteligente) than me.", "s":{"type":"typing","correct_answers":["more intelligent"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"An elephant is ___ (más grande) than a dog.", "s":{"type":"typing","correct_answers":["bigger"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"My sister is ___ (más lista) than me.", "s":{"type":"typing","correct_answers":["cleverer","more clever"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"This box is ___ (más grande) than the other.", "s":{"type":"typing","correct_answers":["bigger"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"The new sofa is ___ (más cómodo).", "s":{"type":"typing","correct_answers":["more comfortable"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cuál es el comparativo correcto de ''clean''?", "s":{"type":"multiple_choice","options":["cleaner","more clean","cleanest"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el comparativo correcto de ''big''?", "s":{"type":"multiple_choice","options":["more big","biger","bigger"],"answer":2}}'::jsonb,
        '{"r":1, "p":"¿Cuál es la forma correcta?", "s":{"type":"multiple_choice","options":["more intelligent than","intelligent_er than","more intelligent that"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es correcta para adjetivos de dos sílabas como ''clever''?", "s":{"type":"multiple_choice","options":["Solo cleverer","Solo more clever","Ambas (cleverer / more clever)"],"answer":2}}'::jsonb,
        '{"r":1, "p":"The house is ___ than the apartment.", "s":{"type":"multiple_choice","options":["more big","bigger","biger"],"answer":1}}'::jsonb,
        '{"r":1, "p":"My dog is ___ than yours.", "s":{"type":"multiple_choice","options":["stronger","more strong","strongest"],"answer":0}}'::jsonb,
        '{"r":1, "p":"This hotel is ___ than the other.", "s":{"type":"multiple_choice","options":["comfortabler","more comfortable","most comfortable"],"answer":1}}'::jsonb,
        '{"r":1, "p":"En comparativos de superioridad, después del adjetivo se utiliza la partícula:", "s":{"type":"multiple_choice","options":["that","then","than"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"A los adjetivos de una sílaba se les añade el sufijo -ER para hacer el comparativo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para el adjetivo ''intelligent'', el comparativo es ''intelligenter''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Si un adjetivo de una sílaba termina en vocal+consonante (como ''big''), se duplica la consonante (''bigger'').", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para los adjetivos largos (3 sílabas o más) se antepone la palabra ''more''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El comparativo de ''clean'' es ''more clean''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La palabra que se usa para decir ''que'' en una comparación es ''than''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Los adjetivos de dos sílabas pueden formarse de ambas maneras (ej. cleverer / more clever).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Mi coche es más limpio que el tuyo.", "s":{"type":"scramble","chunks":["My car","cleaner","is","than","yours"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él es más fuerte que John.", "s":{"type":"scramble","chunks":["He","stronger","is","than","John"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Este sofá es más cómodo.", "s":{"type":"scramble","chunks":["is","This sofa","more","comfortable"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella es más inteligente que yo.", "s":{"type":"scramble","chunks":["She","intelligent","is","more","than me"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Mi casa es más grande que la tuya.", "s":{"type":"scramble","chunks":["My house","than","is","bigger","yours"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él es más listo que su hermano.", "s":{"type":"scramble","chunks":["cleverer","He","than","is","his brother"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Un tigre es más rápido.", "s":{"type":"scramble","chunks":["faster","A tiger","is"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Igualdad e Inferioridad (as...as / less...than) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"He is ___ tall as his father. (Tan)", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"This car is not ___ fast as that one. (Tan)", "s":{"type":"typing","correct_answers":["as","so"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"My phone is ___ expensive than yours. (Menos)", "s":{"type":"typing","correct_answers":["less"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It is less comfortable ___ the old one. (Que)", "s":{"type":"typing","correct_answers":["than"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She runs as fast ___ you. (Como)", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Today is ___ cold as yesterday. (Tan)", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"This book is ___ interesting than the movie. (Menos)", "s":{"type":"typing","correct_answers":["less"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He is not ___ clever as her. (Tan)", "s":{"type":"typing","correct_answers":["as","so"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cómo dices ''tan grande como''?", "s":{"type":"multiple_choice","options":["as big as","more big as","less big than"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cómo dices ''menos interesante que''?", "s":{"type":"multiple_choice","options":["less interesting as","less interesting than","least interesting than"],"answer":1}}'::jsonb,
        '{"r":2, "p":"En oraciones negativas, ''tan...como'' se puede decir:", "s":{"type":"multiple_choice","options":["not as/so + adj + as","not more + adj + than","not less + adj + as"],"answer":0}}'::jsonb,
        '{"r":2, "p":"This exam is ___ difficult than the last one. (Menos)", "s":{"type":"multiple_choice","options":["less","as","not as"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I am ___ tall as my brother.", "s":{"type":"multiple_choice","options":["than","less","as"],"answer":2}}'::jsonb,
        '{"r":2, "p":"She is not ___ fast as him.", "s":{"type":"multiple_choice","options":["less","so","than"],"answer":1}}'::jsonb,
        '{"r":2, "p":"¿Qué palabra acompaña siempre a ''less'' en una comparación de inferioridad?", "s":{"type":"multiple_choice","options":["as","that","than"],"answer":2}}'::jsonb,
        '{"r":2, "p":"He is less intelligent ___ me.", "s":{"type":"multiple_choice","options":["as","than","that"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"El comparativo de igualdad se forma con ''as + adjetivo + as''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En las comparaciones negativas de igualdad se puede usar ''not so + adjetivo + as''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para el comparativo de inferioridad utilizamos la estructura ''less + adjetivo + as''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Less + adjetivo + than'' significa ''menos... que''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''He is less taller than me'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''As big as'' se traduce como ''tan grande como''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Not as fast as'' significa ''más rápido que''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Él es tan alto como yo.", "s":{"type":"scramble","chunks":["tall","as","He is","me","as"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Este coche no es tan rápido como ese.", "s":{"type":"scramble","chunks":["This car","as","fast","as that one","is not"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Es menos caro que el oro.", "s":{"type":"scramble","chunks":["is","expensive","less","It","than gold"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella corre tan rápido como tú.", "s":{"type":"scramble","chunks":["runs","as","you","as fast","She"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: El libro es menos interesante que la película.", "s":{"type":"scramble","chunks":["less","interesting","The book is","than","the movie"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Hoy no hace tanto frío como ayer.", "s":{"type":"scramble","chunks":["is not","as","cold as","Today","yesterday"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Mi perro es menos agresivo que el tuyo.", "s":{"type":"scramble","chunks":["My dog","less","than yours","aggressive","is"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Comparativos Irregulares - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"El comparativo de ''good'' es ___.", "s":{"type":"typing","correct_answers":["better"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''bad'' es ___.", "s":{"type":"typing","correct_answers":["worse"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''far'' es further o ___.", "s":{"type":"typing","correct_answers":["farther"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"El comparativo del adverbio ''well'' es ___.", "s":{"type":"typing","correct_answers":["better"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''little'' es ___.", "s":{"type":"typing","correct_answers":["less"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''much'' es ___.", "s":{"type":"typing","correct_answers":["more"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"El comparativo del adverbio ''badly'' es ___.", "s":{"type":"typing","correct_answers":["worse"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"El comparativo del adverbio ''often'' es ___ often.", "s":{"type":"typing","correct_answers":["more"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Cuál es el comparativo correcto de ''good''?", "s":{"type":"multiple_choice","options":["gooder","better","more good"],"answer":1}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el comparativo correcto de ''bad''?", "s":{"type":"multiple_choice","options":["worse","badder","more bad"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el comparativo de ''far''?", "s":{"type":"multiple_choice","options":["farer","further / farther","more far"],"answer":1}}'::jsonb,
        '{"r":3, "p":"El comparativo del adverbio ''well'' es:", "s":{"type":"multiple_choice","options":["weller","better","more well"],"answer":1}}'::jsonb,
        '{"r":3, "p":"El comparativo del adverbio ''badly'' es:", "s":{"type":"multiple_choice","options":["worse","badlier","more badly"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el comparativo de ''little''?", "s":{"type":"multiple_choice","options":["littler","less","more little"],"answer":1}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el comparativo de ''much''?", "s":{"type":"multiple_choice","options":["more","mucher","most"],"answer":0}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''often'' es:", "s":{"type":"multiple_choice","options":["oftener","more often","oftenest"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"El comparativo del adjetivo ''good'' es ''gooder''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''bad'' es ''worse''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Far'' tiene dos formas de comparativo: ''further'' y ''farther''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Tanto el adjetivo ''good'' como el adverbio ''well'' tienen el mismo comparativo: ''better''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''badly'' es ''more badly''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"El comparativo de la cantidad ''much'' es ''more''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"El comparativo de ''little'' es ''less''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Esto es mejor que aquello.", "s":{"type":"scramble","chunks":["better","This is","than","that"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Su salud es peor que ayer.", "s":{"type":"scramble","chunks":["is","His health","worse","yesterday","than"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Mi casa está más lejos que la tuya.", "s":{"type":"scramble","chunks":["further","My house is","than","yours"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella canta mejor que yo.", "s":{"type":"scramble","chunks":["better","She sings","than","me"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Tengo menos tiempo libre ahora.", "s":{"type":"scramble","chunks":["I have","free time","less","now"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Necesitamos más dinero.", "s":{"type":"scramble","chunks":["more","We","money","need"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: La situación es peor hoy.", "s":{"type":"scramble","chunks":["worse","The situation","today","is"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Estructuras Especiales - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I don’t go out ___ much as I used to. (Tanto)", "s":{"type":"typing","correct_answers":["as"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"My marks were the ___ as hers. (Igual que)", "s":{"type":"typing","correct_answers":["same"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ more you read, the smarter you get. (Cuanto más)", "s":{"type":"typing","correct_answers":["The"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"The more you read, the smarter you ___. (Get)", "s":{"type":"typing","correct_answers":["get"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Petrol is more ___ more expensive. (Cada vez más)", "s":{"type":"typing","correct_answers":["and"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Computers are cheaper and ___. (Cada vez más baratos)", "s":{"type":"typing","correct_answers":["cheaper"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He is ___ and less shy. (Cada vez menos)", "s":{"type":"typing","correct_answers":["less"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"The older you get, ___ wiser you become.", "s":{"type":"typing","correct_answers":["the"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Cómo dices ''tanto como''?", "s":{"type":"multiple_choice","options":["as much as","so much that","as many that"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cómo traduces ''Lo mismo que ella''?", "s":{"type":"multiple_choice","options":["The same than her","The same as hers","Equal to her"],"answer":1}}'::jsonb,
        '{"r":4, "p":"''The more you read, ___ smarter you get.''", "s":{"type":"multiple_choice","options":["more","than","the"],"answer":2}}'::jsonb,
        '{"r":4, "p":"¿Cómo expresas ''cada vez más caro''?", "s":{"type":"multiple_choice","options":["more and more expensive","expensiver and expensiver","most and most expensive"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cómo expresas ''cada vez más baratos''?", "s":{"type":"multiple_choice","options":["more and more cheap","cheaper and cheaper","cheap and cheap"],"answer":1}}'::jsonb,
        '{"r":4, "p":"He is ___ shy. (Cada vez menos tímido)", "s":{"type":"multiple_choice","options":["less and less","least and least","more and less"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I don’t go out ___ I used to.", "s":{"type":"multiple_choice","options":["as much as","as much than","so much that"],"answer":0}}'::jsonb,
        '{"r":4, "p":"My answers are ___ yours. (Las mismas que)", "s":{"type":"multiple_choice","options":["the same as","the same than","as same as"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"La estructura ''as much as'' significa ''tanto como''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para decir ''lo mismo que'' se utiliza ''the same than''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La estructura ''The more..., the more...'' significa ''Cuanto más..., más...''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para decir ''cada vez más caro'' es correcto decir ''more and more expensive''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para decir ''cada vez más baratos'' decimos ''more and more cheap''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Cheaper and cheaper'' es la forma correcta para adjetivos cortos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Less and less'' se utiliza para expresar ''cada vez menos''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: No salgo tanto como solía.", "s":{"type":"scramble","chunks":["go out","as much as","I don''t","I used to"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Mis notas fueron las mismas que las suyas.", "s":{"type":"scramble","chunks":["My marks","as hers","were","the same"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Cuanto más lees, más listo te vuelves.", "s":{"type":"scramble","chunks":["The more","the smarter","you read,","you get"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: La gasolina es cada vez más cara.", "s":{"type":"scramble","chunks":["Petrol is","expensive","more and more"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Los ordenadores son cada vez más baratos.", "s":{"type":"scramble","chunks":["Computers","cheaper","are","and cheaper"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él es cada vez menos tímido.", "s":{"type":"scramble","chunks":["He is","less","shy","and less"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Te quiero tanto como siempre.", "s":{"type":"scramble","chunks":["I love you","always","as much as"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 12, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Comparativos (Superioridad, Igualdad y Estructuras)', 
    'Aprende a comparar cosas en inglés: desde formar comparativos regulares e irregulares, hasta estructuras avanzadas como "the more... the more".', 
    to_jsonb('## Grammar Lesson: Los Comparativos
En inglés, existen distintas formas de comparar objetos, personas o situaciones. Las reglas cambian un poco dependiendo de la longitud del adjetivo y del tipo de comparación.

##### 1. Comparativos de Superioridad ("Más ... que")
Depende de la longitud del adjetivo:
*   **1 Sílaba:** Se le añade el sufijo **-ER**. (*Clean ➔ Cleaner*). 
    * *Nota ortográfica:* Si termina en Vocal + Consonante (VC), se duplica la consonante (*Big ➔ Bigger*).
*   **3 Sílabas o más:** Se le antepone la palabra **MORE**. (*Intelligent ➔ More intelligent*).
*   **2 Sílabas:** Pueden formarse de ambas maneras. (*Clever ➔ Cleverer / More clever*).
> **Importante:** La palabra que significa "que" para enlazar la comparación es siempre **THAN**. (*He is stronger than me*).

##### 2. Igualdad e Inferioridad
*   **Igualdad:** Se forma con **AS + adjetivo + AS** (Tan... como). (*He is as tall as John*).
*   **Igualdad Negativa:** Se puede usar **NOT AS / SO + adjetivo + AS**. (*It is not as fast as mine*).
*   **Inferioridad:** Se forma con **LESS + adjetivo + THAN** (Menos... que). (*Less expensive than gold*).

##### 3. Comparativos Irregulares
Algunos adjetivos y adverbios tienen formas que debes memorizar:
*   **Good / Well:** Better (Mejor)
*   **Bad / Badly / Ill:** Worse (Peor)
*   **Far:** Further / Farther (Más lejos)
*   **Little:** Less (Menos)
*   **Much:** More (Más)
*   **Often:** More often (Más a menudo)

##### 4. Estructuras Especiales de Comparación
*   **As much as:** Tanto como. (*I don’t go out as much as I used to*).
*   **The same as:** Lo mismo que / Igual que. (*My marks were the same as hers*).
*   **The ..., the...:** Cuanto más..., más... (*The more you read, the smarter you get*).
*   **More and more / -er and -er:** Cada vez más... Para adjetivos largos se usa *more and more expensive*. Para cortos se duplica el comparativo *cheaper and cheaper*.
*   **Less and less:** Cada vez menos... (*He is less and less shy*).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Superioridad (-ER vs MORE + than)', 'Añade -ER a los adjetivos cortos (bigger, cleaner) y usa MORE para los largos (more intelligent). Recuerda usar "than" para conectar la frase.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Igualdad e Inferioridad', 'Usa "as + adj + as" para decir "tan...como", y "less + adj + than" para "menos...que".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Comparativos Irregulares', 'Recuerda las formas irregulares: good/well -> better, bad/badly -> worse, far -> further, little -> less, much -> more.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Estructuras Especiales', 'Aprende formas como "the..., the..." (cuanto más..., más...), "more and more" (cada vez más) y "the same as" (lo mismo que).');

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