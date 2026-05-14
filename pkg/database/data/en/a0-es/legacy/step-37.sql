-- ============================================================
-- Seed: A0 English Path – Grammar – Speak vs Talk
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
        -- REGLA 1: Speak (Idiomas y Capacidad) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"I can ___ (hablar) Spanish.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She doesn''t ___ (hablar) French.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Babies can''t ___ (hablar).", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___s (habla) three languages.", "s":{"type":"typing","correct_answers":["speak","speaks"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Do you ___ (hablar) English?", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I am learning to ___ (hablar) German.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___s (habla) very softly.", "s":{"type":"typing","correct_answers":["speak","speaks"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Can you ___ (hablar) Italian?", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué verbo se usa SIEMPRE para decir que sabes un idioma?", "s":{"type":"multiple_choice","options":["Speak","Talk","Say"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I can ___ English and Spanish.", "s":{"type":"multiple_choice","options":["talk","speak","tell"],"answer":1}}'::jsonb,
        '{"r":1, "p":"My dog is very smart, but he can''t ___.", "s":{"type":"multiple_choice","options":["speak","talk","say"],"answer":0}}'::jsonb,
        '{"r":1, "p":"How many languages do you ___?", "s":{"type":"multiple_choice","options":["talk","say","speak"],"answer":2}}'::jsonb,
        '{"r":1, "p":"She ___ Japanese perfectly.", "s":{"type":"multiple_choice","options":["talks","speaks","tells"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He lost his voice and can''t ___.", "s":{"type":"multiple_choice","options":["speak","talk","say"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I would love to ___ fluent French.", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Si hablamos de la capacidad física de producir palabras, usamos:", "s":{"type":"multiple_choice","options":["Talk","Speak","Cualquiera de los dos"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"Para preguntar ''¿Hablas inglés?'' lo correcto es decir ''Do you talk English?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Speak'' se utiliza para mencionar el conocimiento o dominio de un idioma.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''She speaks three languages''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''I talk Spanish'' suena natural en inglés.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Para indicar que alguien no puede emitir sonidos o palabras por un problema físico usamos ''speak''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Speak'' tiene una connotación ligeramente más pasiva o de capacidad que ''talk''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Se dice ''Can you talk German?'' para preguntar si sabes hablar alemán.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Sé hablar español.", "s":{"type":"scramble","chunks":["I can","speak","Spanish"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella no habla francés.", "s":{"type":"scramble","chunks":["She doesn''t","speak","French"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Los bebés no pueden hablar.", "s":{"type":"scramble","chunks":["Babies","can''t","speak"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Hablas inglés?", "s":{"type":"scramble","chunks":["Do you","speak","English?"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él habla tres idiomas.", "s":{"type":"scramble","chunks":["He speaks","three","languages"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: ¿Puedes hablar italiano?", "s":{"type":"scramble","chunks":["Can you","speak","Italian?"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos hablan muy bajito (suavemente).", "s":{"type":"scramble","chunks":["They speak","very","softly"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Speak (Formalidad y Teléfono) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"Could I ___ (hablar) to Mr. Smith, please?", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"The president will ___ (hablar) tonight.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Please, let me ___ (hablar).", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"May I ___ (hablar) with the manager?", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He is ___ing (hablando) to the audience.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I need to ___ (hablar) to the boss.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She will ___ (hablar) at the conference.", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Who is ___ing (hablando)? (Al teléfono)", "s":{"type":"typing","correct_answers":["speak"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué verbo usarías si llamas por teléfono a una empresa y preguntas por alguien?", "s":{"type":"multiple_choice","options":["Speak","Talk","Say"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Could I ___ to the doctor, please?", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":0}}'::jsonb,
        '{"r":2, "p":"En una conferencia, el invitado especial va a...", "s":{"type":"multiple_choice","options":["speak to the audience","talk the audience","tell to the audience"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Hello, this is John ___ (al contestar el teléfono).", "s":{"type":"multiple_choice","options":["talking","speaking","saying"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I need to ___ with the principal of the school.", "s":{"type":"multiple_choice","options":["talk","speak","Cualquiera, pero speak es más formal"],"answer":2}}'::jsonb,
        '{"r":2, "p":"The King will ___ to the nation on Christmas.", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Qué verbo sugiere a menudo una comunicación de un solo sentido (yo hablo, tú escuchas)?", "s":{"type":"multiple_choice","options":["Talk","Speak","Say"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Please, allow me to ___.", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Speak'' se usa frecuentemente al teléfono (ej. Could I speak to Mr. Smith?).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"En discursos y contextos muy formales, se prefiere usar ''talk'' en lugar de ''speak''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Speak'' connota una comunicación donde generalmente uno habla y los demás escuchan.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Para pedir hablar con tu jefe de forma respetuosa, dices ''I need to speak to you''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''He is speaking to the audience'' significa que está dando un discurso al público.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Al descolgar el teléfono es muy común decir ''Mary talking''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Speak'' se considera más formal que ''Talk''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: ¿Podría hablar con el Sr. Smith?", "s":{"type":"scramble","chunks":["Could I speak","to","Mr. Smith?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: El presidente hablará esta noche.", "s":{"type":"scramble","chunks":["The president","will speak","tonight"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Por favor, déjame hablar.", "s":{"type":"scramble","chunks":["Please,","let me","speak"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿Puedo hablar con el gerente?", "s":{"type":"scramble","chunks":["May I speak","with","the manager?"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Necesito hablar con el jefe.", "s":{"type":"scramble","chunks":["I need to speak","to","the boss"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella hablará en la conferencia.", "s":{"type":"scramble","chunks":["She will speak","at","the conference"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él está hablando al público.", "s":{"type":"scramble","chunks":["He is speaking","to","the audience"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Talk (Conversación e Intercambio) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"We need to ___ (hablar/charlar).", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Can I ___ (hablar) to you for a minute?", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They are ___ing (hablando/charlando) right now.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Stop ___ing (hablando) in class!", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I like to ___ (hablar/conversar) with my friends.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Let''s ___ (hablar) tomorrow.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Are you ___ing (hablándome) to me?", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___s (habla) too much.", "s":{"type":"typing","correct_answers":["talk","talks"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué verbo implica fuertemente una comunicación mutua o un intercambio de ideas?", "s":{"type":"multiple_choice","options":["Talk","Speak","Say"],"answer":0}}'::jsonb,
        '{"r":3, "p":"We need to ___.", "s":{"type":"multiple_choice","options":["talk","speak","tell"],"answer":0}}'::jsonb,
        '{"r":3, "p":"My friends and I ___ on the phone for hours.", "s":{"type":"multiple_choice","options":["speak","talk","say"],"answer":1}}'::jsonb,
        '{"r":3, "p":"Don''t ___ to your mother like that! (intercambio informal)", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":1}}'::jsonb,
        '{"r":3, "p":"The baby is learning how to walk and ___.", "s":{"type":"multiple_choice","options":["talk","speak","Ambas pueden valer, pero ''talk'' subraya la interacción"],"answer":2}}'::jsonb,
        '{"r":3, "p":"They were ___ing laughing in the living room.", "s":{"type":"multiple_choice","options":["speaking","talking","saying"],"answer":1}}'::jsonb,
        '{"r":3, "p":"''Talk'' se asocia principalmente con contextos...", "s":{"type":"multiple_choice","options":["Formales","Informales","Académicos"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I had a long ___ with my brother yesterday (usado como sustantivo).", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''Talk'' se utiliza para contextos de comunicación informales donde existe una conversación fluida.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''We need to speak'' es mucho más común entre amigos que ''We need to talk''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Talk'' implica intercambio mutuo de información.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"La expresión ''Can I talk to you for a minute?'' indica que deseas tener una charla rápida.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es incorrecto decirle al profesor ''Stop speaking'' si te refieres a que los alumnos dejen de charlar; debes decir ''Stop talking''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Talk'' siempre se traduce al español como ''decir''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Si dos personas están interactuando y riendo, decimos ''They are talking''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Necesitamos hablar.", "s":{"type":"scramble","chunks":["We","need","to talk"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Puedo hablar contigo?", "s":{"type":"scramble","chunks":["Can I","talk","to you?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos están hablando ahora mismo.", "s":{"type":"scramble","chunks":["They are talking","right","now"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Deja de hablar en clase.", "s":{"type":"scramble","chunks":["Stop talking","in","class"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Me gusta conversar con mis amigos.", "s":{"type":"scramble","chunks":["I like to talk","with","my friends"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿Me estás hablando a mí?", "s":{"type":"scramble","chunks":["Are you talking","to","me?"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella habla demasiado.", "s":{"type":"scramble","chunks":["She","talks","too much"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Talk about (Temas de conversación) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"We need to ___ (hablar) about what happened.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"What are you ___ing (hablando) about?", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Let''s ___ (hablar) about the project.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ed (hablaron) about the weather.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I don''t want to ___ (hablar) about my job.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He is ___ing (hablando) about his trip.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Can we ___ (hablar) about this later?", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She loves to ___ (hablar) about her cats.", "s":{"type":"typing","correct_answers":["talk"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué verbo se usa típicamente acompañado de ''about'' para mencionar el tema de conversación?", "s":{"type":"multiple_choice","options":["Talk","Speak","Tell"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We need to ___ about the problem.", "s":{"type":"multiple_choice","options":["speak","talk","say"],"answer":1}}'::jsonb,
        '{"r":4, "p":"What are you talking ___?", "s":{"type":"multiple_choice","options":["of","about","for"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I don''t want to ___ about it.", "s":{"type":"multiple_choice","options":["talk","say","tell"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He was ___ing about politics all night.", "s":{"type":"multiple_choice","options":["speaking","talking","saying"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Can we ___ about your grades?", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Si quieres sugerir un tema de conversación, dices: ''Let''s ___ about...''", "s":{"type":"multiple_choice","options":["speak","talk","tell"],"answer":1}}'::jsonb,
        '{"r":4, "p":"My mom loves to ___ about her garden.", "s":{"type":"multiple_choice","options":["talk","speak","say"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"Cuando se menciona el sujeto explícito de la conversación (seguido de ''about''), la opción más natural es ''talk''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''We need to speak about what happened'' es la única forma correcta de decirlo.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"La expresión ''What are you talking about?'' significa ''¿De qué estás hablando?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Talk about'' se usa cuando se intercambian ideas sobre un tema específico.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''Let''s say about the weather''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Se dice ''I don''t want to talk about it'' cuando te niegas a discutir un asunto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La combinación ''talk + about'' es muy poco frecuente en inglés.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Necesitamos hablar sobre lo que pasó.", "s":{"type":"scramble","chunks":["We need","to talk about","what happened"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿De qué estás hablando?", "s":{"type":"scramble","chunks":["What are you","talking","about?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Hablemos sobre el proyecto.", "s":{"type":"scramble","chunks":["Let''s talk","about","the project"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Ellos hablaron sobre el clima.", "s":{"type":"scramble","chunks":["They talked","about","the weather"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Podemos hablar de esto más tarde?", "s":{"type":"scramble","chunks":["Can we talk","about this","later?"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él está hablando sobre su viaje.", "s":{"type":"scramble","chunks":["He is talking","about","his trip"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: No quiero hablar de ello.", "s":{"type":"scramble","chunks":["I don''t want","to talk about","it"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 28, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Speak vs. Talk', 
    'Aprende a distinguir cuándo usar "Speak" o "Talk", entendiendo la formalidad de la situación y la dirección en la que fluye la conversación.', 
    to_jsonb('## Grammar Lesson: Speak vs. Talk
Ambos verbos significan "hablar", pero existen matices claros entre ellos relacionados con la **formalidad**, la **dirección** de la conversación y el **conocimiento de idiomas**.

##### 1. SPEAK (Formalidad y un solo sentido)
"Speak" se utiliza generalmente cuando la comunicación es más formal o unidireccional (una persona habla y las demás escuchan).
*   **Idiomas:** SIEMPRE usamos *speak* para referirnos a la habilidad de hablar un idioma. (*I can speak Spanish* / *She speaks English*).
*   **Capacidad física:** Para referirse a la capacidad de emitir sonido. (*She can''t speak without her glasses on*).
*   **Teléfono:** En contextos formales, es la palabra estándar para pedir hablar con alguien al teléfono. (*Could I speak to Mr. Smith, please?*).
*   **Discursos:** Cuando alguien se dirige a una audiencia. (*The president will speak tonight*).

##### 2. TALK (Informal e Intercambio)
"Talk" se enfoca en la acción de conversar, es decir, existe un **intercambio mutuo** de ideas entre dos o más personas.
*   **Conversaciones informales:** Es la palabra favorita para pedir charlar con amigos, familiares o en situaciones casuales. (*Can I talk to you for a minute?* / *We need to talk*).
*   **Interactuar:** Cuando varias personas están compartiendo ideas juntas. (*They were talking and laughing in the living room*).
*   **Hablar SOBRE algo (Talk about):** Se utiliza típicamente la preposición "about" junto a "talk" cuando el sujeto de la conversación se menciona explícitamente. (*We need to talk about what happened* / *What are you talking about?*).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Idiomas y Capacidad (Speak)', 'Recuerda: Para indicar que dominas un idioma (I speak English) o para la capacidad física de hablar (Babies can''t speak), siempre debes usar "speak".');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Teléfono y Formalidad (Speak)', 'Usa "Speak" en contextos formales, discursos (speak to the audience) o cuando pides al teléfono contactar con alguien (Could I speak to...?).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Charlas y Conversaciones (Talk)', 'Usa "Talk" para pedir o describir un intercambio mutuo de ideas, usualmente de forma casual (Can I talk to you? / They are talking).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Mencionar el Tema (Talk about)', 'Si vas a mencionar de qué se está hablando utilizando la preposición "about", la forma más natural y utilizada es "Talk about" (What are you talking about?).');

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