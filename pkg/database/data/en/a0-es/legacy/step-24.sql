-- ============================================================
-- Seed: A0 English Path – Grammar – Gerundios (Completo >100)
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
        -- REGLA 1: Verbos de Actitud (like, love, enjoy...) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I like ___ (play) tennis.", "s":{"type":"typing","correct_answers":["playing"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She loves ___ (read) books.", "s":{"type":"typing","correct_answers":["reading"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He hates ___ (cook) dinner.", "s":{"type":"typing","correct_answers":["cooking"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We enjoy ___ (watch) movies.", "s":{"type":"typing","correct_answers":["watching"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They detest ___ (clean) the house.", "s":{"type":"typing","correct_answers":["cleaning"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I fear ___ (fly) in airplanes.", "s":{"type":"typing","correct_answers":["flying"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She dreads ___ (go) to the dentist.", "s":{"type":"typing","correct_answers":["going"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Do you like ___ (swim) in the sea?", "s":{"type":"typing","correct_answers":["swimming"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"I enjoy ___ video games.", "s":{"type":"multiple_choice","options":["playing","to play","play"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She loves ___ to music.", "s":{"type":"multiple_choice","options":["to listening","listening","listen"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He hates ___ up early.", "s":{"type":"multiple_choice","options":["getting","get","to getting"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They detest ___ in public.", "s":{"type":"multiple_choice","options":["speak","speaking","to speaking"],"answer":1}}'::jsonb,
        '{"r":1, "p":"We like ___ new food.", "s":{"type":"multiple_choice","options":["trying","try","to trying"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I dread ___ that email.", "s":{"type":"multiple_choice","options":["reading","read","to reading"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She fears ___ alone.", "s":{"type":"multiple_choice","options":["to being","be","being"],"answer":2}}'::jsonb,
        '{"r":1, "p":"Do you enjoy ___?", "s":{"type":"multiple_choice","options":["running","run","to running"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Después del verbo ''enjoy'', el siguiente verbo debe ir en gerundio (-ing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''I hate to cooking'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Los verbos que expresan actitud hacia una actividad (like, love, hate) suelen ir seguidos de gerundio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''They detest cleaning'' significa que odian limpiar.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Después de ''like'' siempre debes usar infinitivo sin to.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''She dreads going'' significa que le aterra ir.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El verbo ''enjoy'' se puede seguir de un verbo en infinitivo (ej. enjoy to read).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Me gusta jugar al tenis.", "s":{"type":"scramble","chunks":["playing","I","tennis","like"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: A ella le encanta leer.", "s":{"type":"scramble","chunks":["loves","She","reading"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él odia cocinar.", "s":{"type":"scramble","chunks":["cooking","hates","He"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Disfrutamos viendo la tele.", "s":{"type":"scramble","chunks":["watching","We","TV","enjoy"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos detestan limpiar.", "s":{"type":"scramble","chunks":["detest","cleaning","They"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Temo volar.", "s":{"type":"scramble","chunks":["flying","I","fear"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: A él le gusta correr.", "s":{"type":"scramble","chunks":["He","running","likes"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Verbos Específicos (admit, avoid, suggest...) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"They admitted ___ (rob) the bank.", "s":{"type":"typing","correct_answers":["robbing"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The politician avoided ___ (talk) to the reporters.", "s":{"type":"typing","correct_answers":["talking"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It is worth ___ (save) for the future.", "s":{"type":"typing","correct_answers":["saving"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She is busy ___ (work).", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I can''t help ___ (sneeze).", "s":{"type":"typing","correct_answers":["sneezing"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I caught him ___ (steal) your bike.", "s":{"type":"typing","correct_answers":["stealing"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I suggested ___ (go) to the cinema.", "s":{"type":"typing","correct_answers":["going"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I regret ___ (buy) the bike.", "s":{"type":"typing","correct_answers":["buying"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"They denied ___ the money.", "s":{"type":"multiple_choice","options":["stealing","to steal","steal"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He avoided ___ my question.", "s":{"type":"multiple_choice","options":["to answer","answering","answer"],"answer":1}}'::jsonb,
        '{"r":2, "p":"This book is worth ___.", "s":{"type":"multiple_choice","options":["reading","to read","read"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We went ___ yesterday.", "s":{"type":"multiple_choice","options":["to shop","shopping","shop"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I can''t help ___ at his jokes.", "s":{"type":"multiple_choice","options":["laughing","to laugh","laugh"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She suggested ___ a break.", "s":{"type":"multiple_choice","options":["to take","taking","take"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Love means ___ for someone else.", "s":{"type":"multiple_choice","options":["caring","to care","care"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I remember ___ the door.", "s":{"type":"multiple_choice","options":["to lock","locking","lock"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Después del verbo ''avoid'' siempre se usa el gerundio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La expresión ''It is worth'' (vale la pena) va seguida de infinitivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''I can''t help sneezing'' significa ''No puedo evitar estornudar''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Se dice ''I suggest to go'' en lugar de ''I suggest going''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Después de ''go'' en actividades de ocio se usa gerundio (ej. go shopping, go fishing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''He denied robbing'' es la estructura correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Después de ''admit'' se usa infinitivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Evité hablar con él.", "s":{"type":"scramble","chunks":["talking","I","to him","avoided"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Vale la pena leerlo.", "s":{"type":"scramble","chunks":["reading","worth","It is"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella sugirió ir.", "s":{"type":"scramble","chunks":["going","She","suggested"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él admitió haber robado.", "s":{"type":"scramble","chunks":["stealing","admitted","He"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No puedo evitar reírme.", "s":{"type":"scramble","chunks":["laughing","can''t help","I"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Fui a pescar.", "s":{"type":"scramble","chunks":["fishing","I","went"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Lamento haber comprado esto.", "s":{"type":"scramble","chunks":["buying","regret","I","this"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Sujeto, Prohibiciones y Expresiones - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"___ (Smoke) is bad for you.", "s":{"type":"typing","correct_answers":["Smoking"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Read) is my favorite hobby.", "s":{"type":"typing","correct_answers":["Reading"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"No ___ (park) in this area.", "s":{"type":"typing","correct_answers":["parking"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"No ___ (smoke).", "s":{"type":"typing","correct_answers":["smoking"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Swim) is good exercise.", "s":{"type":"typing","correct_answers":["Swimming"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"In the ___ (begin)...", "s":{"type":"typing","correct_answers":["beginning"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Learn) English is important.", "s":{"type":"typing","correct_answers":["Learning"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The ___ (live)...", "s":{"type":"typing","correct_answers":["living"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"___ is bad for your health.", "s":{"type":"multiple_choice","options":["Smoking","Smoke","To smoking"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ fast is dangerous.", "s":{"type":"multiple_choice","options":["To driving","Driving","Drive"],"answer":1}}'::jsonb,
        '{"r":3, "p":"No ___ in the hallway.", "s":{"type":"multiple_choice","options":["running","run","to run"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ is a lot of fun.", "s":{"type":"multiple_choice","options":["To traveling","Traveling","Travel"],"answer":1}}'::jsonb,
        '{"r":3, "p":"No ___ allowed here.", "s":{"type":"multiple_choice","options":["eating","eat","to eat"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ vegetables is healthy.", "s":{"type":"multiple_choice","options":["Eating","Eat","To eating"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ early is a good habit.", "s":{"type":"multiple_choice","options":["To waking","Waking up","Wake up"],"answer":1}}'::jsonb,
        '{"r":3, "p":"In the ___ of the movie...", "s":{"type":"multiple_choice","options":["beginning","begin","began"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Un gerundio (-ing) puede utilizarse como el sujeto principal de una frase.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''Smoke is bad for you'' en lugar de ''Smoking is bad for you''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"En prohibiciones cortas con la palabra ''No'', el verbo siempre va en gerundio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''No smoking'' significa ''Prohibido fumar''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Se debe decir ''No to park'' para prohibir aparcar.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Learning is fun'' utiliza el gerundio como sustantivo/sujeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En expresiones como ''in the beginning'', se utiliza el gerundio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Fumar es malo para ti.", "s":{"type":"scramble","chunks":["Smoking","bad","is","for you"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Prohibido aparcar.", "s":{"type":"scramble","chunks":["parking","No"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Leer es divertido.", "s":{"type":"scramble","chunks":["fun","is","Reading"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Prohibido fumar aquí.", "s":{"type":"scramble","chunks":["here","No","smoking"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Nadar es bueno.", "s":{"type":"scramble","chunks":["good","Swimming","is"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Conducir rápido es peligroso.", "s":{"type":"scramble","chunks":["fast","dangerous","Driving","is"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: En el principio...", "s":{"type":"scramble","chunks":["the","beginning","In"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Preposiciones, STOP y Preferencias - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I am interested in ___ (learn).", "s":{"type":"typing","correct_answers":["learning"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She stopped ___ (talk).", "s":{"type":"typing","correct_answers":["talking"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I prefer singing to ___ (dance).", "s":{"type":"typing","correct_answers":["dancing"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I look forward to ___ (have) holidays.", "s":{"type":"typing","correct_answers":["having"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I get sad ___ (watch) the news.", "s":{"type":"typing","correct_answers":["watching"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He left without ___ (say) goodbye.", "s":{"type":"typing","correct_answers":["saying"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I apologize for ___ (be) late.", "s":{"type":"typing","correct_answers":["being"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Are you used to ___ (work) here?", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"I prefer reading to ___.", "s":{"type":"multiple_choice","options":["writing","write","to write"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She stopped ___ when I entered.", "s":{"type":"multiple_choice","options":["to speak","speaking","speak"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I am looking forward to ___ you.", "s":{"type":"multiple_choice","options":["seeing","see","to see"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He is good at ___.", "s":{"type":"multiple_choice","options":["paint","painting","to paint"],"answer":1}}'::jsonb,
        '{"r":4, "p":"They left without ___.", "s":{"type":"multiple_choice","options":["paying","pay","to pay"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I get tired ___.", "s":{"type":"multiple_choice","options":["to walk","walking","walk"],"answer":1}}'::jsonb,
        '{"r":4, "p":"We are interested in ___ the house.", "s":{"type":"multiple_choice","options":["buying","buy","to buy"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I am used to ___ early.", "s":{"type":"multiple_choice","options":["waking up","wake up","to wake up"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Después de una preposición (in, at, for, without), el verbo siempre va en gerundio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Se dice ''I am interested in learn''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En la estructura ''prefer... to...'', el segundo verbo va en gerundio (ej. prefer singing to dancing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El verbo ''stop'' cuando significa ''dejar de hacer algo'' va seguido de gerundio (ej. stop talking).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En ''look forward to'', la palabra ''to'' es parte del infinitivo, así que el verbo siguiente no lleva -ing.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''He left without saying goodbye'' es gramaticalmente correcto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Después de ''get + adjetivo'' a veces se usa gerundio (ej. I get sad watching).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Estoy interesado en aprender.", "s":{"type":"scramble","chunks":["learning","I am","in","interested"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella dejó de hablar.", "s":{"type":"scramble","chunks":["talking","She","stopped"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Prefiero cantar a bailar.", "s":{"type":"scramble","chunks":["dancing","I prefer","to","singing"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él se fue sin pagar.", "s":{"type":"scramble","chunks":["He","paying","left","without"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Estoy deseando verte (look forward to).", "s":{"type":"scramble","chunks":["seeing you","looking forward","I am","to"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Soy bueno pintando.", "s":{"type":"scramble","chunks":["good","painting","I am","at"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Me entristece ver las noticias.", "s":{"type":"scramble","chunks":["watching","sad","I get","the news"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 14, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Gerundios (-ING)', 
    'Aprende a usar el gerundio en inglés. Descubre cómo los verbos con terminación -ing pueden funcionar como sustantivos y las reglas exactas de cuándo utilizarlos.', 
    to_jsonb('## Grammar Lesson: Los Gerundios (-ING)
En inglés, el gerundio se forma añadiendo la terminación **-ing** a un verbo. A diferencia del español (donde el gerundio se usa casi exclusivamente para tiempos continuos como "estoy comiendo"), en inglés **el gerundio actúa como un sustantivo**.

Aquí tienes las reglas fundamentales de cuándo debes usar el gerundio:

##### 1. Después de Verbos de Actitud
Se utiliza el gerundio después de verbos que expresan gusto, disgusto o actitud hacia una actividad (como *love, hate, detest, dread, like, feel, fear, enjoy*, etc.).
*   *I like playing tennis.* (Me gusta jugar al tenis).
*   *She hates cooking.* (Ella odia cocinar).

##### 2. Después de Verbos Específicos
Existe una lista de verbos y expresiones concretas en inglés que siempre van seguidas de un gerundio: *admit, deny, avoid, be worth, busy, can''t help, catch, go* (para ocio), *mean, remember, suggest, regret*.
*   *They admitted robbing the bank.* (Admitieron haber robado el banco).
*   *It is worth saving.* (Vale la pena ahorrar).
*   *I can''t help sneezing.* (No puedo evitar estornudar).
*   *Let''s go shopping.* (Vamos de compras).

##### 3. Como Sujeto y en Prohibiciones
Dado que el gerundio actúa como un sustantivo, es la forma correcta para poner un verbo como sujeto de la frase. Además, se usa detrás de la palabra "NO" para crear prohibiciones cortas.
*   *Smoking is bad for you.* (Fumar es malo para ti).
*   *No smoking.* (Prohibido fumar).
*   *No parking.* (Prohibido aparcar).

##### 4. Después de Preposiciones y Casos Especiales
**Regla de Oro:** Si tienes un verbo justo después de **cualquier preposición** (*in, on, at, about, without, for*), ese verbo debe ir en gerundio. 
*   *I am interested in learning.* (Estoy interesado en aprender).
*   *He left without saying goodbye.* (Se fue sin despedirse).

Además, se usa en estas estructuras especiales:
*   **Stop:** Cuando significa "dejar de hacer algo" (*She stopped talking*).
*   **Prefer ... to ... :** (*I prefer singing to dancing*).
*   **To como preposición:** En expresiones como *look forward to* o *be used to*, el "to" es una preposición, por lo que exige gerundio (*I am looking forward to having holidays*).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Verbos de Actitud', 'Después de verbos que expresan gustos o emociones (like, love, hate, enjoy, dread), el siguiente verbo debe llevar la terminación -ing.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Verbos y Expresiones Específicas', 'Memoriza que verbos como admit, avoid, suggest, deny y expresiones como "can''t help" o "be worth" exigen siempre gerundio.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Sujeto de la Oración y Prohibiciones', 'Cuando un verbo es el sujeto principal (ej. "Fumar es malo"), usa el gerundio (Smoking). Para prohibiciones con "No", también (No smoking).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Preposiciones, Stop y Look forward to', 'Cualquier verbo detrás de una preposición (in, at, for, without) va en gerundio. Aplica igual para "stop" (dejar de) y "look forward to".');

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