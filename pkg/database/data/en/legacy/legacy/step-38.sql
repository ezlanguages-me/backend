-- ============================================================
-- Seed: A0 English Path – Grammar – See vs Watch vs Look
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
        -- REGLA 1: SEE (Connotación Pasiva) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I can''t ___ (ver) a thing without my glasses.", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Did you ___ (ver) that bird?", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She didn''t ___ (ver) the sign.", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (vemos) with our eyes.", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I ___ (veo) a plane in the sky.", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He couldn''t ___ (ver) the board.", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I didn''t ___ (ver) you there.", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Can you ___ (ver) the mountains?", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué verbo tiene una connotación pasiva (se puede hacer sin esfuerzo)?", "s":{"type":"multiple_choice","options":["See","Look","Watch"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I can''t ___ a thing without my glasses.", "s":{"type":"multiple_choice","options":["see","look","watch"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Suddenly, I ___ a flash of light in the dark.", "s":{"type":"multiple_choice","options":["looked","saw (pasado de see)","watched"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I opened the door and ___ him standing there.", "s":{"type":"multiple_choice","options":["watched","looked","saw"],"answer":2}}'::jsonb,
        '{"r":1, "p":"If you go out, you will ___ the stars.", "s":{"type":"multiple_choice","options":["see","look","watch"],"answer":0}}'::jsonb,
        '{"r":1, "p":"It was so dark I couldn''t ___ anything.", "s":{"type":"multiple_choice","options":["look","watch","see"],"answer":2}}'::jsonb,
        '{"r":1, "p":"¿Qué verbo usarías para describir la capacidad visual de una persona?", "s":{"type":"multiple_choice","options":["See","Watch","Look"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I ___ my friend at the supermarket yesterday by chance.", "s":{"type":"multiple_choice","options":["saw","looked","watched"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''See'' tiene una connotación pasiva; es algo que ocurre aunque no te esfuerces.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''I can''t watch anything without glasses'' para referirse a la capacidad visual.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''See'' implica que llevamos la mirada intencionalmente hacia algo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Si algo entra accidentalmente en tu campo de visión, el verbo correcto es ''see''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto usar ''see'' para hablar de la percepción física con los ojos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El pasado de ''see'' es ''seed''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''I saw a bird'' significa que un pájaro apareció en mi campo visual.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: No puedo ver nada sin mis gafas.", "s":{"type":"scramble","chunks":["I can''t see","a thing","without my glasses"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Viste ese pájaro?", "s":{"type":"scramble","chunks":["Did you","see","that bird?"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella no vio la señal.", "s":{"type":"scramble","chunks":["She didn''t","see","the sign"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: No te vi allí.", "s":{"type":"scramble","chunks":["I didn''t","see you","there"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Vemos con nuestros ojos.", "s":{"type":"scramble","chunks":["We see","with","our eyes"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Puedes ver las montañas?", "s":{"type":"scramble","chunks":["Can you","see","the mountains?"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él no podía ver nada.", "s":{"type":"scramble","chunks":["He couldn''t","see","anything"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: LOOK (Connotación Activa - Corta) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"___ (Mira) at this car!", "s":{"type":"typing","correct_answers":["Look"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ed (miró) at the picture.", "s":{"type":"typing","correct_answers":["look","looked"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Don''t ___ (mirar) down.", "s":{"type":"typing","correct_answers":["look"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Mira) out the window.", "s":{"type":"typing","correct_answers":["Look"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They are ___ing (mirando) at me.", "s":{"type":"typing","correct_answers":["look","looking"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Please, ___ (mira) at the board.", "s":{"type":"typing","correct_answers":["look"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ed (miró) at his watch.", "s":{"type":"typing","correct_answers":["look","looked"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"___ (Mira) at that dog.", "s":{"type":"typing","correct_answers":["Look"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué verbo indica que llevamos la mirada hacia algo intencionalmente, usualmente por poco tiempo?", "s":{"type":"multiple_choice","options":["Look","See","Watch"],"answer":0}}'::jsonb,
        '{"r":2, "p":"___ at this car!", "s":{"type":"multiple_choice","options":["See","Look","Watch"],"answer":1}}'::jsonb,
        '{"r":2, "p":"If you ___ closely, you will find the hidden message.", "s":{"type":"multiple_choice","options":["see","watch","look"],"answer":2}}'::jsonb,
        '{"r":2, "p":"She ___ at her phone to check the time.", "s":{"type":"multiple_choice","options":["watched","looked","saw"],"answer":1}}'::jsonb,
        '{"r":2, "p":"¿Qué preposición acompaña frecuentemente al verbo ''Look'' cuando se indica el objeto mirado?", "s":{"type":"multiple_choice","options":["in","on","at"],"answer":2}}'::jsonb,
        '{"r":2, "p":"Don''t ___ at me like that!", "s":{"type":"multiple_choice","options":["look","see","watch"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He opened the book and ___ at the first page.", "s":{"type":"multiple_choice","options":["saw","watched","looked"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''___ out!'' (¡Cuidado / Mira afuera!)", "s":{"type":"multiple_choice","options":["See","Watch","Look"],"answer":2}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Look'' tiene una connotación activa; requiere que dirijas intencionalmente tu mirada.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Se utiliza ''Look'' principalmente para miradas de larga duración o para ver programas de televisión.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"La expresión correcta es ''Look at this car!''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Podemos usar ''Look'' para indicar que prestamos atención visual a algo brevemente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''See at me'' es la manera correcta de decir ''Mírame''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Look'' implica un esfuerzo consciente, a diferencia de ''See''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es gramaticalmente correcto decir ''She looked the picture'' (sin la preposición at).", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: ¡Mira este coche!", "s":{"type":"scramble","chunks":["Look at","this","car!"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella miró la foto.", "s":{"type":"scramble","chunks":["She","looked at","the picture"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Por favor, mira a la pizarra.", "s":{"type":"scramble","chunks":["Please,","look at","the board"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No mires hacia abajo.", "s":{"type":"scramble","chunks":["Don''t","look","down"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Mira por la ventana.", "s":{"type":"scramble","chunks":["Look","out","the window"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Me están mirando a mí.", "s":{"type":"scramble","chunks":["They are","looking","at me"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él miró su reloj.", "s":{"type":"scramble","chunks":["He looked","at","his watch"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: WATCH (Connotación Activa - Larga) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"They ___ed (observaron) the children play.", "s":{"type":"typing","correct_answers":["watch","watched"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I like to ___ (ver) TV.", "s":{"type":"typing","correct_answers":["watch"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He is ___ing (viendo) a football match.", "s":{"type":"typing","correct_answers":["watch","watching"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We ___ed (observamos/vimos) the sunset.", "s":{"type":"typing","correct_answers":["watch","watched"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Don''t ___ (ver) too much television.", "s":{"type":"typing","correct_answers":["watch"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She is ___ing (observando) the birds.", "s":{"type":"typing","correct_answers":["watch","watching"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (Observa) your steps.", "s":{"type":"typing","correct_answers":["Watch"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I will ___ (ver) the game tonight.", "s":{"type":"typing","correct_answers":["watch"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué verbo se usa para mirar algo de forma activa y que dura en el tiempo (como algo en movimiento)?", "s":{"type":"multiple_choice","options":["Watch","Look","See"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They ___ the children play in the park.", "s":{"type":"multiple_choice","options":["saw","watched","looked"],"answer":1}}'::jsonb,
        '{"r":3, "p":"We spent the evening ___ a movie on Netflix.", "s":{"type":"multiple_choice","options":["watching","seeing","looking"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I sat on the bench to ___ the people pass by.", "s":{"type":"multiple_choice","options":["look","see","watch"],"answer":2}}'::jsonb,
        '{"r":3, "p":"He is ___ a football match on television.", "s":{"type":"multiple_choice","options":["looking","watching","seeing"],"answer":1}}'::jsonb,
        '{"r":3, "p":"¿Qué verbo usas típicamente con la televisión o el deporte en vivo?", "s":{"type":"multiple_choice","options":["See","Watch","Look"],"answer":1}}'::jsonb,
        '{"r":3, "p":"The security guard ___ the monitors all night.", "s":{"type":"multiple_choice","options":["looked","saw","watched"],"answer":2}}'::jsonb,
        '{"r":3, "p":"Can you ___ my bag while I go to the bathroom? (vigilar)", "s":{"type":"multiple_choice","options":["watch","look","see"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Watch'' es igual que ''look'', pero se usa cuando se mira algo que dura en el tiempo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es común decir ''I like to look TV'' en inglés.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Usamos ''watch'' para observar cosas en movimiento, como niños jugando o deportes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''They watched the children play'' indica que prestaron atención durante un rato.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Watch'' tiene una connotación pasiva, igual que ''See''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Se utiliza ''watch'' si quieres decir que vigilaste algo con detenimiento (ej. el atardecer).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Si miras rápidamente un cuadro en un museo por un segundo, usas ''Watch''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Observaron a los niños jugar.", "s":{"type":"scramble","chunks":["They watched","the children","play"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Me gusta ver la televisión.", "s":{"type":"scramble","chunks":["I like","to watch","TV"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Él está viendo un partido de fútbol.", "s":{"type":"scramble","chunks":["He is watching","a football","match"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Observamos el hermoso atardecer.", "s":{"type":"scramble","chunks":["We watched","the beautiful","sunset"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: No veas demasiada televisión.", "s":{"type":"scramble","chunks":["Don''t watch","too much","television"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella está observando a los pájaros.", "s":{"type":"scramble","chunks":["She is","watching","the birds"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Veré el partido.", "s":{"type":"scramble","chunks":["I will","watch","the game"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Contrastes (See vs Look vs Watch) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"If you ___ (miras) closely, you will ___ (ver) it. (look / see)", "s":{"type":"typing","correct_answers":["look"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Did you ___ (ver/observar) the news on TV?", "s":{"type":"typing","correct_answers":["watch"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Please, ___ (mira) at the camera.", "s":{"type":"typing","correct_answers":["look"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I can''t ___ (ver) the screen from here.", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We sat and ___ed (observamos) the stars for hours.", "s":{"type":"typing","correct_answers":["watch","watched"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ed (miró) at him but didn''t ___ (ver) his sadness. (Escribe el primer verbo)", "s":{"type":"typing","correct_answers":["look","looked"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Can you ___ (ver) the house at the end of the road?", "s":{"type":"typing","correct_answers":["see"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I was ___ing (observando/vigilando) the bags while he was buying tickets.", "s":{"type":"typing","correct_answers":["watch","watching"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"Completa lógicamente: ''___ at this document and tell me if you ___ any mistakes.''", "s":{"type":"multiple_choice","options":["Look / see","See / watch","Watch / look"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Si estás hablando de la capacidad de percibir algo con tus ojos, usas:", "s":{"type":"multiple_choice","options":["Watch","Look","See"],"answer":2}}'::jsonb,
        '{"r":4, "p":"Si diriges la mirada hacia un objeto fijo un momento para llamar la atención, usas:", "s":{"type":"multiple_choice","options":["Look (at)","Watch","See"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Si estás prestando atención al desarrollo de una película o un juego, usas:", "s":{"type":"multiple_choice","options":["See","Look","Watch"],"answer":2}}'::jsonb,
        '{"r":4, "p":"I ___ him walking down the street yesterday.", "s":{"type":"multiple_choice","options":["watched","saw","looked"],"answer":1}}'::jsonb,
        '{"r":4, "p":"We spent two hours ___ the monkeys at the zoo.", "s":{"type":"multiple_choice","options":["watching","seeing","looking"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ at me when I am speaking to you!", "s":{"type":"multiple_choice","options":["Watch","See","Look"],"answer":2}}'::jsonb,
        '{"r":4, "p":"It’s too dark in here, I can’t ___ my hands.", "s":{"type":"multiple_choice","options":["look","see","watch"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"En la frase ''I look at the sky and see a cloud'', usamos ''look'' para la acción voluntaria y ''see'' para lo que percibimos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Ver la televisión o un partido siempre requiere el uso del verbo ''Look''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''See'' es pasivo, ''Look'' es activo pero corto, y ''Watch'' es activo pero prolongado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''Watch at this picture''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''I saw a movie at the cinema'' y ''I watched a movie on TV'' son ambas correctas en sus contextos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Si le dices a alguien que dirija sus ojos hacia una mosca en la pared, dices ''See the fly!''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Look'' necesita habitualmente la preposición ''at'' cuando nombras el objeto que miras.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: No puedo ver nada.", "s":{"type":"scramble","chunks":["I can''t","see","a thing"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Mírame ahora.", "s":{"type":"scramble","chunks":["Look at","me","now"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Viste la película? (observar)", "s":{"type":"scramble","chunks":["Did you","watch","the movie?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Veo a lo que te refieres.", "s":{"type":"scramble","chunks":["I see","what you","mean"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella está mirando su teléfono.", "s":{"type":"scramble","chunks":["She is looking","at","her phone"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Observaron la carrera de coches.", "s":{"type":"scramble","chunks":["They watched","the car","race"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Si miras, lo verás.", "s":{"type":"scramble","chunks":["If you look,","you will","see it"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 29, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'See, Watch and Look', 
    'Descubre la diferencia fundamental entre ver sin querer, dirigir la mirada intencionalmente y observar algo en desarrollo.', 
    to_jsonb('## Grammar Lesson: See, Watch and Look
Estos tres verbos se relacionan con la vista, pero en inglés se diferencian por la intención del sujeto (pasiva o activa) y por la duración de la mirada.

##### 1. SEE (Connotación Pasiva)
Significa **"ver"**. Tiene una connotación totalmente pasiva. No requiere esfuerzo; es la habilidad física de percibir cosas que entran en tu campo visual.
*   *I can’t see a thing without my glasses on.* (No puedo ver nada sin mis gafas).
*   *I saw a bird.* (Vi un pájaro - apareció en mi campo de visión de repente).

##### 2. LOOK (Connotación Activa y Corta)
Significa **"mirar"**. Tiene una connotación activa. Lo usas cuando *llevas intencionalmente la mirada hacia algo*. Se utiliza sobre todo para una mirada que dura poco. Suele ir acompañado de la preposición **at**.
*   *Look at this car!* (¡Mira este coche! - Dirige tus ojos hacia allí).
*   *She looked at her watch.* (Miró su reloj).

##### 3. WATCH (Connotación Activa y Larga)
Significa **"observar"** o **"mirar detenidamente"**. Es igual que “look” porque es una acción intencional, pero se usa cuando se mira algo **que dura en el tiempo** o que se mueve/cambia.
*   *They watched the children play.* (Observaron/Miraron a los niños jugar).
*   *I like to watch TV.* (Me gusta ver la televisión).
*   *He is watching a football match.* (Está viendo un partido de fútbol).

##### En Resumen
Imagina la situación:
*Estás en el parque y de repente **ves (see)** un coche raro. Decides **fijar la mirada (look at)** en él por un segundo. Te das cuenta de que lo está conduciendo un perro, así que te quedas **observando (watching)** cómo aparca.*'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'See (Connotación Pasiva)', 'Usa "See" para la capacidad visual o cuando algo entra en tu campo de visión sin esfuerzo (I can''t see / I saw a bird).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Look (Connotación Activa y Corta)', 'Usa "Look" cuando diriges intencionalmente la mirada hacia algo, habitualmente por poco tiempo. Suele llevar "at" (Look at this car!).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Watch (Connotación Activa y Larga)', 'Usa "Watch" para mirar intencionalmente algo que dura en el tiempo o que tiene movimiento, como un partido o niños jugando (Watch TV / Watch the children).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Contrastes', 'Recuerda: "See" es pasivo (percibir), "Look at" es activo pero rápido (dirigir la vista), y "Watch" es activo y prolongado (observar desarrollo).');

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