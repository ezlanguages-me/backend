-- ============================================================
-- Seed: A0 English Path – Grammar – Recíprocos y Otras Estructuras
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
        -- REGLA 1: Recíprocos (Each other) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"They love ___ (mutuamente).", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We talk to ___ (el uno al otro) every day.", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Albert and Douglas aren''t talking to ___ (mutuamente).", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They help ___ (el uno al otro) with homework.", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We respect ___ (mutuamente).", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They are looking at ___ (el uno al otro).", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We need ___ (mutuamente).", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They smiled at ___ (el uno al otro).", "s":{"type":"typing","correct_answers":["each other"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué significa ''each other''?", "s":{"type":"multiple_choice","options":["Ellos mismos","El uno al otro (mutuamente)","Cada uno"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Dónde se coloca ''each other'' en una oración?", "s":{"type":"multiple_choice","options":["Detrás del verbo o preposición","Delante del verbo","Al principio de la frase"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They kiss ___ before going to work.", "s":{"type":"multiple_choice","options":["themselves","each other","every other"],"answer":1}}'::jsonb,
        '{"r":1, "p":"We don''t talk to ___ anymore.", "s":{"type":"multiple_choice","options":["each other","ourselves","us"],"answer":0}}'::jsonb,
        '{"r":1, "p":"John and Mary love ___.", "s":{"type":"multiple_choice","options":["each other","themselves","they"],"answer":0}}'::jsonb,
        '{"r":1, "p":"The two dogs are biting ___.", "s":{"type":"multiple_choice","options":["each other","itselves","them"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We should support ___.", "s":{"type":"multiple_choice","options":["ourselves","each other","us"],"answer":1}}'::jsonb,
        '{"r":1, "p":"They looked at ___ and laughed.", "s":{"type":"multiple_choice","options":["each other","themselves","every one"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Each other'' se utiliza cuando dos personas realizan la misma acción recíprocamente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Each other'' se coloca delante del verbo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La frase ''They love each other'' significa que se aman mutuamente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Each other'' significa exactamente lo mismo que ''themselves'' (a sí mismos).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Si Albert y Douglas discuten y no se hablan el uno al otro, decimos que ''they aren''t talking to each other''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Solo se puede usar ''each other'' en tiempo pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''We respect each other'' es una oración gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Se aman mutuamente.", "s":{"type":"scramble","chunks":["They","love","each other"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Hablamos el uno con el otro.", "s":{"type":"scramble","chunks":["We","talk to","each other"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Nos necesitamos mutuamente.", "s":{"type":"scramble","chunks":["need","We","each other"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Se miraron el uno al otro.", "s":{"type":"scramble","chunks":["They","looked at","each other"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Nos ayudamos mutuamente.", "s":{"type":"scramble","chunks":["each other","We","help"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Se respetan el uno al otro.", "s":{"type":"scramble","chunks":["respect","each other","They"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Se sonrieron mutuamente.", "s":{"type":"scramble","chunks":["smiled at","They","each other"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: So y Neither (Acuerdos) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I like pizza. ➔ ___ (A mí también) do I.", "s":{"type":"typing","correct_answers":["So"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I can''t swim. ➔ ___ (Yo tampoco) can I.", "s":{"type":"typing","correct_answers":["Neither"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I am happy. ➔ ___ (Yo también) am I.", "s":{"type":"typing","correct_answers":["So"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I don''t know. ➔ ___ (Yo tampoco) do I.", "s":{"type":"typing","correct_answers":["Neither"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I will go. ➔ ___ (Yo también) will I.", "s":{"type":"typing","correct_answers":["So"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I won''t do it. ➔ ___ (Yo tampoco) will I.", "s":{"type":"typing","correct_answers":["Neither"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I have a dog. ➔ ___ (Yo también) do I.", "s":{"type":"typing","correct_answers":["So"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I haven''t seen it. ➔ ___ (Yo tampoco) have I.", "s":{"type":"typing","correct_answers":["Neither"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"Si alguien dice ''I love apples'', y tú estás de acuerdo, dices:", "s":{"type":"multiple_choice","options":["So do I","Neither do I","So am I"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Si alguien dice ''I don''t like spiders'', ¿cómo dices ''Yo tampoco''?", "s":{"type":"multiple_choice","options":["So do I","Neither do I","Neither am I"],"answer":1}}'::jsonb,
        '{"r":2, "p":"''So'' se usa para expresar acuerdo con oraciones...", "s":{"type":"multiple_choice","options":["Afirmativas","Negativas","Interrogativas"],"answer":0}}'::jsonb,
        '{"r":2, "p":"''Neither'' se usa para expresar acuerdo con oraciones...", "s":{"type":"multiple_choice","options":["Afirmativas","Negativas","Imperativas"],"answer":1}}'::jsonb,
        '{"r":2, "p":"- I am very tired. - ___", "s":{"type":"multiple_choice","options":["So do I","So am I","Neither am I"],"answer":1}}'::jsonb,
        '{"r":2, "p":"- I won''t go to the party. - ___", "s":{"type":"multiple_choice","options":["Neither will I","So will I","Neither do I"],"answer":0}}'::jsonb,
        '{"r":2, "p":"- I can speak English. - ___", "s":{"type":"multiple_choice","options":["So can I","So do I","Neither can I"],"answer":0}}'::jsonb,
        '{"r":2, "p":"- I didn''t play yesterday. - ___", "s":{"type":"multiple_choice","options":["Neither did I","Neither do I","So did I"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''So'' se utiliza para coincidir con lo que otra persona ha dicho en una frase afirmativa.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Neither'' se utiliza para mostrar acuerdo con frases negativas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''So do I'' significa ''Yo tampoco''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La respuesta correcta a ''I can''t swim'' es ''Neither can I''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Estas estructuras se usan para llevarle la contraria a alguien.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"A la frase ''I am happy'', se responde ''So am I''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Si alguien dice ''I hate you'', la respuesta para decir ''yo también'' es ''Neither do I''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Yo también. (Con verbo auxiliar Do)", "s":{"type":"scramble","chunks":["So","do","I"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo tampoco. (Con verbo auxiliar Do)", "s":{"type":"scramble","chunks":["do","Neither","I"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo también. (Con verbo To Be)", "s":{"type":"scramble","chunks":["I","So","am"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo tampoco puedo.", "s":{"type":"scramble","chunks":["can","Neither","I"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo también lo haré (Will).", "s":{"type":"scramble","chunks":["So","will","I"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo tampoco lo he hecho (Have).", "s":{"type":"scramble","chunks":["I","have","Neither"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Yo también lo hice (Did).", "s":{"type":"scramble","chunks":["did","I","So"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Good vs. Well - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"He is a ___ (buen) dancer.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She sings very ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I am not feeling ___ (bien, de salud).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"This is a ___ (buen) book.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"You did ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is a ___ (buena) student.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He speaks English ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It is a ___ (buena) idea.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"La palabra ''Good'' es un...", "s":{"type":"multiple_choice","options":["Adjetivo","Adverbio","Verbo"],"answer":0}}'::jsonb,
        '{"r":3, "p":"La palabra ''Well'' es principalmente un...", "s":{"type":"multiple_choice","options":["Adjetivo","Adverbio","Pronombre"],"answer":1}}'::jsonb,
        '{"r":3, "p":"He plays tennis very ___.", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":1}}'::jsonb,
        '{"r":3, "p":"She is a ___ teacher.", "s":{"type":"multiple_choice","options":["well","good","best"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I don''t dance very ___.", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":1}}'::jsonb,
        '{"r":3, "p":"The food tastes ___ (con verbos de sentido/estado se usa el adjetivo).", "s":{"type":"multiple_choice","options":["good","well","better"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I don''t feel ___ today (salud).", "s":{"type":"multiple_choice","options":["good","well","best"],"answer":1}}'::jsonb,
        '{"r":3, "p":"You did a ___ job.", "s":{"type":"multiple_choice","options":["well","good","better"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Good'' es un adjetivo y describe a un sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Well'' es un adverbio y describe la forma en que se realiza una acción (el verbo).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La oración ''I play tennis good'' es gramaticalmente perfecta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Well'' puede actuar como adjetivo ÚNICAMENTE cuando significa estar bien de salud.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La frase ''He is a well dancer'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Se debe usar ''Good'' con verbos de estado o percepción (ej. It looks good).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Goodly'' es el adverbio correcto de ''good''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Ella es una buena bailarina.", "s":{"type":"scramble","chunks":["She is","a good","dancer"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Él juega muy bien al tenis.", "s":{"type":"scramble","chunks":["He plays tennis","very","well"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: La comida está muy buena.", "s":{"type":"scramble","chunks":["The food","is","very good"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: No me siento bien (salud).", "s":{"type":"scramble","chunks":["I don''t","feel","well"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Hiciste un buen trabajo.", "s":{"type":"scramble","chunks":["You did","a good","job"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos cantan muy bien.", "s":{"type":"scramble","chunks":["They sing","very","well"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Es una buena idea.", "s":{"type":"scramble","chunks":["It is","a good","idea"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Conjeturas (Modals of Deduction) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"It ___ (debe ser) true.", "s":{"type":"typing","correct_answers":["must be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"It ___ (no puede ser) him.", "s":{"type":"typing","correct_answers":["can''t be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (pudo haber sido) there.", "s":{"type":"typing","correct_answers":["may have been","might have been","could have been"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (debió haber sido) the thief.", "s":{"type":"typing","correct_answers":["must have been"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"It ___ (podría ser) raining.", "s":{"type":"typing","correct_answers":["might be","could be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (no pudieron haber sido) late.", "s":{"type":"typing","correct_answers":["can''t have been"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"It ___ (puede que sea) true.", "s":{"type":"typing","correct_answers":["may be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (puede ser) the boss.", "s":{"type":"typing","correct_answers":["may be"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué modal expresa certeza de que algo es verdad? (Debe ser)", "s":{"type":"multiple_choice","options":["must be","can''t be","may be"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué modal expresa certeza de que algo NO es verdad? (No puede ser)", "s":{"type":"multiple_choice","options":["must be","can''t be","might be"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Cómo dices ''debió haber sido'' (certeza en el pasado)?", "s":{"type":"multiple_choice","options":["must be","must have been","can''t have been"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Cómo dices ''no pudo haber sido'' (certeza negativa en el pasado)?", "s":{"type":"multiple_choice","options":["must have been","might have been","can''t have been"],"answer":2}}'::jsonb,
        '{"r":4, "p":"He drives a Ferrari. He ___ rich.", "s":{"type":"multiple_choice","options":["can''t be","must be","might have been"],"answer":1}}'::jsonb,
        '{"r":4, "p":"She was at work all day. She ___ the one who broke the window.", "s":{"type":"multiple_choice","options":["must have been","can''t have been","may be"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Take an umbrella. It ___ later (podría).", "s":{"type":"multiple_choice","options":["must rain","might rain","can''t rain"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Qué modal indica posibilidad? (Puede ser)", "s":{"type":"multiple_choice","options":["must be","can''t be","may be"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Must be'' se utiliza cuando hay bastante certeza de que algo es afirmativo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Can''t be'' expresa imposibilidad o certeza de que algo NO es verdad.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''May be'' expresa absoluta certeza y significa ''debe ser''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Para hacer deducciones en pasado se le añade ''have been'' al modal (ej. must have been).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Might be'' y ''Could be'' expresan que hay poca posibilidad de que algo sea cierto (podría ser).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Can''t have been'' significa ''no puede ser''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Se dice ''He must to be tired'' en lugar de ''He must be tired''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Debe ser verdad.", "s":{"type":"scramble","chunks":["It","must be","true"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No puede ser él.", "s":{"type":"scramble","chunks":["It","can''t be","him"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella pudo haber estado allí.", "s":{"type":"scramble","chunks":["She","may have been","there"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él debió haber sido el ladrón.", "s":{"type":"scramble","chunks":["He","must have been","the thief"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Podría estar lloviendo.", "s":{"type":"scramble","chunks":["It","might be","raining"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No pudieron haber llegado tarde.", "s":{"type":"scramble","chunks":["They","can''t have been","late"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Podría ser un error.", "s":{"type":"scramble","chunks":["It","could be","a mistake"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 20, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Recíprocos y Otras Estructuras', 
    'Aprende a expresar acciones mutuas, mostrar acuerdo con otras personas, dominar la diferencia entre "good" y "well", y hacer deducciones lógicas.', 
    to_jsonb('## Grammar Lesson: Recíprocos y Otras Estructuras
En esta lección agrupamos varias estructuras esenciales para darle naturalidad a tu inglés:

##### 1. Recíprocos (Each other)
Significa "el uno al otro" o "mutuamente". Se usa cuando dos personas realizan la misma acción recíprocamente y recae sobre ellos mismos. Se coloca detrás del verbo.
*   *He loves her. She loves him. ➔ They love each other.* (Se aman mutuamente)
*   *Albert and Douglas aren’t talking to each other.* (No se hablan el uno al otro)

##### 2. Acuerdos (So y Neither)
Se utilizan para expresar acuerdo o coincidencia con lo que otra persona acaba de decir (para decir "yo también" o "yo tampoco"). Utilizan el verbo auxiliar correspondiente.
*   **SO:** Se usa para coincidir con frases **afirmativas**.
    *   *I like pizza. ➔ So do I.* (Yo también)
    *   *I am happy. ➔ So am I.* (Yo también)
*   **NEITHER:** Se usa para coincidir con frases **negativas**.
    *   *I can''t swim. ➔ Neither can I.* (Yo tampoco)
    *   *I don''t know. ➔ Neither do I.* (Yo tampoco)

##### 3. Good vs. Well
Es un error muy común confundirlos, pero tienen funciones totalmente distintas:
*   **GOOD (Bueno):** Es un **adjetivo** y describe a un sustantivo. (Ej. *I am a good dancer*).
*   **WELL (Bien):** Es un **adverbio** y describe cómo se realiza una acción (el verbo). (Ej. *I don''t dance very well*). La única excepción es usar "well" como adjetivo para decir "en buena salud" (Ej. *I don''t feel well*).

##### 4. Conjeturas (Modals of Deduction)
Se usan para deducir lógicamente algo que creemos cierto, imposible o posible.
*   **Certeza positiva:** Hay bastante certeza de que SÍ es así.
    *   Presente: *Must be* (Debe ser).
    *   Pasado: *Must have been* (Debió haber sido).
*   **Certeza negativa:** Hay certeza de que NO es así.
    *   Presente: *Can''t be* (No puede ser).
    *   Pasado: *Can''t have been* (No pudo haber sido).
*   **Posibilidad:** Hay duda o poca posibilidad.
    *   Presente: *May be / Might be / Could be* (Puede / podría ser).
    *   Pasado: *May have been / Might have been* (Pudo / podría haber sido).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Recíprocos (Each other)', 'Recuerda: Usa "each other" cuando dos o más personas se hacen algo mutuamente (ej. they love each other). Va siempre detrás del verbo.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Acuerdos (So y Neither)', 'Usa "So" para coincidir con una afirmación (So do I - Yo también) y "Neither" para coincidir con una negación (Neither do I - Yo tampoco).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Good vs. Well', 'Acuérdate: "Good" es un adjetivo (un buen libro), mientras que "Well" es un adverbio para describir cómo se hace una acción (canta bien).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Conjeturas y Deducciones', 'Certezas: must be (SÍ debe ser) / can''t be (NO puede ser). Posibilidades: may/might be (podría ser). En pasado, añádeles "have been".');

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