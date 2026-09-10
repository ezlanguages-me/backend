-- ============================================================
-- Seed: A0 English Path – Grammar – Will (Future Structures)
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
        -- REGLA 1: Predicciones y Opiniones - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I think it ___ (lloverá) tomorrow.", "s":{"type":"typing","correct_answers":["will rain"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"My teacher thinks I ___ (aprobaré) my exam.", "s":{"type":"typing","correct_answers":["will pass"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I suppose they ___ (no vendrán).", "s":{"type":"typing","correct_answers":["won''t come","will not come"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I believe she ___ (ganará) the competition.", "s":{"type":"typing","correct_answers":["will win"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ (¿Llamará) he later?", "s":{"type":"typing","correct_answers":["Will he call"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I think we ___ (estaremos) ready.", "s":{"type":"typing","correct_answers":["will be"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (no lo harán) do it.", "s":{"type":"typing","correct_answers":["won''t","will not"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I suppose it ___ (será) difficult.", "s":{"type":"typing","correct_answers":["will be"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"Según los apuntes, ''Will'' se usa frecuentemente para hablar sobre lo que pasará en el futuro acompañado de expresiones como...", "s":{"type":"multiple_choice","options":["I think, I believe, I suppose","Yesterday, Last year, Ago","Look at those clouds!"],"answer":0}}'::jsonb,
        '{"r":1, "p":"My teacher thinks I ___ pass my exam.", "s":{"type":"multiple_choice","options":["will","am going to","would"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cuál es el auxiliar negativo de ''Will''?", "s":{"type":"multiple_choice","options":["Won''t (Will not)","Don''t","Didn''t"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I believe the weather ___ be nice next week.", "s":{"type":"multiple_choice","options":["will","is","was"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ you go to the party tomorrow?", "s":{"type":"multiple_choice","options":["Will","Do","Are"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I suppose she ___ like the present.", "s":{"type":"multiple_choice","options":["will","does","is"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué expresamos con ''I think it will rain''?", "s":{"type":"multiple_choice","options":["Una predicción basada en una opinión personal","Una acción futura segura basada en la evidencia","Una decisión ya tomada"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They ___ arrive on time, the traffic is terrible.", "s":{"type":"multiple_choice","options":["won''t","will","don''t"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Se utiliza ''will'' para predicciones basadas en hechos o en simples opiniones.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La oración ''My teacher thinks I will pass my exam'' es el ejemplo textual de tus apuntes para predicciones.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"El verbo principal que acompaña a ''will'' debe ir siempre terminado en -ing para predicciones simples.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Won''t'' es la contracción formal y correcta de ''Will not''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''I suppose he will come'' significa ''Supongo que él vendrá''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es obligatorio usar ''going to'' si utilizamos la expresión ''I think''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"En las preguntas, ''Will'' se coloca delante del sujeto (ej. Will you...?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Creo que lloverá.", "s":{"type":"scramble","chunks":["I think","it will","rain"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Mi profesor cree que aprobaré el examen.", "s":{"type":"scramble","chunks":["My teacher thinks","I will pass","my exam"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Supongo que iremos.", "s":{"type":"scramble","chunks":["I suppose","we will","go"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Creo que ella ganará.", "s":{"type":"scramble","chunks":["I believe","she will","win"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos no vendrán a la fiesta.", "s":{"type":"scramble","chunks":["They won''t","come","to the party"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Estarás allí?", "s":{"type":"scramble","chunks":["Will","you be","there?"],"correct_order":[]}}'::jsonb,
        '{"r":1, "p":"Ordena: Creo que será fácil.", "s":{"type":"scramble","chunks":["I think","it will be","easy"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Decisiones Espontáneas y Promesas - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"I ___ (te ayudaré) on Saturday.", "s":{"type":"typing","correct_answers":["will help you","''ll help you"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I think I ___ (estudiaré) architecture.", "s":{"type":"typing","correct_answers":["will study","''ll study"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I promise I ___ (no llegaré tarde).", "s":{"type":"typing","correct_answers":["won''t be late","will not be late"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The phone is ringing. I ___ (lo cogeré / responderé).", "s":{"type":"typing","correct_answers":["will answer it","''ll answer it"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (pagaremos) for the dinner.", "s":{"type":"typing","correct_answers":["will pay","''ll pay"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I promise I ___ (te llamaré) tomorrow.", "s":{"type":"typing","correct_answers":["will call you","''ll call you"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I ___ (llevaré) those bags for you.", "s":{"type":"typing","correct_answers":["will carry","''ll carry"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Don''t worry, she ___ (te ayudará).", "s":{"type":"typing","correct_answers":["will help you"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Para qué dos funciones directas se usa ''Will'' de acuerdo a la teoría?", "s":{"type":"multiple_choice","options":["Expresar decisiones tomadas al momento y promesas sobre el futuro","Para hablar de hábitos en el pasado y rutinas","Para expresar eventos pasados ya terminados"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I ___ help you on Saturday. (Es una promesa)", "s":{"type":"multiple_choice","options":["will","am going to","would"],"answer":0}}'::jsonb,
        '{"r":2, "p":"The phone is ringing! - Don''t worry, I ___ answer it.", "s":{"type":"multiple_choice","options":["will","am going to","am answering"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I think I ___ study architecture. (Decisión espontánea)", "s":{"type":"multiple_choice","options":["will","do","have to"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I promise I ___ tell anyone your secret.", "s":{"type":"multiple_choice","options":["won''t","don''t","didn''t"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué verbo se usa frecuentemente junto a ''Will'' para dar garantías?", "s":{"type":"multiple_choice","options":["Promise","Believe","Think"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Are you cold? I ___ close the window.", "s":{"type":"multiple_choice","options":["will","am going to","do"],"answer":0}}'::jsonb,
        '{"r":2, "p":"We don''t have any milk. - Really? I ___ go and buy some.", "s":{"type":"multiple_choice","options":["will","went","going"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"Si tomas una decisión justo en el momento de hablar (decisión espontánea), debes usar ''Will''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''I will help you on Saturday'' es un claro ejemplo de una promesa para el futuro.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para hacer una promesa en inglés, es obligatorio utilizar el Pasado Simple.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''I think I will study architecture'' indica una decisión meditada durante años.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"El inglés hablado permite contraer ''will'' como ''ll (ej. I''ll help you).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Si ofreces pagar la cuenta repentinamente en el restaurante, usas ''I will pay''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Las promesas en inglés nunca pueden ir acompañadas de ''won''t''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: Te ayudaré el sábado.", "s":{"type":"scramble","chunks":["I will","help you","on Saturday"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Creo que estudiaré arquitectura.", "s":{"type":"scramble","chunks":["I think","I will study","architecture"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Prometo que no se lo diré a nadie.", "s":{"type":"scramble","chunks":["I promise","I won''t tell","anyone"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Responderé el teléfono.", "s":{"type":"scramble","chunks":["I will","answer","the phone"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Nosotros pagaremos la cena.", "s":{"type":"scramble","chunks":["We will","pay for","the dinner"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Llevaré esas bolsas por ti.", "s":{"type":"scramble","chunks":["I will carry","those bags","for you"],"correct_order":[]}}'::jsonb,
        '{"r":2, "p":"Ordena: Prometo que no llegaré tarde.", "s":{"type":"scramble","chunks":["I promise","I won''t","be late"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Futuro Continuo (Will be + -ing) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"Next week today, I ___ (estaré) delivering a speech.", "s":{"type":"typing","correct_answers":["will be","''ll be"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I will be ___ (durmiendo) at 10 PM.", "s":{"type":"typing","correct_answers":["sleeping"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"This time tomorrow, we ___ (estaremos) flying to London.", "s":{"type":"typing","correct_answers":["will be","''ll be"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They will be ___ (jugando) tennis all morning.", "s":{"type":"typing","correct_answers":["playing"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (no estará) waiting for you.", "s":{"type":"typing","correct_answers":["won''t be","will not be"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ (¿Estarás) you be working tomorrow?", "s":{"type":"typing","correct_answers":["Will"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I will be ___ (estudiando) when you arrive.", "s":{"type":"typing","correct_answers":["studying"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She will ___ (estar) watching TV.", "s":{"type":"typing","correct_answers":["be"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Para qué se utiliza la estructura ''Will be + verbo terminado en -ing''?", "s":{"type":"multiple_choice","options":["Para expresar una acción continua o en progreso que tendrá lugar en el futuro","Para acciones que terminaron ayer","Para pedir permiso de forma formal"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Next week today, I ___ delivering a speech.", "s":{"type":"multiple_choice","options":["will be","will","am"],"answer":0}}'::jsonb,
        '{"r":3, "p":"This time tomorrow, we ___ lying on the beach.", "s":{"type":"multiple_choice","options":["will be","will are","will"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Don''t call me at 8 PM. I ___ eating dinner.", "s":{"type":"multiple_choice","options":["will be","will","was"],"answer":0}}'::jsonb,
        '{"r":3, "p":"She ___ be sleeping when you come home.", "s":{"type":"multiple_choice","options":["will","is","has"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They will be ___ football tomorrow afternoon.", "s":{"type":"multiple_choice","options":["playing","play","played"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cómo formamos la negación en el Futuro Continuo?", "s":{"type":"multiple_choice","options":["won''t be + verbo -ing","don''t be + verbo -ing","will not + verbo base"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Will you ___ using the computer later?", "s":{"type":"multiple_choice","options":["be","are","is"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"El Futuro Continuo (Will be + -ing) expresa una acción que estará en progreso durante un momento del futuro.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Next week today, I will be delivering a speech'' significa que la acción ya se completó el año pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Es gramaticalmente correcto decir ''I will be play tennis''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"En español, esta estructura equivale a decir ''Estaré haciendo algo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Se utiliza la forma base ''be'' sin conjugar (am/is/are) detrás de ''will''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''She won''t be sleeping'' significa ''Ella no estará durmiendo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"En preguntas, se pone el verbo to be delante del sujeto: ''Be you will working?''", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: La semana que viene hoy, estaré dando un discurso.", "s":{"type":"scramble","chunks":["Next week today,","I will be","delivering a speech"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella estará durmiendo mañana a las 10.", "s":{"type":"scramble","chunks":["She will be","sleeping","tomorrow at 10"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Estaremos volando a París.", "s":{"type":"scramble","chunks":["We will be","flying","to Paris"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos estarán jugando al tenis.", "s":{"type":"scramble","chunks":["They will be","playing","tennis"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Él no estará trabajando la semana que viene.", "s":{"type":"scramble","chunks":["He won''t be","working","next week"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Estarás esperándome?", "s":{"type":"scramble","chunks":["Will you","be waiting","for me?"],"correct_order":[]}}'::jsonb,
        '{"r":3, "p":"Ordena: Yo estaré estudiando toda la noche.", "s":{"type":"scramble","chunks":["I will be","studying","all night"],"correct_order":[]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Futuro Perfecto / Perfecto Continuo - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"By 2020 I will have ___ (mudado) to the countryside.", "s":{"type":"typing","correct_answers":["moved"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"By the end of May, I will have been ___ (trabajando) for this company for 10 years.", "s":{"type":"typing","correct_answers":["working"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She will ___ (haber) finished by tomorrow.", "s":{"type":"typing","correct_answers":["have"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They will have ___ (ido) by the time you arrive.", "s":{"type":"typing","correct_answers":["left","gone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"By next year, we will have ___ (comprado) a house.", "s":{"type":"typing","correct_answers":["bought"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He won''t have ___ (terminado) his work.", "s":{"type":"typing","correct_answers":["finished","done"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Will you have ___ (llegado) by six?", "s":{"type":"typing","correct_answers":["arrived"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I will have ___ (estado) studying for three hours.", "s":{"type":"typing","correct_answers":["been"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué expresa la estructura ''Will have + participio'' (Futuro Perfecto)?", "s":{"type":"multiple_choice","options":["Una acción que se logrará o habrá terminado en un punto exacto del futuro","Una rutina diaria","Un deseo imposible en el presente"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Qué palabra se utiliza frecuentemente con estas estructuras para traducir ''para tal fecha...''?", "s":{"type":"multiple_choice","options":["By (ej. By 2020...)","In (ej. In 2020...)","At (ej. At 2020...)"],"answer":0}}'::jsonb,
        '{"r":4, "p":"By 2020 I will have ___ to the countryside.", "s":{"type":"multiple_choice","options":["moved","move","moving"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuándo se usa ''Will have been + verbo en -ing''?", "s":{"type":"multiple_choice","options":["Para enfatizar que una acción lleva un tiempo desarrollándose y continuará en el futuro","Para acciones puntuales","Para hablar de eventos pasados"],"answer":0}}'::jsonb,
        '{"r":4, "p":"By the end of May, I will have been ___ for this company for ten years.", "s":{"type":"multiple_choice","options":["working","worked","work"],"answer":0}}'::jsonb,
        '{"r":4, "p":"By 5 PM, she will have ___ reading the book.", "s":{"type":"multiple_choice","options":["finished","finish","finishing"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Next month, we will have been ___ in this house for five years.", "s":{"type":"multiple_choice","options":["living","lived","live"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He won''t ___ finished the project by Friday.", "s":{"type":"multiple_choice","options":["have","has","had"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"El Futuro Perfecto (Will have + participio) equivale en español a ''Habré hecho algo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''By 2020 I will have moved to the countryside'' indica un logro o meta que se completará para esa fecha.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La preposición clave en inglés para fijar el límite temporal en estas oraciones es ''By''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Will have been + -ing'' enfatiza que la acción no tiene duración alguna.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''I will have been working for 10 years'' significa ''Habré estado trabajando por 10 años''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es gramaticalmente correcto decir ''She will has finished''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Estas estructuras combinan el verbo auxiliar del futuro (will) con la formación del presente perfecto (have + participio).", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Para 2020 me habré mudado.", "s":{"type":"scramble","chunks":["By 2020","I will have","moved"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Para mayo, habré estado trabajando por diez años.", "s":{"type":"scramble","chunks":["By the end of May,","I will have been working","for ten years"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella habrá terminado para mañana.", "s":{"type":"scramble","chunks":["She will have","finished","by tomorrow"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ellos se habrán ido para entonces.", "s":{"type":"scramble","chunks":["They will have","left","by then"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Habremos estado viajando durante horas.", "s":{"type":"scramble","chunks":["We will have been","traveling","for hours"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él no habrá terminado su trabajo.", "s":{"type":"scramble","chunks":["He won''t have","finished","his work"],"correct_order":[]}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Habrás llegado para las seis?", "s":{"type":"scramble","chunks":["Will you have","arrived","by six?"],"correct_order":[]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 43, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Will y Estructuras de Futuro', 
    'Aprende a usar WILL para opinar, predecir, prometer y expresar acciones futuras fluidas o logros que se completarán para una fecha específica.', 
    to_jsonb('## Grammar Lesson: WILL y Estructuras de Futuro
En inglés, el auxiliar **WILL** y su negativa **WON''T** sirven para hablar, predecir u opinar sobre lo que pasará en el futuro. Puede acompañar a verbos simples o crear estructuras verbales complejas.

##### 1. Predicciones y Opiniones
Se usa para dar tu perspectiva sobre un hecho futuro. A menudo va acompañado con expresiones clave como *I think* (creo), *I believe* (creo/considero) o *I suppose* (supongo).
*   *My teacher thinks I **will pass** my exam.* (Mi profesor cree que aprobaré el examen).
*   *I believe it **won''t rain**.* (Creo que no lloverá).

##### 2. Decisiones Espontáneas y Promesas
Si decides hacer algo **justo en el momento de hablar** o quieres darle a alguien tu palabra (una promesa), utiliza *will*.
*   *The phone is ringing! - I **will answer** it.* (¡Suena el teléfono! - Yo lo cogeré - *Decisión al momento*).
*   *I **will help** you on Saturday.* (Te ayudaré el sábado - *Promesa*).

##### 3. Futuro Continuo (Will be + -ing)
Se utiliza para expresar una acción **continua o en progreso** que tendrá lugar en un momento del futuro (equivalente a "estaré haciendo").
*   *Next week today, I **will be delivering** a speech.* (La semana que viene, hoy, estaré dando un discurso).

##### 4. Futuros Perfectos (Con la preposición "By")
Estas estructuras suelen ir acompañadas de **By** (para tal fecha...) e indican logros futuros.
*   **Will have + participio:** Para una acción que se logrará o habrá terminado en el futuro. (*By 2020 I **will have moved** to the countryside* = Para 2020 me habré mudado al campo).
*   **Will have been + -ing:** Hace referencia a una acción que lleva tiempo ocurriendo y probablemente siga en el futuro. (*By the end of May, I **will have been working** for this company for ten years* = Para finales de mayo, habré estado trabajando para esta empresa durante 10 años).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Predicciones y Opiniones', 'Recuerda: Utiliza "Will" junto a expresiones como "I think" o "I believe" para predecir un hecho basándote en tu propia opinión.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Decisiones y Promesas', 'Para decisiones tomadas justo ahora o promesas de ayuda a futuro, debes usar "Will" (ej. I will help you).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Futuro Continuo (Will be -ing)', 'Usa "Will be" + verbo en "-ing" para hablar de una acción que estará en progreso en un momento concreto del futuro (ej. Estaré dando un discurso).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Futuros Perfectos (By...)', 'Para logros futuros, usa "Will have + participio". Si enfatizas la duración continua hasta el futuro, usa "Will have been + -ing". (Acostumbran ir con la palabra "By").');

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