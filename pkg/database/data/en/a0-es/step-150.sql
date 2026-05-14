-- ============================================================
-- Seed: A0 English Path – STEP 150 – Grammar – Adjetivos (Reglas gramaticales y posición)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_grammar1_id UUID; 
    v_rule1_id UUID; 
    v_rule2_id UUID; 
    v_rule3_id UUID; 
    v_rule4_id UUID; 
    v_rule5_id UUID; 
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
        '{"r":1, "p":"Ordena la frase: Tengo un perro pequeño.", "s":{"type":"scramble","chunks":["small", "have", "a", "dog", "I"],"correct_order":[4, 1, 2, 0, 3]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Ella vive en una casa grande.", "s":{"type":"scramble","chunks":["a", "She", "in", "big", "house", "lives"],"correct_order":[1, 5, 2, 0, 3, 4]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Él compró zapatos caros.", "s":{"type":"scramble","chunks":["shoes", "bought", "expensive", "He"],"correct_order":[3, 1, 2, 0]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Leímos un buen libro.", "s":{"type":"scramble","chunks":["read", "a", "good", "book", "We"],"correct_order":[4, 0, 1, 2, 3]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Es una ciudad hermosa.", "s":{"type":"scramble","chunks":["city", "beautiful", "a", "It", "is"],"correct_order":[3, 4, 2, 1, 0]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Son buenas personas.", "s":{"type":"scramble","chunks":["nice", "are", "They", "people"],"correct_order":[2, 1, 0, 3]}}'::jsonb,

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
        '{"r":2, "p":"Ordena la frase: Es una casa hermosa y grande.", "s":{"type":"scramble","chunks":["a", "big", "It is", "beautiful", "house"],"correct_order":[2, 0, 3, 1, 4]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Él es un hombre joven e inteligente.", "s":{"type":"scramble","chunks":["man", "He is", "a", "smart", "young"],"correct_order":[1, 2, 3, 4, 0]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Ella tiene un anillo pequeño y caro.", "s":{"type":"scramble","chunks":["ring", "small", "She has", "expensive", "an"],"correct_order":[2, 4, 3, 1, 0]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Vimos una buena película antigua.", "s":{"type":"scramble","chunks":["old", "movie", "saw", "a", "We", "good"],"correct_order":[4, 2, 3, 5, 0, 1]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Ellos tienen un perro grande y feo.", "s":{"type":"scramble","chunks":["an", "dog", "ugly", "big", "They have"],"correct_order":[4, 0, 2, 3, 1]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Compré un teléfono nuevo y bonito.", "s":{"type":"scramble","chunks":["phone", "a", "nice", "I bought", "new"],"correct_order":[3, 1, 2, 4, 0]}}'::jsonb,

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
        '{"r":3, "p":"Ordena la frase: Compré una mesa negra estrecha.", "s":{"type":"scramble","chunks":["a", "I bought", "black", "narrow", "table"],"correct_order":[1, 0, 3, 2, 4]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Él conduce un coche americano negro.", "s":{"type":"scramble","chunks":["drives", "black", "a", "American", "He", "car"],"correct_order":[4, 0, 2, 1, 3, 5]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Ella tiene un jarrón español delgado.", "s":{"type":"scramble","chunks":["a", "vase", "Spanish", "She has", "thin"],"correct_order":[3, 0, 4, 2, 1]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Es un plato blanco redondo.", "s":{"type":"scramble","chunks":["It is", "plate", "a", "round", "white"],"correct_order":[0, 2, 3, 4, 1]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Ella vistió un vestido italiano rojo.", "s":{"type":"scramble","chunks":["red", "dress", "She", "Italian", "a", "wore"],"correct_order":[2, 5, 4, 0, 3, 1]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Él bebió una cerveza alemana oscura.", "s":{"type":"scramble","chunks":["German", "beer", "dark", "a", "He drank"],"correct_order":[4, 3, 2, 0, 1]}}'::jsonb,

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
        '{"r":4, "p":"Ordena la frase: Es una herramienta de madera para el jardín.", "s":{"type":"scramble","chunks":["It is", "wooden", "tool", "gardening", "a"],"correct_order":[0, 4, 1, 3, 2]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Él compró una olla de hierro para cocinar.", "s":{"type":"scramble","chunks":["He bought", "cooking", "iron", "an", "pot"],"correct_order":[0, 3, 2, 1, 4]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Ella necesita una bolsa de plástico para la compra.", "s":{"type":"scramble","chunks":["plastic", "a", "shopping", "bag", "needs", "She"],"correct_order":[5, 4, 1, 0, 2, 3]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Él usa zapatillas de cuero para correr.", "s":{"type":"scramble","chunks":["shoes", "wears", "running", "He", "leather"],"correct_order":[3, 1, 4, 2, 0]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Tengo una botella de cristal para beber.", "s":{"type":"scramble","chunks":["I have", "glass", "bottle", "drinking", "a"],"correct_order":[0, 4, 1, 3, 2]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Usamos un cuchillo de acero para cortar.", "s":{"type":"scramble","chunks":["knife", "cutting", "We use", "steel", "a"],"correct_order":[2, 4, 3, 1, 0]}}'::jsonb,

        -- ==========================================
        -- REGLA 5: Adjetivos Predicativos (20 Ejercicios)
        -- ==========================================
        -- Multiple Choice (7)
        '{"r":5, "p":"Elige la frase correcta:", "s":{"type":"multiple_choice","options":["The soup smells good","The soup smells well","The good soup smells"],"answer":0}}'::jsonb,
        '{"r":5, "p":"Elige la frase correcta:", "s":{"type":"multiple_choice","options":["She is beautiful","She is beautifully","She beautiful is"],"answer":0}}'::jsonb,
        '{"r":5, "p":"Elige la frase correcta:", "s":{"type":"multiple_choice","options":["He looks tiredly","He looks tired","He tiredlooks"],"answer":1}}'::jsonb,
        '{"r":5, "p":"¿Cuál es la versión predicativa de ''a cold day''?", "s":{"type":"multiple_choice","options":["The day is cold","The day is coldly","The day colds"],"answer":0}}'::jsonb,
        '{"r":5, "p":"Elige la frase correcta:", "s":{"type":"multiple_choice","options":["The music sounds great","The music sounds greatly","The music great sounds"],"answer":0}}'::jsonb,
        '{"r":5, "p":"Elige la frase correcta:", "s":{"type":"multiple_choice","options":["I feel hungryly","I feel hungry","I hungry feel"],"answer":1}}'::jsonb,
        '{"r":5, "p":"¿Cuál completa correctamente: ''The cake tastes ___''?", "s":{"type":"multiple_choice","options":["delicious","deliciously","delicious cake"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":5, "p":"En la frase ''The car is fast'', ''fast'' es un adjetivo predicativo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":5, "p":"Después del verbo ''be'' debemos usar un adverbio, no un adjetivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":5, "p":"La frase ''She looks beautifully'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":5, "p":"Los verbos copulativos como look, feel y smell pueden ir seguidos de un adjetivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":5, "p":"''A fast car'' y ''The car is fast'' expresan la misma idea con el adjetivo en distinta posición.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":5, "p":"La frase ''The food smells well'' usa correctamente un adjetivo predicativo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":5, "p":"En inglés se puede decir tanto ''a tired man'' como ''The man is tired''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (6)
        '{"r":5, "p":"Ordena la frase: El coche es rápido.", "s":{"type":"scramble","chunks":["is", "car", "fast", "The"],"correct_order":[3, 1, 0, 2]}}'::jsonb,
        '{"r":5, "p":"Ordena la frase: Ella parece muy cansada.", "s":{"type":"scramble","chunks":["looks", "She", "very", "tired"],"correct_order":[1, 0, 2, 3]}}'::jsonb,
        '{"r":5, "p":"Ordena la frase: La sopa huele bien.", "s":{"type":"scramble","chunks":["smells", "soup", "The", "good"],"correct_order":[2, 1, 0, 3]}}'::jsonb,
        '{"r":5, "p":"Ordena la frase: Me siento muy feliz hoy.", "s":{"type":"scramble","chunks":["feel", "very", "today", "I", "happy"],"correct_order":[3, 0, 1, 4, 2]}}'::jsonb,
        '{"r":5, "p":"Ordena la frase: Eso suena genial.", "s":{"type":"scramble","chunks":["sounds", "That", "great"],"correct_order":[1, 0, 2]}}'::jsonb,
        '{"r":5, "p":"Ordena la frase: El pastel sabe delicioso.", "s":{"type":"scramble","chunks":["tastes", "cake", "delicious", "The"],"correct_order":[3, 1, 0, 2]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 150, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Los Adjetivos', 
    '', 
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
*   Material + Propósito: *A wooden gardening tool* (Una herramienta de madera para el jardín).

##### 5. Adjetivos Predicativos (después del verbo)
Los adjetivos también pueden colocarse **después del verbo** (especialmente después de *be*, *look*, *feel*, *smell*, *sound*, *taste*). En este caso se llaman adjetivos **predicativos** y describen al sujeto.
*   Atributivo (antes del nombre): *a fast car* (un coche rápido).
*   Predicativo (después del verbo): *The car is fast.* (El coche es rápido).

**Verbos copulativos comunes:**
*   *be* → *She **is** beautiful.* (Ella es hermosa).
*   *look* → *He **looks** tired.* (Él parece cansado).
*   *feel* → *I **feel** cold.* (Tengo frío).
*   *smell* → *The food **smells** good.* (La comida huele bien).
*   *sound* → *That **sounds** great.* (Eso suena genial).'::text)
);

-- 3. Insertar las 5 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Invariabilidad y Posición', 'Los adjetivos van delante del nombre y NUNCA se escriben en plural ni en femenino (ej. The dirty cars, no "The dirtys cars").');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Orden: Opinión, Tamaño y Edad', 'El orden inicial es: 1º Opinión (beautiful), 2º Tamaño (big), 3º Edad (old). Ejemplo: A beautiful big old house.');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Orden: Forma, Color y Origen', 'El orden intermedio es: 4º Forma (narrow), 5º Color (black), 6º Origen/Nacionalidad (Spanish).');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Orden: Material y Propósito', 'Los últimos antes del nombre son: 7º Material (wooden, iron) y 8º Propósito (gardening, sleeping).');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Adjetivos Predicativos (después del verbo)', 'Los adjetivos pueden ir después del verbo be y verbos como look/feel/smell. Ejemplo: The car IS fast (no ''is fastly''). No confundas con adverbios.');

-- 4. Bucle optimizado para insertar los 100 ejercicios
FOREACH ex IN ARRAY exercises
LOOP
    -- Determinar el ID de la regla correcta
    IF (ex->>'r')::int = 1 THEN v_rule_id := v_rule1_id;
    ELSIF (ex->>'r')::int = 2 THEN v_rule_id := v_rule2_id;
    ELSIF (ex->>'r')::int = 3 THEN v_rule_id := v_rule3_id;
    ELSIF (ex->>'r')::int = 4 THEN v_rule_id := v_rule4_id;
    ELSE v_rule_id := v_rule5_id;
    END IF;

    -- Insertar el ejercicio base
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) 
    VALUES (v_grammar1_id, v_rule_id) 
    RETURNING uuid INTO v_ex_id;

    -- Insertar la traducción del ejercicio
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

END LOOP;
END;
$seed$;
