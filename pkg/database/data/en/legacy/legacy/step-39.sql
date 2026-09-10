-- ============================================================
-- Seed: A0 English Path – Grammar – Alone, Lonely, Only & Single
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
        -- REGLA 1: Alone (Físicamente Solo) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"We were ___ (solos) in the restaurant.", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I want to be ___ (solo) right now.", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She lives ___ (sola).", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Don''t go there ___ (solo/a).", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He walked home ___ (solo).", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Please, leave me ___ (solo/en paz).", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They left him ___ (solo).", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I was ___ (solo) at home.", "s":{"type":"typing","correct_answers":["alone"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué palabra se refiere a estar ''físicamente'' sin compañía?", "s":{"type":"multiple_choice","options":["Alone","Lonely","Single"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We were completely ___ in the restaurant.", "s":{"type":"multiple_choice","options":["alone","lonely","only"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Leave me ___!", "s":{"type":"multiple_choice","options":["single","alone","lonely"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Do you live ___?", "s":{"type":"multiple_choice","options":["only","lonely","alone"],"answer":2}}'::jsonb,
        '{"r":1, "p":"She doesn''t like walking ___ at night.", "s":{"type":"multiple_choice","options":["alone","lonely","single"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He was left completely ___ in the big building.", "s":{"type":"multiple_choice","options":["lonely","alone","only"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Which word describes the physical state of being without other people?", "s":{"type":"multiple_choice","options":["Lonely","Only","Alone"],"answer":2}}'::jsonb,
        '{"r":1, "p":"They traveled to Europe ___.", "s":{"type":"multiple_choice","options":["alone","lonely","only"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Alone'' se usa exclusivamente para expresar soledad emocional y tristeza.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''We were alone'' significa ''Estábamos solos físicamente''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La palabra ''Alone'' se traduce como ''solamente'' en español.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Puedes estar rodeado de mil personas en un concierto y aun así decir que estás físicamente ''alone''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La expresión ''Leave me alone'' significa ''Déjame en paz/solo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''She lives alone'' significa que vive en una casa sin nadie más.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Alone'' y ''Lonely'' significan exactamente lo mismo y son siempre intercambiables.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Vivo solo.", "s":{"type":"scramble","chunks":["alone","I","live"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Estábamos solos.", "s":{"type":"scramble","chunks":["alone","We","were"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Déjame en paz (solo).", "s":{"type":"scramble","chunks":["alone","Leave","me"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: No vayas solo.", "s":{"type":"scramble","chunks":["alone","Don''t","go"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella caminó sola.", "s":{"type":"scramble","chunks":["alone","She","walked"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él estaba solo.", "s":{"type":"scramble","chunks":["alone","He","was"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos están solos.", "s":{"type":"scramble","chunks":["alone","They","are"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Lonely (Soledad Emocional) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"Anna has felt ___ (sola/triste) since she got divorced.", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He is a very ___ (solitario) person.", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I feel ___ (solo/triste) in this big city.", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Don''t be ___ (solitario/triste).", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It gets ___ (solitario) here at night.", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She had a ___ (solitaria) childhood.", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Are you ___ (sintiéndote solo)?", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He died a ___ (solitario) man.", "s":{"type":"typing","correct_answers":["lonely"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué palabra se usa para la ''soledad emocional'' o el sentimiento de tristeza por estar sin compañía?", "s":{"type":"multiple_choice","options":["Lonely","Alone","Only"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Anna has felt ___ since she got divorced.", "s":{"type":"multiple_choice","options":["lonely","alone","single"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I feel so ___ even when I am surrounded by people.", "s":{"type":"multiple_choice","options":["alone","lonely","single"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He is a ___ boy who needs friends.", "s":{"type":"multiple_choice","options":["alone","only","lonely"],"answer":2}}'::jsonb,
        '{"r":2, "p":"¿Cuál palabra expresa tristeza por la falta de amigos o compañía?", "s":{"type":"multiple_choice","options":["Lonely","Alone","Single"],"answer":0}}'::jsonb,
        '{"r":2, "p":"It was a long and ___ night.", "s":{"type":"multiple_choice","options":["single","alone","lonely"],"answer":2}}'::jsonb,
        '{"r":2, "p":"She feels ___ when her husband travels for work.", "s":{"type":"multiple_choice","options":["lonely","alone","only"],"answer":0}}'::jsonb,
        '{"r":2, "p":"You don''t have to feel ___ here.", "s":{"type":"multiple_choice","options":["lonely","alone","only"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Lonely'' describe cómo te sientes interiormente, no necesariamente cuánta gente hay a tu alrededor.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es imposible sentirse ''lonely'' si estás en una fiesta llena de personas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Lonely'' se traduce a menudo como ''solitario'' o ''sentirse triste por estar solo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''Anna feels lonely'' significa que Ana está legalmente soltera.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''I am alone, but I am not lonely'' es una frase perfectamente lógica en inglés.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La palabra ''Lonely'' también significa ''único''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Un lugar, como un castillo o un bosque, también puede describirse como ''lonely'' (solitario/desolado).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Ella se siente sola (emocionalmente).", "s":{"type":"scramble","chunks":["lonely","She","feels"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Me siento solo.", "s":{"type":"scramble","chunks":["lonely","I","am"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Anna se sentía sola.", "s":{"type":"scramble","chunks":["lonely","Anna","felt"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Una persona solitaria.", "s":{"type":"scramble","chunks":["person","A","lonely"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él era solitario.", "s":{"type":"scramble","chunks":["lonely","He","was"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Esto se vuelve solitario.", "s":{"type":"scramble","chunks":["lonely","It","gets"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No te sientas solo.", "s":{"type":"scramble","chunks":["lonely","Don''t","feel"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Only (Único o Solamente) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"He is an ___ (único) child.", "s":{"type":"typing","correct_answers":["only"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Some people say he ___ (solo/solamente) married her for money.", "s":{"type":"typing","correct_answers":["only"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"You are the ___ (única) one.", "s":{"type":"typing","correct_answers":["only"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (solamente) have five dollars.", "s":{"type":"typing","correct_answers":["only"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It is the ___ (única) way.", "s":{"type":"typing","correct_answers":["only"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (solamente) want to help.", "s":{"type":"typing","correct_answers":["only"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is the ___ (única) girl in the class.", "s":{"type":"typing","correct_answers":["only"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Solamente) you can do this.", "s":{"type":"typing","correct_answers":["Only"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué palabra se puede usar como adjetivo para decir ''único'' o como adverbio para decir ''solamente''?", "s":{"type":"multiple_choice","options":["Only","Alone","Single"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He is an ___ child.", "s":{"type":"multiple_choice","options":["alone","only","single"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I ___ want a cup of coffee.", "s":{"type":"multiple_choice","options":["only","alone","single"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She is the ___ person who understands me.", "s":{"type":"multiple_choice","options":["single","alone","only"],"answer":2}}'::jsonb,
        '{"r":3, "p":"He ___ married her because she is rich.", "s":{"type":"multiple_choice","options":["only","lonely","alone"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They have ___ two tickets left.", "s":{"type":"multiple_choice","options":["only","single","alone"],"answer":0}}'::jsonb,
        '{"r":3, "p":"This section is for members ___.", "s":{"type":"multiple_choice","options":["single","alone","only"],"answer":2}}'::jsonb,
        '{"r":3, "p":"It was the ___ option we had.", "s":{"type":"multiple_choice","options":["alone","lonely","only"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"La palabra ''Only'' puede funcionar como adjetivo (único) y como adverbio (solamente).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La expresión ''An only child'' se traduce al español como ''un niño solitario''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''I only want to sleep'' significa ''Solamente quiero dormir''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto usar ''Only'' para indicar tu estado civil (estoy soltero).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"La frase ''The only problem'' significa ''El único problema''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''I only have five dollars'' significa que me siento emocionalmente mal por tener 5 dólares.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Only you'' es la forma correcta de decir ''Solamente tú''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Él es hijo único.", "s":{"type":"scramble","chunks":["only child","He is","an"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Solo tengo cinco dólares.", "s":{"type":"scramble","chunks":["five dollars","I","only have"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Eres el único.", "s":{"type":"scramble","chunks":["only one","You are","the"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Solo tú puedes hacerlo.", "s":{"type":"scramble","chunks":["do it","Only you","can"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Es la única manera.", "s":{"type":"scramble","chunks":["only way","It is","the"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Solo quiero ayudar.", "s":{"type":"scramble","chunks":["to help","I","only want"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella es la única chica.", "s":{"type":"scramble","chunks":["only girl","She is","the"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Single (Soltero, Individual o "Ni uno solo") - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"Are you ___ (soltero/a)?", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He didn''t make a ___ (solo/ni un) mistake in his paper.", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Every ___ (solo/cada) day I think about it.", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I''d like a ___ (individual) room, please.", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"A ___ (solo/sencillo) ticket to London, please.", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She is a ___ (soltera) mother.", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He didn''t say a ___ (sola/única) word.", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He is a ___ (soltero) man.", "s":{"type":"typing","correct_answers":["single"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué palabra significa ''soltero'', ''individual'' o sirve para enfatizar ''ni uno solo''?", "s":{"type":"multiple_choice","options":["Single","Alone","Lonely"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He did not make a ___ mistake in his paper.", "s":{"type":"multiple_choice","options":["alone","only","single"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Are you married or ___?", "s":{"type":"multiple_choice","options":["single","alone","lonely"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I need a ___ room for tonight.", "s":{"type":"multiple_choice","options":["alone","single","only"],"answer":1}}'::jsonb,
        '{"r":4, "p":"She is a ___ mother of two.", "s":{"type":"multiple_choice","options":["alone","only","single"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Every ___ day, I go to the gym.", "s":{"type":"multiple_choice","options":["single","only","alone"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I didn''t understand a ___ word of what he said.", "s":{"type":"multiple_choice","options":["alone","lonely","single"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Would you like a ___ or return ticket? (billete de tren)", "s":{"type":"multiple_choice","options":["only","single","alone"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Single'' se utiliza ampliamente para indicar el estado civil de una persona (soltero/a).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La expresión ''Not a single mistake'' se traduce como ''Ni un solo error''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para dar énfasis diciendo ''Cada santo día'', la forma en inglés es ''Every alone day''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Una ''single room'' en un hotel es una habitación individual (para una persona).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La palabra ''Single'' se utiliza para expresar que alguien llora de soledad por las noches.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''A single ticket'' puede significar un billete sencillo (solo de ida) en inglés británico.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La frase ''I am single'' significa que soy hijo único en mi familia.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Estoy soltero.", "s":{"type":"scramble","chunks":["single","I","am"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ni un solo error.", "s":{"type":"scramble","chunks":["mistake","Not","a single"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Una habitación individual, por favor.", "s":{"type":"scramble","chunks":["please","A","single room,"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Cada santo día.", "s":{"type":"scramble","chunks":["day","Every","single"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Estás soltero?", "s":{"type":"scramble","chunks":["single?","Are","you"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él es un hombre soltero.", "s":{"type":"scramble","chunks":["single man","He is","a"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Una madre soltera.", "s":{"type":"scramble","chunks":["mother","A","single"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 30, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Alone, Lonely, Only & Single', 
    'En español estas palabras pueden traducirse a menudo como "solo/sola", pero en inglés cada una tiene un matiz único y un uso totalmente distinto.', 
    to_jsonb('## Grammar Lesson: Alone, Lonely, Only & Single
En español es muy común usar la palabra "solo" o "sola" para múltiples contextos. En inglés, debes ser muy preciso eligiendo entre estas cuatro palabras dependiendo de si hablas de física, de emociones, de exclusividad o del estado civil.

##### 1. ALONE (Soledad Física)
Se utiliza exclusivamente en el sentido físico para indicar que alguien o algo está **sin compañía** o aislado.
*   *We were alone in the restaurant.* (Estábamos solos en el restaurante).
*   *Please, leave me alone.* (Por favor, déjame en paz / déjame solo).
*   *She lives alone.* (Ella vive sola).

##### 2. LONELY (Soledad Emocional)
Describe un estado emocional. Significa **sentirse triste por estar solo**, o describe a una persona o lugar "solitario". ¡Ojo! Puedes estar rodeado de gente y aun así sentirte *lonely*.
*   *Anna has felt lonely since she got divorced.* (Anna se ha sentido sola/triste desde su divorcio).
*   *He is a lonely boy.* (Es un chico solitario).

##### 3. ONLY (Único o Solamente)
Se utiliza para hablar de exclusividad o limitación. 
*   **Como adjetivo (Único):** *He is an only child.* (Es hijo único). *It is the only way.* (Es la única manera).
*   **Como adverbio (Solamente/Únicamente):** *Some people say he only married her because she’s rich.* (Dicen que él solo se casó con ella porque es rica). *I only have five dollars.* (Solo tengo cinco dólares).

##### 4. SINGLE (Soltero, individual o "Ni uno solo")
Se utiliza para enfatizar que algo es uno (frente a plurales), para clasificar objetos individuales o para el estado civil.
*   **Estado civil:** *Are you single?* (¿Estás soltero?). *She is a single mother.* (Es madre soltera).
*   **Para dar énfasis (Ni uno solo / Cada uno):** *He did not make a single mistake in his paper.* (No cometió ni un solo error). *Every single day.* (Cada santo día / Todos y cada uno de los días).
*   **Cosas individuales:** *A single room.* (Una habitación individual).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Alone (Físicamente solo)', 'Usa "Alone" cuando te refieras puramente a estar físicamente sin ninguna compañía alrededor (I live alone / We were alone).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Lonely (Soledad emocional)', 'Usa "Lonely" para hablar de sentimientos, es decir, sentirse triste por estar solo o para describir a alguien solitario (Anna feels lonely).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Only (Único o Solamente)', 'Usa "Only" para expresar exclusividad, como ser "único" (an only child, the only way) o para decir "solamente" (I only want to sleep).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Single (Soltero, Individual o Énfasis)', 'Usa "Single" para el estado civil (I am single), cosas individuales (single room) o dar énfasis para decir "ni uno solo" (not a single mistake).');

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