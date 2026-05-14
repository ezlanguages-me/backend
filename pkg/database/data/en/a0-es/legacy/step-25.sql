-- ============================================================
-- Seed: A0 English Path – Grammar – Infinitivos (Completo >100)
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
        -- REGLA 1: Con TO (Propósito, Adjetivos, Too/Enough) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I am glad ___ (see) you.", "s":{"type":"typing","correct_answers":["to see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I went to London ___ (learn).", "s":{"type":"typing","correct_answers":["to learn"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He is too young ___ (vote).", "s":{"type":"typing","correct_answers":["to vote"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He is not old enough ___ (vote).", "s":{"type":"typing","correct_answers":["to vote"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I am happy ___ (help) you.", "s":{"type":"typing","correct_answers":["to help"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Are you ready ___ (go)?", "s":{"type":"typing","correct_answers":["to go"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It is hard ___ (understand).", "s":{"type":"typing","correct_answers":["to understand"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She stopped ___ (talk) to me.", "s":{"type":"typing","correct_answers":["to talk"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"I am happy ___ you.", "s":{"type":"multiple_choice","options":["to see","see","seeing"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I went to the store ___ bread.", "s":{"type":"multiple_choice","options":["to buy","for buy","buy"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He is too tired ___.", "s":{"type":"multiple_choice","options":["work","to work","working"],"answer":1}}'::jsonb,
        '{"r":1, "p":"She is smart enough ___ the test.", "s":{"type":"multiple_choice","options":["pass","to pass","passing"],"answer":1}}'::jsonb,
        '{"r":1, "p":"It is difficult ___ this.", "s":{"type":"multiple_choice","options":["to do","do","doing"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I called ___ you a question.", "s":{"type":"multiple_choice","options":["for ask","to ask","asking"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Are you ready ___?", "s":{"type":"multiple_choice","options":["to order","order","for order"],"answer":0}}'::jsonb,
        '{"r":1, "p":"The water is too cold ___.", "s":{"type":"multiple_choice","options":["swim","swimming","to swim"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El infinitivo de propósito (para decir el porqué se hace algo) siempre lleva TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Después de un adjetivo, normalmente el verbo va con TO (ej. glad to see you).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''He is too young to vote'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La estructura correcta es ''enough old to vote'' en lugar de ''old enough to vote''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Para decir ''Fui para aprender'' se dice ''I went for learn''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''She stopped to talk to me'' significa que se detuvo con el propósito de hablarme.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Too + adjetivo'' siempre va seguido de un verbo sin TO.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Me alegra verte.", "s":{"type":"scramble","chunks":["glad","I am","to see you"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Fui a Londres para estudiar.", "s":{"type":"scramble","chunks":["to study","I went","to London"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él es demasiado joven para conducir.", "s":{"type":"scramble","chunks":["He is","to drive","too young"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella es lo suficientemente mayor para votar.", "s":{"type":"scramble","chunks":["old enough","She is","to vote"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Es difícil de decir.", "s":{"type":"scramble","chunks":["hard","It is","to say"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Paramos para comer.", "s":{"type":"scramble","chunks":["to eat","We","stopped"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Estoy feliz de ayudar.", "s":{"type":"scramble","chunks":["happy","I am","to help"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Con TO (Verbos, Semiauxiliares, Objeto Personal) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I would like ___ (leave).", "s":{"type":"typing","correct_answers":["to leave"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I remembered ___ (lock) the door.", "s":{"type":"typing","correct_answers":["to lock"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I meant ___ (tell) you.", "s":{"type":"typing","correct_answers":["to tell"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I have ___ (do) the ironing.", "s":{"type":"typing","correct_answers":["to do"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She advised me ___ (rest).", "s":{"type":"typing","correct_answers":["to rest"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It started ___ (rain).", "s":{"type":"typing","correct_answers":["to rain"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I want ___ (go) home.", "s":{"type":"typing","correct_answers":["to go"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I prefer to read than ___ (write).", "s":{"type":"typing","correct_answers":["to write"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"I would like ___ a coffee.", "s":{"type":"multiple_choice","options":["to order","order","ordering"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I remembered ___ the door.", "s":{"type":"multiple_choice","options":["to close","close","for close"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She advised me ___ rest.", "s":{"type":"multiple_choice","options":["to","for","that"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I have ___ work today.", "s":{"type":"multiple_choice","options":["to","for","in"],"answer":0}}'::jsonb,
        '{"r":2, "p":"It started ___ rain.", "s":{"type":"multiple_choice","options":["rain","raining","to rain"],"answer":2}}'::jsonb,
        '{"r":2, "p":"They are going ___ win.", "s":{"type":"multiple_choice","options":["win","to win","winning"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He asked me ___ help.", "s":{"type":"multiple_choice","options":["help","to help","helping"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I prefer to read than ___ write.", "s":{"type":"multiple_choice","options":["write","writing","to write"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Después de ''would like'' siempre se debe usar el infinitivo con TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''I remembered to lock'' significa ''recordé cerrar'' (no olvidé hacerlo).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Después del verbo ''mean'' (tener intención de), el siguiente verbo va sin TO.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"En ''She advised me to rest'', la estructura correcta requiere un TO después del objeto personal (me).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Los semiauxiliares como ''have to'', ''be going to'' o ''be able to'' siempre llevan TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Después de ''start'' (para actividades largas), se puede usar el infinitivo con TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Se dice ''I prefer to read than write'' sin repetir el TO en el segundo verbo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Me gustaría pedir.", "s":{"type":"scramble","chunks":["to order","would like","I"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Recordé cerrar la puerta.", "s":{"type":"scramble","chunks":["the door","to lock","I remembered"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella me aconsejó descansar.", "s":{"type":"scramble","chunks":["me","to rest","She advised"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Empezó a llover.", "s":{"type":"scramble","chunks":["to rain","started","It"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Tengo que hacer mis deberes.", "s":{"type":"scramble","chunks":["to do","I have","my homework"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él me pidió que ayudara.", "s":{"type":"scramble","chunks":["He asked","to help","me"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Prefiero leer que escribir.", "s":{"type":"scramble","chunks":["to write","than","I prefer","to read"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: SIN TO (Modales, Let, Make, Had better) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"They must ___ (go) home now.", "s":{"type":"typing","correct_answers":["go"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Let me ___ (come) in.", "s":{"type":"typing","correct_answers":["come"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"You make me ___ (feel) good.", "s":{"type":"typing","correct_answers":["feel"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"You had better ___ (study) hard.", "s":{"type":"typing","correct_answers":["study"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I would rather ___ (stay) at home.", "s":{"type":"typing","correct_answers":["stay"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She can ___ (speak) English.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We should ___ (listen).", "s":{"type":"typing","correct_answers":["listen"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He will ___ (help) you.", "s":{"type":"typing","correct_answers":["help"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"You must ___ now.", "s":{"type":"multiple_choice","options":["go","to go","going"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Let me ___.", "s":{"type":"multiple_choice","options":["to help","help","helping"],"answer":1}}'::jsonb,
        '{"r":3, "p":"You make me ___ happy.", "s":{"type":"multiple_choice","options":["to feel","feel","feeling"],"answer":1}}'::jsonb,
        '{"r":3, "p":"You had better ___ hard.", "s":{"type":"multiple_choice","options":["study","to study","studying"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I would rather ___ at home.", "s":{"type":"multiple_choice","options":["to stay","stay","staying"],"answer":1}}'::jsonb,
        '{"r":3, "p":"She can ___ English.", "s":{"type":"multiple_choice","options":["to speak","speak","speaking"],"answer":1}}'::jsonb,
        '{"r":3, "p":"We should ___.", "s":{"type":"multiple_choice","options":["to leave","leave","leaving"],"answer":1}}'::jsonb,
        '{"r":3, "p":"He will ___ you.", "s":{"type":"multiple_choice","options":["to call","call","calling"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Los verbos modales (can, must, should) nunca van seguidos de TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Se debe decir ''Let me to come in''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Es incorrecto decir ''You make me to feel good''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Después de la expresión ''had better'' (más vale que), el verbo va sin TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Después de ''would rather'' (preferiría), se necesita el TO.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''She can to play the piano'' es una frase gramaticalmente incorrecta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Los verbos let y make obligan a que el siguiente verbo vaya en infinitivo sin TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Ellos deben irse a casa ahora.", "s":{"type":"scramble","chunks":["go home","must","They","now"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Déjame entrar.", "s":{"type":"scramble","chunks":["come in","Let","me"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Tú me haces sentir bien.", "s":{"type":"scramble","chunks":["make me","feel good","You"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Más te vale estudiar mucho.", "s":{"type":"scramble","chunks":["study hard","had better","You"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Preferiría quedarme aquí.", "s":{"type":"scramble","chunks":["stay here","would rather","I"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella puede tocar la guitarra.", "s":{"type":"scramble","chunks":["can","play","She","the guitar"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Deberíamos irnos pronto.", "s":{"type":"scramble","chunks":["leave","We","should","early"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: SIN TO (Percepción, Conjunciones y Why) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I saw him ___ (fall).", "s":{"type":"typing","correct_answers":["fall"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I heard her ___ (sing).", "s":{"type":"typing","correct_answers":["sing"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Why ___ (study) if you know the answers?", "s":{"type":"typing","correct_answers":["study"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Why not ___ (go) with him?", "s":{"type":"typing","correct_answers":["go"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Joan wants to visit China and ___ (buy) a house.", "s":{"type":"typing","correct_answers":["buy"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I can do nothing but ___ (wait).", "s":{"type":"typing","correct_answers":["wait"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I felt it ___ (move).", "s":{"type":"typing","correct_answers":["move"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I watched them ___ (play).", "s":{"type":"typing","correct_answers":["play"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"I saw him ___.", "s":{"type":"multiple_choice","options":["to fall","fall","falling"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I heard her ___.", "s":{"type":"multiple_choice","options":["to cry","cry","crying"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Why ___ if you know?", "s":{"type":"multiple_choice","options":["to study","study","studying"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Why not ___ with him?", "s":{"type":"multiple_choice","options":["to go","go","going"],"answer":1}}'::jsonb,
        '{"r":4, "p":"He wants to eat and ___.", "s":{"type":"multiple_choice","options":["to drink","drink","drinking"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I felt the earth ___.", "s":{"type":"multiple_choice","options":["shake","to shake","shaking"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She watched him ___.", "s":{"type":"multiple_choice","options":["to leave","leave","leaving"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Why ___ sad?", "s":{"type":"multiple_choice","options":["to be","be","being"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Después de verbos de percepción (see, hear, smell), el segundo verbo va sin TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I saw him to fall'' es correcto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Después de la conjunción ''and'', el segundo verbo normalmente no lleva TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Se dice ''Why to study?'' en lugar de ''Why study?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Why not go?'' es una forma correcta de sugerir algo utilizando el infinitivo sin TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I heard him to sing'' es incorrecto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Después de las conjunciones AND, BUT, OR, y EXCEPT, se omite el TO del infinitivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Lo vi caer.", "s":{"type":"scramble","chunks":["fall","I","saw him"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Por qué no ir con él?", "s":{"type":"scramble","chunks":["with him","Why not","go"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: La escuché cantar una canción.", "s":{"type":"scramble","chunks":["heard her","I","sing a song"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Por qué preocuparse por ello?", "s":{"type":"scramble","chunks":["worry","about it","Why"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él quiere sentarse y descansar.", "s":{"type":"scramble","chunks":["He wants","and rest","to sit"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Sentí la casa temblar.", "s":{"type":"scramble","chunks":["the house","shake","I felt"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Los vi jugar al fútbol.", "s":{"type":"scramble","chunks":["play football","I watched","them"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 15, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Infinitivos (Con TO y Sin TO)', 
    'Aprende cuándo usar los verbos en infinitivo acompañado de la partícula TO y en qué casos especiales debes omitirla por completo.', 
    to_jsonb('## Grammar Lesson: Los Infinitivos
El infinitivo es la forma base de un verbo (como *comer, jugar, vivir* en español). En inglés, el infinitivo generalmente va precedido por la partícula **TO** (ej. *to play*), pero existen muchas excepciones donde se usa "desnudo" (sin el TO).

##### 1. Infinitivo CON TO: Casos Generales
Siempre debes usar **TO** antes del verbo en los siguientes casos:
*   **Después de adjetivos:** *I''m glad to see you.* (Me alegra verte).
*   **Propósito o intención:** Cuando explicas el porqué. *I went there to learn.* (Fui allí para aprender).
*   **Después de TOO y ENOUGH:** *He''s too young to vote.* / *He''s old enough to vote.*

##### 2. Infinitivo CON TO: Verbos Específicos
Algunos verbos y estructuras siempre exigen un TO:
*   **Like / Would Like:** Para expresar voluntad u ofrecimientos. *I would like to leave.*
*   **Otros verbos:** *mean* (intención), *prefer... than*, *propose*, *regret*, *remember*, *start* (para actividades largas).
*   **Semiauxiliares:** *have to* (tener que), *be going to* (ir a), *be able to* (ser capaz de).
*   **Con objeto indirecto explícito:** *She advised me to rest.* (Me aconsejó descansar) / *He asked me to help.* (Me pidió que ayudara).

##### 3. Infinitivo SIN TO: Modales y Verbos Causativos
Aquí es donde debes omitir la partícula TO por completo:
*   **Verbos Modales:** Después de *can, could, must, should, may, will*, el verbo va "desnudo". *They must go home now.* (Nunca digas *must to go*).
*   **Make y Let:** Cuando obligas o permites. *Let me come in.* (Déjame entrar) / *You make me feel good.* (Me haces sentir bien).
*   **Had better / Would rather:** *You had better study hard.* (Más te vale estudiar).

##### 4. Infinitivo SIN TO: Percepción, Conjunciones y Why
*   **Verbos de Percepción:** Después de *see, hear, smell, sense*, etc. *I saw him fall.* (Lo vi caer).
*   **Conjunciones:** Después de *AND, BUT, OR, EXCEPT* cuando enlazas dos verbos. *Joan wants to visit China and buy a house there.*
*   **Preguntas con Why / Why not:** Al sugerir algo directamente. *Why not go with him?* (¿Por qué no ir con él?).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Adjetivos, Propósito y Too/Enough', 'El infinitivo lleva "TO" cuando va detrás de un adjetivo, cuando expresa un propósito (para hacer algo) o detrás de expresiones con "too" o "enough".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Verbos Específicos y Semiauxiliares', 'Verbos como would like, remember, mean, y semiauxiliares como "have to" o "be going to" siempre exigen el TO antes del verbo principal.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Modales, Let, Make y Had better', 'La regla más importante: los verbos modales (must, can, should) y los verbos let, make, had better o would rather NUNCA llevan TO.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Percepción, Conjunciones y Preguntas Why', 'Omite el TO después de los verbos de percepción (see, hear, smell), detrás de "and/or/but/except", o en las preguntas "Why" y "Why not".');

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