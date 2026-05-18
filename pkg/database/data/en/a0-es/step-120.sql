-- ============================================================
-- Seed: A0 English Path – STEP 120 – Grammar – Expresando Posesión (Genitivo Sajón)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_grammar_id UUID; 
    v_rule1_id UUID; 
    v_rule2_id UUID; 
    v_rule3_id UUID; 
    v_rule4_id UUID; 
    v_rule5_id UUID; 
    v_ex_id UUID; 
    v_rule_id UUID;
    ex JSONB;
    exercises JSONB[] := ARRAY[
        -- ==========================================
        -- REGLA 1: Genitivo Sajón vs Of (25 Ejercicios)
        -- ==========================================
        -- Typing (6)
        '{"r":1, "p":"Traduce: El coche de Jennifer", "p_de":"Übersetze: Jennifers Auto", "s":{"type":"typing","correct_answers":["Jennifer''s car"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Traduce: La pata del gato", "p_de":"Übersetze: Das Bein der Katze", "s":{"type":"typing","correct_answers":["The cat''s leg"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Traduce: La pata de la mesa", "p_de":"Übersetze: The leg of the table", "s":{"type":"typing","correct_answers":["The leg of the table"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Traduce: Los días de la semana", "p_de":"Übersetze: The days of the week", "s":{"type":"typing","correct_answers":["The days of the week"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Traduce usando genitivo sajón: El coche de Peter", "p_de":"Übersetze mit Genitiv-s: Peters Auto", "s":{"type":"typing","correct_answers":["Peter''s car"],"case_sensitive":false}}'::jsonb,
        '{"r":1, "p":"Traduce usando of: La puerta de la casa", "p_de":"Übersetze mit of: The door of the house", "s":{"type":"typing","correct_answers":["The door of the house"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (7)
        '{"r":1, "p":"Para expresar posesión de personas y seres animados usamos:", "p_de":"Um Besitz von Personen und Lebewesen auszudrücken, verwenden wir:", "s":{"type":"multiple_choice","options":["Genitivo sajón (''s)","Of","From"],"answer":0}}'::jsonb,
        '{"r":1, "p":"Para expresar posesión de objetos y seres inanimados usamos:", "p_de":"Um Besitz von Objekten und leblosen Dingen auszudrücken, verwenden wir:", "s":{"type":"multiple_choice","options":["Of","Genitivo sajón (''s)","Whose"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se dice la pata de la mesa?", "p_de":"Wie sagt man ''das Bein des Tisches'' auf Englisch?", "s":{"type":"multiple_choice","options":["The leg of the table","The table''s leg","The table of leg"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se dice el coche de Jennifer?", "p_de":"Wie sagt man ''Jennifers Auto'' auf Englisch?", "s":{"type":"multiple_choice","options":["Jennifer''s car","The car of Jennifer","Jennifer car"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Cómo se dice los días de la semana?", "p_de":"Wie sagt man ''die Tage der Woche'' auf Englisch?", "s":{"type":"multiple_choice","options":["The days of the week","The week''s days","The days from week"],"answer":0}}'::jsonb,
        '{"r":1, "p":"El apóstrofe y la ''s'' (''s) se colocan:", "p_de":"Das Apostroph und das ''s'' (''s) wird gesetzt:", "s":{"type":"multiple_choice","options":["Al final del poseedor","Al final de la cosa poseída","Delante del verbo"],"answer":0}}'::jsonb,
        '{"r":1, "p":"¿Qué significa ''Of'' en este contexto?", "p_de":"Was bedeutet ''Of'' in diesem Kontext?", "s":{"type":"multiple_choice","options":["De (pertenencia inanimada)","De quién","Hacia"],"answer":0}}'::jsonb,
        -- True/False (6)
        '{"r":1, "p":"''The cat''s leg'' es correcto porque el gato es un ser animado.", "p_de":"''The cat''s leg'' ist korrekt, weil die Katze ein Lebewesen ist.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''The table''s leg'' es la forma más natural de decirlo en inglés.", "p_de":"''The table''s leg'' ist die natürlichste Art, es auf Englisch zu sagen.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Of'' se usa principalmente para la posesión de personas.", "p_de":"''Of'' wird hauptsächlich für den Besitz von Personen verwendet.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"El Genitivo Sajón se utiliza para expresar posesión por parte de objetos sin vida.", "p_de":"Das Genitiv-s wird verwendet, um Besitz von leblosen Objekten auszudrücken.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":1, "p":"''Jennifer''s car'' significa literalmente el coche de Jennifer.", "p_de":"''Jennifer''s car'' bedeutet wörtlich Jennifers Auto.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":1, "p":"''The leg of the table'' expresa la pertenencia de un objeto inanimado.", "p_de":"''The leg of the table'' drückt die Zugehörigkeit eines leblosen Objekts aus.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (6)
        '{"r":1, "p":"Ordena: El coche de Jennifer.", "p_de":"Ordne: Jennifers Auto.", "s":{"type":"scramble","chunks":["car", "Jennifer''s"],"correct_order":[1, 0]}}'::jsonb,
        '{"r":1, "p":"Ordena: La pata del gato.", "p_de":"Ordne: Das Bein der Katze.", "s":{"type":"scramble","chunks":["leg", "cat''s", "The"],"correct_order":[2, 1, 0]}}'::jsonb,
        '{"r":1, "p":"Ordena: La pata de la mesa.", "p_de":"Ordne: The leg of the table.", "s":{"type":"scramble","chunks":["of", "the table", "The leg"],"correct_order":[2, 0, 1]}}'::jsonb,
        '{"r":1, "p":"Ordena: Los días de la semana.", "p_de":"Ordne: The days of the week.", "s":{"type":"scramble","chunks":["of", "the week", "The days"],"correct_order":[2, 0, 1]}}'::jsonb,
        '{"r":1, "p":"Ordena: El coche del perro.", "p_de":"Ordne: Das Auto des Hundes.", "s":{"type":"scramble","chunks":["dog''s", "The", "car"],"correct_order":[1, 0, 2]}}'::jsonb,
        '{"r":1, "p":"Ordena: El techo del coche.", "p_de":"Ordne: The roof of the car.", "s":{"type":"scramble","chunks":["of", "the car", "The roof"],"correct_order":[2, 0, 1]}}'::jsonb,

        -- ==========================================
        -- REGLA 2: From (Origen) (25 Ejercicios)
        -- ==========================================
        -- Typing (6)
        '{"r":2, "p":"Traduce: Ella es de París", "p_de":"Übersetze: Sie kommt aus Paris", "s":{"type":"typing","correct_answers":["She is from Paris"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Traduce: Manzanas de Londres", "p_de":"Übersetze: Äpfel aus London", "s":{"type":"typing","correct_answers":["Apples from London"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Traduce: Yo soy de España", "p_de":"Übersetze: Ich komme aus Spanien", "s":{"type":"typing","correct_answers":["I am from Spain"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Traduce: Naranjas de Nueva York", "p_de":"Übersetze: Orangen aus New York", "s":{"type":"typing","correct_answers":["Oranges from New York"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Traduce: Él es de México", "p_de":"Übersetze: Er kommt aus Mexiko", "s":{"type":"typing","correct_answers":["He is from Mexico"],"case_sensitive":false}}'::jsonb,
        '{"r":2, "p":"Traduce: ¿Eres de aquí?", "p_de":"Übersetze: Bist du von hier?", "s":{"type":"typing","correct_answers":["Are you from here?"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (7)
        '{"r":2, "p":"¿Qué preposición expresa pertenencia de origen (ser de un lugar)?", "p_de":"Welche Präposition drückt Herkunft aus (aus einem Ort sein)?", "s":{"type":"multiple_choice","options":["From","Of","''s"],"answer":0}}'::jsonb,
        '{"r":2, "p":"''Ella es de París'' se dice:", "p_de":"''Sie kommt aus Paris'' heißt auf Englisch:", "s":{"type":"multiple_choice","options":["She is from Paris","She is of Paris","Paris''s she"],"answer":0}}'::jsonb,
        '{"r":2, "p":"''Manzanas de Londres'' se dice:", "p_de":"''Äpfel aus London'' heißt auf Englisch:", "s":{"type":"multiple_choice","options":["Apples from London","London''s apples","Apples of London"],"answer":0}}'::jsonb,
        '{"r":2, "p":"Si digo ''Apples ___ London'', la palabra correcta es:", "p_de":"Wenn ich ''Apples ___ London'' sage, ist das richtige Wort:", "s":{"type":"multiple_choice","options":["from","of","''s"],"answer":0}}'::jsonb,
        '{"r":2, "p":"''From'' se traduce como DE, pero solo para:", "p_de":"''From'' wird als ''von/aus'' übersetzt, aber nur für:", "s":{"type":"multiple_choice","options":["Expresar procedencia u origen","Posesión inanimada","Posesión de personas"],"answer":0}}'::jsonb,
        '{"r":2, "p":"''She is from Paris'' indica:", "p_de":"''She is from Paris'' drückt aus:", "s":{"type":"multiple_choice","options":["Origen","Propiedad física","Edad"],"answer":0}}'::jsonb,
        '{"r":2, "p":"¿Puedes usar ''of'' en vez de ''from'' en ''She is from Paris''?", "p_de":"Kannst du ''of'' statt ''from'' in ''She is from Paris'' verwenden?", "s":{"type":"multiple_choice","options":["No, nunca","Sí, siempre","A veces"],"answer":0}}'::jsonb,
        -- True/False (6)
        '{"r":2, "p":"''From'' se usa para expresar que una pata pertenece a una mesa.", "p_de":"''From'' wird verwendet, um auszudrücken, dass ein Tischbein zum Tisch gehört.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''She is from Paris'' es un ejemplo correcto de origen.", "p_de":"''She is from Paris'' ist ein korrektes Beispiel für Herkunft.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''Apples from London'' significa Manzanas de Londres.", "p_de":"''Apples from London'' bedeutet ''Äpfel aus London''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"''From'' se usa exactamente con la misma gramática que el Genitivo Sajón.", "p_de":"''From'' wird genauso wie das Genitiv-s verwendet.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":2, "p":"''From'' puede expresar pertenencia de origen de una persona a un lugar.", "p_de":"''From'' kann die Herkunft einer Person aus einem Ort ausdrücken.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":2, "p":"Decir ''The days from the week'' es correcto.", "p_de":"''The days from the week'' zu sagen ist korrekt.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (6)
        '{"r":2, "p":"Ordena: Ella es de París.", "p_de":"Ordne: Sie kommt aus Paris.", "s":{"type":"scramble","chunks":["is", "from", "Paris", "She"],"correct_order":[3, 0, 1, 2]}}'::jsonb,
        '{"r":2, "p":"Ordena: Manzanas de Londres.", "p_de":"Ordne: Äpfel aus London.", "s":{"type":"scramble","chunks":["from", "Apples", "London"],"correct_order":[1, 0, 2]}}'::jsonb,
        '{"r":2, "p":"Ordena: Él es de Madrid.", "p_de":"Ordne: Er kommt aus Madrid.", "s":{"type":"scramble","chunks":["He", "Madrid", "from", "is"],"correct_order":[0, 3, 2, 1]}}'::jsonb,
        '{"r":2, "p":"Ordena: Somos de Italia.", "p_de":"Ordne: Wir kommen aus Italien.", "s":{"type":"scramble","chunks":["We", "from", "Italy", "are"],"correct_order":[0, 3, 1, 2]}}'::jsonb,
        '{"r":2, "p":"Ordena: ¿De dónde eres?", "p_de":"Ordne: Woher kommst du?", "s":{"type":"scramble","chunks":["you", "are", "from?", "Where"],"correct_order":[3, 1, 0, 2]}}'::jsonb,
        '{"r":2, "p":"Ordena: Coches de Alemania.", "p_de":"Ordne: Autos aus Deutschland.", "s":{"type":"scramble","chunks":["Cars", "Germany", "from"],"correct_order":[0, 2, 1]}}'::jsonb,

        -- ==========================================
        -- REGLA 3: Whose (¿De quién?) (25 Ejercicios)
        -- ==========================================
        -- Typing (6)
        '{"r":3, "p":"Traduce: ¿De quién es este abrigo?", "p_de":"Übersetze: Wessen Mantel ist das?", "s":{"type":"typing","correct_answers":["Whose coat is it?"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Traduce: ¿De quiénes son ellos hijos?", "p_de":"Übersetze: Wessen Kinder sind das?", "s":{"type":"typing","correct_answers":["Whose children are they?"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Traduce: ¿De quién es el coche?", "p_de":"Übersetze: Wessen Auto ist das?", "s":{"type":"typing","correct_answers":["Whose car is it?"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Traduce: ¿De quién es el perro?", "p_de":"Übersetze: Wessen Hund ist das?", "s":{"type":"typing","correct_answers":["Whose dog is it?"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Traduce: ¿De quién es este libro?", "p_de":"Übersetze: Wessen Buch ist das?", "s":{"type":"typing","correct_answers":["Whose book is this?"],"case_sensitive":false}}'::jsonb,
        '{"r":3, "p":"Traduce: ¿De quién es el gato?", "p_de":"Übersetze: Wessen Katze ist das?", "s":{"type":"typing","correct_answers":["Whose cat is it?"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (7)
        '{"r":3, "p":"¿Qué significa ''Whose''?", "p_de":"Was bedeutet ''Whose''?", "s":{"type":"multiple_choice","options":["De quién / De quiénes","Dónde","Cuándo"],"answer":0}}'::jsonb,
        '{"r":3, "p":"''Whose coat is it?'' significa:", "p_de":"''Whose coat is it?'' bedeutet:", "s":{"type":"multiple_choice","options":["¿De quién es este abrigo?","¿Dónde está el abrigo?","¿Qué abrigo es?"],"answer":0}}'::jsonb,
        '{"r":3, "p":"Para preguntar por la pertenencia de algo se usa:", "p_de":"Um nach dem Besitzer von etwas zu fragen, verwendet man:", "s":{"type":"multiple_choice","options":["Whose","Who","How"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ children are they?", "p_de":"___ children are they?", "s":{"type":"multiple_choice","options":["Whose","Who","Which"],"answer":0}}'::jsonb,
        '{"r":3, "p":"___ coat is it?", "p_de":"___ coat is it?", "s":{"type":"multiple_choice","options":["Whose","Who''s","Who"],"answer":0}}'::jsonb,
        '{"r":3, "p":"''Whose'' se utiliza para preguntar por:", "p_de":"''Whose'' wird verwendet, um zu fragen nach:", "s":{"type":"multiple_choice","options":["El poseedor o dueño de algo","El lugar donde está algo","El precio de un objeto"],"answer":0}}'::jsonb,
        '{"r":3, "p":"¿Cuál es la estructura correcta para preguntar?", "p_de":"Was ist die richtige Struktur für eine Frage?", "s":{"type":"multiple_choice","options":["Whose + objeto + verbo auxiliar","Verbo auxiliar + whose + objeto","Objeto + whose + verbo"],"answer":0}}'::jsonb,
        -- True/False (6)
        '{"r":3, "p":"''Whose'' significa ¿De quién? o ¿De quiénes?.", "p_de":"''Whose'' bedeutet ''Wessen?'' oder ''Von wem?''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Whose coat is it?'' se usa para preguntar el precio del abrigo.", "p_de":"''Whose coat is it?'' wird verwendet, um den Preis des Mantels zu fragen.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Whose children are they?'' pregunta por los padres (de quién son esos niños).", "p_de":"''Whose children are they?'' fragt nach den Eltern (wessen Kinder das sind).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Who'' y ''Whose'' significan exactamente lo mismo.", "p_de":"''Who'' und ''Whose'' bedeuten genau dasselbe.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":3, "p":"''Whose'' se coloca normalmente al principio de la pregunta de posesión.", "p_de":"''Whose'' steht normalerweise am Anfang einer Besitzfrage.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":3, "p":"''Whose'' se usa para afirmar algo, nunca para hacer preguntas.", "p_de":"''Whose'' wird verwendet, um etwas zu behaupten, nie für Fragen.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (6)
        '{"r":3, "p":"Ordena: ¿De quién es este abrigo?", "p_de":"Ordne: Wessen Mantel ist das?", "s":{"type":"scramble","chunks":["coat", "is it?", "Whose"],"correct_order":[2, 0, 1]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quiénes son ellos hijos?", "p_de":"Ordne: Wessen Kinder sind das?", "s":{"type":"scramble","chunks":["are they?", "Whose", "children"],"correct_order":[1, 2, 0]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién es el gato?", "p_de":"Ordne: Wessen Katze ist das?", "s":{"type":"scramble","chunks":["is it?", "cat", "Whose"],"correct_order":[2, 1, 0]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién es el coche?", "p_de":"Ordne: Wessen Auto ist das?", "s":{"type":"scramble","chunks":["is it?", "car", "Whose"],"correct_order":[2, 1, 0]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién es la casa?", "p_de":"Ordne: Wessen Haus ist das?", "s":{"type":"scramble","chunks":["Whose", "is it?", "house"],"correct_order":[0, 2, 1]}}'::jsonb,
        '{"r":3, "p":"Ordena: ¿De quién es el teléfono?", "p_de":"Ordne: Wessen Telefon ist das?", "s":{"type":"scramble","chunks":["is it?", "phone", "Whose"],"correct_order":[2, 1, 0]}}'::jsonb,

        -- ==========================================
        -- REGLA 4: To Have (Verbo Tener - US Style) (25 Ejercicios)
        -- ==========================================
        -- Typing (6)
        '{"r":4, "p":"Traduce: Yo tengo un coche", "p_de":"Übersetze: Ich habe ein Auto", "s":{"type":"typing","correct_answers":["I have a car"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Traduce: Ella tiene un perro", "p_de":"Übersetze: Sie hat einen Hund", "s":{"type":"typing","correct_answers":["She has a dog"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Traduce: Él no tiene un gato", "p_de":"Übersetze: Er hat keine Katze", "s":{"type":"typing","correct_answers":["He doesn''t have a cat","He does not have a cat"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Traduce: Nosotros no tenemos tiempo", "p_de":"Übersetze: Wir haben keine Zeit", "s":{"type":"typing","correct_answers":["We don''t have time","We do not have time"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Traduce: ¿Tienes un coche?", "p_de":"Übersetze: Hast du ein Auto?", "s":{"type":"typing","correct_answers":["Do you have a car?"],"case_sensitive":false}}'::jsonb,
        '{"r":4, "p":"Traduce: ¿Tiene ella un hermano?", "p_de":"Übersetze: Hat sie einen Bruder?", "s":{"type":"typing","correct_answers":["Does she have a brother?"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (7)
        '{"r":4, "p":"Para indicar posesión con el verbo tener en inglés usamos:", "p_de":"Um Besitz mit dem Verb ''haben'' auf Englisch auszudrücken, verwenden wir:", "s":{"type":"multiple_choice","options":["To have","To be","To do"],"answer":0}}'::jsonb,
        '{"r":4, "p":"''Ella tiene una casa'' se dice:", "p_de":"''Sie hat ein Haus'' heißt auf Englisch:", "s":{"type":"multiple_choice","options":["She has a house","She have a house","She haves a house"],"answer":0}}'::jsonb,
        '{"r":4, "p":"Para hacer una pregunta con ''have'' en presente (US), usamos el auxiliar:", "p_de":"Um eine Frage mit ''have'' im Präsens (US) zu stellen, verwenden wir das Hilfsverb:", "s":{"type":"multiple_choice","options":["Do / Does","Are / Is","Ninguno"],"answer":0}}'::jsonb,
        '{"r":4, "p":"''Él no tiene dinero'' se dice:", "p_de":"''Er hat kein Geld'' heißt auf Englisch:", "s":{"type":"multiple_choice","options":["He doesn''t have money","He don''t have money","He hasn''t money"],"answer":0}}'::jsonb,
        '{"r":4, "p":"We ___ a big family.", "p_de":"We ___ a big family.", "s":{"type":"multiple_choice","options":["have","has","having"],"answer":0}}'::jsonb,
        '{"r":4, "p":"___ they have a pet?", "p_de":"___ they have a pet?", "s":{"type":"multiple_choice","options":["Do","Are","Does"],"answer":0}}'::jsonb,
        '{"r":4, "p":"¿Cuál es incorrecta gramaticalmente?", "p_de":"Welche ist grammatisch falsch?", "s":{"type":"multiple_choice","options":["She doesn''t has time","She doesn''t have time","I don''t have time"],"answer":0}}'::jsonb,
        -- True/False (6)
        '{"r":4, "p":"Se necesita el auxiliar ''DO'' o ''DOES'' para hacer preguntas con el verbo ''have'' en presente.", "p_de":"Man braucht das Hilfsverb ''DO'' oder ''DOES'' für Fragen mit dem Verb ''have'' im Präsens.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''I haven''t a car'' es la forma más común y natural en Estados Unidos para decir que no tienes coche.", "p_de":"''I haven''t a car'' ist die gebräuchlichste Art in den USA zu sagen, dass man kein Auto hat.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"Para la tercera persona del singular (he, she, it) usamos ''has''.", "p_de":"Für die dritte Person Singular (he, she, it) verwenden wir ''has''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"Es correcto decir ''Does she has a car?''.", "p_de":"Es ist korrekt zu sagen ''Does she has a car?''.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":4, "p":"''I don''t have a dog'' significa ''No tengo un perro''.", "p_de":"''I don''t have a dog'' bedeutet ''Ich habe keinen Hund''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":4, "p":"''Have you a house?'' es la estructura correcta para preguntar en Estados Unidos.", "p_de":"''Have you a house?'' ist die richtige Fragestruktur in den USA.", "s":{"type":"true_false","answer":false}}'::jsonb,
        -- Scramble (6)
        '{"r":4, "p":"Ordena: ¿Tienes un coche?", "p_de":"Ordne: Hast du ein Auto?", "s":{"type":"scramble","chunks":["have", "a car?", "you", "Do"],"correct_order":[3, 2, 0, 1]}}'::jsonb,
        '{"r":4, "p":"Ordena: Yo tengo un perro.", "p_de":"Ordne: Ich habe einen Hund.", "s":{"type":"scramble","chunks":["have", "I", "a dog"],"correct_order":[1, 0, 2]}}'::jsonb,
        '{"r":4, "p":"Ordena: Ella tiene una casa.", "p_de":"Ordne: Sie hat ein Haus.", "s":{"type":"scramble","chunks":["has", "She", "a house"],"correct_order":[1, 0, 2]}}'::jsonb,
        '{"r":4, "p":"Ordena: No tengo tiempo.", "p_de":"Ordne: Ich habe keine Zeit.", "s":{"type":"scramble","chunks":["don''t", "time", "have", "I"],"correct_order":[3, 0, 2, 1]}}'::jsonb,
        '{"r":4, "p":"Ordena: Él no tiene dinero.", "p_de":"Ordne: Er hat kein Geld.", "s":{"type":"scramble","chunks":["doesn''t", "money", "He", "have"],"correct_order":[2, 0, 3, 1]}}'::jsonb,
        '{"r":4, "p":"Ordena: ¿Tienen ellos hijos?", "p_de":"Ordne: Haben sie Kinder?", "s":{"type":"scramble","chunks":["children?", "have", "they", "Do"],"correct_order":[3, 2, 1, 0]}}'::jsonb,

        -- ==========================================
        -- REGLA 5: Genitivo Sajón Plural (s')
        -- ==========================================
        -- Typing (5)
        '{"r":5, "p":"Traduce: Los huesos de los perros", "p_de":"Übersetze: Die Knochen der Hunde", "s":{"type":"typing","correct_answers":["The dogs'' bones"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"Traduce: La sala de los profesores", "p_de":"Übersetze: Das Lehrerzimmer", "s":{"type":"typing","correct_answers":["The teachers'' room"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"Traduce: Las chaquetas de las chicas", "p_de":"Übersetze: Die Jacken der Mädchen", "s":{"type":"typing","correct_answers":["The girls'' jackets"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"Traduce: Los juguetes de los ninos (boys)", "p_de":"Übersetze: Das Spielzeug der Jungen", "s":{"type":"typing","correct_answers":["The boys'' toys"],"case_sensitive":false}}'::jsonb,
        '{"r":5, "p":"Traduce: El vestuario de los jugadores", "p_de":"Übersetze: Der Umkleideraum der Spieler", "s":{"type":"typing","correct_answers":["The players'' locker room"],"case_sensitive":false}}'::jsonb,
        -- Multiple Choice (5)
        '{"r":5, "p":"Como se dice los huesos de los perros?", "p_de":"Wie sagt man ''die Knochen der Hunde'' auf Englisch?", "s":{"type":"multiple_choice","options":["The dogs'' bones","The dogs''s bones","The dog''s bones"],"answer":0}}'::jsonb,
        '{"r":5, "p":"Cuando el poseedor es un sustantivo plural que ya acaba en ''s'', el genitivo sajon se forma:", "p_de":"Wenn der Besitzer ein Substantiv im Plural ist, das bereits auf ''s'' endet, wird das Genitiv-s gebildet durch:", "s":{"type":"multiple_choice","options":["Solo anadiendo apostrofe (s'')","Anadiendo '' + s (''s)","Sin cambio ninguno"],"answer":0}}'::jsonb,
        '{"r":5, "p":"Cual es correcta?", "p_de":"Welche ist richtig?", "s":{"type":"multiple_choice","options":["The teachers'' room","The teacher''s room","The teachers''s room"],"answer":0}}'::jsonb,
        '{"r":5, "p":"The girls'' coats significa:", "p_de":"Was bedeutet ''The girls'' coats''?", "s":{"type":"multiple_choice","options":["Los abrigos de las chicas","El abrigo de la chica","Las chicas de los abrigos"],"answer":0}}'::jsonb,
        '{"r":5, "p":"My parents'' house significa:", "p_de":"Was bedeutet ''My parents'' house''?", "s":{"type":"multiple_choice","options":["La casa de mis padres","La casa de mi padre","Mi casa de los padres"],"answer":0}}'::jsonb,
        -- True/False (5)
        '{"r":5, "p":"Cuando el sustantivo es plural y acaba en ''s'', anadimos solo el apostrofe: dogs''.", "p_de":"Wenn das Substantiv im Plural steht und auf ''s'' endet, fügen wir nur den Apostroph hinzu: dogs''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":5, "p":"The boys''s room es la forma correcta del genitivo sajon plural.", "p_de":"''The boys''s room'' ist die korrekte Form des Plural-Genitiv-s.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":5, "p":"The teachers'' books indica que varios profesores poseen los libros.", "p_de":"''The teachers'' books'' zeigt an, dass mehrere Lehrer die Bücher besitzen.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"r":5, "p":"Para el plural, el genitivo sajon se forma igual que para el singular (anadiendo ''s).", "p_de":"Für den Plural wird das Genitiv-s genauso wie für den Singular gebildet (durch Hinzufügen von ''s).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"r":5, "p":"My parents'' car es la forma correcta de decir el coche de mis padres.", "p_de":"''My parents'' car'' ist die korrekte Art zu sagen ''das Auto meiner Eltern''.", "s":{"type":"true_false","answer":true}}'::jsonb,
        -- Scramble (5)
        '{"r":5, "p":"Ordena: Los libros de los estudiantes.", "p_de":"Ordne: Die Bücher der Schüler.", "s":{"type":"scramble","chunks":["books","students''","The"],"correct_order":[2,1,0]}}'::jsonb,
        '{"r":5, "p":"Ordena: La sala de los profesores.", "p_de":"Ordne: Das Lehrerzimmer.", "s":{"type":"scramble","chunks":["teachers''","room","The"],"correct_order":[2,0,1]}}'::jsonb,
        '{"r":5, "p":"Ordena: Los juguetes de los ninos.", "p_de":"Ordne: Das Spielzeug der Jungen.", "s":{"type":"scramble","chunks":["toys","The","boys''"],"correct_order":[1,2,0]}}'::jsonb,
        '{"r":5, "p":"Ordena: Los abrigos de las chicas.", "p_de":"Ordne: Die Mäntel der Mädchen.", "s":{"type":"scramble","chunks":["The","coats","girls''"],"correct_order":[0,2,1]}}'::jsonb,
        '{"r":5, "p":"Ordena: La casa de mis padres.", "p_de":"Ordne: Das Haus meiner Eltern.", "s":{"type":"scramble","chunks":["house","parents''","My"],"correct_order":[2,1,0]}}'::jsonb
    ];

BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar Grammar Principal en el Step 6
INSERT INTO grammar (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 120, 'en', 'grammar') 
RETURNING uuid INTO v_grammar_id;

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar_id, 
    'es', 
    'Expresando Posesión', 
    '', 
    to_jsonb('## Expresando Posesión
En inglés existen diferentes formas de expresar que algo pertenece a alguien o a algo. La elección depende de si el poseedor es una persona, un lugar o un objeto inanimado.

##### 1. El Genitivo Sajón (''s)
Se utiliza para expresar posesión por parte de personas, animales o seres animados. Se añade un apóstrofo y una ''s'' al poseedor.
*   *Jennifer''s car* (El coche de Jennifer).
*   *The cat''s leg* (La pata del gato).

##### 2. Of (Para objetos inanimados)
Significa "DE" y se utiliza para expresar posesión o pertenencia de objetos o seres inanimados.
*   *The leg of the table* (La pata de la mesa).
*   *The days of the week* (Los días de la semana).

##### 3. From (Origen)
Se traduce como "DE", pero solo se usa para expresar origen o procedencia de una persona o cosa (no propiedad).
*   *She is from Paris* (Ella es de París).
*   *Apples from London* (Manzanas de Londres).

##### 4. Whose (¿De quién?)
Significa "DE QUIÉN" o "DE QUIÉNES", y se emplea para preguntar por la pertenencia de algo. Se coloca al inicio de la pregunta.
*   *Whose coat is it?* (¿De quién es el abrigo?).
*   *Whose children are they?* (¿De quiénes son ellos hijos?).

##### 5. To Have (El verbo Tener)
Significa "TENER" e indica posesión en general. En inglés actúa como un verbo normal y necesita los verbos auxiliares DO / DOES para su forma negativa e interrogativa en presente.
*   *I have a car.* (Tengo un coche).
*   *She has a dog.* (Ella tiene un perro).
*   *I don''t have a car.* (No tengo un coche).
*   *He doesn''t have money.* (Él no tiene dinero).
*   *Do you have a car?* (¿Tienes un coche?).

##### 6. Genitivo Sajón Plural (s'')
Cuando el **poseedor es plural** y ya termina en "s", solo añadimos el apóstrofe sin "s" adicional.
*   *The dogs'' bones* (Los huesos de los perros).
*   *The teachers'' room* (La sala de los profesores).
*   *My parents'' house* (La casa de mis padres).
*   ⚠️ No confundir: *the dog''s bone* (singular) vs *the dogs'' bones* (plural).'::text)
);

INSERT INTO grammar_translation (grammar_uuid, language, title, description, content) 
VALUES (
    v_grammar_id, 
    'de', 
    'Besitz ausdrücken', 
    '', 
    to_jsonb('## Besitz ausdrücken
Im Englischen gibt es verschiedene Wege, auszudrücken, dass etwas jemandem oder etwas gehört. Die Wahl hängt davon ab, ob der Besitzer eine Person, ein Ort oder ein lebloses Objekt ist.

##### 1. Der Genitiv-s (''s)
Wird verwendet, um Besitz von Personen, Tieren oder Lebewesen auszudrücken. Man fügt dem Besitzer einen Apostroph und ein s hinzu.
*   *Jennifer''s car* (Jennifers Auto).
*   *The cat''s leg* (Das Bein der Katze).

##### 2. Of (Für leblose Objekte)
Bedeutet "von" und wird für Besitz oder Zugehörigkeit von Objekten oder leblosen Dingen verwendet.
*   *The leg of the table* (Das Tischbein).
*   *The days of the week* (Die Tage der Woche).

##### 3. From (Herkunft)
Bedeutet "aus/von", aber nur für Herkunft oder Abstammung einer Person oder Sache (nicht für Eigentum).
*   *She is from Paris* (Sie kommt aus Paris).
*   *Apples from London* (Äpfel aus London).

##### 4. Whose (Wessen?)
Bedeutet "wessen" und wird verwendet, um nach dem Besitzer von etwas zu fragen. Steht am Satzanfang.
*   *Whose coat is it?* (Wessen Mantel ist das?).
*   *Whose children are they?* (Wessen Kinder sind das?).

##### 5. To Have (Das Verb Haben)
Bedeutet "haben" und drückt allgemeinen Besitz aus. Im Englischen braucht es die Hilfsverben DO / DOES für Verneinung und Fragen im Präsens.
*   *I have a car.* (Ich habe ein Auto).
*   *She has a dog.* (Sie hat einen Hund).
*   *I don''t have a car.* (Ich habe kein Auto).
*   *He doesn''t have money.* (Er hat kein Geld).
*   *Do you have a car?* (Hast du ein Auto?).

##### 6. Genitiv-s im Plural (s'')
Wenn der **Besitzer im Plural** ist und bereits auf "s" endet, fügt man nur den Apostroph ohne zusätzliches s hinzu.
*   *The dogs'' bones* (Die Knochen der Hunde).
*   *The teachers'' room* (Das Lehrerzimmer).
*   *My parents'' house* (Das Haus meiner Eltern).
*   ⚠️ Nicht verwechseln: *the dog''s bone* (Singular) vs *the dogs'' bones* (Plural).'::text)
);


-- 3. Insertar las 5 Reglas Gramaticales
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule1_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'es', 'Genitivo Sajón (''s) vs Of', 'Usa el apóstrofo (''s) para personas y animales (Jennifer''s car). Usa "of" para inanimados (leg of the table).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule1_id, 'de', 'Genitiv-s (''s) vs Of', 'Verwende den Apostroph (''s) für Personen und Tiere (Jennifer''s car). Verwende "of" für Unbelebtes (leg of the table).');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule2_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'es', 'From (Origen)', '"From" significa DE, pero solo se usa para el lugar de origen o procedencia, no para propiedad (ej. She is from Paris).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule2_id, 'de', 'From (Herkunft)', '"From" bedeutet VON/AUS, aber nur für Herkunft, nicht für Eigentum (z.B. She is from Paris).');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule3_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'es', 'Whose (Preguntando Posesión)', 'Usa "Whose" al principio de la pregunta para saber de quién o de quiénes es algo (ej. Whose coat is it?).');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule3_id, 'de', 'Whose (Nach dem Besitzer fragen)', 'Verwende "Whose" am Satzanfang, um zu fragen wem etwas gehört (z.B. Whose coat is it?).');

INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule4_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'es', 'To Have (El verbo Tener)', 'Para posesión, usa "have" (o "has" para he/she/it). En negativa e interrogativa necesitas el auxiliar do/does (ej. "Do you have?", "I don''t have").');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule4_id, 'de', 'To Have (Das Verb Haben)', 'Für Besitz verwende "have" (bzw. "has" für he/she/it). In Verneinung und Fragen brauchst du do/does (z.B. "Do you have?", "I don''t have").');
INSERT INTO grammar_rule (grammar_uuid, source_language) VALUES (v_grammar_id, 'en') RETURNING uuid INTO v_rule5_id; 
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'es', 'Genitivo Sajón Plural (s'')', 'Cuando el poseedor es plural y ya termina en "s", añade solo el apóstrofe: dogs'' bones, teachers'' room. No uses ''s para plurales que ya terminan en s.');
INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback) 
VALUES (v_rule5_id, 'de', 'Genitiv-s im Plural (s'')', 'Wenn der Besitzer im Plural steht und bereits auf "s" endet, füge nur den Apostroph hinzu: dogs'' bones, teachers'' room. Kein ''s für Plurale, die bereits auf s enden.');
-- 4. Bucle para insertar los 120 ejercicios
FOREACH ex IN ARRAY exercises
LOOP
    -- Determinar el ID de la regla correcta
    IF (ex->>'r')::int = 1 THEN v_rule_id := v_rule1_id;
    ELSIF (ex->>'r')::int = 2 THEN v_rule_id := v_rule2_id;
    ELSIF (ex->>'r')::int = 3 THEN v_rule_id := v_rule3_id;
    ELSIF (ex->>'r')::int = 4 THEN v_rule_id := v_rule4_id;
    ELSE v_rule_id := v_rule5_id;
    END IF;

    -- Insertar el ejercicio base
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) 
    VALUES (v_grammar_id, v_rule_id) 
    RETURNING uuid INTO v_ex_id;

    -- Insertar la traducción del ejercicio
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');

END LOOP;

END;
$seed$;
