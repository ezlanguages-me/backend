-- ============================================================
-- Seed: A0 English Path – Grammar – Preposiciones (AT, ON, IN)
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
        -- REGLA 1: Preposición IN (Tiempo y Lugar) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I was born ___ (en) July.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She was born ___ (en) 1992.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We go to the beach ___ (en) summer.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I drink coffee ___ (en) the morning.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They live ___ (en) Barcelona.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We left the car ___ (en) the car park.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"The money is ___ (dentro de) the box.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She is studying ___ (en) her bedroom.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"I was born ___ 1990.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She usually wakes up early ___ the morning.", "s":{"type":"multiple_choice","options":["on","in","at"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I will travel to London ___ August.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They live ___ Paris.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We parked ___ the garage.", "s":{"type":"multiple_choice","options":["on","at","in"],"answer":2}}'::jsonb,
        '{"r":1, "p":"My keys are ___ my pocket.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        '{"r":1, "p":"The museum is beautiful ___ winter.", "s":{"type":"multiple_choice","options":["at","in","on"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He works ___ a large office.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Se utiliza ''IN'' para hablar de meses y años (ej. in July, in 1992).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La preposición ''IN'' se utiliza para espacios cerrados o de tres dimensiones.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''at Barcelona'' para indicar que vives en esa ciudad.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Para hablar de las estaciones del año se usa ''IN'' (ej. in summer).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''In the morning'' significa ''en la mañana''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''I was born in 1995'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para indicar que algo está dentro de una caja se usa ''ON''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Nací en julio.", "s":{"type":"scramble","chunks":["born","I was","in July"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella nació en 1992.", "s":{"type":"scramble","chunks":["in 1992","She was","born"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos viven en París.", "s":{"type":"scramble","chunks":["live","in Paris","They"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Dejamos el coche en el aparcamiento.", "s":{"type":"scramble","chunks":["the car","We left","in the car park"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Bebo café en la mañana.", "s":{"type":"scramble","chunks":["in the morning","I drink","coffee"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros vivimos en España.", "s":{"type":"scramble","chunks":["in Spain","live","We"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: El dinero está en la caja.", "s":{"type":"scramble","chunks":["is","in the box","The money"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Preposición ON (Tiempo y Lugar) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"We are having a party ___ (en) Saturday.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"My birthday is ___ (en) Monday.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The meeting is ___ (el) July 4th.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There is a picture ___ (sobre) the wall.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The keys are ___ (sobre) the table.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Don''t sit ___ (en) the floor.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He got ___ (sobre) the horse.", "s":{"type":"typing","correct_answers":["on","onto"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The spider is ___ (en) the ceiling.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"We have a meeting ___ Monday.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"My appointment is ___ Friday morning.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The clock is ___ the wall.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The food is ___ the table.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He arrived ___ October 12th.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Please write it ___ the paper.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"There is dirt ___ the floor.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I will see you ___ Tuesday.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Se utiliza ''ON'' para los días de la semana (ej. on Monday).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Con fechas exactas como ''el 4 de julio'' se utiliza ''ON''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''ON'' se usa cuando un objeto está tocando una superficie plana (ej. on the wall).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Se dice ''in the table'' para indicar que algo está encima de la mesa.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La expresión ''on the ceiling'' (en el techo) es correcta porque el techo es una superficie.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para decir ''el viernes por la mañana'' usamos ''IN Friday morning''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Si un pintor dibuja algo en la pared, lo pinta ''ON the wall''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Tenemos una fiesta el sábado.", "s":{"type":"scramble","chunks":["a party","We have","on Saturday"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Mi clase es el lunes.", "s":{"type":"scramble","chunks":["on Monday","is","My class"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Hay un cuadro en la pared.", "s":{"type":"scramble","chunks":["There is","on the wall","a picture"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Las llaves están sobre la mesa.", "s":{"type":"scramble","chunks":["are","The keys","on the table"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: El evento es el 4 de julio.", "s":{"type":"scramble","chunks":["on July 4th","is","The event"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No te sientes en el suelo.", "s":{"type":"scramble","chunks":["on the floor","sit","Don''t"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Hay una araña en el techo.", "s":{"type":"scramble","chunks":["on the ceiling","is","A spider"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Preposición AT (Tiempo y Lugar) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I will see you ___ (en) Christmas.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"What do you do ___ (en) the weekend?", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We eat eggs ___ (en el) breakfast.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They arrived ___ (al) dawn.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He is waiting ___ (en) the bus-stop.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She studies ___ (en) school.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I will meet you ___ (en) the hotel.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Write your name ___ (en) the top of the page.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"Let''s meet ___ the weekend.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":3, "p":"We exchange gifts ___ Christmas.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":3, "p":"He drinks coffee ___ breakfast.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":3, "p":"There is a man standing ___ the bus-stop.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":3, "p":"They are dancing ___ a disco.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":3, "p":"I saw him ___ the top of the stairs.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":3, "p":"Call me ___ 8 o''clock.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":3, "p":"We met ___ a party.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"La expresión correcta es ''in Christmas''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"La preposición ''AT'' se usa para las comidas (ej. at breakfast).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''AT'' funciona como comodín para una posición general o punto específico (ej. at the bus-stop).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para instituciones frecuentadas por su actividad como el colegio se usa ''at school''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Se usa ''AT'' para actividades en grupo, como ''at a disco''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''In the top'' es la expresión correcta para describir posición relativa en la cima.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Para decir ''el fin de semana'', se dice ''at the weekend'' en inglés británico.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Nos vemos en Navidad.", "s":{"type":"scramble","chunks":["at Christmas","see you","I will"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Leo el periódico en el desayuno.", "s":{"type":"scramble","chunks":["at breakfast","I read","the newspaper"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Él está esperando en la parada del autobús.", "s":{"type":"scramble","chunks":["waiting","He is","at the bus-stop"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella estudia en el colegio.", "s":{"type":"scramble","chunks":["at school","studies","She"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos bailaron en una discoteca.", "s":{"type":"scramble","chunks":["at a disco","danced","They"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Escribe tu nombre en la parte superior.", "s":{"type":"scramble","chunks":["at the top","Write","your name"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Trabajo los fines de semana.", "s":{"type":"scramble","chunks":["at the weekend","work","I"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Casos Mixtos y Contrastes (IN vs ON vs AT) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"He sleeps ___ (en) the morning.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He sleeps ___ (en) night.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Put the book ___ (sobre) the desk.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Put the book ___ (dentro de) the bag.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I will see you ___ (a) 10 o''clock.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I will see you ___ (en) Monday.", "s":{"type":"typing","correct_answers":["on"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We met ___ (en) a concert.", "s":{"type":"typing","correct_answers":["at"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They live ___ (en) London.", "s":{"type":"typing","correct_answers":["in"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"I was born ___ May.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        '{"r":4, "p":"The party is ___ Sunday.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Stars shine ___ night.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Children are playing ___ the garden (espacio delimitado).", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Your food is ___ the plate (superficie).", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        '{"r":4, "p":"We had dinner ___ the restaurant (evento/lugar público).", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":4, "p":"It snows ___ winter.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I got a lot of presents ___ my birthday.", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Para decir ''por la noche'' se usa ''in night''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''On Monday morning'' es correcto porque cuando se especifica el día siempre manda el ''ON''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Se dice ''in the bus stop'' porque es un espacio cerrado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La expresión ''at the door'' significa en la puerta (punto específico).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para el año 2023 la preposición correcta es ''ON 2023''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Se usa ''AT'' para la hora exacta (ej. at 5 pm).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para referirse a un país se utiliza ''IN'' (ej. in France).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Él estudia por la noche.", "s":{"type":"scramble","chunks":["at night","studies","He"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: El dinero está en mi bolsillo.", "s":{"type":"scramble","chunks":["in my pocket","The money","is"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: La vi en una fiesta.", "s":{"type":"scramble","chunks":["at a party","saw her","I"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Te veré el viernes.", "s":{"type":"scramble","chunks":["on Friday","see you","I will"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él nació en 1990.", "s":{"type":"scramble","chunks":["born","He was","in 1990"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ponlo sobre el escritorio, por favor.", "s":{"type":"scramble","chunks":["on the desk","Put it","please"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Alguien está en la puerta.", "s":{"type":"scramble","chunks":["at the door","Someone","is"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 16, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Preposiciones (AT, ON, IN)', 
    'Aprende a dominar el uso exacto de las preposiciones in, on y at tanto para expresiones de tiempo como de lugar.', 
    to_jsonb('## Grammar Lesson: Las Preposiciones AT, ON, IN
Las preposiciones pueden resultar confusas en inglés porque no siempre coinciden uno a uno con el español ("en"). Vamos a desglosar las reglas clave para que nunca más dudes entre "in", "on" o "at".

##### 1. AT, ON, IN para el TIEMPO
*   **IN (Periodos largos):** Se usa para periodos grandes o genéricos como **meses** (*in July*), **años** (*in 1992*), **estaciones** (*in summer*) y **partes largas del día** (*in the morning, in the afternoon*).
*   **ON (Días y fechas):** Se usa exclusivamente para **días de la semana** (*on Saturday*), **días festivos concretos** (*on my birthday*) y **fechas exactas** que incluyen el día (*on July 4th*).
*   **AT (Puntos exactos):** Se usa para la **hora exacta** (*at 5 o''clock*), **comidas** (*at breakfast*), las **partes concretas del día** (*at dawn, at night*), **festividades largas** (*at Christmas*) y el **fin de semana** (*at the weekend*).

##### 2. AT, ON, IN para el LUGAR
*   **IN (Dentro de / Interiores):** Significa "en o dentro de". Se utiliza para espacios cerrados **tridimensionales** limitados por muros (*in the car park, in the box*), habitaciones, y **zonas geográficas grandes** como pueblos, ciudades o países (*in Barcelona, in Spain*).
*   **ON (Superficies):** Se utiliza para describir algo que se encuentra **sobre una superficie plana** tocándola (*on the wall, on the table, on the floor, on the ceiling*).
*   **AT (Puntos y Eventos):** Funciona como comodín para indicar un **punto específico general** en un mapa (*at the bus-stop, at the door*), lugares **frecuentados por su actividad** (*at school, at the hotel*), y para **actividades o eventos en grupo** (*at a disco, at a party, at a concert*). También para posición relativa (*at the top*).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Preposición IN (Tiempo y Lugar)', 'Recuerda: Usa IN para meses, años, estaciones, partes largas del día (morning) y espacios cerrados (3D) o ciudades/países.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Preposición ON (Tiempo y Lugar)', 'Recuerda: Usa ON para días de la semana, fechas exactas y superficies planas (mesas, paredes, suelos).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Preposición AT (Tiempo y Lugar)', 'Recuerda: Usa AT para la hora, comidas, "at night", el fin de semana, puntos específicos (bus-stop) y eventos en grupo.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Contrastes: AT vs ON vs IN', 'Piensa bien el contexto: ¿Es una superficie (ON), un punto exacto/evento (AT) o un contenedor/país (IN)? ¿Es una fecha exacta (ON) o un mes (IN)?');

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