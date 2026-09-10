-- ============================================================
-- Seed: A0 English Path – Grammar – Conjeturas (Modals of Deduction)
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
        -- REGLA 1: Certeza Positiva (Must be / Must have been) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":1, "p":"It ___ (debe ser) true.", "s":{"type":"typing","correct_answers":["must be"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"You ___ (debes estar) very tired.", "s":{"type":"typing","correct_answers":["must be"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (debió haber sido) the thief.", "s":{"type":"typing","correct_answers":["must have been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"They ___ (debieron haber) left early.", "s":{"type":"typing","correct_answers":["must have"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She ___ (ha de ser) the new boss.", "s":{"type":"typing","correct_answers":["must be"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"It ___ (debió haber sido) a difficult decision.", "s":{"type":"typing","correct_answers":["must have been"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He ___ (debe ser) the doctor.", "s":{"type":"typing","correct_answers":["must be"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We ___ (debimos haber) won the game.", "s":{"type":"typing","correct_answers":["must have"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":1, "p":"¿Qué modal expresa que hay BASTANTE CERTEZA de que algo SÍ es verdad en el presente?", "s":{"type":"multiple_choice","options":["Must be","May be","Can''t be"],"answer":0}}'::jsonb,
        '{"r":1, "p":"He has a huge house. He ___ very rich.", "s":{"type":"multiple_choice","options":["can''t be","must be","might be"],"answer":1}}'::jsonb,
        '{"r":1, "p":"¿Cómo dices ''debió haber sido'' (certeza positiva en el pasado)?", "s":{"type":"multiple_choice","options":["must be","must have been","can''t have been"],"answer":1}}'::jsonb,
        '{"r":1, "p":"The ground is wet. It ___ raining all night.", "s":{"type":"multiple_choice","options":["must have been","might have been","can''t have been"],"answer":0}}'::jsonb,
        '{"r":1, "p":"She got an A+ on the exam. She ___ studied a lot.", "s":{"type":"multiple_choice","options":["must have","can''t have","may have"],"answer":0}}'::jsonb,
        '{"r":1, "p":"You haven''t eaten all day. You ___ hungry.", "s":{"type":"multiple_choice","options":["can''t be","must be","could be"],"answer":1}}'::jsonb,
        '{"r":1, "p":"This ___ the right address. There is no one here.", "s":{"type":"multiple_choice","options":["must be","can''t be","might have been"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He left his keys. He ___ in a hurry.", "s":{"type":"multiple_choice","options":["must have been","must be","can''t have been"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":1, "p":"''Must be'' se utiliza cuando hay bastante certeza de que algo es afirmativo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Must have been'' significa ''puede que sea''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"Para hacer deducciones en pasado se le añade ''have been'' al modal (ej. must have been).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"La frase ''He must to be tired'' es gramaticalmente correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Must be'' se traduce como ''debe ser'' o ''ha de ser''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Si estás seguro de que alguien fue el ladrón ayer, dices ''He must be the thief''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Must have been'' se traduce como ''debió haber sido''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":1, "p":"Ordena: Debe ser verdad.", "s":{"type":"scramble","chunks":["must be","It","true"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Debes estar cansado.", "s":{"type":"scramble","chunks":["tired","You","must be"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Él debió haber sido el ladrón.", "s":{"type":"scramble","chunks":["the thief","He","must have been"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Debió haber sido difícil.", "s":{"type":"scramble","chunks":["must have been","difficult","It"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ella ha de ser la jefa.", "s":{"type":"scramble","chunks":["the boss","must be","She"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ellos debieron haberse ido.", "s":{"type":"scramble","chunks":["must have","left","They"],"correct_order":}}'::jsonb,
        '{"r":1, "p":"Ordena: Ese debe ser su coche.", "s":{"type":"scramble","chunks":["his car","must be","That"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 2: Certeza Negativa (Can't be / Can't have been) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":2, "p":"It ___ (no puede ser) true.", "s":{"type":"typing","correct_answers":["can''t be"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (no pudo haber sido) the thief.", "s":{"type":"typing","correct_answers":["can''t have been"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You ___ (no puedes estar) serious.", "s":{"type":"typing","correct_answers":["can''t be"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They ___ (no pudieron haber) arrived yet.", "s":{"type":"typing","correct_answers":["can''t have"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She ___ (no puede ser) the manager.", "s":{"type":"typing","correct_answers":["can''t be"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"It ___ (no pudo haber sido) easy.", "s":{"type":"typing","correct_answers":["can''t have been"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He ___ (no puede estar) hungry, he just ate.", "s":{"type":"typing","correct_answers":["can''t be"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We ___ (no pudimos haber) lost the keys.", "s":{"type":"typing","correct_answers":["can''t have"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":2, "p":"¿Qué modal expresa CERTEZA de que algo NO es verdad (imposibilidad)?", "s":{"type":"multiple_choice","options":["can''t be","must be","might be"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He just ate a huge pizza. He ___ hungry again.", "s":{"type":"multiple_choice","options":["must be","can''t be","may be"],"answer":1}}'::jsonb,
        '{"r":2, "p":"¿Cómo dices ''no pudo haber sido'' (certeza negativa en el pasado)?", "s":{"type":"multiple_choice","options":["must have been","can''t have been","might have been"],"answer":1}}'::jsonb,
        '{"r":2, "p":"She was with me all day. She ___ the one who broke the window.", "s":{"type":"multiple_choice","options":["can''t have been","must have been","may be"],"answer":0}}'::jsonb,
        '{"r":2, "p":"You slept for 12 hours. You ___ tired.", "s":{"type":"multiple_choice","options":["must be","can''t be","could be"],"answer":1}}'::jsonb,
        '{"r":2, "p":"The exam was incredibly hard. It ___ easy for anyone.", "s":{"type":"multiple_choice","options":["can''t have been","must have been","might be"],"answer":0}}'::jsonb,
        '{"r":2, "p":"That guy ___ John. John is in London right now.", "s":{"type":"multiple_choice","options":["must be","can''t be","might have been"],"answer":1}}'::jsonb,
        '{"r":2, "p":"They ___ forgotten the meeting, I reminded them twice.", "s":{"type":"multiple_choice","options":["can''t have","must have","may have"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":2, "p":"''Can''t be'' expresa imposibilidad o certeza de que algo NO es verdad en el presente.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Can''t have been'' significa ''debió haber sido''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Se dice ''He mustn''t be'' para expresar que algo es imposible (como deducción), en lugar de ''He can''t be''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Can''t have been'' indica que estamos seguros de que algo NO ocurrió en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"La frase ''It can''t be true'' significa ''No puede ser verdad''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Can''t be'' y ''Must not be'' son exactamente intercambiables al 100% para deducciones.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Para decir ''No pudo haber sido él'', usamos ''It can''t have been him''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":2, "p":"Ordena: No puede ser él.", "s":{"type":"scramble","chunks":["can''t be","It","him"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No puede ser verdad.", "s":{"type":"scramble","chunks":["true","It","can''t be"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No pudieron haber llegado tarde.", "s":{"type":"scramble","chunks":["late","They","can''t have been"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No puedes ir en serio.", "s":{"type":"scramble","chunks":["can''t be","serious","You"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: No pudo haber sido fácil.", "s":{"type":"scramble","chunks":["can''t have been","easy","It"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Él no puede estar hambriento.", "s":{"type":"scramble","chunks":["He","hungry","can''t be"],"correct_order":}}'::jsonb,
        '{"r":2, "p":"Ordena: Ella no pudo haberlo hecho.", "s":{"type":"scramble","chunks":["done it","She","can''t have"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Posibilidad (May be / May have been) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":3, "p":"It ___ (puede ser / puede que sea) true.", "s":{"type":"typing","correct_answers":["may be"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (pudo haber sido) the winner.", "s":{"type":"typing","correct_answers":["may have been"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"You ___ (puede que estés) right.", "s":{"type":"typing","correct_answers":["may be"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"They ___ (pudieron haber) forgotten.", "s":{"type":"typing","correct_answers":["may have"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She ___ (puede ser) at home.", "s":{"type":"typing","correct_answers":["may be"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"It ___ (pudo haber sido) a mistake.", "s":{"type":"typing","correct_answers":["may have been"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He ___ (puede que sea) late.", "s":{"type":"typing","correct_answers":["may be"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"The keys ___ (pudieron haber) fallen.", "s":{"type":"typing","correct_answers":["may have"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":3, "p":"¿Qué modal indica que existe una POSIBILIDAD razonable (puede ser)?", "s":{"type":"multiple_choice","options":["must be","may be","can''t be"],"answer":1}}'::jsonb,
        '{"r":3, "p":"Where is Sarah? She ___ at the library, but I''m not sure.", "s":{"type":"multiple_choice","options":["must be","may be","can''t be"],"answer":1}}'::jsonb,
        '{"r":3, "p":"¿Cómo dices ''pudo haber sido'' (posibilidad en el pasado)?", "s":{"type":"multiple_choice","options":["may have been","must have been","can''t have been"],"answer":0}}'::jsonb,
        '{"r":3, "p":"I can''t find my phone. I ___ left it at work.", "s":{"type":"multiple_choice","options":["can''t have","may have","must have been"],"answer":1}}'::jsonb,
        '{"r":3, "p":"He isn''t answering. He ___ sleeping.", "s":{"type":"multiple_choice","options":["must have been","may be","can''t be"],"answer":1}}'::jsonb,
        '{"r":3, "p":"The flight was delayed. The weather ___ bad.", "s":{"type":"multiple_choice","options":["may have been","can''t have been","may be"],"answer":0}}'::jsonb,
        '{"r":3, "p":"It ___ raining tomorrow. Bring a jacket just in case.", "s":{"type":"multiple_choice","options":["may be","must be","can''t be"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They ___ lost the map. They are very late.", "s":{"type":"multiple_choice","options":["may have","can''t have","must be"],"answer":0}}'::jsonb,
        -- True/False (7)
        '{"r":3, "p":"''May be'' se utiliza para expresar que hay posibilidad de que algo sea cierto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''May have been'' expresa una certeza absoluta sobre un evento pasado.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''It may be true'' significa ''Puede que sea verdad''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''May'' implica menos certeza que ''Must'', pero algo de posibilidad.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Para decir ''Él pudo haber sido el ganador'', usamos ''He may have been the winner''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''May be'' y ''Maybe'' (junto) son siempre intercambiables sintácticamente en la frase.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''May have'' se usa para posibilidades en el pasado.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":3, "p":"Ordena: Puede que sea verdad.", "s":{"type":"scramble","chunks":["may be","It","true"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ella pudo haber estado allí.", "s":{"type":"scramble","chunks":["there","She","may have been"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Puede que tengas razón.", "s":{"type":"scramble","chunks":["may be","right","You"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Pudo haber sido un error.", "s":{"type":"scramble","chunks":["a mistake","may have been","It"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Él puede que llegue tarde.", "s":{"type":"scramble","chunks":["may be","He","late"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Ellos pudieron haber olvidado.", "s":{"type":"scramble","chunks":["may have","forgotten","They"],"correct_order":}}'::jsonb,
        '{"r":3, "p":"Ordena: Puede que ella esté en casa.", "s":{"type":"scramble","chunks":["at home","She","may be"],"correct_order":}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Poca Posibilidad (Might & Could) - 30 Ejercicios
        -- ==========================================
        -- Typing (8)
        '{"r":4, "p":"It ___ (podría ser) a trap.", "s":{"type":"typing","correct_answers":["might be","could be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (podría haber sido) hurt.", "s":{"type":"typing","correct_answers":["could have been","might have been"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"You ___ (podrías estar) wrong.", "s":{"type":"typing","correct_answers":["might be","could be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"They ___ (podrían haber) seen us.", "s":{"type":"typing","correct_answers":["could have","might have"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She ___ (podría ser) the winner.", "s":{"type":"typing","correct_answers":["might be","could be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"It ___ (podría haber sido) worse.", "s":{"type":"typing","correct_answers":["might have been","could have been"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He ___ (podría estar) sleeping.", "s":{"type":"typing","correct_answers":["could be","might be"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We ___ (podríamos haber) died.", "s":{"type":"typing","correct_answers":["might have","could have"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (8)
        '{"r":4, "p":"¿Qué modales expresan POCA POSIBILIDAD (podría ser)?", "s":{"type":"multiple_choice","options":["might / could be","must be","can''t be"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Take an umbrella. It ___ later, though the sky is clear now.", "s":{"type":"multiple_choice","options":["must rain","might rain","can''t rain"],"answer":1}}'::jsonb,
        '{"r":4, "p":"¿Cómo dices ''podría haber sido'' (poca posibilidad en el pasado)?", "s":{"type":"multiple_choice","options":["must have been","might have been","can''t have been"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I don''t know where he is. He ___ at the gym.", "s":{"type":"multiple_choice","options":["must be","can''t be","could be"],"answer":2}}'::jsonb,
        '{"r":4, "p":"It ___ a mistake, but I doubt it.", "s":{"type":"multiple_choice","options":["might be","must be","can''t be"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They ___ lost the match if they hadn''t practiced.", "s":{"type":"multiple_choice","options":["must have","could have","can''t have"],"answer":1}}'::jsonb,
        '{"r":4, "p":"She ___ sleeping, try calling her again.", "s":{"type":"multiple_choice","options":["might be","must be","can''t be"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We ___ gone to the beach, but we stayed home.", "s":{"type":"multiple_choice","options":["must have","might have","can''t have"],"answer":1}}'::jsonb,
        -- True/False (7)
        '{"r":4, "p":"''Might be'' y ''Could be'' expresan que hay poca posibilidad de que algo sea cierto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Could have been'' significa ''debió haber sido''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Might have been'' se traduce como ''podría haber sido''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Could be'' indica menos certeza que ''Must be''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"La oración ''It might be raining'' significa ''Debe estar lloviendo seguro''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Might'' y ''Could'' se pueden usar casi indistintamente para conjeturas de baja posibilidad.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Para decir ''Podría haber sido peor'', usamos ''It might have been worse''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (7)
        '{"r":4, "p":"Ordena: Podría estar lloviendo.", "s":{"type":"scramble","chunks":["might be","raining","It"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Podría ser un error.", "s":{"type":"scramble","chunks":["a mistake","It","could be"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Podría haber sido peor.", "s":{"type":"scramble","chunks":["worse","might have been","It"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Podrías estar equivocado.", "s":{"type":"scramble","chunks":["wrong","might be","You"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Él podría haber resultado herido.", "s":{"type":"scramble","chunks":["could have been","He","hurt"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Podrían habernos visto.", "s":{"type":"scramble","chunks":["seen us","might have","They"],"correct_order":}}'::jsonb,
        '{"r":4, "p":"Ordena: Podría ser una trampa.", "s":{"type":"scramble","chunks":["could be","a trap","It"],"correct_order":}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 22, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Conjeturas (Modals of Deduction)', 
    'Aprende a hacer deducciones lógicas y conjeturas en inglés utilizando verbos modales para expresar distintos grados de certeza y posibilidad.', 
    to_jsonb('## Grammar Lesson: Conjeturas (Modals of Deduction)
Las conjeturas nos permiten hacer deducciones sobre una situación en el presente o en el pasado basándonos en la evidencia que tenemos y en nuestro nivel de certeza.

##### 1. Certeza Positiva (Must be / Must have been)
Se utiliza cuando tienes **bastante certeza de que algo SÍ es verdad** o sucedió.
*   **Presente:** *Must be* (Debe ser / Ha de ser).
    *   *You haven''t eaten all day. You must be hungry.* (Debes estar hambriento).
*   **Pasado:** *Must have been* (Debió haber sido).
    *   *The ground is wet. It must have been raining.* (Debió haber estado lloviendo).

##### 2. Certeza Negativa (Can''t be / Can''t have been)
Se utiliza cuando tienes **certeza de que algo NO es verdad** (es imposible).
*   **Presente:** *Can''t be* (No puede ser).
    *   *That can''t be John. John is in London.* (Ese no puede ser John).
*   **Pasado:** *Can''t have been* (No pudo haber sido).
    *   *She can''t have been the thief, she was with me.* (No pudo haber sido la ladrona).

##### 3. Posibilidad Media (May be / May have been)
Se utiliza cuando **hay posibilidad** razonable de que algo sea cierto (puede que sea).
*   **Presente:** *May be* (Puede ser / Puede que sea).
    *   *It may be true.* (Puede que sea verdad).
*   **Pasado:** *May have been* (Pudo haber sido).
    *   *She may have been at the party, I don''t know.* (Pudo haber estado en la fiesta).

##### 4. Poca Posibilidad (Might / Could be)
Se utiliza cuando **hay muy poca posibilidad** (podría ser). *Might* y *Could* funcionan de forma casi idéntica para conjeturas.
*   **Presente:** *Might be / Could be* (Podría ser).
    *   *It might be raining later.* (Podría estar lloviendo más tarde).
*   **Pasado:** *Might have been / Could have been* (Podría haber sido).
    *   *It might have been worse.* (Podría haber sido peor).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Certeza Positiva (Must)', 'Usa "must be" (presente) o "must have been" (pasado) cuando tienes bastante certeza de que algo SÍ es cierto (debe ser / debió ser).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Certeza Negativa (Can''t)', 'Usa "can''t be" (presente) o "can''t have been" (pasado) para expresar imposibilidad (no puede ser / no pudo haber sido).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Posibilidad (May)', 'Usa "may be" (presente) o "may have been" (pasado) cuando hay una posibilidad real (puede ser / pudo haber sido).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Poca Posibilidad (Might/Could)', 'Usa "might/could be" (presente) o "might/could have been" (pasado) cuando hay poca posibilidad (podría ser / podría haber sido).');

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