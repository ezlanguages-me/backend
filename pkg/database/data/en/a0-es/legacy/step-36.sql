-- ============================================================
-- Seed: A0 English Path – Grammar – Whole vs All
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
        -- REGLA 1: Posición de WHOLE (detrás de The/My) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ate the ___ (entera) pizza.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She spent her ___ (entera) life in Moscow.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He read the ___ (entero) book.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"My ___ (entera) family is here.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"The ___ (entero) building was destroyed.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He told me the ___ (entera) truth.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They painted the ___ (entera) house.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Our ___ (entero) team played very well.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"Elige la estructura correcta:", "s":{"type":"multiple_choice","options":["the whole story","whole the story","all whole story"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She lived in Moscow ___ life.", "s":{"type":"multiple_choice","options":["her whole","whole her","her all"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Dónde se coloca la palabra ''whole''?", "s":{"type":"multiple_choice","options":["Delante del artículo definido o posesivo","Detrás del artículo definido o posesivo","Al final de la oración"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I ate ___ cake.", "s":{"type":"multiple_choice","options":["the whole","whole the","whole a"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ building is on fire!", "s":{"type":"multiple_choice","options":["The whole","Whole the","The all"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She lost ___ salary at the casino.", "s":{"type":"multiple_choice","options":["her whole","whole her","the whole her"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I want to hear ___ truth.", "s":{"type":"multiple_choice","options":["the whole","whole the","whole"],"answer":0}}'::jsonb,
        '{"r":1, "p":"My ___ body hurts.", "s":{"type":"multiple_choice","options":["whole","all","whole of"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Whole'' se coloca siempre detrás del artículo definido (the) o de un adjetivo posesivo (my, her, your).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''Whole the world'' para referirse al mundo entero.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La expresión ''my whole family'' significa ''toda mi familia'' (mi familia entera).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''The whole book'' significa ''el libro entero''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''her whole life'' en lugar de ''whole her life''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Whole'' no se puede usar con adjetivos posesivos.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La estructura correcta es siempre: Artículo/Posesivo + Whole + Sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Leí el libro entero.", "s":{"type":"scramble","chunks":["I read","the whole","book"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella vivió en Moscú toda su vida.", "s":{"type":"scramble","chunks":["in Moscow","her whole life","She lived"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Comimos la pizza entera.", "s":{"type":"scramble","chunks":["pizza","We ate","the whole"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Mi familia entera está aquí.", "s":{"type":"scramble","chunks":["family","My whole","is here"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: El edificio entero se derrumbó.", "s":{"type":"scramble","chunks":["collapsed","The whole","building"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Cuéntame la verdad entera.", "s":{"type":"scramble","chunks":["Tell me","the whole","truth"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Limpiamos la casa entera.", "s":{"type":"scramble","chunks":["the whole","house","We cleaned"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Posición de ALL (delante de The/My) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"___ (Todos) my friends are married.", "s":{"type":"typing","correct_answers":["All"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I invited ___ (todos) the students.", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Todo) the money was stolen.", "s":{"type":"typing","correct_answers":["All"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ate ___ (toda) the food.", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Todos) his cars are red.", "s":{"type":"typing","correct_answers":["All"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Did you read ___ (toda) the information?", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Todas) the tickets are sold.", "s":{"type":"typing","correct_answers":["All"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I have checked ___ (todos) the rooms.", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Dónde se coloca la palabra ''All''?", "s":{"type":"multiple_choice","options":["Delante del artículo definido o adjetivo posesivo","Detrás del artículo definido o adjetivo posesivo","Al final del sustantivo"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ friends are married.", "s":{"type":"multiple_choice","options":["All my","My all","Whole my"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I want ___ money back.", "s":{"type":"multiple_choice","options":["all the","the all","whole the"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He knows ___ answers.", "s":{"type":"multiple_choice","options":["all the","the all","the whole"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Elige la estructura correcta:", "s":{"type":"multiple_choice","options":["The all world","All the world","All whole world"],"answer":1}}'::jsonb,
        '{"r":2, "p":"___ people in the room clapped.", "s":{"type":"multiple_choice","options":["All the","The all","Whole the"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ his brothers are tall.", "s":{"type":"multiple_choice","options":["All","Whole","The all"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ate ___ the soup.", "s":{"type":"multiple_choice","options":["all","whole","entire"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''All'' se coloca siempre delante del artículo definido o de los adjetivos posesivos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''My all friends are married''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La estructura correcta es: All + the/my/his + Sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''All the money'' significa ''todo el dinero''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Podemos decir ''The all house'' para referirnos a toda la casa.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''All his cars'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''All the time'' significa ''todo el tiempo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Todos mis amigos están casados.", "s":{"type":"scramble","chunks":["All my friends","are","married"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Todo el dinero desapareció.", "s":{"type":"scramble","chunks":["is gone","All the","money"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Invité a todos los estudiantes.", "s":{"type":"scramble","chunks":["I invited","all the","students"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Revisé todas las habitaciones.", "s":{"type":"scramble","chunks":["checked","I have","all the rooms"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Todas las entradas están agotadas.", "s":{"type":"scramble","chunks":["All the tickets","sold out","are"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él se comió toda la comida.", "s":{"type":"scramble","chunks":["all the","He ate","food"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Todos sus hermanos son altos.", "s":{"type":"scramble","chunks":["are tall","his brothers","All"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Singular vs Plurales/Incontables - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"We drank ___ (toda) the water (incontable).", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He read the ___ (entera) story (singular).", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Todos) birds lay eggs (plural).", "s":{"type":"typing","correct_answers":["All"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I watched the ___ (entera) movie (singular).", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Did you eat ___ (todo) the sugar? (incontable)", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The ___ (entera) class was silent (singular).", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Todo) oxygen is essential (incontable).", "s":{"type":"typing","correct_answers":["All"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He lived in that house his ___ (entera) childhood (singular).", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué palabra se utiliza habitualmente con sustantivos en SINGULAR (para decir la totalidad de algo uno solo)?", "s":{"type":"multiple_choice","options":["Whole","All","Ambas por igual"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué palabra se utiliza habitualmente con PLURALES e INCONTABLES?", "s":{"type":"multiple_choice","options":["All","Whole","Ninguna"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I need ___ the information (information = incontable).", "s":{"type":"multiple_choice","options":["all","whole","the whole"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She ate the ___ apple (apple = singular).", "s":{"type":"multiple_choice","options":["whole","all","whole of"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ cats like milk (cats = plural).", "s":{"type":"multiple_choice","options":["All","Whole","The whole"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Did you listen to the ___ album? (album = singular).", "s":{"type":"multiple_choice","options":["whole","all","all the"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We used ___ the milk (milk = incontable).", "s":{"type":"multiple_choice","options":["all","whole","the whole"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I read the ___ document (document = singular).", "s":{"type":"multiple_choice","options":["whole","all","the all"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Whole'' se suele utilizar con sustantivos en singular para indicar que algo está completo o entero.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para cosas incontables como el agua (water) o el tiempo (time), se suele usar ''whole'' en lugar de ''all''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Con sustantivos plurales (ej. friends, cars), la opción correcta es ''all'' (All my friends).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''The whole water'' es una expresión muy común en inglés.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Podemos usar ''All'' para decir ''Todo el oxígeno'' (All the oxygen) porque es incontable.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''The whole movie'' significa ''la película entera'' y es correcto porque movie es singular.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es totalmente correcto decir ''Whole my friends are here''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Él leyó la historia entera (singular).", "s":{"type":"scramble","chunks":["the whole","He read","story"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Necesito toda la información (incontable).", "s":{"type":"scramble","chunks":["I need","all the","information"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Todos los pájaros ponen huevos (plural).", "s":{"type":"scramble","chunks":["lay eggs","All","birds"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: La clase entera estaba en silencio (singular).", "s":{"type":"scramble","chunks":["was silent","The whole","class"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Bebimos toda el agua (incontable).", "s":{"type":"scramble","chunks":["all the","We drank","water"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Todos los gatos duermen mucho (plural).", "s":{"type":"scramble","chunks":["All","sleep a lot","cats"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Vi la película entera (singular).", "s":{"type":"scramble","chunks":["the whole","movie","I watched"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Expresiones de Tiempo (All day vs The whole day) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I worked ___ (todo) day.", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I worked the ___ (entero) day.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She cried ___ (toda) night.", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She cried the ___ (entera) night.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We stayed there ___ (todo) summer.", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We stayed there the ___ (entero) summer.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He has been playing ___ (todo) morning.", "s":{"type":"typing","correct_answers":["all"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He has been playing the ___ (entera) morning.", "s":{"type":"typing","correct_answers":["whole"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Cuál es el equivalente de ''All day''?", "s":{"type":"multiple_choice","options":["The whole day","Whole day","The all day"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He studied ___ week.", "s":{"type":"multiple_choice","options":["all","the all","whole"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He studied the ___ week.", "s":{"type":"multiple_choice","options":["whole","all","all the"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She lived in London ___ her life.", "s":{"type":"multiple_choice","options":["all","whole","the whole"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She lived in London her ___ life.", "s":{"type":"multiple_choice","options":["whole","all","all the"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I was sick ___ weekend.", "s":{"type":"multiple_choice","options":["all","the all","whole"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I was sick the ___ weekend.", "s":{"type":"multiple_choice","options":["whole","all","all the"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué par de expresiones significa exactamente lo mismo?", "s":{"type":"multiple_choice","options":["All night / The whole night","All the night / Whole night","All night / Whole the night"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Con expresiones de tiempo, ''All day'' y ''The whole day'' significan exactamente lo mismo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''I worked whole day'' (sin el ''the'').", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Para decir ''toda mi vida'' podemos decir ''All my life'' o ''My whole life''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''All week'' (toda la semana) es una expresión muy habitual en inglés.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''The all morning'' es la forma correcta de decir toda la mañana.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Si usas ''whole'' con periodos de tiempo, debes poner un artículo o posesivo delante (ej. THE whole night).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''All summer'' y ''The whole summer'' significan todo el verano.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Trabajé todo el día.", "s":{"type":"scramble","chunks":["I worked","all","day"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Trabajé el día entero.", "s":{"type":"scramble","chunks":["the whole","day","I worked"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella lloró toda la noche.", "s":{"type":"scramble","chunks":["all","She cried","night"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella lloró la noche entera.", "s":{"type":"scramble","chunks":["the whole night","She","cried"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Vivió allí toda su vida (all).", "s":{"type":"scramble","chunks":["all","He lived there","his life"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Vivió allí su vida entera (whole).", "s":{"type":"scramble","chunks":["He lived there","her whole","life"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Estudió toda la mañana.", "s":{"type":"scramble","chunks":["all","morning","He studied"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 27, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Whole vs. All', 
    'Aprende a dominar la diferencia entre "whole" y "all", prestando especial atención a la posición de los artículos y los adjetivos posesivos.', 
    to_jsonb('## Grammar Lesson: Whole vs. All
Las palabras **Whole** (entero) y **All** (todo) pueden generar confusión porque en español significan casi lo mismo. Sin embargo, en inglés tienen posiciones gramaticales estrictas cuando van acompañadas de artículos definidos (*the*) o posesivos (*my, your, her*).

##### 1. Posición de WHOLE
La palabra *whole* se utiliza normalmente con un **sustantivo en singular**. Se coloca SIEMPRE **detrás** del artículo definido (*the*) o del adjetivo posesivo (*my, your, his, her, our, their*).
*   **The / My + WHOLE + Sustantivo**
*   *She’s lived in Moscow **her whole** life.* (Ha vivido en Moscú toda su vida).
*   *I ate **the whole** pizza.* (Me comí la pizza entera).
*   *He read **the whole** book.* (Leyó el libro entero).

##### 2. Posición de ALL
La palabra *all* se coloca SIEMPRE **delante** del artículo definido (*the*) o del adjetivo posesivo.
*   **ALL + the / my + Sustantivo**
*   ***All my** friends are married.* (Todos mis amigos están casados).
*   *He ate **all the** food.* (Se comió toda la comida).
*   *Did you check **all the** rooms?* (¿Revisaste todas las habitaciones?).

##### 3. Singular vs. Plural e Incontables
*   **Whole:** Se usa para cosas singulares que forman un "todo" (un libro, una ciudad, una vida).
*   **All:** Es la opción natural para hablar de **plurales** (*All my friends*, *All the cars*) o de cosas **incontables** (*All the water*, *All the money*).

##### 4. Expresiones de Tiempo (El gran clásico)
En las expresiones de tiempo, puedes usar ambas, pero la estructura cambia haciendo que signifiquen exactamente lo mismo:
*   *All day* = *The whole day* (Todo el día / El día entero)
*   *All night* = *The whole night* (Toda la noche / La noche entera)
*   *All my life* = *My whole life* (Toda mi vida / Mi vida entera)'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Posición de WHOLE', 'Recuerda: "Whole" se coloca DETRÁS de "the" o de tu posesivo ("my", "her"). Ejemplo: "The whole book" / "Her whole life".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Posición de ALL', 'Recuerda: "All" se coloca DELANTE de "the" o de tu posesivo ("my", "his"). Ejemplo: "All the money" / "All my friends".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Singular vs Plurales e Incontables', 'Usa "Whole" para destacar que algo singular está entero (the whole class). Usa "All" para plurales e incontables (all the water, all my cars).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Expresiones de Tiempo', 'Tanto "All day" (sin the) como "The whole day" significan exactamente lo mismo. Aplica para all night, all morning, all week.');

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