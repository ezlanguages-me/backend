-- ============================================================
-- Seed: A0 English Path – Grammar – Pronombres (Completo >100)
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
        -- REGLA 1: Pronombres Objeto (me, him, her, us...) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"She loves ___ (a él).", "s":{"type":"typing","correct_answers":["him"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Give the book to ___ (a mí).", "s":{"type":"typing","correct_answers":["me"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I saw ___ (a ella) at the park.", "s":{"type":"typing","correct_answers":["her"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They invited ___ (a nosotros) to the party.", "s":{"type":"typing","correct_answers":["us"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Look at ___ (a ellos)!", "s":{"type":"typing","correct_answers":["them"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I don''t like ___ (ello / esa cosa).", "s":{"type":"typing","correct_answers":["it"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We want to help ___ (a ti).", "s":{"type":"typing","correct_answers":["you"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Please, tell ___ (a ella) the truth.", "s":{"type":"typing","correct_answers":["her"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"I called ___ yesterday (a él).", "s":{"type":"multiple_choice","options":["he","him","his"],"answer":1}}'::jsonb,
        '{"r":1, "p":"Can you help ___? (a nosotros)", "s":{"type":"multiple_choice","options":["our","we","us"],"answer":2}}'::jsonb,
        '{"r":1, "p":"She is looking at ___ (a ellos).", "s":{"type":"multiple_choice","options":["they","their","them"],"answer":2}}'::jsonb,
        '{"r":1, "p":"Give ___ the keys (a mí).", "s":{"type":"multiple_choice","options":["I","my","me"],"answer":2}}'::jsonb,
        '{"r":1, "p":"He doesn''t know ___ (a ella).", "s":{"type":"multiple_choice","options":["she","her","hers"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I bought a new car. I love ___.", "s":{"type":"multiple_choice","options":["it","its","he"],"answer":0}}'::jsonb,
        '{"r":1, "p":"This present is for ___ (vosotros).", "s":{"type":"multiple_choice","options":["your","you","yours"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I want to talk to ___ (a él).", "s":{"type":"multiple_choice","options":["him","he","his"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Los pronombres objeto (me, him, her) se colocan generalmente después del verbo o preposición.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''She loves he'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El pronombre objeto para ''we'' (nosotros) es ''us''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Them'' se traduce como ''a ellos'' o ''para ellos''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para decir ''Mírame'', se dice ''Look at I''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El pronombre objeto de ''it'' sigue siendo ''it''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Him'' se usa tanto para animales como para hombres.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: La vi ayer.", "s":{"type":"scramble","chunks":["her","I saw","yesterday"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Dáselo a él.", "s":{"type":"scramble","chunks":["it","to him","Give"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos nos invitaron.", "s":{"type":"scramble","chunks":["invited","us","They"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: No me mires.", "s":{"type":"scramble","chunks":["look","Don''t","at me"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Te quiero.", "s":{"type":"scramble","chunks":["you","love","I"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Este libro es para ellos.", "s":{"type":"scramble","chunks":["for them","is","This book"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Quiero ayudarla.", "s":{"type":"scramble","chunks":["to help","I want","her"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Pronombres Reflexivos (myself, yourself...) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I did it by ___ (mí mismo).", "s":{"type":"typing","correct_answers":["myself"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She cut ___ (a sí misma) with a knife.", "s":{"type":"typing","correct_answers":["herself"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He hurt ___ (a sí mismo) playing football.", "s":{"type":"typing","correct_answers":["himself"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We prepared the dinner ___ (nosotros mismos).", "s":{"type":"typing","correct_answers":["ourselves"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They enjoyed ___ (a sí mismos) at the party.", "s":{"type":"typing","correct_answers":["themselves"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You must do it ___ (tú mismo).", "s":{"type":"typing","correct_answers":["yourself"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The cat washed ___ (a sí mismo).", "s":{"type":"typing","correct_answers":["itself"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You all must defend ___ (vosotros mismos).", "s":{"type":"typing","correct_answers":["yourselves"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"I painted the house ___.", "s":{"type":"multiple_choice","options":["me","myself","mine"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He bought ___ a new car.", "s":{"type":"multiple_choice","options":["him","himself","his"],"answer":1}}'::jsonb,
        '{"r":2, "p":"They solved the problem by ___.", "s":{"type":"multiple_choice","options":["them","theirselves","themselves"],"answer":2}}'::jsonb,
        '{"r":2, "p":"She looked at ___ in the mirror.", "s":{"type":"multiple_choice","options":["her","herself","hers"],"answer":1}}'::jsonb,
        '{"r":2, "p":"We built this cabin ___.", "s":{"type":"multiple_choice","options":["ours","us","ourselves"],"answer":2}}'::jsonb,
        '{"r":2, "p":"Did you make this cake ___? (singular)", "s":{"type":"multiple_choice","options":["you","yourself","yourselves"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The machine turns ___ off automatically.", "s":{"type":"multiple_choice","options":["it","itself","its"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Welcome! Please, make ___ at home. (plural)", "s":{"type":"multiple_choice","options":["yourself","yourselves","you"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Los pronombres reflexivos se usan cuando el sujeto y el objeto de la acción son la misma persona.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"El pronombre reflexivo para ''he'' es ''hiself''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Ourselves'' significa ''a nosotros mismos''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La palabra ''theirselves'' es la forma correcta para ''ellos mismos''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Se puede usar ''myself'' para dar énfasis (ej. I did it myself).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para ''you'' plural, el reflexivo es ''yourself''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Herself'' se utiliza para referirse a ''ella misma''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Lo hice yo mismo.", "s":{"type":"scramble","chunks":["myself","I did it","by"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella se cortó.", "s":{"type":"scramble","chunks":["cut","herself","She"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él se compró un coche.", "s":{"type":"scramble","chunks":["a car","He bought","himself"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Nos divertimos en la fiesta.", "s":{"type":"scramble","chunks":["at the party","We enjoyed","ourselves"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ellos lo resolvieron por sí mismos.", "s":{"type":"scramble","chunks":["by themselves","They solved it"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Hazlo tú mismo.", "s":{"type":"scramble","chunks":["Do it","yourself"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: La máquina se apagó sola (a sí misma).", "s":{"type":"scramble","chunks":["turned","The machine","itself off"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Pronombres Posesivos (mine, yours, hers...) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"This book is ___ (mío).", "s":{"type":"typing","correct_answers":["mine"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The red car is ___ (suyo, de ellos).", "s":{"type":"typing","correct_answers":["theirs"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"That house is ___ (nuestra).", "s":{"type":"typing","correct_answers":["ours"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Is this pen ___? (tuyo).", "s":{"type":"typing","correct_answers":["yours"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The bag is ___ (suyo, de ella).", "s":{"type":"typing","correct_answers":["hers"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The jacket is ___ (suyo, de él).", "s":{"type":"typing","correct_answers":["his"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"These tickets are ___ (nuestros).", "s":{"type":"typing","correct_answers":["ours"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Those keys are ___ (mías).", "s":{"type":"typing","correct_answers":["mine"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"This is my book. The book is ___.", "s":{"type":"multiple_choice","options":["my","mine","me"],"answer":1}}'::jsonb,
        '{"r":3, "p":"That is their car. The car is ___.", "s":{"type":"multiple_choice","options":["their","theirs","them"],"answer":1}}'::jsonb,
        '{"r":3, "p":"It is our house. The house is ___.", "s":{"type":"multiple_choice","options":["our","ours","us"],"answer":1}}'::jsonb,
        '{"r":3, "p":"Is this your pen? Is it ___?", "s":{"type":"multiple_choice","options":["your","yours","you"],"answer":1}}'::jsonb,
        '{"r":3, "p":"It is her bag. The bag is ___.", "s":{"type":"multiple_choice","options":["her","hers","she"],"answer":1}}'::jsonb,
        '{"r":3, "p":"The black dog is ___ (suyo, de él).", "s":{"type":"multiple_choice","options":["his","he","him"],"answer":0}}'::jsonb,
        '{"r":3, "p":"These seats are ___ (nuestros).", "s":{"type":"multiple_choice","options":["ours","our","us"],"answer":0}}'::jsonb,
        '{"r":3, "p":"The decision is ___ (tuya).", "s":{"type":"multiple_choice","options":["yours","your","you"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Los pronombres posesivos sustituyen al nombre para no repetirlo (ej. The book is mine).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La frase ''The car is my'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Ours'' se traduce como ''nuestro/a'' o ''nuestros/as''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Los pronombres posesivos como ''yours'' o ''theirs'' llevan apóstrofe (your''s).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"El pronombre posesivo para ''ella'' es ''hers''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''His'' funciona tanto como adjetivo posesivo (his car) como pronombre posesivo (the car is his).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para decir ''el dinero es suyo (de ellos)'' se dice ''the money is their''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Este coche es mío.", "s":{"type":"scramble","chunks":["mine","is","This car"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: La casa azul es suya (de ellos).", "s":{"type":"scramble","chunks":["theirs","is","The blue house"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: La victoria es nuestra.", "s":{"type":"scramble","chunks":["is","ours","The victory"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ese bolígrafo es tuyo.", "s":{"type":"scramble","chunks":["is","yours","That pen"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: El bolso rojo es suyo (de ella).", "s":{"type":"scramble","chunks":["The red bag","hers","is"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Esos libros son suyos (de él).", "s":{"type":"scramble","chunks":["are","his","Those books"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: El problema es nuestro.", "s":{"type":"scramble","chunks":["ours","The problem","is"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Pronombres Relativos (who, which, where...) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"The man ___ (que/quien) wrote the book is here.", "s":{"type":"typing","correct_answers":["who","that"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"That is the dog ___ (que/el cual) barks at night.", "s":{"type":"typing","correct_answers":["which","that"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"That is the office ___ (donde) he works.", "s":{"type":"typing","correct_answers":["where"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She is the girl ___ (cuyos) parents were on TV.", "s":{"type":"typing","correct_answers":["whose"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Look at ___ (lo que) I have written.", "s":{"type":"typing","correct_answers":["what"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I bought a car ___ (que/el cual) doesn''t go.", "s":{"type":"typing","correct_answers":["which","that"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I don''t understand ___ (lo que) you are saying.", "s":{"type":"typing","correct_answers":["what"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He is the man ___ (cuyo) father is an artist.", "s":{"type":"typing","correct_answers":["whose"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"The person ___ lives next door is nice.", "s":{"type":"multiple_choice","options":["which","who","where"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I lost the watch ___ you gave me.", "s":{"type":"multiple_choice","options":["who","where","which"],"answer":2}}'::jsonb,
        '{"r":4, "p":"This is the place ___ everything happened.", "s":{"type":"multiple_choice","options":["where","which","who"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Paloma is the woman ___ father was an artist.", "s":{"type":"multiple_choice","options":["who","whose","which"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Look at ___ I found!", "s":{"type":"multiple_choice","options":["that","what","which"],"answer":1}}'::jsonb,
        '{"r":4, "p":"El pronombre relativo se puede omitir cuando:", "s":{"type":"multiple_choice","options":["Sustituye al sujeto (la persona realiza la acción)","Sustituye al objeto (la persona sufre la acción)","Nunca se omite"],"answer":1}}'::jsonb,
        '{"r":4, "p":"This is the book ___ you were looking for.", "s":{"type":"multiple_choice","options":["who","where","(omitido)"],"answer":2}}'::jsonb,
        '{"r":4, "p":"That''s the car ___ I bought.", "s":{"type":"multiple_choice","options":["(omitido) / that","who","where"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El pronombre ''who'' o ''that'' se usa para referirse a personas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El pronombre ''which'' se usa para referirse a personas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Whose'' significa ''cuyo'' o ''de quién'' e indica posesión.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''What'' utilizado como relativo significa ''lo que''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En inglés, nunca se puede omitir el pronombre relativo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Where'' se utiliza como pronombre relativo para referirse a lugares.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En la frase ''He''s the man I spoke to'', la preposición va al final y el relativo se omite.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Ella es la chica que escribió el libro.", "s":{"type":"scramble","chunks":["wrote the book","She is the girl","who"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ese es el perro que ladra por la noche.", "s":{"type":"scramble","chunks":["barks at night","which","That is the dog"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Esa es la oficina donde mi marido trabaja.", "s":{"type":"scramble","chunks":["where","my husband works","That''s the office"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Carol es la chica cuyos padres salieron en la tele.", "s":{"type":"scramble","chunks":["Carol is the girl","parents were on TV","whose"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Mira lo que he escrito.", "s":{"type":"scramble","chunks":["what","I''ve written","Look at"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ese es el coche que compré (relativo omitido).", "s":{"type":"scramble","chunks":["I bought","That''s the car"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No entiendo lo que dices.", "s":{"type":"scramble","chunks":["what","I don''t understand","you''re saying"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 17, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Pronombres (Objeto, Reflexivos, Posesivos y Relativos)', 
    'Aprende a sustituir nombres y conectar frases correctamente usando los diferentes tipos de pronombres en inglés.', 
    to_jsonb('## Grammar Lesson: Los Pronombres
Los pronombres son palabras que sustituyen a un sustantivo para evitar repetirlo. En inglés, cambian de forma dependiendo de la función que cumplan en la frase.

##### 1. Pronombres Objeto (Object Pronouns)
Reciben la acción del verbo. Se colocan **después** del verbo o de una preposición.
*   **me** (a mí, para mí) / **you** (a ti) / **him** (a él) / **her** (a ella) / **it** (a ello) / **us** (a nosotros) / **you** (a vosotros) / **them** (a ellos).
*   *I saw him yesterday.* (Lo vi a él ayer).
*   *Give the book to me.* (Dame el libro a mí).

##### 2. Pronombres Reflexivos
Se usan cuando el sujeto y el objeto de la acción son la misma persona (la acción recae sobre quien la hace).
*   **myself / yourself / himself / herself / itself / ourselves / yourselves / themselves**.
*   *She cut herself.* (Ella se cortó).
*   *We prepared it ourselves.* (Lo preparamos nosotros mismos).

##### 3. Pronombres Posesivos
Indican que algo pertenece a alguien y sustituyen a "adjetivo posesivo + sustantivo". A diferencia de los adjetivos (my, your), estos van solos. No llevan apóstrofe.
*   **mine** (mío) / **yours** (tuyo) / **his** (suyo de él) / **hers** (suyo de ella) / **ours** (nuestro) / **yours** (vuestro) / **theirs** (suyo de ellos).
*   *This book is mine.* (Este libro es mío).
*   *The red car is theirs.* (El coche rojo es suyo).

##### 4. Pronombres Relativos
Unen dos frases indicando a qué o quién nos referimos.
*   **Who / That:** Para personas. (*The girl who wrote the book* - La chica que escribió el libro).
*   **Which / That:** Para animales o cosas. (*The dog which barks* - El perro que ladra).
*   **Where:** Para lugares. (*The office where he works* - La oficina donde trabaja).
*   **Whose:** Para posesión (Cuyo/a). (*The woman whose father is an artist* - La mujer cuyo padre...).
*   **What:** Significa "lo que". (*Look at what I’ve written* - Mira lo que he escrito).

**¡Truco Ninja! (Omisión de Relativos):**
Cuando la persona o cosa de la que hablamos NO realiza la acción (sino que la sufre), podemos suprimir el pronombre "who/that/which".
*   *That’s the car (which/that) I bought* ➔ *That’s the car I bought*. 
*   Además, si hay preposiciones, se suelen poner al final: *He’s the man I spoke to*.'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Pronombres Objeto (me, him, her...)', 'Recuerda: Los pronombres objeto (me, you, him, her, it, us, them) reciben la acción y van DESPUÉS del verbo o de una preposición (ej. I love him).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Pronombres Reflexivos', 'Se usan cuando la acción recae sobre el mismo sujeto que la hace (ej. himself, herself, ourselves). Terminan en -self (singular) o -selves (plural).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Pronombres Posesivos', 'Van solos y sustituyen a la cosa poseída: mine, yours, his, hers, ours, theirs (ej. The book is mine). ¡Ojo, no llevan apóstrofe!');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Pronombres Relativos', 'Usa "who" para personas, "which" para cosas, "where" para lugares, "whose" para posesión (cuyo) y "what" para decir "lo que". Si el relativo es el objeto, se puede omitir.');

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