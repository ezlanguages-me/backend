-- ============================================================
-- Seed: A0 English Path – STEP 100 – Grammar – Adjetivos Posesivos
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_grammar1_id UUID; 
    v_rule1_id UUID; 
    v_rule2_id UUID; 
    v_rule3_id UUID; 
    v_rule4_id UUID; 
    v_rule5_id UUID; 
    v_ex_id UUID; 
    v_rule_id UUID;
    ex JSONB;
    exercises JSONB[] := ARRAY[
        -- ==========================================
        -- REGLA 1: My / Your (Singular)
        -- ==========================================
        -- Typing
        '{"r":1, "p":"___ (Mi) book is on the table.", "s":{"type":"typing","correct_answers":["My"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"What is ___ (tu) name?", "s":{"type":"typing","correct_answers":["your"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I love ___ (mi) family.", "s":{"type":"typing","correct_answers":["my"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Is that ___ (tu) pen?", "s":{"type":"typing","correct_answers":["your"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Mis) eyes are blue.", "s":{"type":"typing","correct_answers":["My"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice
        '{"r":1, "p":"___ (Mi) car is new.", "s":{"type":"multiple_choice","options":["My","Your","His"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Where is ___ (tu) brother?", "s":{"type":"multiple_choice","options":["your","my","our"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I lost ___ (mi) phone.", "s":{"type":"multiple_choice","options":["his","your","my"],"answer":2}}'::jsonb,
        '{"r":1, "p":"Did you finish ___ (tu) homework?", "s":{"type":"multiple_choice","options":["your","my","her"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ (Mis) friends are here.", "s":{"type":"multiple_choice","options":["Your","My","Their"],"answer":1}}'::jsonb,
        -- True/False
        '{"r":1, "p":"''My'' se traduce como ''mi'' o ''mis'', ya que en inglés los adjetivos no tienen plural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para decir ''tus libros'' lo correcto es decir ''yours books''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Los adjetivos posesivos van siempre delante del sustantivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Your'' solo significa ''tu'', nunca puede significar ''tus''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Los adjetivos en inglés no tienen género (masculino/femenino) ni número.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble
        '{"r":1, "p":"Ordena la frase: Mi nombre es John.", "s":{"type":"scramble","chunks":["John","My","is","name"],"correct_order":[1,3,2,0]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: ¿Dónde está tu coche?", "s":{"type":"scramble","chunks":["your","Where","car","is"],"correct_order":[1,3,0,2]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Me gusta mi trabajo.", "s":{"type":"scramble","chunks":["like","job","I","my"],"correct_order":[2,0,3,1]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: ¿Es este tu libro?", "s":{"type":"scramble","chunks":["this","book","Is","your"],"correct_order":[2,0,3,1]}}'::jsonb,
        '{"r":1, "p":"Ordena la frase: Mis manos están frías.", "s":{"type":"scramble","chunks":["cold","hands","are","My"],"correct_order":[3,1,2,0]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: His / Her / Its (Tercera persona singular)
        -- ==========================================
        -- Typing
        '{"r":2, "p":"___ (Su, de él) name is Peter.", "s":{"type":"typing","correct_answers":["His"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Su, de ella) sister is tall.", "s":{"type":"typing","correct_answers":["Her"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The cat is sleeping in ___ (su) bed.", "s":{"type":"typing","correct_answers":["its"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I saw ___ (su, de él) brother.", "s":{"type":"typing","correct_answers":["his"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She lost ___ (su, de ella) bag.", "s":{"type":"typing","correct_answers":["her"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice
        '{"r":2, "p":"___ (Su, de ella) eyes are green.", "s":{"type":"multiple_choice","options":["Her","His","Its"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He washed ___ (su, de él) car.", "s":{"type":"multiple_choice","options":["her","his","its"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The dog wagged ___ (su) tail.", "s":{"type":"multiple_choice","options":["his","her","its"],"answer":2}}'::jsonb,
        '{"r":2, "p":"We visited ___ (su, de él) house.", "s":{"type":"multiple_choice","options":["his","her","their"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Mary loves ___ (su) dog.", "s":{"type":"multiple_choice","options":["his","its","her"],"answer":2}}'::jsonb,
        -- True/False
        '{"r":2, "p":"''His'' se utiliza cuando el dueño de algo es un hombre.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Its'' se usa para referirse a la posesión de un animal o una cosa.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Her'' significa ''su'' o ''sus'', pero solo si el dueño es una mujer.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En inglés usamos ''his'' para ''su'' sin importar si el dueño es hombre o mujer.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"El adjetivo posesivo ''Its'' lleva un apóstrofe (It''s).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble
        '{"r":2, "p":"Ordena la frase: Su nombre (de él) es Mark.", "s":{"type":"scramble","chunks":["is","His","Mark","name"],"correct_order":[1,3,0,2]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Ella ama a su familia.", "s":{"type":"scramble","chunks":["her","loves","She","family"],"correct_order":[2,1,0,3]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: El perro comió su comida.", "s":{"type":"scramble","chunks":["food","The","its","ate","dog"],"correct_order":[1,4,3,2,0]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: ¿Dónde está su chaqueta (de él)?", "s":{"type":"scramble","chunks":["his","Where","jacket","is"],"correct_order":[1,3,0,2]}}'::jsonb,
        '{"r":2, "p":"Ordena la frase: Sus zapatos (de ella) son nuevos.", "s":{"type":"scramble","chunks":["are","shoes","Her","new"],"correct_order":[2,1,0,3]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Our / Your (Plural)
        -- ==========================================
        -- Typing
        '{"r":3, "p":"___ (Nuestro) team is the best.", "s":{"type":"typing","correct_answers":["Our"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Is this ___ (vuestro) classroom?", "s":{"type":"typing","correct_answers":["your"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We love ___ (nuestros) parents.", "s":{"type":"typing","correct_answers":["our"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Open ___ (vuestros) books.", "s":{"type":"typing","correct_answers":["your"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Nuestra) house is big.", "s":{"type":"typing","correct_answers":["Our"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice
        '{"r":3, "p":"___ (Nuestros) friends are coming.", "s":{"type":"multiple_choice","options":["Our","Your","Their"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Can I see ___ (vuestros) tickets?", "s":{"type":"multiple_choice","options":["our","your","their"],"answer":1}}'::jsonb,
        '{"r":3, "p":"We need ___ (nuestros) coats.", "s":{"type":"multiple_choice","options":["your","their","our"],"answer":2}}'::jsonb,
        '{"r":3, "p":"Did you wash ___ (vuestras) hands?", "s":{"type":"multiple_choice","options":["your","our","his"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ (Nuestra) teacher is nice.", "s":{"type":"multiple_choice","options":["Your","Our","Her"],"answer":1}}'::jsonb,
        -- True/False
        '{"r":3, "p":"''Our'' significa ''nuestro'', ''nuestra'', ''nuestros'' o ''nuestras''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Your'' se usa para ''tu/tus'' y también para el plural ''vuestro/vuestra/s''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para decir ''nuestras gatas'' es correcto decir ''ours cats''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Our'' cambia de escritura si la palabra que le sigue es femenina en español.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"El adjetivo posesivo ''your'' se escribe exactamente igual en singular y en plural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble
        '{"r":3, "p":"Ordena la frase: Nuestra casa es muy antigua.", "s":{"type":"scramble","chunks":["very","Our","old","house","is"],"correct_order":[1,3,4,0,2]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: ¿Trajisteis vuestros libros?", "s":{"type":"scramble","chunks":["books","you","Did","your","bring"],"correct_order":[2,1,4,3,0]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Amamos nuestro coche nuevo.", "s":{"type":"scramble","chunks":["car","love","We","new","our"],"correct_order":[2,1,4,3,0]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: ¿Son estos vuestros asientos?", "s":{"type":"scramble","chunks":["your","these","Are","seats"],"correct_order":[2,1,0,3]}}'::jsonb,
        '{"r":3, "p":"Ordena la frase: Nuestro vuelo está retrasado.", "s":{"type":"scramble","chunks":["is","flight","Our","delayed"],"correct_order":[2,1,0,3]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Their (Tercera persona plural)
        -- ==========================================
        -- Typing
        '{"r":4, "p":"___ (Su, de ellos) children are playing.", "s":{"type":"typing","correct_answers":["Their"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I don''t know ___ (sus) names.", "s":{"type":"typing","correct_answers":["their"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They parked ___ (su) car here.", "s":{"type":"typing","correct_answers":["their"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (Sus) bags are heavy.", "s":{"type":"typing","correct_answers":["Their"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Have you seen ___ (sus) new house?", "s":{"type":"typing","correct_answers":["their"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice
        '{"r":4, "p":"___ (Su, de ellos) dog is barking.", "s":{"type":"multiple_choice","options":["Their","Our","His"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They forgot ___ (sus) umbrellas.", "s":{"type":"multiple_choice","options":["our","their","your"],"answer":1}}'::jsonb,
        '{"r":4, "p":"We visited ___ (su, de ellos) city.", "s":{"type":"multiple_choice","options":["our","your","their"],"answer":2}}'::jsonb,
        '{"r":4, "p":"The students opened ___ (sus) laptops.", "s":{"type":"multiple_choice","options":["their","his","our"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ (Sus) ideas are great.", "s":{"type":"multiple_choice","options":["Our","Their","Its"],"answer":1}}'::jsonb,
        -- True/False
        '{"r":4, "p":"''Their'' significa ''su'' o ''sus'' cuando los dueños son ellos o ellas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Their'' se utiliza solamente cuando los dueños son personas, no aplica a cosas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Es correcto añadirle una S al posesivo y decir ''theirs books''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Al igual que en español, usamos ''their'' (su/sus) siempre que el poseedor sea la tercera persona plural.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Usamos ''their'' para referirnos a un grupo al que nosotros pertenecemos (nosotros).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble
        '{"r":4, "p":"Ordena la frase: Sus padres (de ellos) son muy agradables.", "s":{"type":"scramble","chunks":["very","are","parents","nice","Their"],"correct_order":[4,2,1,0,3]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Ellos perdieron sus llaves.", "s":{"type":"scramble","chunks":["keys","lost","their","They"],"correct_order":[3,1,2,0]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: ¿Cuál es su dirección (de ellos)?", "s":{"type":"scramble","chunks":["address","What","their","is"],"correct_order":[1,3,2,0]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Su perro está durmiendo.", "s":{"type":"scramble","chunks":["sleeping","Their","is","dog"],"correct_order":[1,3,2,0]}}'::jsonb,
        '{"r":4, "p":"Ordena la frase: Me gusta su casa nueva (de ellos).", "s":{"type":"scramble","chunks":["like","new","I","their","house"],"correct_order":[2,0,3,1,4]}}'::jsonb,

        -- ==========================================
        -- REGLA 5: WHOSE (Preguntar por la posesión)
        -- ==========================================
        -- Typing
        '{"r":5, "p":"___ book is this? It''s mine.", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"___ car is parked outside?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"___ keys are on the table?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"___ dog is barking so loudly?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"___ idea was this?", "s":{"type":"typing","correct_answers":["Whose"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice
        '{"r":5, "p":"___ jacket is on my chair?", "s":{"type":"multiple_choice","options":["Whose","Who","What"],"answer":0}}'::jsonb,
        '{"r":5, "p":"___ children are playing in the garden?", "s":{"type":"multiple_choice","options":["What","Who","Whose"],"answer":2}}'::jsonb,
        '{"r":5, "p":"___ phone is ringing?", "s":{"type":"multiple_choice","options":["Whose","Who","Which"],"answer":0}}'::jsonb,
        '{"r":5, "p":"___ bike is this?", "s":{"type":"multiple_choice","options":["Who","Whose","What"],"answer":1}}'::jsonb,
        '{"r":5, "p":"___ glasses are these?", "s":{"type":"multiple_choice","options":["What","Whose","Who"],"answer":1}}'::jsonb,
        -- True/False
        '{"r":5, "p":"''Whose'' se usa para preguntar a quién pertenece algo (¿De quién es?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":5, "p":"''Who'' y ''Whose'' significan lo mismo y se pueden usar indistintamente.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":5, "p":"La pregunta ''Whose car is this?'' se puede responder con un adjetivo posesivo: ''It''s my car.''", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":5, "p":"Se puede decir ''Who''s book is this?'' con apóstrofe para preguntar por la posesión.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":5, "p":"''Whose'' siempre va seguido de un sustantivo (Whose + noun).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble
        '{"r":5, "p":"Ordena: ¿De quién es este abrigo?", "s":{"type":"scramble","chunks":["coat","Whose","this","is"],"correct_order":[1,3,0,2]}}'::jsonb,
        '{"r":5, "p":"Ordena: ¿De quién son esas llaves?", "s":{"type":"scramble","chunks":["keys","Whose","those","are"],"correct_order":[1,3,0,2]}}'::jsonb,
        '{"r":5, "p":"Ordena: ¿De quién es el coche rojo?", "s":{"type":"scramble","chunks":["red","car","is","Whose","the"],"correct_order":[3,4,1,2,0]}}'::jsonb,
        '{"r":5, "p":"Ordena: Es el libro de ella.", "s":{"type":"scramble","chunks":["book","It''s","her"],"correct_order":[1,2,0]}}'::jsonb,
        '{"r":5, "p":"Ordena: ¿De quién es esa mochila?", "s":{"type":"scramble","chunks":["backpack","is","that","Whose"],"correct_order":[3,2,1,0]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 100, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Adjetivos Posesivos', 
    '', 
    to_jsonb('## Grammar Lesson: Los Adjetivos Posesivos
Los adjetivos posesivos se utilizan para indicar a quién pertenece algo. A diferencia del español (que usa "su" para casi todo), el inglés tiene un adjetivo diferente dependiendo de **quién sea el poseedor**.

**💡 Regla de Oro:** Los adjetivos en inglés **no tienen género ni número**, y siempre se colocan **delante** de los nombres que describen. 
*(Ej: "My car" = Mi coche / "My cars" = Mis coches. La palabra "my" no cambia).*

##### 1. Singular: MY / YOUR
*   **My:** mi / mis. Habla de lo que me pertenece a mí. (*My book is blue*).
*   **Your:** tu / tus. Habla de lo que te pertenece a ti. (*Where is your pen?*).

##### 2. Tercera Persona Singular: HIS / HER / ITS
Aquí el inglés es muy preciso. El adjetivo cambia según el sexo del poseedor:
*   **His:** su / sus (de **él**). (*His name is John*).
*   **Her:** su / sus (de **ella**). (*Her sister is tall*).
*   **Its:** su / sus (de **una cosa o animal**). Ojo: no lleva apóstrofe. (*The dog is eating its food*).

##### 3. Plural: OUR / YOUR
*   **Our:** nuestro/a / nuestros/as. Lo que nos pertenece a nosotros. (*Our house is big*).
*   **Your:** vuestro/a / vuestros/as. Es exactamente igual que en singular, el contexto nos dirá si hablamos de "tú" o de "vosotros". (*Open your books*).

##### 4. Tercera Persona Plural: THEIR
*   **Their:** su / sus (de **ellos o ellas**). Se usa cuando los dueños son varias personas, animales o cosas. (*Their children are playing*).

##### 5. Preguntando por la Posesión: WHOSE
Para preguntar **¿de quién es algo?** usamos **WHOSE** (no "who" ni "who''s").
*   **Estructura:** Whose + sustantivo + verbo? (*Whose book is this?*).
*   **Respuesta:** Se responde con un adjetivo posesivo + sustantivo. (*It''s my book / It''s her bag*).
*   ⚠️ No confundir: **Whose** (de quién) ≠ **Who''s** (who is / who has).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Primera y Segunda Persona (My / Your)', 'Usa "My" (mi/mis) para lo tuyo y "Your" (tu/tus) para lo de la otra persona. Recuerda que no tienen plural (se dice my cars, no mys cars).');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Tercera Persona (His / Her / Its)', 'Presta atención al poseedor: "His" es para él (hombre), "Her" para ella (mujer) y "Its" para cosas o animales.');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Plural (Our / Your)', 'Usa "Our" para nuestro/a/s y "Your" para vuestro/a/s. Siempre se colocan delante del nombre (ej. Our house).');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Tercera Persona Plural (Their)', 'Usa "Their" cuando hables de las posesiones de "ellos" o "ellas". Se traduce como "su" o "sus".');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Cuestionando la Posesión (Whose)', 'Usa "Whose" para preguntar ¿de quién es algo? Siempre va seguido de un sustantivo (Whose + noun). No confundas "Whose" con "Who''s" (who is).');

-- 4. Bucle optimizado para insertar los 100 ejercicios
FOREACH ex IN ARRAY exercises
LOOP
    -- Determinar el ID de la regla correcta
    IF (ex->>'r')::int = 1 THEN v_rule_id := v_rule1_id;
    ELSIF (ex->>'r')::int = 2 THEN v_rule_id := v_rule2_id;
    ELSIF (ex->>'r')::int = 3 THEN v_rule_id := v_rule3_id;
    ELSIF (ex->>'r')::int = 4 THEN v_rule_id := v_rule4_id;
    ELSE v_rule_id := v_rule5_id;
    END IF;

    -- Insertar el ejercicio base
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) 
    VALUES (v_grammar1_id, v_rule_id) 
    RETURNING uuid INTO v_ex_id;

    -- Insertar la traducción del ejercicio
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

END LOOP;
END;
$seed$;
