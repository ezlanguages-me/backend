-- ============================================================
-- Seed: A0 English Path – Grammar – Condicionales y Deseos
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
        -- REGLA 1: Tipo 0 y Alternativas a If (Unless, As long as...) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"If you heat water to 100° C, it ___ (hierve).", "s":{"type":"typing","correct_answers":["boils"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Water boils ___ (si) you heat it to 100° C.", "s":{"type":"typing","correct_answers":["if"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (A menos que) you pay me, I won''t do it.", "s":{"type":"typing","correct_answers":["Unless"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Siempre que / Mientras que) you don''t move, the dog won''t bite you.", "s":{"type":"typing","correct_answers":["As long as"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Cuando) it gets dark, bats come out.", "s":{"type":"typing","correct_answers":["When"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"If you don''t have a racket, you ___ (no puedes) play tennis.", "s":{"type":"typing","correct_answers":["can''t","cannot"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It boils if you ___ (calientas) water to 100 degrees.", "s":{"type":"typing","correct_answers":["heat"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Bats come out ___ (cuando) it gets dark.", "s":{"type":"typing","correct_answers":["when"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cuándo se utiliza la estructura ''If + present simple + present simple'' (Condicional Tipo 0)?", "s":{"type":"multiple_choice","options":["Cuando la condición y el resultado siempre son verdad, como hechos científicos","Para hablar de eventos irreales en el pasado","Para hacer promesas futuras"],"answer":0}}'::jsonb,
        '{"r":1, "p":"If you heat water to 100° C, it ___.", "s":{"type":"multiple_choice","options":["boils","will boil","would boil"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué significa la palabra ''Unless'' según los apuntes?", "s":{"type":"multiple_choice","options":["A menos que / A no ser que","Siempre que","Cuando"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué significa la expresión ''As long as''?", "s":{"type":"multiple_choice","options":["Siempre que / Mientras que","Tan largo como","En cuanto"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ you pay me, I won''t do it. (A menos que me pagues...)", "s":{"type":"multiple_choice","options":["Unless","If","When"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ you don''t move, the dog won''t bite you. (Siempre que no te muevas...)", "s":{"type":"multiple_choice","options":["As long as","Unless","If"],"answer":0}}'::jsonb,
        '{"r":1, "p":"If you don''t have a racket, you ___ play tennis. (Usando un modal de permiso/posibilidad)", "s":{"type":"multiple_choice","options":["can''t","won''t","wouldn''t"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ it gets dark, bats come out. (Cuando oscurece... - Condición segura)", "s":{"type":"multiple_choice","options":["When","Unless","As long as"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El condicional de hechos científicos o verdades universales utiliza el Presente Simple en ambas partes de la oración.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Unless'' significa lo mismo que ''If''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''If you heat water to 100° C, it boils'' es el ejemplo exacto de tus apuntes para este condicional.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Podemos usar el modal CAN o MAY en este condicional para expresar posibilidad o permiso.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''As long as'' se traduce como ''A menos que''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Podemos invertir el orden de la oración (ej. Water boils if you heat it) sin cambiar su significado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se usa ''When'' en condicionales seguros que solo dependen de que llegue el momento adecuado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Si calientas agua a 100 grados, hierve.", "s":{"type":"scramble","chunks":["If you","heat water","to 100° C,","it boils"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: El agua hierve si la calientas a 100 grados.", "s":{"type":"scramble","chunks":["Water boils","if you heat it","to 100° C"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: A menos que me pagues, no lo haré.", "s":{"type":"scramble","chunks":["Unless","you pay me,","I won''t do it"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Mientras no te muevas, el perro no te morderá.", "s":{"type":"scramble","chunks":["As long as","you don''t move,","the dog won''t bite you"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Cuando oscurece, los murciélagos salen.", "s":{"type":"scramble","chunks":["When","it gets dark,","bats come out"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Si no tienes raqueta, no puedes jugar.", "s":{"type":"scramble","chunks":["If you don''t","have a racket,","you can''t play tennis"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: No lo haré a menos que me pagues.", "s":{"type":"scramble","chunks":["I won''t","do it","unless you pay me"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Condicional Probable (If + Present Simple + Will) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"If Bill ___ (estudia), he will pass the exam.", "s":{"type":"typing","correct_answers":["studies"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"If he studies, he ___ (aprobará) the exam.", "s":{"type":"typing","correct_answers":["will pass","''ll pass"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"If it doesn''t rain, we ___ (podríamos/may) go to the beach.", "s":{"type":"typing","correct_answers":["may"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"If she calls, I ___ (contestaré).", "s":{"type":"typing","correct_answers":["will answer","''ll answer"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Bill will pass the exam ___ (si) he studies.", "s":{"type":"typing","correct_answers":["if"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"If he runs, he ___ (atrapará) the bus.", "s":{"type":"typing","correct_answers":["will catch","''ll catch"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We will go to the beach if it ___ (no llueve).", "s":{"type":"typing","correct_answers":["doesn''t rain","does not rain"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"If you help me, I ___ (terminaré) sooner.", "s":{"type":"typing","correct_answers":["will finish","''ll finish"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Para qué se utiliza la estructura ''If + present simple + will'' (Condicional Tipo 1)?", "s":{"type":"multiple_choice","options":["Para el futuro y en los casos en que es muy probable que la condición pase","Para situaciones irreales o sueños en el presente","Para hablar de hechos científicos irrefutables"],"answer":0}}'::jsonb,
        '{"r":2, "p":"If Bill studies, he ___ the exam.", "s":{"type":"multiple_choice","options":["will pass","would pass","passed"],"answer":0}}'::jsonb,
        '{"r":2, "p":"If it doesn''t rain, we ___ go to the beach. (Posibilidad/Opinión)", "s":{"type":"multiple_choice","options":["may","would","did"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué tiempo verbal sigue inmediatamente a la palabra ''If'' en este tipo de condicional?", "s":{"type":"multiple_choice","options":["Presente Simple","Futuro con Will","Pasado Simple"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We will stay at home if it ___ tomorrow.", "s":{"type":"multiple_choice","options":["rains","will rain","rained"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Bill ___ the exam if he studies.", "s":{"type":"multiple_choice","options":["will pass","would pass","pass"],"answer":0}}'::jsonb,
        '{"r":2, "p":"If you eat all that cake, you ___ feel sick.", "s":{"type":"multiple_choice","options":["will","would","do"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Según los apuntes, ¿se pueden usar verbos modales en vez de ''will'' en el lado del resultado?", "s":{"type":"multiple_choice","options":["Sí, para cambiar la probabilidad o expresar una opinión (ej. may)","No, es gramaticalmente incorrecto","Solo en preguntas"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"El Condicional Tipo 1 (If + present, will) se usa para condiciones que tienen alta probabilidad de ocurrir en el futuro.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''If Bill will study, he will pass''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''If Bill studies, he will pass the exam'' es el ejemplo exacto de tus apuntes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Podemos usar modales como ''may'' o ''can'' en lugar de ''will'' para indicar una probabilidad menor o una opinión.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En ''We will go to the beach if it doesn''t rain'', la condición va en segunda posición y sigue estando en presente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Este condicional expresa deseos imposibles sobre el pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La cláusula del resultado siempre debe ir en futuro, ya sea con will o un verbo modal.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Si Bill estudia, aprobará el examen.", "s":{"type":"scramble","chunks":["If Bill","studies,","he will pass","the exam"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Bill aprobará el examen si estudia.", "s":{"type":"scramble","chunks":["Bill will pass","the exam","if he studies"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Si no llueve, podríamos ir a la playa.", "s":{"type":"scramble","chunks":["If it","doesn''t rain,","we may go","to the beach"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Si ella llama, yo contestaré.", "s":{"type":"scramble","chunks":["If","she calls,","I will answer"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Iremos al parque si no llueve.", "s":{"type":"scramble","chunks":["We will go","to the park","if it doesn''t rain"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Si corres, atraparás el autobús.", "s":{"type":"scramble","chunks":["If you run,","you will","catch the bus"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Te ayudaré si tú me ayudas.", "s":{"type":"scramble","chunks":["I will","help you","if you help me"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Posibilidad Irreal (If + Past Simple + Would) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"If I ___ (ganara) the lottery, I would travel around the world.", "s":{"type":"typing","correct_answers":["won"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"If I won the lottery, I ___ (viajaría) around the world.", "s":{"type":"typing","correct_answers":["would travel","''d travel"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"If she ___ (tuviera) time, she would help us.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (comprarían) a house if they had money.", "s":{"type":"typing","correct_answers":["would buy","''d buy"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"If I ___ (fuera) you, I would study more.", "s":{"type":"typing","correct_answers":["were","was"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He would go to the party if he ___ (supiera) the address.", "s":{"type":"typing","correct_answers":["knew"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"If we ___ (viviéramos) in Paris, we would eat croissants every day.", "s":{"type":"typing","correct_answers":["lived"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I would buy a sports car if I ___ (ganara) the lottery.", "s":{"type":"typing","correct_answers":["won"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Para qué se utiliza la estructura ''If + past simple + would'' (Condicional Tipo 2)?", "s":{"type":"multiple_choice","options":["Para expresar una posibilidad irreal en el presente, como un deseo o un sueño","Para situaciones muy probables en el futuro cercano","Para hechos científicos"],"answer":0}}'::jsonb,
        '{"r":3, "p":"If I won the lottery, I ___ travel around the world.", "s":{"type":"multiple_choice","options":["would","will","do"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué tiempo verbal acompaña a la partícula ''If'' en esta estructura hipótetica?", "s":{"type":"multiple_choice","options":["Pasado Simple","Presente Simple","Futuro"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ travel around the world if I won the lottery.", "s":{"type":"multiple_choice","options":["would","will","am going to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"If I ___ you, I wouldn''t do that.", "s":{"type":"multiple_choice","options":["were (o was)","am","be"],"answer":0}}'::jsonb,
        '{"r":3, "p":"If they had a lot of money, they ___ buy a mansion.", "s":{"type":"multiple_choice","options":["would","will","would have"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We would travel more if we ___ more free time.", "s":{"type":"multiple_choice","options":["had","have","has"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Se puede sustituir ''would'' por otro modal en este condicional?", "s":{"type":"multiple_choice","options":["Sí, para cambiar la probabilidad (ej. could, might)","No, está estrictamente prohibido","Solo en inglés británico"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"El Condicional Tipo 2 (If + past simple + would) se usa para hablar del pasado real.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Sirve para plantear escenarios hipotéticos, irreales o sueños en el presente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''If I won the lottery, I would travel around the world'' es el ejemplo textual de tus apuntes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En la parte de la oración que lleva ''If'', el verbo debe ir conjugado en Pasado Simple, aunque el sentido sea presente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La palabra ''Would'' convierte al verbo principal en la terminación ''-ría'' en español (ej. would travel = viajaría).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''If I would win the lottery, I traveled''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Se pueden usar verbos modales como ''could'' o ''might'' en vez de ''would'' para expresar una opinión diferente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Si ganara la lotería, viajaría por el mundo.", "s":{"type":"scramble","chunks":["If I","won the lottery,","I would travel","around the world"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Viajaría por el mundo si ganara la lotería.", "s":{"type":"scramble","chunks":["I would travel","around the world","if I won the lottery"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Si tuviera tiempo, te ayudaría.", "s":{"type":"scramble","chunks":["If I","had time,","I would","help you"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Comprarían una casa si tuvieran dinero.", "s":{"type":"scramble","chunks":["They would buy","a house","if they had money"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Si yo fuera tú, estudiaría más.", "s":{"type":"scramble","chunks":["If I","were you,","I would","study more"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él iría si supiera la respuesta.", "s":{"type":"scramble","chunks":["He would go","if he knew","the answer"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Si viviéramos en París, comeríamos cruasanes.", "s":{"type":"scramble","chunks":["If we lived","in Paris,","we would eat","croissants"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Pasado Imposible (Tipo 3) e I wish - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"If I had known, I ___ (habría hecho) things differently.", "s":{"type":"typing","correct_answers":["would have done","''d have done"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I would have done things differently if I ___ (hubiera sabido).", "s":{"type":"typing","correct_answers":["had known","''d known"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I wish I ___ (tuviera) a dog.", "s":{"type":"typing","correct_answers":["had"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I wish I ___ (no hubiera perdido) the bus.", "s":{"type":"typing","correct_answers":["hadn''t missed","had not missed"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"If she had studied, she ___ (habría aprobado).", "s":{"type":"typing","correct_answers":["would have passed","''d have passed"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I wish it ___ (fuera) Friday today.", "s":{"type":"typing","correct_answers":["were","was"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"If they ___ (hubieran venido), they would have seen her.", "s":{"type":"typing","correct_answers":["had come","''d come"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I wish I ___ (supiera) the answer right now.", "s":{"type":"typing","correct_answers":["knew"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Para qué se utiliza el condicional con Pasado Perfecto y ''Would have'' (Condicional Tipo 3)?", "s":{"type":"multiple_choice","options":["Para hablar de algo en el pasado que no ha sucedido y sus resultados hipotéticos","Para hacer predicciones futuras","Para hablar de cosas que siempre son verdad"],"answer":0}}'::jsonb,
        '{"r":4, "p":"If I had known then what I know now, I ___ things differently.", "s":{"type":"multiple_choice","options":["would have done","would do","will do"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué significa la expresión ''I wish''?", "s":{"type":"multiple_choice","options":["Ojalá (expresa deseos de realización imposible)","Yo gano","Yo espero (con alta probabilidad)"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Para expresar un deseo imposible sobre el PRESENTE (ej. Ojalá tuviera un perro), ¿qué tiempo sigue a ''I wish''?", "s":{"type":"multiple_choice","options":["Pasado Simple (I wish I had a dog)","Presente Simple (I wish I have a dog)","Futuro (I wish I will have)"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Para expresar arrepentimiento sobre el PASADO (ej. Ojalá no hubiera perdido el autobús), ¿qué tiempo usamos?", "s":{"type":"multiple_choice","options":["Pasado Perfecto (I wish I hadn''t missed the bus)","Pasado Simple (I wish I didn''t miss)","Presente Perfecto"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I would have helped you if you ___ me.", "s":{"type":"multiple_choice","options":["had told","told","would tell"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I wish I ___ taller. (Deseo presente)", "s":{"type":"multiple_choice","options":["were / was","am","will be"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I wish I ___ studied more for the exam yesterday.", "s":{"type":"multiple_choice","options":["had","have","would have"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El Condicional Tipo 3 se usa para lamentarse o imaginar cómo habría sido el pasado si las cosas hubieran ocurrido de otra manera.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La estructura correcta es: If + Pasado Perfecto + Would have + Participio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''If I had known, I would have done things differently'' es el ejemplo exacto de tus apuntes para este condicional.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La expresión ''I wish'' significa ''Ojalá''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para desear algo en el presente, debes usar el verbo en Presente Simple después de ''I wish''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''I wish I hadn''t missed the bus'' significa ''Ojalá no hubiera perdido el autobús''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Tanto en los condicionales imposibles como en ''I wish'', usamos tiempos pasados para indicar que la situación es irreal o hipotética.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Si lo hubiera sabido, habría hecho las cosas diferente.", "s":{"type":"scramble","chunks":["If I had known,","I would have done","things differently"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Habría hecho las cosas diferente si lo hubiera sabido.", "s":{"type":"scramble","chunks":["I would have done","things differently","if I had known"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ojalá tuviera un perro.", "s":{"type":"scramble","chunks":["I wish","I had","a dog"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ojalá no hubiera perdido el autobús.", "s":{"type":"scramble","chunks":["I wish","I hadn''t missed","the bus"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Si ella hubiera estudiado, habría aprobado.", "s":{"type":"scramble","chunks":["If she","had studied,","she would have passed"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ojalá fuera viernes.", "s":{"type":"scramble","chunks":["I wish","it were","Friday"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ojalá supiera la respuesta.", "s":{"type":"scramble","chunks":["I wish","I knew","the answer"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 47, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Condicionales y Deseos (I wish)', 
    'Aprende a formular hipótesis y condiciones: desde verdades universales y probabilidades futuras, hasta sueños imposibles y arrepentimientos del pasado.', 
    to_jsonb('## Grammar Lesson: Condicionales y la expresión "I wish"
En inglés, construimos condicionales cruzando dos oraciones: una con "If" (la condición) y otra con el resultado. El tiempo verbal que elijas cambiará drásticamente la probabilidad de que eso ocurra.

##### 1. Condicional 0 y Alternativas a "If" (Verdades y Hechos)
Se usa cuando la condición y el resultado **siempre son verdad** (ej. hechos científicos). Se construye con **Presente Simple en ambas partes**. En la frase de resultado también pueden aparecer modales como *can* o *may*.
*   *If you heat water to 100° C, it **boils**.* (Si calientas agua a 100 grados, hierve).
*   *If you don''t have a racket, you **can''t play** tennis.*
**Alternativas a If:**
*   **Unless** (A menos que/ A no ser que): *Unless you pay me, I won''t do it.*
*   **As long as** (Siempre/Mientras que): *As long as you don''t move, the dog won''t bite you.*
*   **When** (Cuando - Condicionales seguros): *When it gets dark, bats come out.*

##### 2. Condicional 1 (Futuro Probable)
Se utiliza para casos en que es **muy probable que la condición pase**. Se usa **If + Presente Simple**, y en la otra mitad se usa el **Futuro (Will)** o modales de probabilidad.
*   *If Bill **studies**, he **will pass** the exam.* (Si Bill estudia, aprobará).
*   *If it doesn''t rain, we **may go** to the beach.* (Si no llueve, podríamos ir).

##### 3. Condicional 2 (Posibilidad Irreal o Sueño en el Presente)
Se usa para expresar una **posibilidad irreal, un deseo o un sueño** en el momento actual. Se forma con **If + Pasado Simple**, y en la segunda mitad se usa **Would** (que da la terminación "-ría").
*   *If I **won** the lottery, I **would travel** around the world.* (Si ganara la lotería, viajaría por el mundo).

##### 4. Condicional 3 (Pasado Imposible) y I WISH (Ojalá)
Se usa para hablar de algo que **no sucedió** en el pasado y reflexionar sobre cómo habría sido. Se forma con **If + Pasado Perfecto**, y en el resultado **Would have + participio**.
*   *If I **had known** then what I know now, I **would have done** things differently.* (Si hubiera sabido entonces lo que sé ahora, habría hecho las cosas de otra manera).
**I WISH (Ojalá):** Expresa deseos de realización imposible.
*   Deseo sobre el presente (usa pasado simple): *I wish I **had** a dog.* (Ojalá tuviera un perro).
*   Deseo sobre el pasado (usa pasado perfecto): *I wish I **hadn''t missed** the bus.* (Ojalá no hubiera perdido el autobús).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Tipo 0 y Alternativas (Unless, When)', 'Para hechos siempre ciertos usa Presente Simple en ambas partes. Recuerda las alternativas: Unless (a menos que), As long as (siempre que) y When (cuando).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Condicional Probable (If + Presente, Will)', 'Para una condición muy probable en el futuro usa: If + Presente Simple en la primera parte, y Will (o May) en la segunda.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Posibilidad Irreal (If + Pasado, Would)', 'Para hipótesis o sueños irrealizables en el presente usa: If + Pasado Simple, seguido del modal Would en la cláusula de resultado.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Pasado Imposible y I WISH', 'Para eventos que no sucedieron, usa If + Pasado Perfecto y Would Have. Para la expresión "I wish" (Ojalá), usa pasado para deseos presentes y pasado perfecto para remordimientos.');

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