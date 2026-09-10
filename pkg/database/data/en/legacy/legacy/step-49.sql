-- ============================================================
-- Seed: A0 English Path – Grammar – Used to / Be used to
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
        -- REGLA 1: Hábitos Pasados (Used to afirmativo) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (solía) play tennis every Sunday.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (solía) live in London.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (solíamos) go to the beach in summer.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (solía) smoke a lot.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (solían) be very good friends.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (solía) read comic books as a child.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (solías) have long hair.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (solía) work in a bank.", "s":{"type":"typing","correct_answers":["used to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué significa la estructura ''used to'' cuando va seguida de un verbo en infinitivo?", "s":{"type":"multiple_choice","options":["Solía (hábitos en el pasado que ya no ocurren)","Estoy acostumbrado a","Soler (hábitos que ocurren en el presente)"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ play football when I was young.", "s":{"type":"multiple_choice","options":["used to","use to","am used to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se forma una oración afirmativa con ''used to''?", "s":{"type":"multiple_choice","options":["Sujeto + used to + verbo en infinitivo","Sujeto + used to + verbo en -ing","Sujeto + be used to + verbo en infinitivo"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ work late every night, but now she finishes at 5 PM.", "s":{"type":"multiple_choice","options":["used to","use to","uses to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We ___ have a dog, but he died last year.", "s":{"type":"multiple_choice","options":["used to","used","use to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"My father ___ drive a truck.", "s":{"type":"multiple_choice","options":["used to","was used to","used"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ travel a lot before they had children.", "s":{"type":"multiple_choice","options":["used to","used","use to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"El verbo que sigue a ''used to'' para hablar de un hábito pasado va en...", "s":{"type":"multiple_choice","options":["Infinitivo (forma base)","Participio","Terminado en -ing"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Used to'' se utiliza para expresar acciones que hacíamos a menudo en el pasado pero que ya no hacemos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''I used to playing tennis''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La estructura ''used to'' puede traducirse perfectamente al español como ''solía''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Podemos usar ''used to'' para hablar de rutinas que todavía hacemos en el presente.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''She used to be shy'' significa que ella solía ser tímida (pero ya no lo es).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"En oraciones afirmativas, la palabra siempre se escribe ''used to'' (con d final).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''He uses to go'' para referirse a que él solía ir.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Yo solía vivir en Londres.", "s":{"type":"scramble","chunks":["I used to","live","in London"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella solía jugar al tenis.", "s":{"type":"scramble","chunks":["She used to","play","tennis"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros solíamos tener un coche rojo.", "s":{"type":"scramble","chunks":["We used to","have","a red car"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él solía fumar.", "s":{"type":"scramble","chunks":["He","used to","smoke"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos solían ser amigos.", "s":{"type":"scramble","chunks":["They used to","be","friends"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Yo solía levantarme temprano.", "s":{"type":"scramble","chunks":["I used to","wake up","early"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Solíamos ir a la playa.", "s":{"type":"scramble","chunks":["We used to","go","to the beach"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Negativas e Interrogativas (Didn't use to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"Food ___ (no solía) be so expensive.", "s":{"type":"typing","correct_answers":["didn''t use to","did not use to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (no solía) like vegetables.", "s":{"type":"typing","correct_answers":["didn''t use to","did not use to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Solías) you play the piano?", "s":{"type":"typing","correct_answers":["Did you use to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (no solía) work here.", "s":{"type":"typing","correct_answers":["didn''t use to","did not use to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Solía) he go to your school?", "s":{"type":"typing","correct_answers":["Did he use to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (no solíamos) travel a lot.", "s":{"type":"typing","correct_answers":["didn''t use to","did not use to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Where ___ (solías) you live?", "s":{"type":"typing","correct_answers":["did you use to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (no solían) speak English.", "s":{"type":"typing","correct_answers":["didn''t use to","did not use to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Cómo se forma una oración negativa para decir ''no solía''?", "s":{"type":"multiple_choice","options":["didn''t use to","didn''t used to","wasn''t used to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Food ___ be so expensive in the past.", "s":{"type":"multiple_choice","options":["didn''t use to","didn''t used to","not used to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ you use to live in Madrid?", "s":{"type":"multiple_choice","options":["Did","Were","Are"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ___ watch TV when I was younger.", "s":{"type":"multiple_choice","options":["didn''t use to","didn''t used to","don''t use to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Por qué el verbo ''use'' pierde la ''d'' en oraciones negativas e interrogativas?", "s":{"type":"multiple_choice","options":["Porque el auxiliar ''did/didn''t'' ya lleva la marca de pasado","Porque se escribe así en británico","Porque suena mejor al hablar"],"answer":0}}'::jsonb,
        '{"r":2, "p":"What games ___ to play as a child?", "s":{"type":"multiple_choice","options":["did you use","did you used","do you use"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She ___ have short hair. (Ella no solía tener el pelo corto)", "s":{"type":"multiple_choice","options":["didn''t use to","not used to","didn''t used to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Where did they ___ work?", "s":{"type":"multiple_choice","options":["use to","used to","uses to"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Para hacer una pregunta con ''used to'', utilizamos el auxiliar ''Did''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La oración ''Food didn''t used to be so expensive'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Al usar el auxiliar DID o DIDN''T, la palabra vuelve a su forma base: ''use to''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Did you use to smoke?'' significa ''¿Solías fumar?''", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En inglés no se puede preguntar sobre hábitos del pasado usando ''used to''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''We didn''t use to study'' se traduce como ''Nosotros no solíamos estudiar''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Si quiero decir ''Yo no solía'', la mejor traducción es ''I not used to''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: La comida no solía ser tan cara.", "s":{"type":"scramble","chunks":["Food didn''t use to","be","so expensive"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo no solía comer verduras.", "s":{"type":"scramble","chunks":["I didn''t","use to eat","vegetables"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Solías jugar al baloncesto?", "s":{"type":"scramble","chunks":["Did you","use to play","basketball?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no solía estudiar.", "s":{"type":"scramble","chunks":["She","didn''t use to","study"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Dónde solías vivir?", "s":{"type":"scramble","chunks":["Where","did you","use to live?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: No solíamos ver la televisión.", "s":{"type":"scramble","chunks":["We didn''t","use to watch","TV"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Solía él trabajar aquí?", "s":{"type":"scramble","chunks":["Did he","use to work","here?"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Be used to (Estar acostumbrado a) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"She is used to ___ (vivir) alone.", "s":{"type":"typing","correct_answers":["living"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (estoy acostumbrado a) getting up early.", "s":{"type":"typing","correct_answers":["am used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They are used to ___ (trabajar) at night.", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (no está acostumbrado a) the cold weather.", "s":{"type":"typing","correct_answers":["isn''t used to","is not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We are used to ___ (conducir) on the left.", "s":{"type":"typing","correct_answers":["driving"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Estás acostumbrado a) spicy food?", "s":{"type":"typing","correct_answers":["Are you used to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I am used to ___ (estudiar) with music.", "s":{"type":"typing","correct_answers":["studying"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is used to ___ (hablar) in public.", "s":{"type":"typing","correct_answers":["speaking"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué significa la expresión ''Be used to''?", "s":{"type":"multiple_choice","options":["Estar acostumbrado a algo (que es familiar o normal para ti)","Soler hacer algo en el pasado","Una obligación legal"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Cuando a ''be used to'' le sigue un verbo, ¿qué forma debe tomar ese verbo?", "s":{"type":"multiple_choice","options":["El gerundio (terminado en -ing)","El infinitivo (forma base)","El participio"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She is used to ___ alone.", "s":{"type":"multiple_choice","options":["living","live","lived"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ working under pressure.", "s":{"type":"multiple_choice","options":["am used to","used to","use to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He isn''t used to ___ up so early.", "s":{"type":"multiple_choice","options":["waking","wake","waked"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They are used to the noise. (En esta oración, ¿a qué están acostumbrados?)", "s":{"type":"multiple_choice","options":["A un sustantivo (el ruido)","A una acción (hacer ruido)","A nada"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es correcta?", "s":{"type":"multiple_choice","options":["I am used to driving on the right.","I used to driving on the right.","I am used to drive on the right."],"answer":0}}'::jsonb,
        '{"r":3, "p":"Are you used to ___ spicy food?", "s":{"type":"multiple_choice","options":["eating","eat","ate"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Be used to'' se utiliza para referirse a cosas que nos resultan familiares, normales o comunes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En la estructura ''be used to'', la palabra ''to'' va siempre seguida de un verbo en infinitivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''She is used to living alone'' significa que ella está acostumbrada a vivir sola.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Podemos usar ''be used to'' seguido directamente por un sustantivo (ej. I am used to the cold weather).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''I am used to get up early'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"El verbo TO BE (am/is/are) es esencial en esta estructura para indicar que ''se ESTÁ acostumbrado''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Are you used to the noise?'' significa ''¿Estás acostumbrado al ruido?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Ella está acostumbrada a vivir sola.", "s":{"type":"scramble","chunks":["She is","used to","living alone"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Estoy acostumbrado a levantarme temprano.", "s":{"type":"scramble","chunks":["I am used to","getting up","early"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos están acostumbrados al frío.", "s":{"type":"scramble","chunks":["They are","used to","the cold"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él no está acostumbrado a trabajar duro.", "s":{"type":"scramble","chunks":["He isn''t used to","working","hard"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Estamos acostumbrados a leer.", "s":{"type":"scramble","chunks":["We are","used to","reading"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Estás acostumbrado a la comida picante?", "s":{"type":"scramble","chunks":["Are you","used to","spicy food?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: No estoy acostumbrado a conducir.", "s":{"type":"scramble","chunks":["I am not","used to","driving"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Be used to en Otros Tiempos - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"We ___ (no estábamos acostumbrados a) traveling a lot.", "s":{"type":"typing","correct_answers":["weren''t used to","were not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (estaba acostumbrada a) studying at night.", "s":{"type":"typing","correct_answers":["was used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (estaba acostumbrado a) the noise in the city.", "s":{"type":"typing","correct_answers":["was used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (no estaban acostumbrados a) waking up early.", "s":{"type":"typing","correct_answers":["weren''t used to","were not used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (estaba acostumbrado a) eating late.", "s":{"type":"typing","correct_answers":["was used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (¿Estabas acostumbrado a) the cold winter?", "s":{"type":"typing","correct_answers":["Were you used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We ___ (estábamos acostumbrados a) having a big house.", "s":{"type":"typing","correct_answers":["were used to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (no estaba acostumbrada a) driving on the left.", "s":{"type":"typing","correct_answers":["wasn''t used to","was not used to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Según los apuntes, la estructura ''Be used to''...", "s":{"type":"multiple_choice","options":["Se puede utilizar en cualquier tiempo verbal (presente, pasado, futuro)","Solo se usa en presente","Solo se usa en pasado"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We ___ traveling a lot when we lived in Europe.", "s":{"type":"multiple_choice","options":["weren''t used to","didn''t used to","aren''t used to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ waking up early, but now she hates it.", "s":{"type":"multiple_choice","options":["was used to","used to waking","is used to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ the strict rules at my old school.", "s":{"type":"multiple_choice","options":["was used to","am used to","used to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cómo dirías ''Ellos no estaban acostumbrados a comer tarde''?", "s":{"type":"multiple_choice","options":["They weren''t used to eating late","They didn''t use to eat late","They didn''t used to eating late"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Even though she moved to Spain, she ___ the heat.", "s":{"type":"multiple_choice","options":["wasn''t used to","didn''t use to","wasn''t used"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ you used to the long hours at your previous job?", "s":{"type":"multiple_choice","options":["Were","Did","Are"],"answer":0}}'::jsonb,
        '{"r":4, "p":"The dog ___ sleeping inside the house before we moved.", "s":{"type":"multiple_choice","options":["was used to","used to sleeping","used to sleep"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"La estructura ''be used to'' no se puede usar para referirse a cosas en el pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''We weren''t used to traveling a lot'' significa que en el pasado no estábamos acostumbrados a viajar.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para hablar en pasado, cambiamos el verbo TO BE por WAS o WERE.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I was used to live'' es la forma correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Al usar el pasado ''was used to'', el verbo principal todavía mantiene su terminación -ing.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Did you be used to it?'' es la forma correcta de hacer una pregunta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''She was used to the noise'' es un ejemplo perfecto del uso en pasado con un sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: No estábamos acostumbrados a viajar mucho.", "s":{"type":"scramble","chunks":["We weren''t","used to","traveling a lot"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella estaba acostumbrada a estudiar de noche.", "s":{"type":"scramble","chunks":["She was","used to","studying at night"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Yo estaba acostumbrado a la ciudad.", "s":{"type":"scramble","chunks":["I was","used to","the city"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: No estaban acostumbrados a madrugar.", "s":{"type":"scramble","chunks":["They weren''t used to","waking up","early"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Estabas acostumbrado al frío?", "s":{"type":"scramble","chunks":["Were you","used to","the cold?"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él no estaba acostumbrado a cocinar.", "s":{"type":"scramble","chunks":["He wasn''t","used to","cooking"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Estábamos acostumbrados a tener un perro.", "s":{"type":"scramble","chunks":["We were","used to","having a dog"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 40, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Used to vs. Be used to', 
    'Aprende la diferencia vital entre hablar de hábitos del pasado ("solía") y expresar que algo te resulta familiar o común ("estar acostumbrado a").', 
    to_jsonb('## Grammar Lesson: Used to & Be used to
Estas dos estructuras suenan parecido pero tienen significados y reglas gramaticales completamente diferentes. Es fundamental no confundirlas.

##### 1. USED TO (Hábitos en el pasado)
Significa **"Solía"**. Se utiliza para hablar de hábitos pasados; cosas que se hicieron muchas veces en el pasado pero que ya no se hacen en la actualidad. A la estructura le sigue un verbo en **infinitivo**.
*   *I **used to play** tennis when I was young.* (Yo solía jugar al tenis cuando era joven).
*   *She **used to smoke**.* (Ella solía fumar).

##### 2. USED TO (Negativas e Interrogativas)
Para hacer una pregunta o una negación, necesitamos el auxiliar del pasado (**Did** o **Didn''t**). Al tener el auxiliar, la palabra pierde la "d" final y vuelve a su forma base: **use to**.
*   *Food **didn''t use to be** so expensive.* (La comida no solía ser tan cara).
*   ***Did you use to play** the piano?* (¿Solías tocar el piano?).

##### 3. BE USED TO (Estar acostumbrado a)
Significa **"Estar acostumbrado a"**. Se usa para cosas que nos son familiares, normales o comunes. Se forma con el verbo **TO BE** + **used to**, y la regla de oro es que lo que le sigue debe ser un **sustantivo** o un verbo terminado en **-ing**.
*   *She **is used to living** alone.* (Ella está acostumbrada a vivir sola). -> (Con verbo -ing).
*   *I **am used to** the cold weather.* (Estoy acostumbrado al clima frío). -> (Con sustantivo).

##### 4. BE USED TO en Otros Tiempos
A diferencia de *Used to* (que solo existe en pasado), la estructura *Be used to* se puede utilizar en **cualquier tiempo verbal** simplemente cambiando el tiempo del verbo TO BE. Sigue manteniendo la regla del verbo en -ing.
*   *We **weren''t used to traveling** a lot.* (No estábamos acostumbrados a viajar mucho).
*   *I **was used to waking up** early.* (Yo estaba acostumbrado a madrugar).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Hábitos Pasados (Used to)', 'Recuerda: Utiliza "Used to" seguido de un verbo en infinitivo para decir "solía". Expresa algo que hacías antes y ya no.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Negativas e Interrogativas', '¡Cuidado con la ortografía! Cuando usas "Didn''t" o "Did", la palabra pierde su terminación y debe escribirse "use to".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Estar acostumbrado a (Be used to)', 'Para decir que algo es familiar o normal (estar acostumbrado a), usa el verbo To Be + used to + un verbo siempre terminado en -ing.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Be used to en otros tiempos', 'Puedes usar "Be used to" en pasado cambiando el verbo To Be por Was/Were. (Ej. We weren''t used to traveling a lot).');

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