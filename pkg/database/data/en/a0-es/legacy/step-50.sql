-- ============================================================
-- Seed: A0 English Path – Grammar – Be used to
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
        -- REGLA 1: Presente (Am / Is / Are used to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"She ___ (está acostumbrada a) living alone.", "s":{"type":"typing","correct_answers":["is used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (estoy acostumbrado a) the cold weather.", "s":{"type":"typing","correct_answers":["am used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (están acostumbrados a) working late.", "s":{"type":"typing","correct_answers":["are used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He is used to ___ (conducir) on the left.", "s":{"type":"typing","correct_answers":["driving"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We are used to ___ (despertarnos) early.", "s":{"type":"typing","correct_answers":["waking up","getting up"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I am used to ___ (estudiar) with music.", "s":{"type":"typing","correct_answers":["studying"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (estás acostumbrado a) the noise.", "s":{"type":"typing","correct_answers":["are used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She is used to ___ (hablar) in public.", "s":{"type":"typing","correct_answers":["speaking"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"Según los apuntes, ¿qué significa la expresión ''be used to''?", "s":{"type":"multiple_choice","options":["Estar acostumbrado a algo (que es familiar, normal o común)","Soler hacer algo en el pasado y ya no","Una obligación legal en el presente"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué debe ir justo después de la partícula ''to'' en la estructura ''be used to''?", "s":{"type":"multiple_choice","options":["Un sustantivo o un verbo terminado en -ing","Un verbo en infinitivo (forma base)","Un adjetivo calificativo"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She is used to ___ alone.", "s":{"type":"multiple_choice","options":["living","live","lived"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ the strict rules at my company.", "s":{"type":"multiple_choice","options":["am used to","use to","am use to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They are used to ___ dinner at 9 PM.", "s":{"type":"multiple_choice","options":["having","have","had"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es correcta gramaticalmente?", "s":{"type":"multiple_choice","options":["He is used to the traffic.","He is used to traffic jam. (infinitivo)","He uses to the traffic."],"answer":0}}'::jsonb,
        '{"r":1, "p":"We are used to ___ hard.", "s":{"type":"multiple_choice","options":["working","work","worked"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I am used ___ reading before bed.", "s":{"type":"multiple_choice","options":["to","for","at"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"La estructura ''be used to'' se utiliza para referirse a cosas que nos resultan comunes o normales.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El verbo que sigue a ''be used to'' debe escribirse obligatoriamente en infinitivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''She is used to living alone'' significa que ella está acostumbrada a vivir sola.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es posible utilizar ''be used to'' seguido directamente por un sustantivo (ej. the cold weather).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''I am used to get up early'' es la forma correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El verbo TO BE (am/is/are) es indispensable en esta estructura para indicar el estado presente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"En esta estructura, la palabra ''to'' funciona como una preposición, por lo que el verbo va en gerundio (-ing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Ella está acostumbrada a vivir sola.", "s":{"type":"scramble","chunks":["She is","used to","living alone"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Yo estoy acostumbrado al clima frío.", "s":{"type":"scramble","chunks":["I am","used to","the cold weather"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos están acostumbrados a trabajar tarde.", "s":{"type":"scramble","chunks":["They are","used to","working late"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Estamos acostumbrados a leer.", "s":{"type":"scramble","chunks":["We are","used to","reading"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él está acostumbrado al tráfico.", "s":{"type":"scramble","chunks":["He is","used to","the traffic"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Estás acostumbrado a conducir.", "s":{"type":"scramble","chunks":["You are","used to","driving"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Estoy acostumbrado a usar el ordenador.", "s":{"type":"scramble","chunks":["I am used to","using","the computer"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Pasado (Was / Were used to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"We ___ (estábamos acostumbrados a) the noise.", "s":{"type":"typing","correct_answers":["were used to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (estaba acostumbrada a) studying at night.", "s":{"type":"typing","correct_answers":["was used to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (estaba acostumbrado a) traveling a lot.", "s":{"type":"typing","correct_answers":["was used to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (estaban acostumbrados a) waking up early.", "s":{"type":"typing","correct_answers":["were used to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (estaba acostumbrado a) the heat.", "s":{"type":"typing","correct_answers":["was used to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You ___ (estabas acostumbrado a) walking to school.", "s":{"type":"typing","correct_answers":["were used to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (estábamos acostumbrados a) having a big house.", "s":{"type":"typing","correct_answers":["were used to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (estaba acostumbrado a) eating late.", "s":{"type":"typing","correct_answers":["was used to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"Según los apuntes, a diferencia de ''used to'' (solía), la estructura ''be used to''...", "s":{"type":"multiple_choice","options":["Se puede utilizar en cualquier tiempo verbal, incluyendo el pasado","Solo se puede usar en presente","Desaparece en oraciones pasadas"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We ___ traveling a lot when we lived in Europe.", "s":{"type":"multiple_choice","options":["were used to","was used to","are used to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She ___ waking up early, but now she hates it.", "s":{"type":"multiple_choice","options":["was used to","used to waking","is used to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ___ the strict rules at my old school.", "s":{"type":"multiple_choice","options":["was used to","am used to","used to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué verbo cambia en la oración para indicar que el estado de costumbre es en el pasado?", "s":{"type":"multiple_choice","options":["El verbo TO BE (pasa a was/were)","La preposición TO (pasa a FOR)","La palabra USED (pasa a USE)"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They ___ living in a small apartment before they won the lottery.", "s":{"type":"multiple_choice","options":["were used to","was used to","are used to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He ___ the spicy food in Mexico.", "s":{"type":"multiple_choice","options":["was used to","were used to","was use to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"The dog ___ sleeping inside the house before we moved.", "s":{"type":"multiple_choice","options":["was used to","used to sleeping","used to sleep"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"La estructura ''be used to'' no se puede usar para referirse a estados pasados.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Para hablar en pasado, cambiamos el verbo TO BE por WAS o WERE.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''I was used to live'' es la forma correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Al usar el pasado ''was used to'', el verbo principal todavía mantiene su terminación -ing.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''She was used to the noise'' es un ejemplo perfecto del uso en pasado seguido de un sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Usamos ''were used to'' para los pronombres I, He, She, It.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''They were used to running'' se traduce como ''Ellos estaban acostumbrados a correr''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Estábamos acostumbrados a viajar mucho.", "s":{"type":"scramble","chunks":["We were","used to","traveling a lot"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella estaba acostumbrada a estudiar de noche.", "s":{"type":"scramble","chunks":["She was","used to","studying at night"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo estaba acostumbrado a la ciudad.", "s":{"type":"scramble","chunks":["I was","used to","the city"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Estaban acostumbrados a madrugar.", "s":{"type":"scramble","chunks":["They were used to","waking up","early"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él estaba acostumbrado a cocinar.", "s":{"type":"scramble","chunks":["He was","used to","cooking"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Estábamos acostumbrados a tener un perro.", "s":{"type":"scramble","chunks":["We were","used to","having a dog"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo estaba acostumbrado al frío.", "s":{"type":"scramble","chunks":["I was","used to","the cold"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Negativas e Interrogativas (Be used to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"He ___ (no está acostumbrado a) working under pressure.", "s":{"type":"typing","correct_answers":["isn''t used to","is not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We ___ (no estábamos acostumbrados a) traveling a lot.", "s":{"type":"typing","correct_answers":["weren''t used to","were not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Estás acostumbrado a) the spicy food?", "s":{"type":"typing","correct_answers":["Are you used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (no estoy acostumbrado a) getting up so early.", "s":{"type":"typing","correct_answers":["am not used to","''m not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Estaba ella acostumbrada a) living in a big city?", "s":{"type":"typing","correct_answers":["Was she used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (no están acostumbrados a) the new system.", "s":{"type":"typing","correct_answers":["aren''t used to","are not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___ (no estaba acostumbrada a) driving on the left.", "s":{"type":"typing","correct_answers":["wasn''t used to","was not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Estabais acostumbrados a) the noise?", "s":{"type":"typing","correct_answers":["Were you used to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Cómo formamos la negación con la estructura ''be used to''?", "s":{"type":"multiple_choice","options":["Negando el verbo TO BE (isn''t / aren''t / wasn''t / weren''t)","Usando didn''t o don''t delante (didn''t be used to)","Quitando la ''d'' de la palabra used"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We ___ traveling a lot. (Nosotros no estábamos acostumbrados a viajar mucho).", "s":{"type":"multiple_choice","options":["weren''t used to","didn''t used to","weren''t use to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ you used to the long hours at your previous job?", "s":{"type":"multiple_choice","options":["Were","Did","Are"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ the strict rules.", "s":{"type":"multiple_choice","options":["am not used to","don''t used to","not am used to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cómo dirías ''Ellos no están acostumbrados a comer tarde''?", "s":{"type":"multiple_choice","options":["They aren''t used to eating late","They don''t use to eat late","They aren''t used to eat late"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Even though she moved to Spain, she ___ the heat.", "s":{"type":"multiple_choice","options":["wasn''t used to","didn''t use to","wasn''t used"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ he used to waking up at 5 AM?", "s":{"type":"multiple_choice","options":["Is","Does","Has"],"answer":0}}'::jsonb,
        '{"r":3, "p":"En oraciones negativas e interrogativas con ''be used to'', ¿la palabra ''used'' pierde la ''d''?", "s":{"type":"multiple_choice","options":["No, porque no usamos el auxiliar ''did'' o ''do''","Sí, es la misma regla que con ''solía''","A veces"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''We weren’t used to traveling a lot'' es el ejemplo exacto de tus apuntes para la negación en pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para negar en presente, debemos decir ''He doesn''t be used to''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"La palabra ''used'' mantiene siempre su terminación con ''d'' en las preguntas (ej. Are you used to...?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Did you be used to it?'' es la forma correcta de hacer una pregunta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''I am not used to driving'' significa que no tengo la costumbre o familiaridad de conducir.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En las interrogativas, el verbo TO BE (am/is/are/was/were) se coloca delante del sujeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''She wasn''t used to the silence'' es una oración gramaticalmente incorrecta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: No estábamos acostumbrados a viajar mucho.", "s":{"type":"scramble","chunks":["We weren''t","used to","traveling a lot"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él no está acostumbrado a trabajar duro.", "s":{"type":"scramble","chunks":["He isn''t used to","working","hard"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Estás acostumbrado a la comida picante?", "s":{"type":"scramble","chunks":["Are you","used to","spicy food?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: No estoy acostumbrado a conducir.", "s":{"type":"scramble","chunks":["I am not","used to","driving"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Estaba ella acostumbrada al clima?", "s":{"type":"scramble","chunks":["Was she","used to","the weather?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos no están acostumbrados a madrugar.", "s":{"type":"scramble","chunks":["They aren''t used to","waking up","early"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Yo no estaba acostumbrado al ruido.", "s":{"type":"scramble","chunks":["I wasn''t","used to","the noise"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: El Proceso (Get / Become used to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I am ___ (acostumbrándome a) my new job.", "s":{"type":"typing","correct_answers":["getting used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She has ___ (se ha acostumbrado a) waking up early.", "s":{"type":"typing","correct_answers":["become used to","got used to","gotten used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"You will ___ (te acostumbrarás a) the cold.", "s":{"type":"typing","correct_answers":["get used to","become used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They are ___ (acostumbrándose a) driving on the left.", "s":{"type":"typing","correct_answers":["getting used to","becoming used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He couldn''t ___ (acostumbrarse a) the food.", "s":{"type":"typing","correct_answers":["get used to","become used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I am looking forward to ___ (acostumbrarme a) this city.", "s":{"type":"typing","correct_answers":["getting used to","becoming used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We must ___ (acostumbrarnos a) the new rules.", "s":{"type":"typing","correct_answers":["get used to","become used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"It takes time to ___ (acostumbrarse a) living alone.", "s":{"type":"typing","correct_answers":["get used to","become used to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Tus apuntes de gerundios mencionan ''get used to'' y ''become used to''. ¿Qué expresan?", "s":{"type":"multiple_choice","options":["El proceso dinámico de acostumbrarse a algo nuevo","Un estado final y permanente en el pasado","Una obligación"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Al igual que con ''be used to'', el verbo que sigue a ''get used to'' debe ir en:", "s":{"type":"multiple_choice","options":["Gerundio (terminado en -ing)","Infinitivo sin to","Participio"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I am ___ used to my new schedule.", "s":{"type":"multiple_choice","options":["getting","becoming","ambas son correctas"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Don''t worry, you will ___ used to the noise soon.", "s":{"type":"multiple_choice","options":["get","be","getting"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She has ___ used to studying at night.", "s":{"type":"multiple_choice","options":["become","became","becoming"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I can''t ___ used to this terrible weather.", "s":{"type":"multiple_choice","options":["get","getting","got"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es correcta?", "s":{"type":"multiple_choice","options":["They are getting used to living here.","They are getting used to live here.","They get use to live here."],"answer":0}}'::jsonb,
        '{"r":4, "p":"It took me a long time to ___ used to the new system.", "s":{"type":"multiple_choice","options":["become","became","becoming"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Mientras ''be used to'' describe el estado (estar), ''get/become used to'' describe el proceso (acostumbrarse).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Tus apuntes indican que la preposición ''to'' en estas expresiones obliga a usar el verbo en gerundio (-ing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I am getting used to the city'' significa ''Estoy acostumbrándome a la ciudad''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"No podemos usar un sustantivo detrás de ''get used to''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''You will get used to it'' es una expresión común que significa ''Te acostumbrarás (a ello)''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Become used to'' y ''get used to'' son prácticamente sinónimos, pero el segundo es más informal.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Si usas ''get used to'', el verbo siguiente debe ir en infinitivo simple.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Estoy acostumbrándome a mi nuevo trabajo.", "s":{"type":"scramble","chunks":["I am","getting used to","my new job"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Te acostumbrarás a la ciudad.", "s":{"type":"scramble","chunks":["You will","get used to","the city"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella se ha acostumbrado a madrugar.", "s":{"type":"scramble","chunks":["She has","become used to","waking up early"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: No puedo acostumbrarme al clima.", "s":{"type":"scramble","chunks":["I can''t","get used to","the weather"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Nos estamos acostumbrando a conducir aquí.", "s":{"type":"scramble","chunks":["We are","getting used to","driving here"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él se acostumbró al ruido.", "s":{"type":"scramble","chunks":["He","got used to","the noise"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Me cuesta acostumbrarme a esto.", "s":{"type":"scramble","chunks":["It''s hard to","get used to","this"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 41, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Be used to / Get used to', 
    'Aprende a expresar la familiaridad con una situación ("estar acostumbrado a") y el proceso dinámico de adaptación ("acostumbrarse a") usando sustantivos y gerundios.', 
    to_jsonb('## Grammar Lesson: Be used to / Get used to
Estas estructuras se utilizan para hablar de aquellas situaciones que nos resultan cotidianas, normales o familiares, o bien, el proceso que pasamos para que lleguen a serlo.

##### 1. BE USED TO (Presente: Am / Is / Are)
Significa **"Estar acostumbrado a"**. La regla de oro, al actuar el *to* como preposición, es que todo lo que vaya detrás debe ser un **sustantivo** (el ruido, el frío) o un **verbo terminado en -ing** (gerundio).
*   *She **is used to living** alone.* (Ella está acostumbrada a vivir sola).
*   *I **am used to** the cold weather.* (Estoy acostumbrado al clima frío).

##### 2. BE USED TO (Pasado: Was / Were)
Esta estructura es súper flexible. A diferencia del "Used to" de hábitos (que solo existe en pasado), para expresar que **estabas acostumbrado** a algo en el pasado, solo necesitas cambiar el verbo To Be a *Was* o *Were*. La regla del verbo en *-ing* se mantiene intacta.
*   *I **was used to waking up** early.* (Yo estaba acostumbrado a madrugar).
*   *They **were used to** the noise.* (Ellos estaban acostumbrados al ruido).

##### 3. Negativas e Interrogativas
Al utilizar el verbo TO BE como raíz de la estructura, la negación se forma simplemente añadiendo *not* (isn''t, aren''t, wasn''t, weren''t), y la pregunta colocando el verbo delante del sujeto. **¡Nunca uses Don''t o Didn''t aquí!**
*   *We **weren''t used to traveling** a lot.* (No estábamos acostumbrados a viajar mucho).
*   ***Are you used to** spicy food?* (¿Estás acostumbrado a la comida picante?).

##### 4. GET / BECOME USED TO (El proceso)
Mientras que *Be used to* describe un estado, usar **Get used to** o **Become used to** describe la acción en proceso: **"Acostumbrarse a"**. Siguen exactamente la misma regla: van seguidos de sustantivo o gerundio (-ing).
*   *I am **getting used to** my new job.* (Me estoy acostumbrando a mi nuevo trabajo).
*   *You will **get used to** the city soon.* (Te acostumbrarás a la ciudad pronto).
*   *She has **become used to** studying at night.* (Ella se ha acostumbrado a estudiar de noche).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Presente (Am/Is/Are used to)', 'Usa el verbo TO BE + used to + verbo en -ING o un sustantivo para indicar que algo te resulta normal o familiar (estar acostumbrado a).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Pasado (Was/Were used to)', 'Para referirte a algo a lo que ya estabas acostumbrado en el pasado, simplemente cambia el verbo To Be a Was/Were. (El siguiente verbo sigue yendo en -ing).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Negativas e Interrogativas', '¡Cuidado! Se niega sobre el verbo To Be (isn''t, aren''t, wasn''t, weren''t). ¡Nunca uses los auxiliares "don''t" o "didn''t" para esta estructura!');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'El Proceso (Get/Become used to)', 'Usa "Get used to" o "Become used to" para describir la acción de "acostumbrarse". El verbo que le siga debe ir siempre en -ing.');

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