-- ============================================================
-- Seed: A0 English Path – Grammar – Habilidad y Capacidad
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
        -- REGLA 1: Presente (Can) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"She ___ (sabe/puede) read very well.", "s":{"type":"typing","correct_answers":["can"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (no saben/no pueden) play the piano.", "s":{"type":"typing","correct_answers":["can''t","cannot"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (¿Puedes) you help me with this?", "s":{"type":"typing","correct_answers":["Can"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (puedo) swim across the river.", "s":{"type":"typing","correct_answers":["can"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (no sabe) cook at all.", "s":{"type":"typing","correct_answers":["can''t","cannot"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (podemos) go to the cinema tonight.", "s":{"type":"typing","correct_answers":["can"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (¿Sabe) he drive a truck?", "s":{"type":"typing","correct_answers":["Can"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (puedes) stay here if you want.", "s":{"type":"typing","correct_answers":["can"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"Según los apuntes, ¿qué significa y para qué se usa principalmente el verbo modal CAN?", "s":{"type":"multiple_choice","options":["Para decir que sabemos o podemos hacer una cosa (Poder o Saber)","Para dar órdenes estrictas","Para hablar de hábitos en el pasado"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se conjuga el verbo CAN para la tercera persona (He/She/It)?", "s":{"type":"multiple_choice","options":["Es igual para todas las personas, no se le añade -s (He can)","Se le añade una -s (He cans)","Se usa el auxiliar does (He does can)"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ read perfectly.", "s":{"type":"multiple_choice","options":["can","cans","is can"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ play the piano. (Negativa)", "s":{"type":"multiple_choice","options":["can''t","don''t can","not can"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ you speak English?", "s":{"type":"multiple_choice","options":["Can","Do can","Are can"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué forma toma el verbo principal después de CAN?", "s":{"type":"multiple_choice","options":["Infinitivo sin TO (ej. Can read)","Infinitivo con TO (ej. Can to read)","Gerundio (ej. Can reading)"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He ___ run very fast.", "s":{"type":"multiple_choice","options":["can","cans","can to"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ see anything in the dark.", "s":{"type":"multiple_choice","options":["can''t","don''t can","am not can"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El verbo modal ''can'' se traduce al español tanto como PODER como SABER (hacer algo).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La oración ''She cans read'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''They can''t play the piano'' es el ejemplo exacto de tus apuntes para la negación.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para preguntar con ''can'', se necesita usar el auxiliar DO o DOES.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Can'' es un verbo modal, lo que significa que todas sus personas se escriben exactamente igual.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Después de ''can'', el siguiente verbo siempre debe terminar en -ing.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Can'' se utiliza exclusivamente para hablar de habilidades y capacidades en el presente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Ella sabe leer.", "s":{"type":"scramble","chunks":["She","can","read"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos no saben tocar el piano.", "s":{"type":"scramble","chunks":["They can''t","play","the piano"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Puedes ayudarme?", "s":{"type":"scramble","chunks":["Can","you","help me?"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Yo puedo nadar muy rápido.", "s":{"type":"scramble","chunks":["I can","swim","very fast"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Nosotros no podemos ir hoy.", "s":{"type":"scramble","chunks":["We can''t","go","today"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Sabe ella conducir?", "s":{"type":"scramble","chunks":["Can","she","drive?"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él puede correr muy rápido.", "s":{"type":"scramble","chunks":["He can","run","very fast"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Pasado (Could) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I ___ (podía/sabía) swim when I was five.", "s":{"type":"typing","correct_answers":["could"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (podía/sabía) understand French when he was four.", "s":{"type":"typing","correct_answers":["could"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (no pudimos) go to the party yesterday.", "s":{"type":"typing","correct_answers":["couldn''t","could not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (¿Pudiste) you see the sign?", "s":{"type":"typing","correct_answers":["Could"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (no podía) sleep last night.", "s":{"type":"typing","correct_answers":["couldn''t","could not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (podían) run very fast when they were young.", "s":{"type":"typing","correct_answers":["could"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (no pude) finish my homework.", "s":{"type":"typing","correct_answers":["couldn''t","could not"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (¿Podían) they hear us?", "s":{"type":"typing","correct_answers":["Could"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Para qué se utiliza el verbo modal COULD según tus apuntes?", "s":{"type":"multiple_choice","options":["Para expresar lo mismo que CAN, pero en pasado (podía, pude o podría)","Para hablar de acciones futuras","Para expresar una prohibición absoluta"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ___ swim when I was five.", "s":{"type":"multiple_choice","options":["could","can","was can"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He ___ understand French when he was four.", "s":{"type":"multiple_choice","options":["could","can","could to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Cómo se forma la negación de COULD?", "s":{"type":"multiple_choice","options":["Couldn''t (Could not)","Didn''t could","Don''t could"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They ___ find the keys yesterday.", "s":{"type":"multiple_choice","options":["couldn''t","didn''t can","not could"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ you swim when you were a child?", "s":{"type":"multiple_choice","options":["Could","Did can","Were you can"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She couldn''t ___ the door.", "s":{"type":"multiple_choice","options":["open","opened","to open"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Igual que con CAN, el verbo que va después de COULD debe ir en:", "s":{"type":"multiple_choice","options":["Infinitivo sin TO","Gerundio (-ing)","Participio"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Could'' es el equivalente en pasado del verbo ''Can''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La oración ''I could swim when I was five'' es el ejemplo textual de tus apuntes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para hacer una pregunta con ''could'' necesitas usar el auxiliar DID (ej. Did you could?).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Could'' se traduce al español como PODÍA, PUDE o PODRÍA.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Al igual que ''can'', ''could'' es igual para todas las personas (I, you, he, she...).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''He could understood French'' poniendo también el segundo verbo en pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La contracción negativa de ''could not'' es ''couldn''t''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Yo sabía nadar cuando tenía cinco años.", "s":{"type":"scramble","chunks":["I could swim","when","I was five"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él podía entender francés.", "s":{"type":"scramble","chunks":["He could","understand","French"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: No pudimos ir a la fiesta.", "s":{"type":"scramble","chunks":["We couldn''t","go","to the party"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no podía dormir.", "s":{"type":"scramble","chunks":["She","couldn''t","sleep"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Pudiste verlo?", "s":{"type":"scramble","chunks":["Could","you","see it?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ellos podían correr rápido.", "s":{"type":"scramble","chunks":["They could","run","fast"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: No pude terminar mi trabajo.", "s":{"type":"scramble","chunks":["I couldn''t","finish","my work"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Futuro (Will be able to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"You ___ (podrás) see the Statue of Liberty.", "s":{"type":"typing","correct_answers":["will be able to","''ll be able to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (no podrán) use cellphones on the plane.", "s":{"type":"typing","correct_answers":["won''t be able to","will not be able to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Podrás) you come to the party?", "s":{"type":"typing","correct_answers":["Will you be able to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We ___ (podremos) help you tomorrow.", "s":{"type":"typing","correct_answers":["will be able to","''ll be able to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (no podré) go to the meeting.", "s":{"type":"typing","correct_answers":["won''t be able to","will not be able to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___ (podrá) finish the project on time.", "s":{"type":"typing","correct_answers":["will be able to","''ll be able to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (no podrá) drive for a month.", "s":{"type":"typing","correct_answers":["won''t be able to","will not be able to"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Podrán) they win the match?", "s":{"type":"typing","correct_answers":["Will they be able to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"Dado que CAN y COULD no tienen forma futura, ¿qué expresión usamos para hablar de habilidad en el futuro?", "s":{"type":"multiple_choice","options":["Will be able to","Will can","Will could"],"answer":0}}'::jsonb,
        '{"r":3, "p":"You ___ see the Statue of Liberty in New York.", "s":{"type":"multiple_choice","options":["will be able to","will can","are able to"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They ___ use cellphones on the plane. (No podrán)", "s":{"type":"multiple_choice","options":["won''t be able to","won''t can","will not can"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cómo preguntas ''¿Podrás venir?''?", "s":{"type":"multiple_choice","options":["Will you be able to come?","Will you can come?","Do you will be able to come?"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I ___ finish my work tomorrow.", "s":{"type":"multiple_choice","options":["will be able to","will can","am able"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She ___ read the whole book in one day. (No podrá)", "s":{"type":"multiple_choice","options":["won''t be able to","doesn''t will be able to","won''t can"],"answer":0}}'::jsonb,
        '{"r":3, "p":"''To be able to'' significa literalmente...", "s":{"type":"multiple_choice","options":["Ser capaz de","Estar a punto de","Tener que"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We ___ travel to Japan next year.", "s":{"type":"multiple_choice","options":["will be able to","will can to","will be able"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Para decir ''yo podré'', en inglés es correcto decir ''I will can''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''You will be able to see the Statue of Liberty'' es la frase exacta de tus apuntes para la habilidad en futuro.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La negación de habilidad en el futuro se forma con ''won''t be able to''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''They won''t be able to use cellphones'' significa ''Ellos no podrán usar teléfonos móviles''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La expresión ''to be able to'' sirve exactamente para lo mismo que CAN y COULD, pero aplicada a tiempos donde estos no existen.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Después de ''will be able to'', el verbo debe terminar en -ing.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"En las preguntas de futuro, WILL se coloca delante del sujeto: ''Will you be able to...?''", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Podrás ver la Estatua de la Libertad.", "s":{"type":"scramble","chunks":["You will be able to","see","the Statue of Liberty"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: No podrán usar teléfonos.", "s":{"type":"scramble","chunks":["They won''t be able to","use","cellphones"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Podremos ayudarte mañana.", "s":{"type":"scramble","chunks":["We will be able to","help you","tomorrow"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Podrás venir?", "s":{"type":"scramble","chunks":["Will you","be able to","come?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: No podré ir a la reunión.", "s":{"type":"scramble","chunks":["I won''t be able to","go","to the meeting"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella podrá terminar a tiempo.", "s":{"type":"scramble","chunks":["She will be able to","finish","on time"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él no podrá conducir.", "s":{"type":"scramble","chunks":["He won''t be able to","drive","for a month"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Tiempos Perfectos (Have/Had been able to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"She ___ (ha podido) drive since she was eighteen.", "s":{"type":"typing","correct_answers":["has been able to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (no ha podido) finish his work yet.", "s":{"type":"typing","correct_answers":["hasn''t been able to","has not been able to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (habían podido) finish their work before they went on holidays.", "s":{"type":"typing","correct_answers":["had been able to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (no había podido) use the computer until he went to classes.", "s":{"type":"typing","correct_answers":["had not been able to","hadn''t been able to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I ___ (he podido) sleep well lately.", "s":{"type":"typing","correct_answers":["have been able to","''ve been able to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We ___ (no hemos podido) find the house.", "s":{"type":"typing","correct_answers":["haven''t been able to","have not been able to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (¿Has podido) you been able to fix the car?", "s":{"type":"typing","correct_answers":["Have"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (no había podido) call me.", "s":{"type":"typing","correct_answers":["hadn''t been able to","had not been able to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Cómo formamos la habilidad en Presente Perfecto (ha podido)?", "s":{"type":"multiple_choice","options":["Have/Has been able to","Have/Has can","Had been able to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cómo formamos la habilidad en Pasado Perfecto (había podido)?", "s":{"type":"multiple_choice","options":["Had been able to","Have/Has been able to","Had can"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ drive since she was eighteen.", "s":{"type":"multiple_choice","options":["has been able to","have been able to","had can to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He ___ finish his work yet.", "s":{"type":"multiple_choice","options":["hasn''t been able to","haven''t been able to","hasn''t can"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They ___ finish their work before they went on holidays.", "s":{"type":"multiple_choice","options":["had been able to","have been able to","were able to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He ___ use the computer until he went to classes.", "s":{"type":"multiple_choice","options":["had not been able to","has not been able to","did not can"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I ___ see him recently. (No he podido)", "s":{"type":"multiple_choice","options":["haven''t been able to","hasn''t been able to","hadn''t been able to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We ___ solve the problem before the boss arrived. (Habíamos podido)", "s":{"type":"multiple_choice","options":["had been able to","have been able to","has been able to"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Al igual que en futuro, usamos ''to be able to'' en tiempos perfectos porque CAN no tiene participio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''She has been able to drive'' significa ''Ella ha podido conducir''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''He hasn''t canned to finish'' para el presente perfecto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''They had been able to finish'' se usa para expresar que ''Habían podido terminar'' antes de otro evento pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La estructura completa es el auxiliar (Have/Has/Had) seguido de ''been able to''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''He had not been able to use the computer'' es una oración de presente perfecto.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En los tiempos perfectos, la forma del verbo principal detrás de ''to'' debe ser el infinitivo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Ella ha podido conducir desde los dieciocho.", "s":{"type":"scramble","chunks":["She has been able to","drive","since she was eighteen"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él no ha podido terminar todavía.", "s":{"type":"scramble","chunks":["He hasn''t been able to","finish","yet"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ellos habían podido terminar su trabajo antes de las vacaciones.", "s":{"type":"scramble","chunks":["They had been able to finish","their work","before holidays"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él no había podido usar el ordenador.", "s":{"type":"scramble","chunks":["He hadn''t been able to","use","the computer"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Yo he podido dormir bien.", "s":{"type":"scramble","chunks":["I have been able to","sleep","well"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: No hemos podido encontrar la casa.", "s":{"type":"scramble","chunks":["We haven''t been able to","find","the house"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella no había podido llamarme.", "s":{"type":"scramble","chunks":["She hadn''t","been able to","call me"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 45, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Habilidad y Capacidad', 
    'Aprende a expresar lo que sabes o puedes hacer en todos los tiempos verbales usando Can, Could y To be able to.', 
    to_jsonb('## Grammar Lesson: Habilidad y Capacidad
Expresar que sabemos o podemos hacer algo requiere usar diferentes verbos modales dependiendo de la época o tiempo en el que se ubique la acción.

##### 1. El Presente: CAN
El verbo modal **CAN** sirve para decir que sabemos o podemos hacer una cosa ahora mismo. Puede traducirse como PODER o SABER. Al ser un verbo modal, **todas las personas son exactamente iguales** (no se añade "-s" para he/she/it), y el verbo que le sigue va en infinitivo sin *to*.
*   *She **can** read.* (Ella sabe/puede leer).
*   *They **can''t** play the piano.* (Ellos no saben/no pueden tocar el piano).

##### 2. El Pasado: COULD
Para expresar exactamente lo mismo pero en el pasado, utilizamos **COULD**. Significa PODÍA, PUEDE o PODRÍA. Se forma igual: es idéntico para todas las personas y el verbo va sin *to*.
*   *I **could** swim when I was five.* (Sabía/Podía nadar cuando tenía cinco años).
*   *He **could** understand French when he was four.* (Él podía entender francés cuando tenía cuatro años).

##### 3. El Futuro: WILL BE ABLE TO
Dado que *CAN* no tiene forma futura (no se puede decir "will can"), en inglés utilizamos la estructura **TO BE ABLE TO** (literalmente: ser capaz de).
*   *You **will be able to** see the Statue of Liberty in New York.* (Podrás ver la Estatua de la Libertad en Nueva York).
*   *They **won''t be able to** use cellphones on the plane.* (No podrán usar teléfonos móviles en el avión).

##### 4. Los Tiempos Perfectos
De la misma manera, como *CAN* no tiene participio (no se puede decir "ha podido" usando "has canned"), usamos nuevamente la estructura **TO BE ABLE TO** conjugándola en los tiempos perfectos:
*   **Presente Perfecto (Ha podido):**
    *   *She **has been able to** drive since she was eighteen.* (Ha podido conducir desde los dieciocho años).
    *   *He **hasn''t been able to** finish his work yet.* (No ha podido terminar su trabajo todavía).
*   **Pasado Perfecto (Había podido):**
    *   *They **had been able to** finish their work before they went on holidays.* (Habían podido terminar su trabajo antes de irse de vacaciones).
    *   *He **had not been able to** use the computer until he went to classes.* (No había podido usar el ordenador hasta que fue a clases).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Presente (Can)', 'Usa el verbo modal "CAN" (o "CAN''T") para expresar que sabes o puedes hacer algo en la actualidad. ¡Es igual para todas las personas y va seguido del verbo sin "to"!');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Pasado (Could)', 'Para hablar de habilidades pasadas (podía, sabía), utiliza "COULD". Forma su negativa con "COULDN''T".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Futuro (Will be able to)', 'Como "Can" no tiene futuro, debes usar "Will be able to" para decir "podré", "podrá", etc. Para la negativa usa "Won''t be able to".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Tiempos Perfectos (Have/Had been able to)', 'Usa "Have/Has been able to" para decir que alguien "ha podido" hacer algo. Usa "Had been able to" para decir que "había podido".');

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