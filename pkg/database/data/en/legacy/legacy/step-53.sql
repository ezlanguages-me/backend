-- ============================================================
-- Seed: A0 English Path – Grammar – Órdenes, Sugerencias y Consejos
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
        -- REGLA 1: Órdenes y Advertencias - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"___ (Siempre sé) nice to people.", "s":{"type":"typing","correct_answers":["Always be"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (No te sientes) on the table!", "s":{"type":"typing","correct_answers":["Don''t sit","Do not sit"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Abre) the window, please.", "s":{"type":"typing","correct_answers":["Open"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (más te vale) keep your driving license.", "s":{"type":"typing","correct_answers":["had better"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (más te vale no) forget your driving license.", "s":{"type":"typing","correct_answers":["had better not"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (No hables) in the library.", "s":{"type":"typing","correct_answers":["Don''t talk","Do not talk"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (Nunca vayas) there alone.", "s":{"type":"typing","correct_answers":["Never go"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (más te vale) study hard.", "s":{"type":"typing","correct_answers":["had better"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Cómo se forma el imperativo afirmativo según tus apuntes?", "s":{"type":"multiple_choice","options":["Con el verbo en infinitivo sin la palabra TO","Con el verbo terminado en -ing","Con el verbo antecedido por TO"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se forma una orden negativa (imperativo negativo)?", "s":{"type":"multiple_choice","options":["Don''t + verbo en infinitivo sin TO","Doesn''t + verbo","Not + verbo en -ing"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ on the table!", "s":{"type":"multiple_choice","options":["Don''t sit","No sit","Not sit"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Always ___ nice to people.", "s":{"type":"multiple_choice","options":["be","are","is"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Para qué se utiliza la expresión ''Had better''?", "s":{"type":"multiple_choice","options":["Para dar un aviso fuerte o una amenaza (más vale que...)","Para dar una sugerencia amable","Para pedir permiso en el pasado"],"answer":0}}'::jsonb,
        '{"r":1, "p":"You ___ keep your driving license on you while driving.", "s":{"type":"multiple_choice","options":["had better","had better to","have better"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se hace la negativa de ''Had better''?", "s":{"type":"multiple_choice","options":["Had better not","Hadn''t better","Didn''t have better"],"answer":0}}'::jsonb,
        '{"r":1, "p":"You ___ not forget your keys.", "s":{"type":"multiple_choice","options":["had better","had best","have better"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"El imperativo se usa para decirle a alguien que haga o no haga algo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Para hacer una orden afirmativa se debe usar la palabra TO (ej. To open the door).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Don''t sit on the table!'' es un mandato negativo correctamente escrito.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La expresión ''had better'' se traduce como un aviso o amenaza (ej. más te vale).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''You had better not forget'' significa ''Más vale que no lo olvides''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se debe usar ''doesn''t'' para dar órdenes negativas a una tercera persona que esté presente.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El imperativo es exclusivo para reprender, no se puede usar para animar a alguien.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Siempre sé amable con la gente.", "s":{"type":"scramble","chunks":["Always","be nice","to people"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: No te sientes en la mesa.", "s":{"type":"scramble","chunks":["Don''t sit","on","the table"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Más te vale quedarte aquí.", "s":{"type":"scramble","chunks":["You had better","stay","here"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Más vale que no lo olvides.", "s":{"type":"scramble","chunks":["You had better","not","forget it"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Cierra la puerta, por favor.", "s":{"type":"scramble","chunks":["Close","the door,","please"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Más te vale guardar tu licencia.", "s":{"type":"scramble","chunks":["You had better","keep","your license"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: No hables en clase.", "s":{"type":"scramble","chunks":["Don''t","talk","in class"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Sugerencias y Ofrecimientos - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"___ (Salgamos / Vamos) out.", "s":{"type":"typing","correct_answers":["Let''s"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (¿Te ayudo / Debería ayudar) I help you with your homework?", "s":{"type":"typing","correct_answers":["Shall"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"How about ___ (ir) to the cinema tomorrow?", "s":{"type":"typing","correct_answers":["going"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"What about ___ (comprar) that for Xmas?", "s":{"type":"typing","correct_answers":["buying"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Where ___ (deberíamos / sugerencia) we go tonight?", "s":{"type":"typing","correct_answers":["shall"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Hagamos) a cake.", "s":{"type":"typing","correct_answers":["Let''s make"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"How about ___ (jugar) tennis?", "s":{"type":"typing","correct_answers":["playing"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (¿Abro) I open the window?", "s":{"type":"typing","correct_answers":["Shall"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué usamos para sugerir una actividad en la que nosotros también nos incluimos?", "s":{"type":"multiple_choice","options":["Let''s + verbo sin TO","Shall + verbo","How about + infinitivo"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Con qué pronombres se utiliza la estructura ''Shall... ?'' para ofrecerse a hacer algo o pedir consejo?", "s":{"type":"multiple_choice","options":["I / We","You / They","He / She / It"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué forma toma el verbo detrás de las expresiones ''How about'' y ''What about''?", "s":{"type":"multiple_choice","options":["Terminado en -ing","Infinitivo sin TO","Participio pasado"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ go out tonight.", "s":{"type":"multiple_choice","options":["Let''s","Shall","How about"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ I help you with those bags?", "s":{"type":"multiple_choice","options":["Shall","Let''s","What about"],"answer":0}}'::jsonb,
        '{"r":2, "p":"How about ___ pizza for dinner?", "s":{"type":"multiple_choice","options":["ordering","order","to order"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Where ___ we go for our holidays?", "s":{"type":"multiple_choice","options":["shall","let''s","how about"],"answer":0}}'::jsonb,
        '{"r":2, "p":"What about ___ that movie?", "s":{"type":"multiple_choice","options":["watching","watch","watched"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"La estructura ''Let''s'' siempre va seguida de un verbo en infinitivo sin TO.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''How about to go to the cinema?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Shall I open the window?'' es una forma educada de ofrecerse a abrir la ventana.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Podemos usar ''Shall'' con el pronombre ''They'' para hacer sugerencias (ej. Shall they go?).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''What about buying that?'' significa ''¿Qué tal si compramos eso? / ¿Qué te parece comprar eso?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Let''s go out'' incluye a la persona que habla y a los que escuchan.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Detrás de ''How about'' y ''What about'' los verbos van en gerundio (-ing).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Salgamos.", "s":{"type":"scramble","chunks":["Let''s","go","out"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Te ayudo con los deberes?", "s":{"type":"scramble","chunks":["Shall I","help you","with your homework?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Qué tal si vamos al cine mañana?", "s":{"type":"scramble","chunks":["How about","going to the cinema","tomorrow?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Qué te parece comprar eso para Navidad?", "s":{"type":"scramble","chunks":["What about","buying that","for Xmas?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Abro la ventana?", "s":{"type":"scramble","chunks":["Shall I","open","the window?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿A dónde deberíamos ir esta noche?", "s":{"type":"scramble","chunks":["Where","shall we","go tonight?"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Juguemos un partido.", "s":{"type":"scramble","chunks":["Let''s","play","a match"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Peticiones (Can, May, Would like, Borrow/Lend) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"___ (¿Podrías) you help me?", "s":{"type":"typing","correct_answers":["Could"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Puedo) I use your phone?", "s":{"type":"typing","correct_answers":["May","Can"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I ___ (me gustaría) some information about buses.", "s":{"type":"typing","correct_answers":["would like"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Can I ___ (tomar prestado) your pen?", "s":{"type":"typing","correct_answers":["borrow"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Could you ___ (prestar) me your pen?", "s":{"type":"typing","correct_answers":["lend"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Te gustaría) a sandwich?", "s":{"type":"typing","correct_answers":["Would you like"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Harás/Podrás) you help me?", "s":{"type":"typing","correct_answers":["Will"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"May I ___ (tomar prestado) your book?", "s":{"type":"typing","correct_answers":["borrow"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Cuál es más formal para hacer una petición: Can o Could?", "s":{"type":"multiple_choice","options":["Could","Can","Ambos son igual de informales"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué verbo modal se usa exclusivamente para pedir permiso en primera persona de forma muy educada?", "s":{"type":"multiple_choice","options":["May (ej. May I...?)","Will (ej. Will I...?)","Must (ej. Must I...?)"],"answer":0}}'::jsonb,
        '{"r":3, "p":"En una tienda o restaurante, ¿qué expresión debemos usar para ser educados en lugar de decir ''I want''?", "s":{"type":"multiple_choice","options":["I would like","I need","I demand"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es el sujeto correcto para usar con el verbo BORROW (tomar prestado)?", "s":{"type":"multiple_choice","options":["I / We (ej. Can I borrow...?)","You / They (ej. Can you borrow me...?)","He / She"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Qué verbo usamos cuando le pedimos a la OTRA persona que nos preste algo?", "s":{"type":"multiple_choice","options":["Lend (ej. Can you lend me...?)","Borrow (ej. Can you borrow me...?)","Give"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ you help me with this box?", "s":{"type":"multiple_choice","options":["Will","May","Shall"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ you like a cup of tea?", "s":{"type":"multiple_choice","options":["Would","Will","Do"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Could you ___ me 10 dollars?", "s":{"type":"multiple_choice","options":["lend","borrow","take"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"Decir ''I want some information'' en una agencia se considera grosero; se debe usar ''I would like''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''May I use your phone?'' significa ''¿Me prestas tu teléfono? / ¿Puedo usar tu teléfono?'' de forma muy educada.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"El verbo ''Borrow'' significa PRESTAR (dar algo a alguien).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''Can you borrow me your pen?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Para pedir que alguien te preste algo debes decir ''Can you lend me...?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Would you like a sandwich?'' sirve para hacer un ofrecimiento o invitación.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Could you help me?'' es más formal y educado que ''Can you help me?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: ¿Me ayudarás?", "s":{"type":"scramble","chunks":["Will","you","help me?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Puedo usar tu teléfono?", "s":{"type":"scramble","chunks":["May I","use","your phone?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Me gustaría un poco de información.", "s":{"type":"scramble","chunks":["I would like","some information","about buses"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Te gustaría un sándwich?", "s":{"type":"scramble","chunks":["Would you","like","a sandwich?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Puedo tomar prestado tu bolígrafo?", "s":{"type":"scramble","chunks":["Can I","borrow","your pen?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Podrías prestarme tu bolígrafo?", "s":{"type":"scramble","chunks":["Could you","lend me","your pen?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Podrías ayudarme?", "s":{"type":"scramble","chunks":["Could","you","help me?"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Consejos y Obligaciones (Should, Ought to, Supposed to) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"You ___ (deberías) go to the doctor when you are ill.", "s":{"type":"typing","correct_answers":["should"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ (¿Deberíamos) we tell him everything?", "s":{"type":"typing","correct_answers":["Should"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (debería) quit smoking. (Usa el sinónimo de should de 2 palabras)", "s":{"type":"typing","correct_answers":["ought to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"You are ___ (se supone que debes) check the mirrors.", "s":{"type":"typing","correct_answers":["supposed to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"You are not ___ (no se supone que debas) listen to the radio while driving.", "s":{"type":"typing","correct_answers":["supposed to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (debería) study more.", "s":{"type":"typing","correct_answers":["should"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (deberían) apologize. (Usa el sinónimo de should)", "s":{"type":"typing","correct_answers":["ought to"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Am I ___ (se supone que debo) be here?", "s":{"type":"typing","correct_answers":["supposed to"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué verbo modal usamos para dar consejos u opiniones de forma menos tajante que el imperativo?", "s":{"type":"multiple_choice","options":["Should","Must","Have to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Según los apuntes, ¿cuál es el sinónimo exacto de ''Should'' para dar consejos?", "s":{"type":"multiple_choice","options":["Ought to","Need to","Can"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué significa la expresión ''Be supposed to''?", "s":{"type":"multiple_choice","options":["Estar supuesto a / Que se espera o supone que hagamos algo","Tener la prohibición absoluta de algo","Estar a punto de hacer algo"],"answer":0}}'::jsonb,
        '{"r":4, "p":"You ___ go to the doctor when you are ill.", "s":{"type":"multiple_choice","options":["should","ought","supposed to"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She ___ to quit smoking.", "s":{"type":"multiple_choice","options":["ought","should","had better"],"answer":0}}'::jsonb,
        '{"r":4, "p":"You are ___ to check the rear mirrors constantly.", "s":{"type":"multiple_choice","options":["supposed","suppose","supposing"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ we tell him everything?", "s":{"type":"multiple_choice","options":["Should","Ought","Supposed"],"answer":0}}'::jsonb,
        '{"r":4, "p":"You are not ___ to use your phone in the library.", "s":{"type":"multiple_choice","options":["supposed","should","ought"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Should'' se usa para aconsejar de manera más suave y amigable que un imperativo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La expresión ''Ought to'' significa lo mismo que ''Should''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En las preguntas, se puede usar ''Should'' para pedir consejo (ej. Should we tell him?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''You are supposed to check the mirrors'' indica una sugerencia opcional sin importancia.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Supposed to'' funciona con el verbo TO BE conjugado delante (am, is, are).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''She ought quit smoking'' sin la palabra TO.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''You are not supposed to listen to the radio'' significa que no se espera o no se debe hacer eso según las normas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Deberías ir al médico.", "s":{"type":"scramble","chunks":["You should","go","to the doctor"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Deberíamos contárselo todo?", "s":{"type":"scramble","chunks":["Should we","tell him","everything?"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella debería dejar de fumar.", "s":{"type":"scramble","chunks":["She","ought to","quit smoking"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Se supone que debes revisar los espejos.", "s":{"type":"scramble","chunks":["You are supposed to","check","the rear mirrors"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: No se supone que escuches la radio.", "s":{"type":"scramble","chunks":["You are not","supposed to listen","to the radio"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Deberías estudiar más.", "s":{"type":"scramble","chunks":["You","should","study more"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Se supone que deben estar aquí.", "s":{"type":"scramble","chunks":["They are","supposed to","be here"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 44, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Órdenes, Sugerencias y Peticiones', 
    'Aprende a comunicarte de manera efectiva según la situación: desde dar órdenes y amenazar, hasta hacer sugerencias, pedir favores y dar consejos.', 
    to_jsonb('## Grammar Lesson: Órdenes, Sugerencias y Peticiones
La manera en que construyes la frase en inglés cambia por completo el tono del mensaje. No es lo mismo exigir algo, que sugerirlo o pedirlo educadamente.

##### 1. Órdenes y Advertencias (Imperativos y Had Better)
*   **El Imperativo:** Se utiliza para decirle a alguien que haga algo o reprenderlo. Se usa el verbo directo **sin la palabra TO**. Para negativas se antepone **Don''t**.
    *   *Always **be** nice to people.* (Sé siempre amable).
    *   ***Don''t sit** on the table!* (¡No te sientes en la mesa!).
*   **Had better (Más te vale):** Sirve para dar un aviso fuerte o amenaza.
    *   *You **had better keep** your driving license.* (Más te vale guardar tu licencia).
    *   *You **had better not** forget.* (Más vale que no lo olvides).

##### 2. Sugerencias y Ofrecimientos (Let''s, Shall, How/What about)
*   **Let''s:** Para sugerir algo donde nosotros también participamos (verbo sin TO).
    *   ***Let''s go** out.* (Salgamos).
*   **Shall I / We...?:** Para ofrecerse a hacer algo o pedir un consejo grupal.
    *   ***Shall I help** you?* (¿Te ayudo?).
*   **How about / What about:** Para invitar o sugerir ideas. La gran diferencia es que el verbo que les sigue **siempre termina en -ing**.
    *   ***How about going** to the cinema tomorrow?* (¿Qué tal si vamos al cine?).

##### 3. Peticiones e Invitaciones (Can, May, Would like)
*   **Formalidad:** Para pedir ayuda, *Can you* es normal, *Could you* es más formal, y *Will you* es directo.
*   **May I...?:** El más formal y educado para pedir permiso en primera persona. (*May I use your phone?* = ¿Puedo usar tu teléfono?).
*   **Regla de oro en tiendas:** Jamás digas "I want" (es muy rudo). Usa **I would like** (Me gustaría). Para invitar a alguien usa *Would you like...?*
*   **Borrow vs Lend:** *Borrow* significa TOMAR PRESTADO (lo haces tú), por tanto se usa con "I" (*Can I borrow your pen?*). *Lend* significa PRESTAR (te lo dan), por lo que se usa con "You" (*Can you lend me your pen?*).

##### 4. Consejos y Obligaciones
*   **Should / Ought to:** Se usan para dar o pedir consejo; son mucho más suaves que un imperativo. "Ought to" es exactamente el sinónimo de "Should".
    *   *You **should go** to the doctor.* (Deberías ir al médico).
    *   *She **ought to quit** smoking.* (Ella debería dejar de fumar).
*   **Be supposed to:** Expresa lo que "se supone" que se espera de ti bajo unas normas o sentido común.
    *   *You **are supposed to check** the mirrors.* (Se supone que debes mirar los espejos).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Órdenes y Advertencias', 'Para dar órdenes, usa el verbo directamente en infinitivo sin "to" (en negativas, usa "Don''t"). Para avisos fuertes o amenazas usa la estructura "Had better".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Sugerencias y Ofrecimientos', 'Recuerda que con "Let''s" y "Shall" el verbo va en forma base. Pero con "How about" y "What about", el verbo siempre debe terminar en "-ing".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Peticiones (Can, May, Would like)', 'En tiendas y peticiones educadas usa "I would like" (nunca I want). Recuerda: "Borrow" significa tomar prestado (Can I borrow...?) y "Lend" significa prestar (Can you lend me...?).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Consejos y Obligaciones', 'Usa "Should" o su sinónimo "Ought to" para dar consejos. Usa el verbo To Be + "supposed to" para indicar lo que se espera o las normas dictan que hagas.');

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