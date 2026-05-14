-- ============================================================
-- Seed: A0 English Path – Grammar – Preguntas WH-? y HOW...?
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
        -- REGLA 1: What vs. Which - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"___ (Qué) is your name?", "s":{"type":"typing","correct_answers":["What"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Cuál) is your car, the blue one or the white one?", "s":{"type":"typing","correct_answers":["Which"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Qué) colour is her car?", "s":{"type":"typing","correct_answers":["What"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Cuáles) are your favorite shoes, these or those?", "s":{"type":"typing","correct_answers":["Which"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Qué) time is it?", "s":{"type":"typing","correct_answers":["What"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Qué) do you want to eat?", "s":{"type":"typing","correct_answers":["What"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Cuál) dress do you prefer, the red one or the black one?", "s":{"type":"typing","correct_answers":["Which"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Cuál) of these two books is better?", "s":{"type":"typing","correct_answers":["Which"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué pronombre se usa cuando hay un número grande o ilimitado de opciones?", "s":{"type":"multiple_choice","options":["What","Which","Who"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué pronombre se usa cuando las opciones son limitadas o específicas?", "s":{"type":"multiple_choice","options":["What","Which","Where"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ is your favorite singer? (De entre todos los del mundo)", "s":{"type":"multiple_choice","options":["What","Which","Who"],"answer":2}}'::jsonb,
        '{"r":1, "p":"___ shirt do you want, the blue one or the red one?", "s":{"type":"multiple_choice","options":["What","Which","Why"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ are you doing right now?", "s":{"type":"multiple_choice","options":["What","Which","When"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ is the capital of France?", "s":{"type":"multiple_choice","options":["What","Which","How"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ way should we go, left or right?", "s":{"type":"multiple_choice","options":["What","Which","Where"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ flavor of ice cream do you want? Vanilla, chocolate or strawberry?", "s":{"type":"multiple_choice","options":["What","Which","Who"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''What'' significa ''qué'' o ''cuál'' y se utiliza cuando hay un número grande de opciones.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Which'' significa ''cuál'' y se utiliza para preguntar cuando hay un número ilimitado de opciones.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La pregunta ''What is your name?'' es correcta porque el número de nombres posibles es enorme.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"En la pregunta ''___ is your car, the blue one or the white one?'', la palabra correcta es ''What''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''What colour is her car?'' utiliza ''What'' correctamente porque hay muchísimos colores.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se debe usar ''Which'' siempre que demos a elegir entre dos o tres opciones concretas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Which are you doing?'' es la forma correcta de decir ''¿Qué estás haciendo?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: ¿Cómo te llamas? (¿Cuál es tu nombre?)", "s":{"type":"scramble","chunks":["What","your name?","is"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Cuál es tu coche?", "s":{"type":"scramble","chunks":["your car?","Which","is"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿De qué color es su coche?", "s":{"type":"scramble","chunks":["What","colour","her car?","is"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Qué zapatos prefieres?", "s":{"type":"scramble","chunks":["shoes","do you prefer?","Which"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Qué quieres?", "s":{"type":"scramble","chunks":["do you","What","want?"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Cuál es el tuyo?", "s":{"type":"scramble","chunks":["Which","yours?","one is"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Qué estás haciendo?", "s":{"type":"scramble","chunks":["are you","What","doing?"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Who, Whose y Why - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"___ (Quién) is your favorite singer?", "s":{"type":"typing","correct_answers":["Who"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Por qué) are you sad?", "s":{"type":"typing","correct_answers":["Why"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (De quién) shirt is this?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Quién) ate the last slice of pizza?", "s":{"type":"typing","correct_answers":["Who"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Por qué) did you do that?", "s":{"type":"typing","correct_answers":["Why"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (De quiénes) shoes are these?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Quién) is that man?", "s":{"type":"typing","correct_answers":["Who"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Por qué) are we here?", "s":{"type":"typing","correct_answers":["Why"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué palabra interrogativa se usa para preguntar ''Por qué''?", "s":{"type":"multiple_choice","options":["Who","Whose","Why"],"answer":2}}'::jsonb,
        '{"r":2, "p":"¿Qué palabra interrogativa se usa para preguntar ''De quién''?", "s":{"type":"multiple_choice","options":["Whose","Who''s","Why"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ is knocking at the door? (¿Quién?)", "s":{"type":"multiple_choice","options":["Who","Whose","What"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ keys are on the table? (¿De quién?)", "s":{"type":"multiple_choice","options":["Who","Whose","Why"],"answer":1}}'::jsonb,
        '{"r":2, "p":"___ didn''t you call me? (¿Por qué?)", "s":{"type":"multiple_choice","options":["Who","When","Why"],"answer":2}}'::jsonb,
        '{"r":2, "p":"___ is the president of this country?", "s":{"type":"multiple_choice","options":["Who","Whose","Which"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ idea was this? (¿De quién?)", "s":{"type":"multiple_choice","options":["Whose","Who","Why"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ is the sky blue?", "s":{"type":"multiple_choice","options":["Who","Why","Whose"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Who'' significa ''quién'' y se usa exclusivamente para preguntar por personas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Whose'' se traduce como ''por qué''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Why'' significa ''por qué'' y se utiliza para preguntar por los motivos o razones de algo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Whose shirt is this?'' es la forma correcta de preguntar de quién es una camisa.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para preguntar quién es alguien se debe usar ''Whose is that man?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La respuesta a una pregunta con ''Why'' suele empezar con ''Because'' (Porque...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Who''s'' y ''Whose'' se escriben diferente pero se pronuncian igual y ambos significan ''De quién''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: ¿Quién es tu cantante favorito?", "s":{"type":"scramble","chunks":["favorite singer?","Who is","your"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Por qué estás triste?", "s":{"type":"scramble","chunks":["are you","Why","sad?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿De quién es esta camisa?", "s":{"type":"scramble","chunks":["shirt","is this?","Whose"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Quién es ese hombre?", "s":{"type":"scramble","chunks":["that man?","is","Who"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Por qué se fue ella?", "s":{"type":"scramble","chunks":["did she","Why","leave?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿De quién son estas llaves?", "s":{"type":"scramble","chunks":["keys","are these?","Whose"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Por qué están llorando?", "s":{"type":"scramble","chunks":["are they","Why","crying?"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Where y When - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"___ (Dónde) is Seattle?", "s":{"type":"typing","correct_answers":["Where"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Cuándo) is your birthday?", "s":{"type":"typing","correct_answers":["When"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Dónde) do you live?", "s":{"type":"typing","correct_answers":["Where"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Cuándo) does the train leave?", "s":{"type":"typing","correct_answers":["When"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Dónde) are my keys?", "s":{"type":"typing","correct_answers":["Where"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Cuándo) did she arrive?", "s":{"type":"typing","correct_answers":["When"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Dónde) is the bathroom?", "s":{"type":"typing","correct_answers":["Where"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Cuándo) will we meet?", "s":{"type":"typing","correct_answers":["When"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué partícula se usa para preguntar por lugares?", "s":{"type":"multiple_choice","options":["Where","When","Who"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué partícula se usa para preguntar por el tiempo o momento?", "s":{"type":"multiple_choice","options":["Where","When","How"],"answer":1}}'::jsonb,
        '{"r":3, "p":"___ is the nearest hospital?", "s":{"type":"multiple_choice","options":["Where","When","What"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ does the movie start?", "s":{"type":"multiple_choice","options":["When","Where","Who"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ are you going for your holidays?", "s":{"type":"multiple_choice","options":["Where","When","Why"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ did you buy that beautiful coat?", "s":{"type":"multiple_choice","options":["Where","Who","Which"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ were you born? (En qué año/fecha)", "s":{"type":"multiple_choice","options":["When","Where","What"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ did I park my car?", "s":{"type":"multiple_choice","options":["Where","When","Whose"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Where'' significa ''dónde'' y pregunta por la ubicación de personas o cosas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''When'' significa ''quién'' y pregunta por la persona que hace algo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Para preguntar por la fecha de tu cumpleaños, usamos ''When is your birthday?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Where is Seattle?'' es la forma correcta de preguntar por la ubicación de la ciudad.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Si quiero saber a qué hora sale un tren, puedo usar ''When does the train leave?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''When are my keys?'' es una pregunta perfectamente lógica en inglés.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Where'' y ''When'' nunca pueden llevar una preposición al final de su oración (ej. Where are you from?).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: ¿Dónde está Seattle?", "s":{"type":"scramble","chunks":["is","Where","Seattle?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Cuándo es tu cumpleaños?", "s":{"type":"scramble","chunks":["your birthday?","When","is"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Dónde vives?", "s":{"type":"scramble","chunks":["Where","do you","live?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Cuándo empieza la clase?", "s":{"type":"scramble","chunks":["the class start?","does","When"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Dónde lo pusiste?", "s":{"type":"scramble","chunks":["did you","put it?","Where"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Cuándo llegarán ellos?", "s":{"type":"scramble","chunks":["will they","When","arrive?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Dónde están mis llaves?", "s":{"type":"scramble","chunks":["Where","my keys?","are"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: How, How much/many, How big/old - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"___ (Cómo) does this work?", "s":{"type":"typing","correct_answers":["How"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Cuántos) books are here?", "s":{"type":"typing","correct_answers":["How many"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Cuánta) water do you need?", "s":{"type":"typing","correct_answers":["How much"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Qué edad / Cómo de mayor) is your cousin?", "s":{"type":"typing","correct_answers":["How old"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Cómo de grande) is the house?", "s":{"type":"typing","correct_answers":["How big"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Cómo) are you today?", "s":{"type":"typing","correct_answers":["How"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Cuántos) cars do they have?", "s":{"type":"typing","correct_answers":["How many"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Cuánto) money do you have?", "s":{"type":"typing","correct_answers":["How much"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué palabra significa ''cómo''?", "s":{"type":"multiple_choice","options":["How","What","Which"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Para preguntar ''cuántos/as'' (cosas contables), se usa:", "s":{"type":"multiple_choice","options":["How much","How many","How big"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Para preguntar ''cuánto/a'' (cosas incontables, como dinero o agua), se usa:", "s":{"type":"multiple_choice","options":["How much","How many","How old"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cómo preguntas ''Cómo de grande es...?''", "s":{"type":"multiple_choice","options":["What big","How big","How much big"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ is your sister? (Para preguntar su edad)", "s":{"type":"multiple_choice","options":["How age","How old","What years"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ people are coming to the party?", "s":{"type":"multiple_choice","options":["How much","How many","How"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ time do we have left?", "s":{"type":"multiple_choice","options":["How much","How many","How long"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ tall is he?", "s":{"type":"multiple_choice","options":["How","What","Which"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''How'' por sí solo significa ''cómo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''How many'' se utiliza con sustantivos incontables (ej. How many water?).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''How much'' se usa con incontables y significa ''cuánto/a''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para preguntar la edad de alguien usamos la estructura ''How old''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para saber el tamaño de algo, decimos ''What big is it?'' en lugar de ''How big is it?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''How many books are here?'' es una frase gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En inglés se puede combinar ''How'' con casi cualquier adjetivo para preguntar por su grado (How tall, How far, How deep...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: ¿Cómo funciona esto?", "s":{"type":"scramble","chunks":["does","this work?","How"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Cuántos libros hay aquí?", "s":{"type":"scramble","chunks":["are here?","How many","books"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Qué edad tiene tu primo?", "s":{"type":"scramble","chunks":["your cousin?","How old","is"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Cuánto dinero necesitas?", "s":{"type":"scramble","chunks":["do you need?","money","How much"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Cómo de grande es la casa?", "s":{"type":"scramble","chunks":["the house?","How big","is"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Cómo hiciste eso?", "s":{"type":"scramble","chunks":["do that?","How","did you"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Cuántas manzanas tenemos?", "s":{"type":"scramble","chunks":["apples","do we have?","How many"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 19, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Preguntas WH-? y HOW...?', 
    'Aprende a formular todo tipo de preguntas abiertas en inglés dominando las partículas interrogativas "WH-" y las combinaciones con "How".', 
    to_jsonb('## Grammar Lesson: Preguntas WH-? y HOW...?
En inglés, para hacer preguntas que no se responden con "sí o no", necesitamos utilizar partículas interrogativas (Question Words). La mayoría empiezan por **W-H** o incluyen la palabra **HOW**.

##### 1. Preguntando sobre Opciones y Cosas
*   **What...? (¿Qué? o ¿Cuál?):** Se utiliza cuando preguntamos sobre cosas en general, acciones o cuando hay un número grande o ilimitado de opciones. 
    *   *What''s your name?* (¿Cuál es tu nombre?)
    *   *What colour is her car?* (¿De qué color es su coche?)
*   **Which...? (¿Cuál?):** Se utiliza para preguntar cuando hay un número pequeño o limitado de opciones (te dan a elegir).
    *   *Which is your car, the blue one or the white one?* (¿Cuál es tu coche, el azul o el blanco?)

##### 2. Preguntando sobre Personas y Motivos
*   **Who...? (¿Quién?):** Para preguntar por personas.
    *   *Who is your favorite singer?* (¿Quién es tu cantante favorito?)
*   **Whose...? (¿De quién? o ¿De quiénes?):** Para preguntar por la posesión de algo. El objeto poseído suele ir justo detrás.
    *   *Whose shirt is this?* (¿De quién es esta camisa?)
*   **Why...? (¿Por qué?):** Para preguntar por motivos o causas. Se suele responder con la palabra *Because* (Porque).
    *   *Why are you sad?* (¿Por qué estás triste?)

##### 3. Preguntando por el Tiempo y el Lugar
*   **Where...? (¿Dónde?):** Pregunta por la ubicación de un evento, cosa o persona.
    *   *Where is Seattle?* (¿Dónde está Seattle?)
*   **When...? (¿Cuándo?):** Pregunta por el momento o fecha de un suceso.
    *   *When is your birthday?* (¿Cuándo es tu cumpleaños?)

##### 4. Preguntando HOW (Cómo, Cuánto y Grado)
La palabra **How** significa "¿Cómo?" (Ej: *How does this work?*). Sin embargo, combinada con adjetivos o cuantificadores, su significado se amplía muchísimo:
*   **How many...? (¿Cuántos/as?):** Se utiliza para cosas que se pueden contar (Contables).
    *   *How many books are here?* (¿Cuántos libros hay aquí?)
*   **How much...? (¿Cuánto/a?):** Se utiliza para cosas que no se pueden contar (Incontables como agua, tiempo, dinero).
    *   *How much money do you have?* (¿Cuánto dinero tienes?)
*   **How + Adjetivo (¿Cómo de...?):** En inglés se añade un adjetivo detrás de How para preguntar por sus proporciones:
    *   *How big is the house?* (¿Cómo de grande es la casa?)
    *   *How old is your cousin?* (¿Qué edad tiene tu primo? / ¿Cómo de mayor es...?)
    *   *How tall is she?* (¿Cuánto mide? / ¿Cómo de alta es...?)'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'What vs. Which', 'Recuerda: Usa "What" (Qué/Cuál) para una multitud ilimitada de opciones, y "Which" (Cuál) cuando eliges entre un número limitado de cosas.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Who, Whose y Why', 'Usa "Who" para preguntar por personas (Quién), "Whose" para pertenencia (De quién) y "Why" para motivos (Por qué).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Where y When', 'Usa "Where" para preguntar por ubicaciones (Dónde) y "When" para preguntar por el tiempo o la fecha (Cuándo).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'How y sus combinaciones', '"How" es cómo. "How many" es cuántos (contables), "How much" es cuánto (incontables), y "How old/big" pregunta el grado o medida.');

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