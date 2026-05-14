-- ============================================================
-- Seed: A0 English Path – Grammar – Cuantificadores (COMPLETO)
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
        -- REGLA 1: Much, Many, Very much, None, How much, How many
        -- ==========================================
        -- 1: Much
        '{"r":1, "p":"I haven''t got ___ time.", "s":{"type":"typing","correct_answers":["much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"He doesn''t drink ___ water.", "s":{"type":"typing","correct_answers":["much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Did you buy ___ coffee?", "s":{"type":"typing","correct_answers":["much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"There isn''t ___ sugar left.", "s":{"type":"typing","correct_answers":["much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We don''t have ___ money.", "s":{"type":"multiple_choice","options":["many","much","a few"],"answer":1}}'::jsonb,
        '{"r":1, "p":"I don''t show ___ interest.", "s":{"type":"multiple_choice","options":["much","many","few"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Did he make ___ progress?", "s":{"type":"multiple_choice","options":["many","a few","much"],"answer":2}}'::jsonb,
        '{"r":1, "p":"''Much'' se usa con sustantivos incontables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''Much'' se utiliza principalmente en frases afirmativas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"La frase ''I don''t have much friends'' es correcta.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- 2: Many
        '{"r":1, "p":"There are ___ cars in the street.", "s":{"type":"typing","correct_answers":["many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I don''t have ___ friends here.", "s":{"type":"typing","correct_answers":["many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Did you read ___ books?", "s":{"type":"typing","correct_answers":["many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She has visited ___ countries.", "s":{"type":"typing","correct_answers":["many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"There aren''t ___ people inside.", "s":{"type":"multiple_choice","options":["much","many","little"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He asked ___ questions.", "s":{"type":"multiple_choice","options":["many","much","none"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Do you have ___ problems?", "s":{"type":"multiple_choice","options":["much","a little","many"],"answer":2}}'::jsonb,
        '{"r":1, "p":"''Many'' significa ''muchos/as'' y se usa con contables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''many water''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Many'' puede usarse en oraciones afirmativas con sustantivos contables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 3: Very much
        '{"r":1, "p":"I like tennis ___ ___.", "s":{"type":"typing","correct_answers":["very much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Thank you ___ ___.", "s":{"type":"typing","correct_answers":["very much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"We enjoyed the party ___ ___.", "s":{"type":"typing","correct_answers":["very much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"She missed her family ___ ___.", "s":{"type":"typing","correct_answers":["very much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I appreciate your help ___.", "s":{"type":"multiple_choice","options":["very much","many","lots"],"answer":0}}'::jsonb,
        '{"r":1, "p":"They love their dog ___.", "s":{"type":"multiple_choice","options":["much very","very much","many much"],"answer":1}}'::jsonb,
        '{"r":1, "p":"He dislikes cold weather ___.", "s":{"type":"multiple_choice","options":["many","a lot of","very much"],"answer":2}}'::jsonb,
        '{"r":1, "p":"''Very much'' es un adverbio que se pone detrás del objeto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''I very much like tennis''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Very much'' se traduce como ''mucho/muchísimo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 4: None
        '{"r":1, "p":"How many computers? There are ___.", "s":{"type":"typing","correct_answers":["none"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"I asked for apples but there were ___ left.", "s":{"type":"typing","correct_answers":["none"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Of all the solutions, ___ worked.", "s":{"type":"typing","correct_answers":["none"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"How many errors? ___.", "s":{"type":"typing","correct_answers":["None"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"How many people came? ___.", "s":{"type":"multiple_choice","options":["None","No","Any"],"answer":0}}'::jsonb,
        '{"r":1, "p":"I wanted some cookies but there were ___.", "s":{"type":"multiple_choice","options":["no","none","nothing"],"answer":1}}'::jsonb,
        '{"r":1, "p":"How many cars are there? ___.", "s":{"type":"multiple_choice","options":["Any","Nobody","None"],"answer":2}}'::jsonb,
        '{"r":1, "p":"''None'' significa ''ninguno/a'' y se usa con contables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''None'' se usa seguido inmediatamente de un sustantivo (ej. None car).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''None'' sirve para responder a preguntas de cantidad indicando cero.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 5: How much
        '{"r":1, "p":"___ ___ is it? (Precio)", "s":{"type":"typing","correct_answers":["How much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ water do you need?", "s":{"type":"typing","correct_answers":["How much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ time do we have?", "s":{"type":"typing","correct_answers":["How much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ money did you spend?", "s":{"type":"typing","correct_answers":["How much"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ milk do you want?", "s":{"type":"multiple_choice","options":["How much","How many","Much"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ noise is there?", "s":{"type":"multiple_choice","options":["How many","How much","Many"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ sugar is left?", "s":{"type":"multiple_choice","options":["Much","How many","How much"],"answer":2}}'::jsonb,
        '{"r":1, "p":"''How much'' se usa con sustantivos incontables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto decir ''How much cars do you have?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''How much is it?'' es la frase correcta para preguntar el precio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 6: How many
        '{"r":1, "p":"___ ___ do you want? (Contables)", "s":{"type":"typing","correct_answers":["How many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ cars are there?", "s":{"type":"typing","correct_answers":["How many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ friends did you invite?", "s":{"type":"typing","correct_answers":["How many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ ___ books have you read?", "s":{"type":"typing","correct_answers":["How many"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"___ people came to the party?", "s":{"type":"multiple_choice","options":["How many","How much","Many"],"answer":0}}'::jsonb,
        '{"r":1, "p":"___ days are in a week?", "s":{"type":"multiple_choice","options":["How much","How many","Much"],"answer":1}}'::jsonb,
        '{"r":1, "p":"___ children do they have?", "s":{"type":"multiple_choice","options":["How much","Much","How many"],"answer":2}}'::jsonb,
        '{"r":1, "p":"''How many'' significa ''¿cuántos/as?'' y se usa con contables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"Es correcto usar ''How many'' para preguntar sobre el agua.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"En ''How many do you want?'', estamos asumiendo objetos contables.", "s":{"type":"true_false","answer":true}}'::jsonb,

        -- ==========================================
        -- REGLA 2: A lot of, Lots of, Too much, Too many, A little, A few, Plenty of, Enough
        -- ==========================================
        -- 7: A lot of
        '{"r":2, "p":"There are ___ ___ ___ accidents every year.", "s":{"type":"typing","correct_answers":["a lot of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I have ___ ___ ___ friends.", "s":{"type":"typing","correct_answers":["a lot of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She drank ___ ___ ___ water.", "s":{"type":"typing","correct_answers":["a lot of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We need ___ ___ ___ time.", "s":{"type":"typing","correct_answers":["a lot of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He reads ___ books.", "s":{"type":"multiple_choice","options":["a lot of","much","a little"],"answer":0}}'::jsonb,
        '{"r":2, "p":"There is ___ traffic today.", "s":{"type":"multiple_choice","options":["many","a lot of","few"],"answer":1}}'::jsonb,
        '{"r":2, "p":"They bought ___ presents.", "s":{"type":"multiple_choice","options":["much","little","a lot of"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''A lot of'' se puede usar tanto con contables como con incontables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''A lot of'' se traduce como ''un poco de''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''a lot of accidents''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 8: Lots of
        '{"r":2, "p":"There are ___ ___ people in the supermarket. (Montones)", "s":{"type":"typing","correct_answers":["lots of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We have ___ ___ things to do. (Montones)", "s":{"type":"typing","correct_answers":["lots of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He earned ___ ___ money. (Montones)", "s":{"type":"typing","correct_answers":["lots of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She has ___ ___ love to give. (Montones)", "s":{"type":"typing","correct_answers":["lots of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I saw ___ birds. (Montones)", "s":{"type":"multiple_choice","options":["lots of","much","a little"],"answer":0}}'::jsonb,
        '{"r":2, "p":"They ate ___ apples. (Montones)", "s":{"type":"multiple_choice","options":["much","lots of","little"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He caused ___ problems. (Montones)", "s":{"type":"multiple_choice","options":["a little","much","lots of"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''Lots of'' significa ''montones de''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Lots of'' es mucho más formal que ''A lot of''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Se puede usar ''Lots of'' con incontables como ''money''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 9: Too much
        '{"r":2, "p":"There is ___ ___ noise in big cities.", "s":{"type":"typing","correct_answers":["too much"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You put ___ ___ sugar in my tea.", "s":{"type":"typing","correct_answers":["too much"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I drank ___ ___ coffee today.", "s":{"type":"typing","correct_answers":["too much"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She spends ___ ___ money on clothes.", "s":{"type":"typing","correct_answers":["too much"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There is ___ pollution.", "s":{"type":"multiple_choice","options":["too much","too many","many"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He ate ___ food.", "s":{"type":"multiple_choice","options":["too many","too much","lots"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I have ___ work to do.", "s":{"type":"multiple_choice","options":["too many","many","too much"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''Too much'' significa ''demasiado/a'' y va seguido de sustantivos.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''too much cars''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Too much'' se utiliza con sustantivos incontables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 10: Too many
        '{"r":2, "p":"There are ___ ___ flies in small villages.", "s":{"type":"typing","correct_answers":["too many"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"You made ___ ___ mistakes.", "s":{"type":"typing","correct_answers":["too many"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There are ___ ___ people here.", "s":{"type":"typing","correct_answers":["too many"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I bought ___ ___ apples.", "s":{"type":"typing","correct_answers":["too many"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He owns ___ cars.", "s":{"type":"multiple_choice","options":["too many","too much","much"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I have ___ problems.", "s":{"type":"multiple_choice","options":["too much","too many","much"],"answer":1}}'::jsonb,
        '{"r":2, "p":"There are ___ chairs in the room.", "s":{"type":"multiple_choice","options":["too much","much","too many"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''Too many'' se traduce como ''demasiados/as''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Too many'' se usa con sustantivos incontables como ''water''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''too many problems''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 11: A little
        '{"r":2, "p":"They speak ___ ___ French.", "s":{"type":"typing","correct_answers":["a little"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I need ___ ___ milk for the cake.", "s":{"type":"typing","correct_answers":["a little"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Add ___ ___ salt to the soup.", "s":{"type":"typing","correct_answers":["a little"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We have ___ ___ time to rest.", "s":{"type":"typing","correct_answers":["a little"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I want ___ water.", "s":{"type":"multiple_choice","options":["a little","a few","many"],"answer":0}}'::jsonb,
        '{"r":2, "p":"She has ___ money.", "s":{"type":"multiple_choice","options":["a few","a little","many"],"answer":1}}'::jsonb,
        '{"r":2, "p":"Could you give me ___ help?", "s":{"type":"multiple_choice","options":["a few","many","a little"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''A little'' significa ''un poco de'' y se usa con incontables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''a little friends''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''A little'' expresa una pequeña cantidad de algo que no se puede contar.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 12: A few
        '{"r":2, "p":"He has got ___ ___ sweets in his pocket.", "s":{"type":"typing","correct_answers":["a few"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"I have ___ ___ friends in London.", "s":{"type":"typing","correct_answers":["a few"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We stayed for ___ ___ days.", "s":{"type":"typing","correct_answers":["a few"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"She asked ___ ___ questions.", "s":{"type":"typing","correct_answers":["a few"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There are ___ apples left.", "s":{"type":"multiple_choice","options":["a few","a little","much"],"answer":0}}'::jsonb,
        '{"r":2, "p":"I took ___ photos.", "s":{"type":"multiple_choice","options":["a little","a few","much"],"answer":1}}'::jsonb,
        '{"r":2, "p":"He bought ___ books.", "s":{"type":"multiple_choice","options":["a little","much","a few"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''A few'' significa ''unos pocos/cuantos''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''A few'' se utiliza con sustantivos incontables.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"Es correcto decir ''a few sweets''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 13: Plenty of
        '{"r":2, "p":"She has got ___ ___ friends. (Bastantes/Suficientes)", "s":{"type":"typing","correct_answers":["plenty of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We have ___ ___ time to finish.", "s":{"type":"typing","correct_answers":["plenty of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There is ___ ___ food for everyone.", "s":{"type":"typing","correct_answers":["plenty of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"They have ___ ___ money to travel.", "s":{"type":"typing","correct_answers":["plenty of"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There is ___ room in the car.", "s":{"type":"multiple_choice","options":["plenty of","many","a few"],"answer":0}}'::jsonb,
        '{"r":2, "p":"He brought ___ drinks.", "s":{"type":"multiple_choice","options":["much","plenty of","a little"],"answer":1}}'::jsonb,
        '{"r":2, "p":"We found ___ evidence.", "s":{"type":"multiple_choice","options":["many","a few","plenty of"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''Plenty of'' significa suficientes o bastantes.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Plenty of'' sólo puede utilizarse con incontables.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Plenty of friends'' es una expresión válida.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 14: Enough
        '{"r":2, "p":"She is clever ___. (Suficiente)", "s":{"type":"typing","correct_answers":["enough"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"We don''t have ___ money. (Suficiente)", "s":{"type":"typing","correct_answers":["enough"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Is the water hot ___?", "s":{"type":"typing","correct_answers":["enough"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"There are ___ chairs for everyone.", "s":{"type":"typing","correct_answers":["enough"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"He isn''t tall ___.", "s":{"type":"multiple_choice","options":["enough","plenty","much"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Do we have ___ time?", "s":{"type":"multiple_choice","options":["many","enough","a few"],"answer":1}}'::jsonb,
        '{"r":2, "p":"I didn''t get ___ sleep.", "s":{"type":"multiple_choice","options":["many","a few","enough"],"answer":2}}'::jsonb,
        '{"r":2, "p":"''Enough'' se coloca después de los adjetivos (ej. clever enough).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Enough'' siempre se coloca al final de la oración.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''Enough'' se coloca delante de los sustantivos (ej. enough money).", "s":{"type":"true_false","answer":true}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Some, Any, No, Every
        -- ==========================================
        -- 15: Some
        '{"r":3, "p":"Would you like ___ tea? (Ofrecimiento)", "s":{"type":"typing","correct_answers":["some"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I have ___ apples in my bag.", "s":{"type":"typing","correct_answers":["some"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Can I have ___ water, please?", "s":{"type":"typing","correct_answers":["some"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"There are ___ birds in the tree.", "s":{"type":"typing","correct_answers":["some"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I need ___ milk.", "s":{"type":"multiple_choice","options":["some","any","every"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Would you like ___ coffee?", "s":{"type":"multiple_choice","options":["any","some","every"],"answer":1}}'::jsonb,
        '{"r":3, "p":"She bought ___ flowers.", "s":{"type":"multiple_choice","options":["any","no","some"],"answer":2}}'::jsonb,
        '{"r":3, "p":"''Some'' se utiliza generalmente en oraciones afirmativas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Some'' no puede usarse nunca en preguntas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"Se usa ''some'' en interrogativas si son ofrecimientos o peticiones.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 16: Any
        '{"r":3, "p":"Do you have ___ money? (Pregunta)", "s":{"type":"typing","correct_answers":["any"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I don''t have ___ friends here.", "s":{"type":"typing","correct_answers":["any"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Is there ___ milk left?", "s":{"type":"typing","correct_answers":["any"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We don''t need ___ help.", "s":{"type":"typing","correct_answers":["any"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She doesn''t want ___ food.", "s":{"type":"multiple_choice","options":["any","some","no"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Are there ___ messages for me?", "s":{"type":"multiple_choice","options":["some","any","no"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I won''t give you ___ money.", "s":{"type":"multiple_choice","options":["some","no","any"],"answer":2}}'::jsonb,
        '{"r":3, "p":"''Any'' en oraciones interrogativas suele significar ''algo de'' o ''algún/a''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Any'' se usa para ofrecer cosas amablemente.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"En negativas, ''any'' significa ''nada de'' o ''ningún/a''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 17: No
        '{"r":3, "p":"I have ___ time. (Nada de)", "s":{"type":"typing","correct_answers":["no"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"There are ___ cars in the street. (Ningún)", "s":{"type":"typing","correct_answers":["no"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"He has ___ money.", "s":{"type":"typing","correct_answers":["no"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"We have ___ options left.", "s":{"type":"typing","correct_answers":["no"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I have ___ idea about that.", "s":{"type":"multiple_choice","options":["no","any","some"],"answer":0}}'::jsonb,
        '{"r":3, "p":"There is ___ water in the bottle.", "s":{"type":"multiple_choice","options":["any","no","some"],"answer":1}}'::jsonb,
        '{"r":3, "p":"She has ___ friends here.", "s":{"type":"multiple_choice","options":["any","some","no"],"answer":2}}'::jsonb,
        '{"r":3, "p":"''No'' significa ''no... nada'' o ''ningún/ninguna''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"Es correcto decir ''I don''t have no time''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''No'' hace que la frase sea negativa sin necesitar el auxiliar negativo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 18: Every
        '{"r":3, "p":"I run ___ day. (Cada)", "s":{"type":"typing","correct_answers":["every"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ student must pass the exam. (Todo/Cada)", "s":{"type":"typing","correct_answers":["Every"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"She visits her mother ___ week. (Cada)", "s":{"type":"typing","correct_answers":["every"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"I read ___ book in this library. (Cada/Todo)", "s":{"type":"typing","correct_answers":["every"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"___ car has an engine.", "s":{"type":"multiple_choice","options":["Every","All","Some"],"answer":0}}'::jsonb,
        '{"r":3, "p":"They go to Spain ___ summer.", "s":{"type":"multiple_choice","options":["all","every","any"],"answer":1}}'::jsonb,
        '{"r":3, "p":"I agree with ___ word you said.", "s":{"type":"multiple_choice","options":["all","some","every"],"answer":2}}'::jsonb,
        '{"r":3, "p":"Cuando ''Every'' va solo seguido de sustantivo, se traduce como ''cada'' o ''todo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Every'' se utiliza con sustantivos en plural (ej. every cars).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Every day'' significa ''todos los días'' o ''cada día''.", "s":{"type":"true_false","answer":true}}'::jsonb,

        -- ==========================================
        -- REGLA 4: Compuestos de Some, Any, No, Every
        -- ==========================================
        -- 19: Something
        '{"r":4, "p":"There is ___ under the car. (Algo)", "s":{"type":"typing","correct_answers":["something"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I need ___ to eat.", "s":{"type":"typing","correct_answers":["something"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He told me ___ interesting.", "s":{"type":"typing","correct_answers":["something"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Did you say ___? (Asumiendo sí)", "s":{"type":"typing","correct_answers":["something"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have ___ for you.", "s":{"type":"multiple_choice","options":["something","anything","nothing"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She bought ___ at the store.", "s":{"type":"multiple_choice","options":["anything","something","nobody"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Would you like ___ to drink?", "s":{"type":"multiple_choice","options":["nothing","anything","something"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Something'' significa ''algo'' o ''alguna cosa''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Something'' se usa normalmente para personas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Something'' es un compuesto de ''some''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 20: Somebody / Someone
        '{"r":4, "p":"There is ___ in the garden. (Alguien)", "s":{"type":"typing","correct_answers":["somebody","someone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ is knocking at the door. (Alguien)", "s":{"type":"typing","correct_answers":["Somebody","Someone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I saw ___ in the window. (Alguien)", "s":{"type":"typing","correct_answers":["somebody","someone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ left their bag here. (Alguien)", "s":{"type":"typing","correct_answers":["Somebody","Someone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ is waiting for you.", "s":{"type":"multiple_choice","options":["Somebody","Anybody","Nobody"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I want to talk to ___.", "s":{"type":"multiple_choice","options":["anybody","somebody","everywhere"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Did ___ call me? (Esperando sí)", "s":{"type":"multiple_choice","options":["nobody","anywhere","someone"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Somebody'' o ''someone'' significan ''alguien''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Somebody'' se utiliza generalmente en frases negativas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Somebody'' y ''someone'' son prácticamente intercambiables.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 21: Somewhere
        '{"r":4, "p":"Oxford is ___ in England. (Algún sitio)", "s":{"type":"typing","correct_answers":["somewhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Let''s go ___ nice for dinner.", "s":{"type":"typing","correct_answers":["somewhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I lost my keys ___ in the house.", "s":{"type":"typing","correct_answers":["somewhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"My glasses must be ___ around here.", "s":{"type":"typing","correct_answers":["somewhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I want to live ___ warm.", "s":{"type":"multiple_choice","options":["somewhere","anywhere","nowhere"],"answer":0}}'::jsonb,
        '{"r":4, "p":"They traveled ___ in Europe.", "s":{"type":"multiple_choice","options":["anywhere","somewhere","nobody"],"answer":1}}'::jsonb,
        '{"r":4, "p":"We should hide this ___ safe.", "s":{"type":"multiple_choice","options":["nowhere","everywhere","somewhere"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Somewhere'' significa ''algún sitio'' o ''lugar''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Somewhere'' se refiere a personas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Se utiliza principalmente en oraciones afirmativas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 22: Anything
        '{"r":4, "p":"Is there ___ in the box? (Pregunta)", "s":{"type":"typing","correct_answers":["anything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I didn''t buy ___ at the shop.", "s":{"type":"typing","correct_answers":["anything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Do you need ___ else?", "s":{"type":"typing","correct_answers":["anything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She won''t say ___.", "s":{"type":"typing","correct_answers":["anything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I don''t know ___ about it.", "s":{"type":"multiple_choice","options":["anything","something","nothing"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Did you find ___?", "s":{"type":"multiple_choice","options":["nothing","anything","something"],"answer":1}}'::jsonb,
        '{"r":4, "p":"You can choose ___ you want. (Cualquier cosa)", "s":{"type":"multiple_choice","options":["nothing","somebody","anything"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Anything'' en frases afirmativas puede significar ''cualquier cosa''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Anything'' significa ''nadie'' en oraciones negativas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Anything'' es el compuesto de cosa de ''Any''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 23: Anybody / Anyone
        '{"r":4, "p":"Is there ___ in the house? (Pregunta)", "s":{"type":"typing","correct_answers":["anybody","anyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I didn''t see ___ there.", "s":{"type":"typing","correct_answers":["anybody","anyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Can ___ help me?", "s":{"type":"typing","correct_answers":["anybody","anyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She doesn''t trust ___.", "s":{"type":"typing","correct_answers":["anybody","anyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Has ___ seen my keys?", "s":{"type":"multiple_choice","options":["anybody","somebody","nobody"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I don''t know ___ in this city.", "s":{"type":"multiple_choice","options":["somebody","anybody","nobody"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ can do this easily. (Cualquiera)", "s":{"type":"multiple_choice","options":["Nobody","Nothing","Anybody"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Anybody'' y ''anyone'' significan lo mismo.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"En una afirmación, ''anybody'' significa ''nadie''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En afirmativas, ''anybody'' puede traducirse como ''cualquiera''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 24: Anywhere
        '{"r":4, "p":"Is there a supermarket ___ near here?", "s":{"type":"typing","correct_answers":["anywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I can''t find my keys ___.", "s":{"type":"typing","correct_answers":["anywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Did you go ___ yesterday?", "s":{"type":"typing","correct_answers":["anywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We didn''t travel ___ last year.", "s":{"type":"typing","correct_answers":["anywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Sit ___ you like. (Donde sea)", "s":{"type":"multiple_choice","options":["anywhere","somewhere","nowhere"],"answer":0}}'::jsonb,
        '{"r":4, "p":"I don''t want to go ___ tonight.", "s":{"type":"multiple_choice","options":["somewhere","anywhere","nowhere"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Have you seen him ___?", "s":{"type":"multiple_choice","options":["nowhere","somewhere","anywhere"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Anywhere'' significa ''en ningún sitio'' cuando va en una oración negativa.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Anywhere'' se utiliza para personas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"En afirmativas, ''anywhere'' significa ''en cualquier sitio''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 25: Nothing
        '{"r":4, "p":"There is ___ in the fridge. (Nada)", "s":{"type":"typing","correct_answers":["nothing"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have ___ to say. (Nada)", "s":{"type":"typing","correct_answers":["nothing"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ happened yesterday. (Nada)", "s":{"type":"typing","correct_answers":["Nothing"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He knows ___ about it. (Nada)", "s":{"type":"typing","correct_answers":["nothing"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ is impossible.", "s":{"type":"multiple_choice","options":["Nothing","Anything","Something"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She did ___ all day.", "s":{"type":"multiple_choice","options":["anything","nothing","something"],"answer":1}}'::jsonb,
        '{"r":4, "p":"They had ___ to eat.", "s":{"type":"multiple_choice","options":["anything","something","nothing"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Nothing'' significa ''nada''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Nothing'' se usa con verbos en negativo (ej. I didn''t do nothing).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''Nothing'' es el pronombre negativo para cosas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 26: Nobody / No one
        '{"r":4, "p":"There is ___ in the classroom. (Nadie)", "s":{"type":"typing","correct_answers":["nobody","no one"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ told me about it. (Nadie)", "s":{"type":"typing","correct_answers":["Nobody","No one"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I saw ___ there. (Nadie)", "s":{"type":"typing","correct_answers":["nobody","no one"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She loves ___. (Nadie)", "s":{"type":"typing","correct_answers":["nobody","no one"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ knows the answer.", "s":{"type":"multiple_choice","options":["Nobody","Anybody","Somebody"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He spoke to ___.", "s":{"type":"multiple_choice","options":["anybody","nobody","everybody"],"answer":1}}'::jsonb,
        '{"r":4, "p":"___ came to the party.", "s":{"type":"multiple_choice","options":["Anybody","Somebody","Nobody"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Nobody'' y ''no one'' significan ''nadie''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''No one'' se escribe todo junto como una sola palabra (noone).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"No debemos usar otro verbo negativo en la misma frase con ''nobody''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 27: Nowhere
        '{"r":4, "p":"___ is cheap. (Ningún sitio)", "s":{"type":"typing","correct_answers":["Nowhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"There is ___ to hide. (Ningún sitio)", "s":{"type":"typing","correct_answers":["nowhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"We went ___ this weekend. (Ningún sitio)", "s":{"type":"typing","correct_answers":["nowhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"He has ___ to go. (Ningún sitio)", "s":{"type":"typing","correct_answers":["nowhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have ___ to sit.", "s":{"type":"multiple_choice","options":["nowhere","anywhere","somewhere"],"answer":0}}'::jsonb,
        '{"r":4, "p":"This road leads ___.", "s":{"type":"multiple_choice","options":["anywhere","nowhere","somewhere"],"answer":1}}'::jsonb,
        '{"r":4, "p":"She found the keys ___.", "s":{"type":"multiple_choice","options":["anywhere","everywhere","nowhere"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Nowhere'' significa ''en ningún sitio/lugar''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Nowhere'' puede usarse con frases negativas (ej. I didn''t go nowhere).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Es un pronombre de lugar y da sentido negativo a la oración.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 28: Everything
        '{"r":4, "p":"Is ___ ready? (Todo)", "s":{"type":"typing","correct_answers":["everything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ is fine. (Todo)", "s":{"type":"typing","correct_answers":["Everything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"She told me ___ she knew. (Todo)", "s":{"type":"typing","correct_answers":["everything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I have done ___ I could. (Todo)", "s":{"type":"typing","correct_answers":["everything"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Money isn''t ___.", "s":{"type":"multiple_choice","options":["everything","something","anything"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He lost ___ in the fire.", "s":{"type":"multiple_choice","options":["something","everything","nothing"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Thanks for ___.", "s":{"type":"multiple_choice","options":["nothing","anything","everything"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Everything'' significa ''todo'' o ''todas las cosas''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Everything'' se utiliza con el verbo en plural (ej. Everything are fine).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Es el compuesto de ''every'' para cosas.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 29: Everybody / Everyone
        '{"r":4, "p":"___ is here. (Todo el mundo)", "s":{"type":"typing","correct_answers":["Everybody","Everyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I want to thank ___. (Todo el mundo)", "s":{"type":"typing","correct_answers":["everybody","everyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Does ___ understand? (Todo el mundo)", "s":{"type":"typing","correct_answers":["everybody","everyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ needs a friend. (Todo el mundo)", "s":{"type":"typing","correct_answers":["Everybody","Everyone"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"___ loves this song.", "s":{"type":"multiple_choice","options":["Everybody","Anybody","Nobody"],"answer":0}}'::jsonb,
        '{"r":4, "p":"She said goodbye to ___.", "s":{"type":"multiple_choice","options":["nobody","everyone","someone"],"answer":1}}'::jsonb,
        '{"r":4, "p":"Is ___ happy?", "s":{"type":"multiple_choice","options":["nobody","someone","everybody"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Everybody'' y ''everyone'' significan ''todo el mundo''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"El verbo después de ''everybody'' debe ir en plural (ej. everybody are).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Ambos compuestos son pronombres singulares.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- 30: Everywhere
        '{"r":4, "p":"There are tourists ___ in summer.", "s":{"type":"typing","correct_answers":["everywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"I looked ___ for my phone.", "s":{"type":"typing","correct_answers":["everywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Snow covered ___.", "s":{"type":"typing","correct_answers":["everywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"You can find this plant ___.", "s":{"type":"typing","correct_answers":["everywhere"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"There is dust ___.", "s":{"type":"multiple_choice","options":["everywhere","nowhere","somewhere"],"answer":0}}'::jsonb,
        '{"r":4, "p":"He travels ___ with his dog.", "s":{"type":"multiple_choice","options":["nowhere","everywhere","anywhere"],"answer":1}}'::jsonb,
        '{"r":4, "p":"I want to go ___ in the world.", "s":{"type":"multiple_choice","options":["nowhere","anywhere","everywhere"],"answer":2}}'::jsonb,
        '{"r":4, "p":"''Everywhere'' significa ''por/a todas partes''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Everywhere'' se usa para hablar de personas.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Es el compuesto de ''every'' para lugares.", "s":{"type":"true_false","answer":true}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal
INSERT INTO grammar (path_id, step_order, source_language, type) 
VALUES (v_path_id, 7, 'en', 'grammar') 
RETURNING uuid INTO v_grammar1_id;

INSERT INTO grammar_translation (grammar_id, language, title, description, content) 
VALUES (
    v_grammar1_id, 
    'es', 
    'Los Cuantificadores (Avanzado)', 
    'Aprende los 30 cuantificadores en inglés, incluyendo sus compuestos, para indicar cantidades de contables e incontables.', 
    to_jsonb('## Grammar Lesson: Cuantificadores y Compuestos
Los cuantificadores se utilizan para indicar la cantidad de un sustantivo, ya sea contable o incontable. En esta lección cubrimos los 30 términos esenciales y sus compuestos.

##### 1. Much, Many, Very much, None, How much, How many
*   **Much / How much:** "Mucho/a" o "¿Cuánto?". Para incontables. (*How much time?*).
*   **Many / How many:** "Muchos/as" o "¿Cuántos?". Para contables. (*Many cars*).
*   **Very much:** "Muchísimo". Adverbio que va tras el objeto. (*I like tennis very much*).
*   **None:** "Ninguno/a". Sirve para contables como respuesta indicando cero.

##### 2. A lot of, Lots of, Too much, Too many, A little, A few, Plenty of, Enough
*   **A lot of / Lots of:** "Un montón de". Sirven para ambos tipos.
*   **Too much / Too many:** "Demasiado" (incontables) / "Demasiados" (contables).
*   **A little / A few:** "Un poco de" (incontables) / "Unos pocos" (contables).
*   **Plenty of / Enough:** "Suficientes/bastantes". *Enough* va detrás de los adjetivos y delante de los sustantivos.

##### 3. Some, Any, No, Every (Base)
*   **Some:** "Algo de". Para afirmativas u ofrecimientos.
*   **Any:** "Algo de" / "Ningún". Para negativas e interrogativas.
*   **No:** "Ningún/Nada de". Frase afirmativa pero significado negativo.
*   **Every:** "Cada/Todo".

##### 4. Los Compuestos (-thing, -body/one, -where)
*   **De Some:** *Something* (algo), *Somebody/Someone* (alguien), *Somewhere* (algún sitio).
*   **De Any:** *Anything* (algo/nada/cualquier cosa), *Anybody/Anyone* (alguien/nadie/cualquiera), *Anywhere* (algún/ningún/cualquier sitio).
*   **De No:** *Nothing* (nada), *Nobody/No one* (nadie), *Nowhere* (ningún sitio).
*   **De Every:** *Everything* (todo), *Everybody/Everyone* (todo el mundo), *Everywhere* (por todas partes).'::text)
);

-- 3. Insertar las 4 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Much, Many y Variaciones', 'Recuerda: Much/How much para incontables, Many/How many para contables, None es ninguno y Very much va al final.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'Cantidades (Lots, Too, Little, Enough)', 'A lot of vale para ambos. Too much/A little para incontables. Too many/A few para contables. Enough y Plenty of significan suficiente.');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Bases: Some, Any, No, Every', 'Some (afirmativas/ofrecimientos). Any (negativas/interrogativas). No (significado negativo sin auxiliar). Every (cada/todo).');

INSERT INTO grammar_rule (grammar_id, source_language) VALUES (v_grammar1_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_id, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'Compuestos (Thing, Body, Where)', 'Thing = Cosas (Something, Nothing). Body/One = Personas (Somebody, Nobody). Where = Lugares (Somewhere, Nowhere).');

-- 4. Bucle ultra-optimizado para insertar los 300 ejercicios
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

    -- Insertar la traducción del ejercicio con el JSON exacto de specifics
    INSERT INTO exercise_translation (exercise_id, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

END LOOP;

END $$;