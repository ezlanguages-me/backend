-- ============================================================
-- Seed: A0 English Path – Grammar – Los Adjetivos (Sin Typing)
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
        -- REGLA 1: Invariabilidad y Posición (20 Ejercicios)
        -- ==========================================
        -- Multiple Choice (7)
        '{"r":1, "p":"¿Cuál es gramaticalmente correcta?", "s":{"type":"multiple_choice","options":["The dirty cars","The dirtys cars","The cars dirtys"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es gramaticalmente correcta?", "s":{"type":"multiple_choice","options":["A expensive car","An expensive car","A car expensive"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Cuál es gramaticalmente correcta?", "s":{"type":"multiple_choice","options":["The tall boys","The boys talls","The talls boys"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es gramaticalmente correcta?", "s":{"type":"multiple_choice","options":["A beautiful house","A house beautiful","A beautifuls house"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es gramaticalmente correcta?", "s":{"type":"multiple_choice","options":["Two small cats","Two smalls cats","Two cats small"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es gramaticalmente correcta?", "s":{"type":"multiple_choice","options":["A new book","A book new","A news book"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es gramaticalmente correcta?", "s":{"type":"multiple_choice","options":["Three red apples","Three reds apples","Three apples reds"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Los adjetivos en inglés se colocan generalmente después del sustantivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Los adjetivos en inglés no tienen plural (nunca se les añade una S).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''The dirtys shoes'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Los adjetivos en inglés no tienen género (masculino o femenino).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''the white house'', no ''the house white''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''A talls man'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La misma palabra (adjetivo) sirve para singular y plural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (6)
        '{"r":1, "p":"Ordena la frase: Tengo un perro pequeño.", "s":{"type":"scramble","chunks":["I","have","a","small","dog"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Ella vive en una casa grande.", "s":{"type":"scramble","chunks":["She","lives","in","a","big","house"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Él compró zapatos caros.", "s":{"type":"scramble","chunks":["He","bought","expensive","shoes"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Leímos un buen libro.", "s":{"type":"scramble","chunks":["We","read","a","good","book"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Es una ciudad hermosa.", "s":{"type":"scramble","chunks":["It","is","a","beautiful","city"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Son buenas personas.", "s":{"type":"scramble","chunks":["They","are","nice","people"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Orden 1 (Opinión, Tamaño, Edad) (20 Ejercicios)
        -- ==========================================
        -- Multiple Choice (7)
        '{"r":2, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A beautiful big house","A big beautiful house","A house big beautiful"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["An old small car","A small old car","A car small old"],"answer":1}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["An expensive big watch","A big expensive watch","A watch big expensive"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A young smart boy","A smart young boy","A boy smart young"],"answer":1}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A bad old dog","An old bad dog","A dog bad old"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A great new movie","A new great movie","A movie great new"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["An ugly small box","A small ugly box","A box ugly small"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"La opinión se coloca siempre antes que el tamaño.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La edad va antes que la opinión en el orden de los adjetivos.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''A beautiful young woman'' sigue el orden gramatical correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''A big expensive TV'' es el orden gramatical más natural.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"El tamaño se coloca antes de la edad (ej. a big old house).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''A young beautiful girl'' es la manera más natural de decirlo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''A tall young man'' sigue la regla de Tamaño luego Edad.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (6)
        '{"r":2, "p":"Ordena la frase: Es una casa hermosa y grande.", "s":{"type":"scramble","chunks":["It is","a","beautiful","big","house"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Él es un hombre joven e inteligente.", "s":{"type":"scramble","chunks":["He is","a","smart","young","man"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Ella tiene un anillo pequeño y caro.", "s":{"type":"scramble","chunks":["She has","an","expensive","small","ring"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Vimos una buena película antigua.", "s":{"type":"scramble","chunks":["We","saw","a","good","old","movie"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Ellos tienen un perro grande y feo.", "s":{"type":"scramble","chunks":["They have","an","ugly","big","dog"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Compré un teléfono nuevo y bonito.", "s":{"type":"scramble","chunks":["I bought","a","nice","new","phone"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Orden 2 (Forma, Color, Origen) (20 Ejercicios)
        -- ==========================================
        -- Multiple Choice (7)
        '{"r":3, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A black American car","An American black car","A car black American"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A narrow black table","A black narrow table","A table narrow black"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A thin Spanish vase","A Spanish thin vase","A vase thin Spanish"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A red Italian dress","An Italian red dress","A dress red Italian"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A round blue clock","A blue round clock","A clock round blue"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A square white plate","A white square plate","A plate square white"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A blue Japanese bike","A Japanese blue bike","A bike blue Japanese"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"La forma (shape) del objeto va antes que su color.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"El origen geográfico (nacionalidad) se coloca antes que el color.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''A black Spanish car'' sigue el orden gramatical correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''An American thin book'' es el orden preferido en inglés.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"El color va antes de mencionar el origen del objeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La forma (shape) se coloca después del origen geográfico.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''A round French cheese'' sigue el orden gramatical de forma y origen.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (6)
        '{"r":3, "p":"Ordena la frase: Compré una mesa negra estrecha.", "s":{"type":"scramble","chunks":["I bought","a","narrow","black","table"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Él conduce un coche americano negro.", "s":{"type":"scramble","chunks":["He","drives","a","black","American","car"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Ella tiene un jarrón español delgado.", "s":{"type":"scramble","chunks":["She has","a","thin","Spanish","vase"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Es un plato blanco redondo.", "s":{"type":"scramble","chunks":["It is","a","round","white","plate"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Ella vistió un vestido italiano rojo.", "s":{"type":"scramble","chunks":["She","wore","a","red","Italian","dress"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Él bebió una cerveza alemana oscura.", "s":{"type":"scramble","chunks":["He drank","a","dark","German","beer"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Orden 3 (Material y Propósito) (20 Ejercicios)
        -- ==========================================
        -- Multiple Choice (7)
        '{"r":4, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A wooden sleeping bed","A sleeping wooden bed","A bed wooden sleeping"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["An iron gardening tool","A gardening iron tool","A tool iron gardening"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A plastic shopping bag","A shopping plastic bag","A bag plastic shopping"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A leather running shoe","A running leather shoe","A shoe leather running"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A glass drinking bottle","A drinking glass bottle","A bottle glass drinking"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A metal cooking pot","A cooking metal pot","A pot metal cooking"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es el orden correcto?", "s":{"type":"multiple_choice","options":["A cotton sports shirt","A sports cotton shirt","A shirt cotton sports"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El material del que está hecho un objeto va siempre después de su propósito.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"El propósito (para qué sirve) es el último adjetivo, justo antes del sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''A wooden gardening tool'' sigue el orden gramatical correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Los adjetivos que indican el propósito de un objeto muchas veces terminan en -ing (ej. sleeping).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En la frase ''an iron sleeping bed'', ''iron'' es el material y ''sleeping'' el propósito.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El material (wooden, glass) se coloca antes que el propósito del objeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La frase ''A running leather shoe'' está en el orden correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (6)
        '{"r":4, "p":"Ordena la frase: Es una herramienta de madera para el jardín.", "s":{"type":"scramble","chunks":["It is","a","wooden","gardening","tool"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Él compró una olla de hierro para cocinar.", "s":{"type":"scramble","chunks":["He bought","an","iron","cooking","pot"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Ella necesita una bolsa de plástico para la compra.", "s":{"type":"scramble","chunks":["She","needs","a","plastic","shopping","bag"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Él usa zapatillas de cuero para correr.", "s":{"type":"scramble","chunks":["He","wears","leather","running","shoes"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Tengo una botella de cristal para beber.", "s":{"type":"scramble","chunks":["I have","a","glass","drinking","bottle"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Usamos un cuchillo de acero para cortar.", "s":{"type":"scramble","chunks":["We use","a","steel","cutting","knife"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 10, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Los Adjetivos (Posición y Orden)', 
    'Aprende que los adjetivos en inglés son invariables y descubre el orden exacto en el que debes colocarlos cuando hay más de uno.', 
    to_jsonb('## Grammar Lesson: Los Adjetivos
En inglés, los adjetivos tienen dos grandes reglas que los diferencian completamente del español: su posición y su inviabilidad. Además, cuando queremos usar varios adjetivos para describir una misma cosa, debemos seguir un estricto orden lógico.

##### 1. Regla de Oro: Sin género ni número
Los adjetivos **siempre van delante** de los nombres que describen. 
No tienen **ni género ni número** (son invariables). La misma palabra sirve para masculino, femenino, singular y plural.
*   *Dirty* ➔ Sucio, sucia, sucios, sucias.
    *   *The dirty car* (El coche sucio).
    *   *The dirty cars* (Los coches sucios - *no se añade "s" al adjetivo*).

##### 2. El Orden de los Adjetivos
Cuando hay más de un adjetivo acompañando a un sustantivo, estos deben colocarse en un orden específico. Aunque es raro usar más de tres adjetivos seguidos, el orden completo (del más subjetivo al más objetivo) es el siguiente:

1.  **Opinión o juicio** (*beautiful, expensive, ugly*)
2.  **Tamaño o longitud** (*big, small, tall*)
3.  **Edad o temperatura** (*old, young, hot*)
4.  **Forma** (*thin, narrow, round*)
5.  **Color** (*black, red, blue*)
6.  **Origen** (*American, Spanish, Italian*)
7.  **Material** (*wooden, iron, plastic*)
8.  **Propósito / Utilidad** (*sleeping, gardening, running*)

**Ejemplos aplicados:**
*   Opinión + Tamaño: *A beautiful big house* (Una casa bonita y grande).
*   Tamaño + Edad: *A small old car* (Un coche pequeño y antiguo).
*   Color + Origen: *A black American car* (Un coche negro americano).
*   Material + Propósito: *A wooden gardening tool* (Una herramienta de madera para el jardín).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Invariabilidad y Posición', 'Los adjetivos van delante del nombre y NUNCA se escriben en plural ni en femenino (ej. The dirty cars, no "The dirtys cars").');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Orden: Opinión, Tamaño y Edad', 'El orden inicial es: 1º Opinión (beautiful), 2º Tamaño (big), 3º Edad (old). Ejemplo: A beautiful big old house.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Orden: Forma, Color y Origen', 'El orden intermedio es: 4º Forma (narrow), 5º Color (black), 6º Origen/Nacionalidad (Spanish).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Orden: Material y Propósito', 'Los últimos antes del nombre son: 7º Material (wooden, iron) y 8º Propósito (gardening, sleeping).');

-- 4. Bucle optimizado para insertar los 80 ejercicios
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