-- ============================================================
-- Seed: A0 English Path – Grammar – Present Perfect
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
        -- REGLA 1: Formación y Experiencias Pasadas - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I ___ (he) visited London.", "s":{"type":"typing","correct_answers":["have"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (ha) finished her book.", "s":{"type":"typing","correct_answers":["has"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We have ___ (ganado) the match.", "s":{"type":"typing","correct_answers":["won"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He has ___ (vivido) here all his life.", "s":{"type":"typing","correct_answers":["lived"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Dan has ___ (terminado) his novel.", "s":{"type":"typing","correct_answers":["finished"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Their English has ___ (mejorado) a lot.", "s":{"type":"typing","correct_answers":["improved"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Auxiliar) you seen the Queen?", "s":{"type":"typing","correct_answers":["Have"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (no he) been to Paris.", "s":{"type":"typing","correct_answers":["haven''t","have not"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cuáles son los verbos auxiliares del Presente Perfecto?", "s":{"type":"multiple_choice","options":["Have / Has","Do / Does","Was / Were"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué forma toma el verbo principal en el Presente Perfecto?", "s":{"type":"multiple_choice","options":["Añadiendo -ed o usando la 3ra columna","Usando el infinitivo","Añadiendo -ing"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuándo se debe utilizar el Presente Perfecto en lugar del Pasado Simple?", "s":{"type":"multiple_choice","options":["Cuando la acción es más importante que el momento en el que ocurrió","Cuando queremos especificar la fecha exacta (ej. yesterday)","Para hablar de cosas que sucederán mañana"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She ___ finished her homework.", "s":{"type":"multiple_choice","options":["has","have","is"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Arsenal ___ won a lot of matches.", "s":{"type":"multiple_choice","options":["have","has","did"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Podemos usar adverbios de tiempo concretos como ''yesterday'' con el Presente Perfecto?", "s":{"type":"multiple_choice","options":["No","Sí","A veces"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I have ___ to London.", "s":{"type":"multiple_choice","options":["been","be","was"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ not arrived.", "s":{"type":"multiple_choice","options":["have","has","are"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El Presente Perfecto se forma siempre con HAVE o HAS seguido del verbo en la 3ra columna o terminado en -ed.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es totalmente correcto decir ''I have visited London yesterday''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Utilizamos este tiempo para dar más importancia a la acción en sí (experiencias, logros) que al momento en el que pasó.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La oración ''He have lived here'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El Presente Perfecto se utiliza para indicar éxitos o logros recientes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Los verbos irregulares utilizan su forma de la 2da columna en este tiempo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Their English has improved'' es un buen ejemplo para mostrar un cambio ocurrido en el tiempo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: He estado en Londres.", "s":{"type":"scramble","chunks":["I have","been to","London"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Dan ha terminado su novela.", "s":{"type":"scramble","chunks":["Dan has","finished","his novel"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Él ha vivido aquí.", "s":{"type":"scramble","chunks":["He has","lived","here"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Su inglés ha mejorado.", "s":{"type":"scramble","chunks":["Their English","has","improved"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: El Arsenal ha ganado muchos partidos.", "s":{"type":"scramble","chunks":["Arsenal have","won","a lot of matches"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella no lo ha visto.", "s":{"type":"scramble","chunks":["She","hasn''t","seen it"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Has estado allí?", "s":{"type":"scramble","chunks":["Have","you","been there?"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: For, Since y How Long - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I have known her ___ (durante) ten years.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I have lived here ___ (desde) 1992.", "s":{"type":"typing","correct_answers":["since"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Cuánto) long have you known Carolyn?", "s":{"type":"typing","correct_answers":["How"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She has worked here ___ (desde) January.", "s":{"type":"typing","correct_answers":["since"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We have studied ___ (durante) three hours.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Cuánto tiempo) have you lived here?", "s":{"type":"typing","correct_answers":["How long"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They have been married ___ (desde) 2010.", "s":{"type":"typing","correct_answers":["since"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He has played tennis ___ (durante) five years.", "s":{"type":"typing","correct_answers":["for"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué palabra significa ''desde'' y se usa para indicar cuándo empezó exactamente la acción?", "s":{"type":"multiple_choice","options":["Since","For","How long"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué palabra se utiliza para expresar la ''cantidad de tiempo'' o duración de la acción?", "s":{"type":"multiple_choice","options":["For","Since","Yet"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué expresión utilizamos para preguntar por la duración de algo en el tiempo?", "s":{"type":"multiple_choice","options":["How long","How much","When"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I have known her ___ ten years.", "s":{"type":"multiple_choice","options":["for","since","during"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I have lived here ___ 1992.", "s":{"type":"multiple_choice","options":["since","for","ago"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ have you been a teacher?", "s":{"type":"multiple_choice","options":["How long","Since when","For how"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She has been sick ___ Monday.", "s":{"type":"multiple_choice","options":["since","for","from"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We have waited ___ two hours.", "s":{"type":"multiple_choice","options":["for","since","during"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''For'' se utiliza para referirse a un punto específico de inicio en el tiempo (ej. for 1999).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La palabra ''Since'' significa ''desde'' e indica el momento de inicio de la acción.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La estructura ''How long'' se utiliza siempre para preguntar el tiempo que ha durado o dura algo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''I have known him for 2015'' es completamente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Decir ''She has lived here since five years'' es un error muy común, debería ser ''for five years''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En este contexto temporal, ''For'' puede traducirse como ''durante''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''How long have you known her?'' significa ''¿Cuánto tiempo hace que la conoces?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: La conozco desde hace diez años.", "s":{"type":"scramble","chunks":["I have known her","for","ten years"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: He vivido aquí desde 1992.", "s":{"type":"scramble","chunks":["I have lived here","since","1992"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Cuánto tiempo la conoces?", "s":{"type":"scramble","chunks":["How long","have you","known her?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella ha trabajado aquí desde enero.", "s":{"type":"scramble","chunks":["She has worked here","since","January"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Hemos estudiado durante tres horas.", "s":{"type":"scramble","chunks":["We have studied","for","three hours"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Están casados desde 2010.", "s":{"type":"scramble","chunks":["They have been married","since","2010"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él ha jugado durante cinco años.", "s":{"type":"scramble","chunks":["He has played","for","five years"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Already, Yet y Just - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"I have ___ (acabo de) seen an accident.", "s":{"type":"typing","correct_answers":["just"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She has ___ (ya) done her homework.", "s":{"type":"typing","correct_answers":["already"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Have you seen that film ___ (ya)?", "s":{"type":"typing","correct_answers":["yet"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I haven''t seen that film ___ (aún).", "s":{"type":"typing","correct_answers":["yet"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He has ___ (ya) eaten.", "s":{"type":"typing","correct_answers":["already"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We have ___ (acabamos de) arrived.", "s":{"type":"typing","correct_answers":["just"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Has the plane arrived ___ (ya)?", "s":{"type":"typing","correct_answers":["yet"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The plane hasn''t arrived ___ (aún).", "s":{"type":"typing","correct_answers":["yet"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué palabra significa ''ya'' y se utiliza exclusivamente en oraciones afirmativas?", "s":{"type":"multiple_choice","options":["Already","Yet","Just"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué palabra se utiliza para indicar que una acción acaba de ocurrir hace un momento?", "s":{"type":"multiple_choice","options":["Just","Already","Yet"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué palabra se utiliza en negativas (para decir ''aún'') y en interrogativas (para decir ''ya'')?", "s":{"type":"multiple_choice","options":["Yet","Already","Just"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She has ___ done her homework.", "s":{"type":"multiple_choice","options":["already","yet","just"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I have ___ seen an accident right now.", "s":{"type":"multiple_choice","options":["just","yet","already"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Have you seen that film ___?", "s":{"type":"multiple_choice","options":["yet","already","just"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I haven''t finished my work ___.", "s":{"type":"multiple_choice","options":["yet","already","just"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Dónde se coloca normalmente la palabra ''yet'' en la oración?", "s":{"type":"multiple_choice","options":["Al final de la frase","Entre el auxiliar y el verbo","Al principio de la frase"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Already'' se utiliza frecuentemente en oraciones negativas para indicar que algo no ha pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"La palabra ''Yet'' significa ''aún'' en oraciones negativas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Usamos ''Just'' colocado entre el auxiliar y el verbo principal para acciones recién terminadas (acabar de).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es gramaticalmente correcto colocar ''yet'' al principio de la frase, como ''Yet I haven''t finished''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''She has already done her homework'' es la forma correcta de decir que ella ya ha terminado su tarea.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La oración ''I haven''t seen that film already'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''I have just arrived'' se traduce mejor como ''Acabo de llegar''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Acabo de ver un accidente.", "s":{"type":"scramble","chunks":["I have","just seen","an accident"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella ya ha hecho su tarea.", "s":{"type":"scramble","chunks":["She has","already done","her homework"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Has visto esa película ya?", "s":{"type":"scramble","chunks":["Have you seen","that film","yet?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Aún no he visto esa película.", "s":{"type":"scramble","chunks":["I haven''t seen","that film","yet"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él ya ha comido.", "s":{"type":"scramble","chunks":["He has","already","eaten"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Acabamos de llegar.", "s":{"type":"scramble","chunks":["We have","just","arrived"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Ha llegado el avión ya?", "s":{"type":"scramble","chunks":["Has the plane","arrived","yet?"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Ever y Never - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"Have you ___ (alguna vez) seen the Queen?", "s":{"type":"typing","correct_answers":["ever"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She has ___ (nunca) seen a kangaroo.", "s":{"type":"typing","correct_answers":["never"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have ___ (nunca) been to Japan.", "s":{"type":"typing","correct_answers":["never"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Has he ___ (alguna vez) played golf?", "s":{"type":"typing","correct_answers":["ever"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We have ___ (nunca) eaten sushi.", "s":{"type":"typing","correct_answers":["never"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Have they ___ (alguna vez) visited Madrid?", "s":{"type":"typing","correct_answers":["ever"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He has ___ (nunca) told a lie.", "s":{"type":"typing","correct_answers":["never"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Have you ___ (alguna vez) driven a truck?", "s":{"type":"typing","correct_answers":["ever"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué palabra significa ''nunca'' y se utiliza siempre en oraciones afirmativas?", "s":{"type":"multiple_choice","options":["Never","Ever","Yet"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué palabra se usa en preguntas para destacar la idea de haber hecho algo ''alguna vez'' en la vida?", "s":{"type":"multiple_choice","options":["Ever","Never","Always"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Have you ___ seen the Queen?", "s":{"type":"multiple_choice","options":["ever","never","yet"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She has ___ seen a kangaroo in real life.", "s":{"type":"multiple_choice","options":["never","ever","yet"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Por qué la palabra ''never'' siempre acompaña a un verbo en forma afirmativa?", "s":{"type":"multiple_choice","options":["Para evitar la doble negación gramatical","Porque es una regla de pronunciación","Porque a los británicos les gusta así"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ you ever eaten sushi?", "s":{"type":"multiple_choice","options":["Have","Has","Do"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Has she ___ been to Paris?", "s":{"type":"multiple_choice","options":["ever","never","since"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I have ___ flown in a helicopter.", "s":{"type":"multiple_choice","options":["never","ever","yet"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Never'' se utiliza en oraciones que ya están en forma negativa (ej. I haven''t never).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La palabra ''Ever'' significa ''nunca'' cuando se usa en oraciones interrogativas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La frase ''Have you ever seen the Queen?'' se traduce perfectamente como ''¿Has visto alguna vez a la Reina?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''She hasn''t never seen a kangaroo'' es una oración gramaticalmente incorrecta.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Ever'' y ''Never'' son las palabras ideales para hablar de las experiencias de toda nuestra vida en Presente Perfecto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Usamos ''ever'' en oraciones afirmativas para indicar que nunca hemos hecho algo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''I have never been to London'' es la forma natural de decir ''Nunca he estado en Londres''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: ¿Has visto alguna vez a la Reina?", "s":{"type":"scramble","chunks":["Have you","ever seen","the Queen?"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella nunca ha visto un canguro.", "s":{"type":"scramble","chunks":["She has","never seen","a kangaroo"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Nunca he estado en Japón.", "s":{"type":"scramble","chunks":["I have","never been","to Japan"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Ha jugado él al golf alguna vez?", "s":{"type":"scramble","chunks":["Has he","ever played","golf?"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Nunca hemos comido sushi.", "s":{"type":"scramble","chunks":["We have","never eaten","sushi"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Han visitado ellos Madrid alguna vez?", "s":{"type":"scramble","chunks":["Have they","ever visited","Madrid?"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él nunca ha dicho una mentira.", "s":{"type":"scramble","chunks":["He has","never told","a lie"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 36, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Presente Perfecto', 
    'Aprende a conectar el pasado con el presente usando HAVE/HAS. Domina el uso de complementos clave como For, Since, Already, Yet, Ever y Never.', 
    to_jsonb('## Grammar Lesson: Presente Perfecto
El **Presente Perfecto** es tu herramienta para hablar de acciones ocurridas en el pasado cuando la acción en sí, el logro o la experiencia son mucho más importantes que el momento exacto en que sucedieron. ¡Nunca utilices adverbios de tiempo exactos (como *yesterday*) con este tiempo!

##### 1. Formación y Usos Generales
Se forma con el auxiliar **HAVE / HAS** seguido del verbo principal en **participio** (terminado en -ed para regulares, o la 3ª columna para irregulares).
*   **Logros y éxitos:** *Dan has finished writing his first novel.* (Dan ha terminado de escribir su novela).
*   **Cambio en el tiempo:** *Their English has improved a lot.* (Su inglés ha mejorado mucho).
*   **Acciones no ocurridas:** *The plane hasn’t arrived.* (El avión no ha llegado).

##### 2. For, Since y How Long
Sirven para acciones que empezaron en el pasado y aún continúan.
*   **How long:** Pregunta CUÁNTO TIEMPO ha durado algo. (*How long have you known Carolyn?*).
*   **For:** Expresa la DURACIÓN o cantidad de tiempo acumulado. (*I have known Carolyn for ten years*).
*   **Since:** Indica el PUNTO DE INICIO exacto (desde) de la acción. (*I have known Carolyn since 1992*).

##### 3. Already, Yet y Just
Tres palabras clave para jugar con las expectativas del tiempo.
*   **Already (Ya):** Se usa en afirmativas e indica que la acción ocurrió antes de lo esperado. (*She has already done her homework*).
*   **Yet (Aún / Ya):** Va al final de la frase. En negativas significa "aún" y en interrogativas "ya". (*Have you seen that film yet? / I haven’t seen it yet*).
*   **Just (Acabar de):** Se coloca entre el auxiliar y el verbo para acciones recién terminadas. (*I have just seen an accident*).

##### 4. Ever y Never (Experiencias)
Usados para repasar la experiencia de toda tu vida hasta el presente.
*   **Ever (Alguna vez):** Se usa en preguntas para destacar la idea de haber realizado algo en la vida. (*Have you ever seen the Queen?*).
*   **Never (Nunca):** Se usa en frases afirmativas (el verbo debe estar en afirmativo) para dar el significado de no haber hecho la acción jamás. (*She has never seen a kangaroo*).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Formación y Usos Básicos', 'Usa HAVE/HAS + participio (3ª columna/-ed) para resaltar el logro o la experiencia. Recuerda: No uses tiempos exactos como "yesterday" con este tiempo verbal.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'For, Since y How Long', 'Recuerda: Usa "How long" para preguntar cuánto tiempo, "For" para la cantidad total de tiempo (durante) y "Since" para el año o día de inicio (desde).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Already, Yet y Just', 'Usa "Already" (ya) en afirmaciones, "Yet" (aún/ya) al final de frases negativas e interrogativas, y "Just" para acciones recién terminadas (acabar de).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Ever y Never', 'Para experiencias: usa "Ever" (alguna vez) en preguntas. Usa "Never" (nunca) en oraciones afirmativas para evitar dobles negaciones.');

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