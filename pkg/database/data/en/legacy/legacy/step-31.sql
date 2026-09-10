-- ============================================================
-- Seed: A0 English Path – Grammar – Good vs Well (Completo >100)
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
        -- REGLA 1: Good como Adjetivo - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"He is a ___ (buen) boy.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It is a ___ (buen) book.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We had a ___ (buen) time at the party.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She is a ___ (buena) singer.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"This is a very ___ (buena) idea.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They are ___ (buenos) students.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I need a ___ (buen) computer for work.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You have a ___ (buen) heart.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué tipo de palabra es ''Good''?", "s":{"type":"multiple_choice","options":["Adjetivo","Adverbio","Verbo"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He is a ___ tennis player.", "s":{"type":"multiple_choice","options":["good","well","best"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She gave me some ___ advice.", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":0}}'::jsonb,
        '{"r":1, "p":"That was a ___ movie.", "s":{"type":"multiple_choice","options":["well","good","better"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I want to buy a ___ car.", "s":{"type":"multiple_choice","options":["good","well","more good"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They are ___ friends.", "s":{"type":"multiple_choice","options":["well","good","best"],"answer":1}}'::jsonb,
        '{"r":1, "p":"A ''Good'' siempre le sigue (o modifica a) un...", "s":{"type":"multiple_choice","options":["Sustantivo","Verbo","Adverbio"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Have a ___ trip!", "s":{"type":"multiple_choice","options":["good","well","better"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Good'' es un adjetivo que sirve para describir a personas, lugares o cosas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''He is a well dancer''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La frase ''It is a good idea'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Good'' se utiliza normalmente para describir CÓMO se realiza una acción.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Podemos decir ''a good book'' porque ''book'' es un sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El plural de ''good'' como adjetivo descriptivo es ''goods'' (ej. They are goods boys).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Good'' siempre precede al sustantivo o sigue al verbo TO BE.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Él es un buen estudiante.", "s":{"type":"scramble","chunks":["He is","a good","student"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Es una buena idea.", "s":{"type":"scramble","chunks":["a good","idea","It is"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Tuvimos un buen viaje.", "s":{"type":"scramble","chunks":["a good","We had","trip"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Son buenos chicos.", "s":{"type":"scramble","chunks":["good","They are","boys"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella tiene un buen trabajo.", "s":{"type":"scramble","chunks":["She has","job","a good"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Es un buen libro.", "s":{"type":"scramble","chunks":["book","This is","a good"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Eres una buena persona.", "s":{"type":"scramble","chunks":["You are","person","a good"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Well como Adverbio - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"She sings very ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He plays tennis ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I slept very ___ (bien) last night.", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You did ___ (bien) on the test.", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They speak English ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She drives very ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He explained it ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We worked ___ (bien) together.", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué tipo de palabra es ''Well'' normalmente?", "s":{"type":"multiple_choice","options":["Adjetivo","Adverbio","Pronombre"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I play soccer very ___.", "s":{"type":"multiple_choice","options":["good","well","better"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Did you sleep ___?", "s":{"type":"multiple_choice","options":["good","well","best"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Everything is going ___.", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":1}}'::jsonb,
        '{"r":2, "p":"She speaks Spanish very ___.", "s":{"type":"multiple_choice","options":["good","well","goodest"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Un adverbio como ''Well'' modifica directamente a...", "s":{"type":"multiple_choice","options":["Un sustantivo","Un verbo","Una preposición"],"answer":1}}'::jsonb,
        '{"r":2, "p":"They did their job ___.", "s":{"type":"multiple_choice","options":["good","well","better"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I know him very ___.", "s":{"type":"multiple_choice","options":["well","good","goodly"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Well'' es un adverbio que responde a la pregunta de CÓMO se hace una acción.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''He speaks English good'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"El adverbio derivado de ''good'' no es ''goodly'', sino ''well''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''She plays the piano well'' es una oración correcta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Well'' suele colocarse delante del verbo principal (ej. He well plays).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Cuando quieres alabar cómo alguien cantó, dices ''You sang very well''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Podemos usar ''Well'' para modificar a un sustantivo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Ella canta muy bien.", "s":{"type":"scramble","chunks":["She sings","well","very"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él habla inglés bien.", "s":{"type":"scramble","chunks":["English","He speaks","well"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Dormiste bien.", "s":{"type":"scramble","chunks":["well","You","slept"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Lo hicieron bien.", "s":{"type":"scramble","chunks":["well","They did","it"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Trabajamos muy bien juntos.", "s":{"type":"scramble","chunks":["together","We worked","very well"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Todo está yendo bien.", "s":{"type":"scramble","chunks":["going","Everything is","well"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él cocina bien.", "s":{"type":"scramble","chunks":["cooks","He","well"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Verbos de Estado y Sentidos (Linking Verbs) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"The pizza tastes ___ (buena/bien).", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"This perfume smells ___ (bien).", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"You look ___ (bien) in that dress.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The music sounds ___ (bien).", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I feel ___ (bien, feliz) about my results.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It seems like a ___ (buena) option.", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The soup tastes very ___ (buena).", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"These flowers smell ___ (bien).", "s":{"type":"typing","correct_answers":["good"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"This cake tastes ___.", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Your new haircut looks ___.", "s":{"type":"multiple_choice","options":["well","good","better"],"answer":1}}'::jsonb,
        '{"r":3, "p":"That guitar sounds really ___.", "s":{"type":"multiple_choice","options":["well","good","best"],"answer":1}}'::jsonb,
        '{"r":3, "p":"Con verbos relacionados a los 5 sentidos (look, smell, taste, sound) se utiliza...", "s":{"type":"multiple_choice","options":["El adjetivo (Good)","El adverbio (Well)","Cualquiera de los dos"],"answer":0}}'::jsonb,
        '{"r":3, "p":"These cookies smell ___.", "s":{"type":"multiple_choice","options":["good","well","goodest"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I feel ___ about my decision (estado emocional).", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She seems like a ___ person.", "s":{"type":"multiple_choice","options":["good","well","wellest"],"answer":0}}'::jsonb,
        '{"r":3, "p":"The plan sounds ___ to me.", "s":{"type":"multiple_choice","options":["well","good","more good"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Los verbos de estado y percepción (smell, taste, look, sound) van seguidos de adjetivos, no de adverbios.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''The pizza tastes well''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''You look good'' se usa para decirle a alguien que tiene muy buen aspecto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para decir que una canción suena bien, debemos decir ''The song sounds well''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Con los verbos de estado, ''Good'' no describe cómo se hace una acción, sino una cualidad del sujeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''I feel good'' se usa habitualmente para expresar un estado emocional o de felicidad.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Los verbos de los cinco sentidos se consideran verbos de acción pura y siempre requieren adverbios.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: La comida sabe bien.", "s":{"type":"scramble","chunks":["tastes","The food","good"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Esa música suena bien.", "s":{"type":"scramble","chunks":["music","sounds good","That"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Te ves bien hoy.", "s":{"type":"scramble","chunks":["look good","You","today"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: El perfume huele muy bien.", "s":{"type":"scramble","chunks":["very good","smells","The perfume"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Me siento bien por ello.", "s":{"type":"scramble","chunks":["about it","I feel","good"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Parece una buena idea.", "s":{"type":"scramble","chunks":["a good idea","It seems","like"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: El pastel huele bien.", "s":{"type":"scramble","chunks":["good","smells","The cake"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Well como Adjetivo (Salud) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"I don''t feel ___ (bien de salud).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She is not very ___ (bien de salud) today.", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Hope you get ___ (bien, recuperarte) soon.", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Are you feeling ___ (bien, salud) today?", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He stayed home because he wasn''t ___ (bien, enfermo).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I am quite ___ (bien de salud), thank you.", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"The patient is not quite ___ (bien).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Eat soup if you don''t feel ___ (bien de salud).", "s":{"type":"typing","correct_answers":["well"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Cuál es la ÚNICA excepción donde ''Well'' funciona como un adjetivo?", "s":{"type":"multiple_choice","options":["Para hablar de la salud","Para describir comida","Para hablar de música"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I missed school because I wasn''t feeling ___.", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Get ___ soon! (Que te mejores)", "s":{"type":"multiple_choice","options":["good","better","well"],"answer":2}}'::jsonb,
        '{"r":4, "p":"My grandmother was sick, but now she is ___.", "s":{"type":"multiple_choice","options":["good","well","goodly"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I have a headache, I don''t feel ___.", "s":{"type":"multiple_choice","options":["good","well","best"],"answer":1}}'::jsonb,
        '{"r":4, "p":"- How are you? - I am very ___, thanks.", "s":{"type":"multiple_choice","options":["well","good (sólo para ánimo)","Ambas pueden ser correctas según el contexto"],"answer":2}}'::jsonb,
        '{"r":4, "p":"He looks pale. He doesn''t look ___ (sano).", "s":{"type":"multiple_choice","options":["good","well","goodest"],"answer":1}}'::jsonb,
        '{"r":4, "p":"The doctor said I am completely ___.", "s":{"type":"multiple_choice","options":["well","good","best"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Well'' puede ser un adjetivo EXCLUSIVAMENTE cuando significa ''estar bien de salud o sano''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I don''t feel well'' significa que no sé tocar algo con las manos.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Para desear que alguien se recupere de una enfermedad, se dice ''Get well soon''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Si digo ''I feel good'' me refiero principalmente a que mi cuerpo no tiene enfermedades.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En el contexto de salud médica, es correcto usar ''well'' después de los verbos ''be'' o ''feel''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''She is not well'' significa que ella está enferma.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La salud física siempre se describe con el adjetivo ''Good''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: No me siento bien (de salud).", "s":{"type":"scramble","chunks":["don''t feel","I","well"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Que te mejores pronto.", "s":{"type":"scramble","chunks":["Get","soon","well"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella no está muy bien hoy (salud).", "s":{"type":"scramble","chunks":["very well","today","She is not"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Te sientes bien?", "s":{"type":"scramble","chunks":["well?","Are you","feeling"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él no parecía bien (sano).", "s":{"type":"scramble","chunks":["He","look well","didn''t"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: El paciente está completamente sano.", "s":{"type":"scramble","chunks":["completely well","is","The patient"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Me fui a casa porque no estaba bien.", "s":{"type":"scramble","chunks":["because I wasn''t","well","I went home"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 21, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Good vs. Well', 
    'Aprende de una vez por todas la sutil diferencia entre el adjetivo "good" y el adverbio "well", y descubre sus excepciones con la salud y los sentidos.', 
    to_jsonb('## Grammar Lesson: Good vs. Well
Es uno de los errores más clásicos al aprender inglés: confundir cuándo usar "Good" y cuándo usar "Well". La clave está en observar qué es lo que están describiendo.

##### 1. GOOD (El Adjetivo)
**Good** significa "bueno/a" o "buenos/as". Como es un adjetivo, su única función en la vida es describir a un **sustantivo** (una persona, un lugar, una cosa o una idea). Puede ir delante del sustantivo o después del verbo "To Be".
*   *He is a good dancer.* (Él es un buen bailarín. Describe al bailarín).
*   *This is a good book.* (Este es un buen libro. Describe al libro).
*   *The movie was good.* (La película fue buena).

##### 2. WELL (El Adverbio)
**Well** significa "bien". Es un adverbio, lo que significa que describe **CÓMO** se realiza una acción (modifica a un **verbo**). Se suele colocar detrás del verbo que describe.
*   *He dances well.* (Él baila bien. Describe la forma de bailar).
*   *She sings very well.* (Ella canta muy bien).
*   *You did the test well.* (Hiciste el test bien).

##### 3. Excepción 1: Verbos de Estado y Sentidos
En inglés, hay unos verbos especiales llamados "Linking Verbs" (verbos copulativos) o verbos de los cinco sentidos. Estos son: **Taste (saber), Smell (oler), Look (parecer/verse), Sound (sonar), Feel (sentirse) y Seem (parecer)**. 
Con estos verbos **NUNCA usamos "well", siempre usamos el adjetivo "GOOD"**, porque estamos describiendo el estado del sujeto, no la acción.
*   *The pizza tastes good.* (La pizza sabe bien/buena). ¡NO se dice "tastes well"!
*   *You look good today.* (Te ves bien hoy).
*   *That idea sounds good.* (Esa idea suena bien).

##### 4. Excepción 2: Well como Salud
La única vez en todo el idioma inglés en la que "Well" funciona como un adjetivo es cuando hablamos de **salud física** o de estar sano.
*   *I don''t feel well.* (No me siento bien / Estoy enfermo).
*   *Get well soon!* (¡Que te mejores pronto!).
*   *She is not well today.* (Ella no está bien de salud hoy).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Good como Adjetivo', 'Recuerda: "Good" es un adjetivo que describe sustantivos (personas, objetos, ideas). Ej: "He is a good boy".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Well como Adverbio', 'Recuerda: "Well" es un adverbio que describe cómo se realiza una acción (modifica al verbo). Ej: "She dances very well".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Verbos de Sentidos + Good', '¡Cuidado! Detrás de los verbos feel, look, smell, taste, sound y seem siempre debes usar "Good" (no "well"). Ej: "The food tastes good".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Well como Salud', 'La única excepción donde "Well" describe un estado es para hablar de la salud física. Ej: "I don''t feel well" (estoy enfermo).');

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