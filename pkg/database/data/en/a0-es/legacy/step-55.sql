-- ============================================================
-- Seed: A0 English Path – Grammar – Expresando Obligación
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
        -- REGLA 1: Obligaciones Personales (Must) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"You ___ (debes) stop biting your nails.", "s":{"type":"typing","correct_answers":["must"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (debo) study for the exam.", "s":{"type":"typing","correct_answers":["must"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (¿Debo) I be nice to uncle Franklin?", "s":{"type":"typing","correct_answers":["Must"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (debe) call his mother today.", "s":{"type":"typing","correct_answers":["must"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (debemos) leave right now.", "s":{"type":"typing","correct_answers":["must"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (deben) listen to the teacher.", "s":{"type":"typing","correct_answers":["must"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (debes) read this amazing book.", "s":{"type":"typing","correct_answers":["must"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (debo) go to the doctor.", "s":{"type":"typing","correct_answers":["must"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"Según tus apuntes, ¿qué significa el verbo modal ''Must''?", "s":{"type":"multiple_choice","options":["Deber (Obligación personal)","Tener que (Obligación impersonal)","Necesitar"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Para qué tipo de situaciones se utiliza ''Must''?", "s":{"type":"multiple_choice","options":["Para hablar de obligaciones personales (según la persona que habla)","Para hablar de leyes y reglas generales impuestas por terceros","Para dar opciones voluntarias"],"answer":0}}'::jsonb,
        '{"r":1, "p":"You ___ stop biting your nails.", "s":{"type":"multiple_choice","options":["must","have","must to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ I be nice to uncle Franklin?", "s":{"type":"multiple_choice","options":["Must","Do must","Must to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He ___ study more if he wants to pass.", "s":{"type":"multiple_choice","options":["must","musts","must to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"We ___ be quiet in the library.", "s":{"type":"multiple_choice","options":["must","musts","have"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué forma toma el verbo principal que sigue a ''Must''?", "s":{"type":"multiple_choice","options":["Infinitivo sin TO","Infinitivo con TO","Gerundio (-ing)"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ finish the project today.", "s":{"type":"multiple_choice","options":["must","have","must to"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El verbo modal ''must'' se traduce al español como DEBER.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Must'' se utiliza principalmente para obligaciones impersonales impuestas por la ley.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''You must stop biting your nails'' es el ejemplo exacto de tus apuntes para una obligación personal.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"En las preguntas, ''Must'' se coloca delante del sujeto, como en ''Must I be nice?''", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''He musts go'' añadiendo una -s para la tercera persona.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Después de ''must'', el verbo principal siempre lleva la preposición ''to''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''I must go home'' significa ''Debo ir a casa''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Debes dejar de morderte las uñas.", "s":{"type":"scramble","chunks":["You must","stop","biting your nails"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Debo ser amable con el tío Franklin?", "s":{"type":"scramble","chunks":["Must I","be nice","to uncle Franklin?"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Debo ir a casa ahora.", "s":{"type":"scramble","chunks":["I must","go home","now"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Debemos estudiar para el examen.", "s":{"type":"scramble","chunks":["We must","study","for the test"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos deben terminar el proyecto.", "s":{"type":"scramble","chunks":["They must","finish","the project"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él debe escucharme.", "s":{"type":"scramble","chunks":["He must","listen","to me"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Debes leer este libro.", "s":{"type":"scramble","chunks":["You must","read","this book"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Obligaciones Impersonales (Have to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"You ___ (tienes que) behave yourself well at the ceremony.", "s":{"type":"typing","correct_answers":["have to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (tiene que) wear a uniform at work.", "s":{"type":"typing","correct_answers":["has to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (tenemos que) be there at 8.", "s":{"type":"typing","correct_answers":["have to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (tiene que) wake up early every day.", "s":{"type":"typing","correct_answers":["has to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (tengo que) go now.", "s":{"type":"typing","correct_answers":["have to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (tienen que) pay the bill.", "s":{"type":"typing","correct_answers":["have to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Do you ___ (tienes que) work today?", "s":{"type":"typing","correct_answers":["have to"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Does he ___ (tiene que) study for the test?", "s":{"type":"typing","correct_answers":["have to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué significa ''Have to'' según tus apuntes?", "s":{"type":"multiple_choice","options":["Tener que (Obligación impersonal)","Deber (Obligación personal)","Necesitar"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Para qué se utiliza ''Have to''?", "s":{"type":"multiple_choice","options":["Para hablar de obligaciones impersonales (según lo que generalmente se cree o normas)","Para dar consejos opcionales","Para pedir permiso"],"answer":0}}'::jsonb,
        '{"r":2, "p":"You ___ behave yourself well at the school ceremony.", "s":{"type":"multiple_choice","options":["have to","has to","must to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He ___ wear a tie at the office.", "s":{"type":"multiple_choice","options":["has to","have to","musts"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Do you ___ work on Saturdays?", "s":{"type":"multiple_choice","options":["have to","has to","must"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She ___ start working at 9 AM.", "s":{"type":"multiple_choice","options":["has to","have to","having to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We ___ leave early to catch the train.", "s":{"type":"multiple_choice","options":["have to","has to","must to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They ___ finish the report by tomorrow.", "s":{"type":"multiple_choice","options":["have to","has to","haves to"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Have to'' se traduce como TENER QUE.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Usamos ''have to'' para obligaciones que nacen de reglas, leyes o de lo que se espera socialmente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''You have to behave yourself well'' es el ejemplo textual de tus apuntes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''He have to go'' para la tercera persona.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Para hacer preguntas con ''have to'', utilizamos los auxiliares Do o Does.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''She has to study'' significa que ella tiene el deber u obligación de estudiar.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''We has to leave'' es una oración gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Tienes que comportarte bien.", "s":{"type":"scramble","chunks":["You have to","behave yourself","well"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella tiene que usar uniforme.", "s":{"type":"scramble","chunks":["She has to","wear","a uniform"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Tienes que trabajar hoy?", "s":{"type":"scramble","chunks":["Do you","have to","work today?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Tenemos que estar allí temprano.", "s":{"type":"scramble","chunks":["We have to","be there","early"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él tiene que terminar el informe.", "s":{"type":"scramble","chunks":["He has to","finish","the report"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ellos tienen que pagar la cuenta.", "s":{"type":"scramble","chunks":["They have to","pay","the bill"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Tengo que irme ahora.", "s":{"type":"scramble","chunks":["I have to","go","now"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Ausencia de Obligación (Don't have to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I ___ (no tengo que) work on Sundays.", "s":{"type":"typing","correct_answers":["don''t have to","do not have to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"You ___ (no tienes que) come if you don''t want to.", "s":{"type":"typing","correct_answers":["don''t have to","do not have to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___ (no tiene que) wake up early.", "s":{"type":"typing","correct_answers":["doesn''t have to","does not have to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (no tiene que) wear a suit.", "s":{"type":"typing","correct_answers":["doesn''t have to","does not have to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We ___ (no tenemos que) pay for this.", "s":{"type":"typing","correct_answers":["don''t have to","do not have to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (no tienen que) wait here.", "s":{"type":"typing","correct_answers":["don''t have to","do not have to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (no tengo que) study tonight.", "s":{"type":"typing","correct_answers":["don''t have to","do not have to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It ___ (no tiene que) be perfect.", "s":{"type":"typing","correct_answers":["doesn''t have to","does not have to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué expresa la estructura ''Don''t have to''?", "s":{"type":"multiple_choice","options":["La ausencia de obligación (no es necesario hacerlo)","Una prohibición estricta","Una decisión espontánea"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ work on Sundays.", "s":{"type":"multiple_choice","options":["don''t have to","haven''t to","mustn''t"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She ___ wake up early tomorrow.", "s":{"type":"multiple_choice","options":["doesn''t have to","don''t have to","hasn''t to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We ___ go to the meeting if we are busy.", "s":{"type":"multiple_choice","options":["don''t have to","doesn''t have to","haven''t to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"He ___ pay for the ticket, it is free.", "s":{"type":"multiple_choice","options":["doesn''t have to","don''t have to","doesn''t has to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"You ___ do it right now. Take your time.", "s":{"type":"multiple_choice","options":["don''t have to","doesn''t have to","not have to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They ___ bring anything to the party.", "s":{"type":"multiple_choice","options":["don''t have to","doesn''t have to","haven''t to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"It ___ be expensive to be good.", "s":{"type":"multiple_choice","options":["doesn''t have to","don''t have to","doesn''t has to"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Don''t have to'' se utiliza para indicar que algo está prohibido.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''I don''t have to work on Sundays'' es el ejemplo de tus apuntes para la ausencia de obligación.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para negar en tercera persona singular (he, she, it) se usa ''doesn''t have to''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''She don''t have to go''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''You don''t have to come'' significa que puedes venir si quieres, pero no es obligatorio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La estructura negativa requiere el uso del auxiliar DO o DOES.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''We doesn''t have to pay'' es una oración correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: No tengo que trabajar los domingos.", "s":{"type":"scramble","chunks":["I don''t have to","work","on Sundays"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella no tiene que madrugar.", "s":{"type":"scramble","chunks":["She doesn''t have to","wake up","early"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: No tenemos que pagar por esto.", "s":{"type":"scramble","chunks":["We don''t have to","pay","for this"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: No tienes que venir con nosotros.", "s":{"type":"scramble","chunks":["You don''t have to","come","with us"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él no tiene que usar traje.", "s":{"type":"scramble","chunks":["He doesn''t have to","wear","a suit"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos no tienen que esperar aquí.", "s":{"type":"scramble","chunks":["They don''t have to","wait","here"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: No tengo que estudiar esta noche.", "s":{"type":"scramble","chunks":["I don''t have to","study","tonight"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Necesidad (Need / Needn't) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"She ___ (necesita) to have a rest.", "s":{"type":"typing","correct_answers":["needs"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (no hace falta que) buy a ticket.", "s":{"type":"typing","correct_answers":["needn''t","need not"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (necesito) to buy some milk.", "s":{"type":"typing","correct_answers":["need"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"You ___ (no hace falta que) worry.", "s":{"type":"typing","correct_answers":["needn''t","need not"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (necesita) to go to the bank.", "s":{"type":"typing","correct_answers":["needs"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We ___ (necesitamos) to talk.", "s":{"type":"typing","correct_answers":["need"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (no hace falta que) come early.", "s":{"type":"typing","correct_answers":["needn''t","need not"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (no hace falta que) tell you.", "s":{"type":"typing","correct_answers":["needn''t","need not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué significa el verbo ''Need''?", "s":{"type":"multiple_choice","options":["Necesitar o hacer falta que","Deber (Obligación legal)","Estar a punto de"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Según los apuntes, ''Need'' puede funcionar de dos formas. ¿Cuáles son?", "s":{"type":"multiple_choice","options":["Como verbo normal y como verbo auxiliar modal (en preguntas y negativas)","Como sustantivo y adverbio","Exclusivamente como preposición"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ to have a rest.", "s":{"type":"multiple_choice","options":["needs","need","needn''t"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ buy a ticket. (Usando la forma modal negativa)", "s":{"type":"multiple_choice","options":["needn''t","doesn''t needs","don''t need"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ to talk to you.", "s":{"type":"multiple_choice","options":["need","needs","needn''t"],"answer":0}}'::jsonb,
        '{"r":4, "p":"You ___ worry about that. (Modal negativo)", "s":{"type":"multiple_choice","options":["needn''t","needn''t to","needs not"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He ___ to see a doctor.", "s":{"type":"multiple_choice","options":["needs","need","needn''t"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They ___ to finish it today.", "s":{"type":"multiple_choice","options":["need","needs","needn''t"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Need'' significa NECESITAR o HACER FALTA QUE.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''She needs to have a rest'' es el ejemplo que aparece en los apuntes como verbo normal.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''She needn''t to buy a ticket'' con la palabra TO.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La contracción ''Needn''t'' se utiliza como auxiliar modal y significa que no hace falta que se haga algo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Need'' solo se puede usar para hablar de obligaciones impersonales.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''I needn''t go'' significa ''No hace falta que vaya''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es gramaticalmente correcto escribir ''He need to go'' sin la S final cuando actúa como verbo normal.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Ella necesita descansar.", "s":{"type":"scramble","chunks":["She needs","to have","a rest"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: No hace falta que compre un billete.", "s":{"type":"scramble","chunks":["She needn''t","buy","a ticket"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Necesito comprar algo de leche.", "s":{"type":"scramble","chunks":["I need","to buy","some milk"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: No hace falta que te preocupes por eso.", "s":{"type":"scramble","chunks":["You needn''t","worry","about it"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él necesita ir al banco.", "s":{"type":"scramble","chunks":["He needs","to go","to the bank"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Necesitamos hablar ahora mismo.", "s":{"type":"scramble","chunks":["We need","to talk","right now"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: No hace falta que vengan temprano hoy.", "s":{"type":"scramble","chunks":["They needn''t","come early","today"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 46, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Expresando Obligación', 
    'Aprende a diferenciar obligaciones personales (Must), impersonales (Have to), la ausencia de obligación y cómo expresar necesidad (Need).', 
    to_jsonb('## Grammar Lesson: Expresando Obligación (Must, Have to, Need)
En inglés existen diferentes formas de expresar que algo es obligatorio o necesario. Elegir una u otra depende de si la obligación te la impones tú mismo, si viene dictada por las normas, o si en realidad no es necesario hacerlo.

##### 1. Obligaciones Personales: MUST
El verbo modal **Must** significa **DEBER**. Se utiliza principalmente para hablar de obligaciones personales, es decir, cuando la necesidad de hacer algo nace de la persona que habla. Al ser un verbo modal, es idéntico para todos los pronombres y va seguido del verbo en infinitivo sin *to*.
*   *You **must stop** biting your nails.* (Debes dejar de morderte las uñas).
*   ***Must I be** nice to uncle Franklin?* (¿Debo ser amable con el tío Franklin?).

##### 2. Obligaciones Impersonales: HAVE TO
La expresión **Have to** significa **TENER QUE**. Se utiliza para obligaciones impersonales, basadas en lo que generalmente se cree, leyes, reglas o agentes externos. Funciona como un verbo normal (necesita *Do/Does* para preguntas y se conjuga como *has to* para he/she/it).
*   *You **have to behave** yourself well at the school ceremony.* (Tienes que comportarte bien en la ceremonia escolar).

##### 3. Ausencia de Obligación: DON''T HAVE TO
Cuando queremos indicar que **no es obligatorio** hacer algo (es opcional o no hace falta), utilizamos la forma negativa de *have to*. **Cuidado:** No utilices *Mustn''t* para esto, ya que eso significa una prohibición estricta.
*   *I **don’t have to work** on Sundays.* (No tengo que trabajar los domingos).

##### 4. Necesidad: NEED / NEEDN''T
El verbo **Need** significa **NECESITAR** o **HACER FALTA QUE**. Tiene una doble naturaleza muy interesante:
*   **Como verbo normal:** Sigue las reglas habituales y lleva *to* antes del siguiente verbo.
    *   *She **needs to have** a rest.* (Ella necesita descansar).
*   **Como auxiliar modal (en preguntas y negativas):** Se contrae como **Needn''t** (no hace falta que) y va seguido del verbo principal sin *to*.
    *   *She **needn’t buy** a ticket.* (No hace falta que compre un billete).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Obligaciones Personales (Must)', 'Utiliza "Must" seguido del verbo sin "to" para obligaciones dictadas por el hablante (ej. You must stop).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Obligaciones Impersonales (Have to)', 'Para obligaciones que provienen del exterior (reglas, costumbres), usa "Have to". Recuerda conjugarlo como "Has to" para la tercera persona.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Ausencia de Obligación (Don''t have to)', 'Si no es obligatorio hacer algo, usa "Don''t have to" (o "doesn''t have to"). Significa "no tengo que".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Necesidad (Need / Needn''t)', 'Usa "Need" como verbo normal (needs to go) para afirmar. En negativas, puedes usar su forma modal "Needn''t" (sin "to") para decir "no hace falta que".');

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