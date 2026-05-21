-- ============================================================
-- Seed: A0 English Path – STEP 1090 – Grammar – Preposiciones (In, On, At para tiempo y lugar)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_grammar_id UUID;
    v_current_rule_id UUID;
    v_ex_id UUID;
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise
    WHERE target_uuid IN (SELECT uuid FROM grammar WHERE step_order = 1090 AND path_uuid = v_path_id)
       OR grammar_rule_uuid IN (
            SELECT gr.uuid
            FROM grammar_rule gr
            JOIN grammar g ON g.uuid = gr.grammar_uuid
            WHERE g.step_order = 1090 AND g.path_uuid = v_path_id
       );
    DELETE FROM grammar WHERE step_order = 1090 AND path_uuid = v_path_id;

    INSERT INTO grammar (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1090, 'en', 'grammar')
    RETURNING uuid INTO v_grammar_id;

    INSERT INTO grammar_translation (grammar_uuid, language, title, content)
    VALUES
        (
    v_grammar_id,
    'es',
    'Preposiciones',
    to_jsonb($content_es$
## Preposiciones básicas: in, on, at

Las preposiciones **in**, **on** y **at** ayudan a decir **dónde** está algo y **cuándo** pasa algo.

### 1. IN para espacios cerrados
Usa **in** cuando algo está **dentro** de un espacio con límites.

- in a room
- in a building
- in a city
- in a country
- in a box

**Idea clave:** piensa en algo que está rodeado por paredes, límites o fronteras.

### 2. ON para superficies y transporte
Usa **on** cuando algo está **sobre una superficie** o cuando vas en ciertos medios de transporte.

- on the table
- on the wall
- on the floor
- on the bus
- on the train
- on the street

**Idea clave:** piensa en contacto con una superficie o en transporte público grande.

### 3. AT para puntos concretos
Usa **at** para un **punto exacto** o un lugar visto como punto.

- at the door
- at school
- at work
- at home
- at the bus stop
- at the entrance

**Idea clave:** no piensas en el interior completo, sino en el punto donde alguien está.

### 4. Tiempo: in, on, at
Para el tiempo, cada preposición tiene su grupo.

- **in** the morning / in July / in 2025
- **on** Monday / on Friday / on 12 May
- **at** 3 o''clock / at 9 AM / at night

### Error común
No digas *on Madrid* o *in Monday*. Revisa si hablas de un espacio, una superficie, un punto o un momento concreto.

### Truco rápido
- **in** = dentro / períodos amplios
- **on** = sobre / días
- **at** = punto exacto / hora exacta
$content_es$::text)
),
(
    v_grammar_id,
    'de',
    'Präpositionen',
    to_jsonb($content_de$
## Grundpräpositionen: in, on, at

Die Präpositionen **in**, **on** und **at** helfen dir zu sagen, **wo** etwas ist und **wann** etwas passiert.

### 1. IN für geschlossene Räume
Benutze **in**, wenn etwas **in einem begrenzten Raum** ist.

- in a room
- in a building
- in a city
- in a country
- in a box

**Kernidee:** Denk an etwas, das von Wänden, Grenzen oder einem Rahmen umgeben ist.

### 2. ON für Flächen und Verkehrsmittel
Benutze **on**, wenn etwas **auf einer Fläche** liegt oder wenn du mit bestimmten Verkehrsmitteln fährst.

- on the table
- on the wall
- on the floor
- on the bus
- on the train
- on the street

**Kernidee:** Kontakt mit einer Fläche oder Fahrt mit einem größeren Verkehrsmittel.

### 3. AT für genaue Punkte
Benutze **at** für einen **genauen Punkt** oder einen Ort, der als Punkt gesehen wird.

- at the door
- at school
- at work
- at home
- at the bus stop
- at the entrance

**Kernidee:** Du denkst nicht an das ganze Innere, sondern an den genauen Ortspunkt.

### 4. Zeit: in, on, at
Für Zeit hat jede Präposition ihre eigene Gruppe.

- **in** the morning / in July / in 2025
- **on** Monday / on Friday / on 12 May
- **at** 3 o''clock / at 9 AM / at night

### Häufiger Fehler
Sag nicht *on Madrid* oder *in Monday*. Prüfe, ob du über einen Raum, eine Fläche, einen Punkt oder einen genauen Zeitpunkt sprichst.

### Schneller Trick
- **in** = innen / größere Zeiträume
- **on** = auf / Tage
- **at** = genauer Punkt / genaue Uhrzeit
$content_de$::text)
);

    INSERT INTO grammar_rule (grammar_uuid, source_language)
    VALUES (v_grammar_id, 'en')
    RETURNING uuid INTO v_current_rule_id;

    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'IN para espacios cerrados', 'Usa in para habitaciones, edificios, ciudades, países o cajas: algo está dentro de un espacio.'),
        (v_current_rule_id, 'de', 'IN für geschlossene Räume', 'Benutze in für Zimmer, Gebäude, Städte, Länder oder Boxen: Etwas ist in einem Raum.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is ___ the room.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She is ___ the room.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They live ___ Madrid.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'They live ___ Madrid.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The keys are ___ the bag.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The keys are ___ the bag.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We are ___ the classroom.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We are ___ the classroom.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He is ___ Spain.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'He is ___ Spain.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The milk is ___ the fridge.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The milk is ___ the fridge.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'My friend is ___ the library.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'My friend is ___ the library.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The books are ___ the box.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The books are ___ the box.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We study ___ a building near the park.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We study ___ a building near the park.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She works ___ London.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'She works ___ London.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The students are ___ the room.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The students are ___ the room.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The toy is ___ the basket.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The toy is ___ the basket.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'My grandparents live ___ Portugal.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'My grandparents live ___ Portugal.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The cat is ___ the house.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The cat is ___ the house.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“We say: in a city.” es correcto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„We say: in a city.“ ist richtig.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“We say: on a room.” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„We say: on a room.“ ist richtig.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“In the box” habla de algo dentro de una caja.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„In the box“ bedeutet, dass etwas in einer Kiste ist.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At Spain” es la forma normal para un país.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„At Spain“ ist die normale Form für ein Land.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“In the classroom” es una expresión correcta.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„In the classroom“ ist ein korrekter Ausdruck.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“On the fridge” significa dentro del frigorífico.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„On the fridge“ bedeutet im Kühlschrank.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Para ciudades y países, in suele ser la opción correcta.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'Für Städte und Länder ist in oft die richtige Wahl.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I am in the kitchen.', '{"type": "scramble", "chunks": ["I", "am", "in", "the", "kitchen"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'I am in the kitchen.', '{"type": "scramble", "chunks": ["I", "am", "in", "the", "kitchen"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is in the office.', '{"type": "scramble", "chunks": ["She", "is", "in", "the", "office"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'She is in the office.', '{"type": "scramble", "chunks": ["She", "is", "in", "the", "office"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Shoes are in the box.', '{"type": "scramble", "chunks": ["Shoes", "are", "in", "the", "box"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Shoes are in the box.', '{"type": "scramble", "chunks": ["Shoes", "are", "in", "the", "box"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We live in a city.', '{"type": "scramble", "chunks": ["We", "live", "in", "a", "city"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'We live in a city.', '{"type": "scramble", "chunks": ["We", "live", "in", "a", "city"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He is in the lift.', '{"type": "scramble", "chunks": ["He", "is", "in", "the", "lift"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'He is in the lift.', '{"type": "scramble", "chunks": ["He", "is", "in", "the", "lift"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They are in the library.', '{"type": "scramble", "chunks": ["They", "are", "in", "the", "library"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'They are in the library.', '{"type": "scramble", "chunks": ["They", "are", "in", "the", "library"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Keys are in my bag.', '{"type": "scramble", "chunks": ["Keys", "are", "in", "my", "bag"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Keys are in my bag.', '{"type": "scramble", "chunks": ["Keys", "are", "in", "my", "bag"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO grammar_rule (grammar_uuid, source_language)
    VALUES (v_grammar_id, 'en')
    RETURNING uuid INTO v_current_rule_id;

    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'ON para superficies y transporte', 'Usa on para una superficie o para ciertos transportes como bus, train o plane.'),
        (v_current_rule_id, 'de', 'ON für Flächen und Verkehrsmittel', 'Benutze on für eine Oberfläche oder für Verkehrsmittel wie bus, train oder plane.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The cup is ___ the table.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The cup is ___ the table.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is ___ the bus.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She is ___ the bus.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'My coat is ___ the chair.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'My coat is ___ the chair.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The picture is ___ the wall.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The picture is ___ the wall.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We are ___ the train.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We are ___ the train.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The book is ___ the shelf.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The book is ___ the shelf.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He walks ___ the street.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'He walks ___ the street.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The bag is ___ the floor.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The bag is ___ the floor.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We are ___ the plane now.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We are ___ the plane now.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The photo is ___ the wall.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The photo is ___ the wall.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'My notebook is ___ the desk.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'My notebook is ___ the desk.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The children are ___ the bus.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The children are ___ the bus.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'There is a mark ___ the page.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'There is a mark ___ the page.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The restaurant is ___ this street.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The restaurant is ___ this street.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“On the table” es correcto para una superficie.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„On the table“ ist für eine Oberfläche richtig.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“In the bus” es la opción normal en este nivel básico.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„In the bus“ ist auf diesem Grundniveau die normale Option.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“On the wall” es una expresión común.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„On the wall“ ist ein üblicher Ausdruck.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At the shelf” significa encima de la estantería.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„At the shelf“ bedeutet oben auf dem Regal.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“On the train” es correcto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„On the train“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“In the street” y “on the street” tienen exactamente el mismo uso básico aquí.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„In the street“ und „on the street“ haben hier genau denselben Grundgebrauch.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'On puede hablar de transporte y de superficies.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', 'On kann für Verkehrsmittel und Flächen benutzt werden.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Cup is on the table.', '{"type": "scramble", "chunks": ["Cup", "is", "on", "the", "table"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Cup is on the table.', '{"type": "scramble", "chunks": ["Cup", "is", "on", "the", "table"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is on the bus.', '{"type": "scramble", "chunks": ["She", "is", "on", "the", "bus"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'She is on the bus.', '{"type": "scramble", "chunks": ["She", "is", "on", "the", "bus"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Keys are on the desk.', '{"type": "scramble", "chunks": ["Keys", "are", "on", "the", "desk"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Keys are on the desk.', '{"type": "scramble", "chunks": ["Keys", "are", "on", "the", "desk"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Map is on the wall.', '{"type": "scramble", "chunks": ["Map", "is", "on", "the", "wall"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Map is on the wall.', '{"type": "scramble", "chunks": ["Map", "is", "on", "the", "wall"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We are on the train.', '{"type": "scramble", "chunks": ["We", "are", "on", "the", "train"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'We are on the train.', '{"type": "scramble", "chunks": ["We", "are", "on", "the", "train"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Phone is on the chair.', '{"type": "scramble", "chunks": ["Phone", "is", "on", "the", "chair"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Phone is on the chair.', '{"type": "scramble", "chunks": ["Phone", "is", "on", "the", "chair"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They live on Green Street.', '{"type": "scramble", "chunks": ["They", "live", "on", "Green", "Street"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'They live on Green Street.', '{"type": "scramble", "chunks": ["They", "live", "on", "Green", "Street"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO grammar_rule (grammar_uuid, source_language)
    VALUES (v_grammar_id, 'en')
    RETURNING uuid INTO v_current_rule_id;

    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'AT para puntos concretos', 'Usa at cuando el lugar se ve como un punto: at the door, at school, at work, at home.'),
        (v_current_rule_id, 'de', 'AT für genaue Punkte', 'Benutze at, wenn der Ort als Punkt gesehen wird: at the door, at school, at work, at home.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I am ___ the door.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'I am ___ the door.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is ___ school.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She is ___ school.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He is ___ work.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'He is ___ work.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We are ___ home.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We are ___ home.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Meet me ___ the bus stop.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'Meet me ___ the bus stop.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The teacher is ___ the front desk.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The teacher is ___ the front desk.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They are ___ the entrance.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'They are ___ the entrance.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is waiting ___ the door.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'She is waiting ___ the door.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'My brother is ___ home now.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'My brother is ___ home now.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We are ___ school today.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We are ___ school today.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The taxi is ___ the station entrance.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The taxi is ___ the station entrance.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Dad is ___ work.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Dad is ___ work.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Please stop ___ the traffic lights.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'Please stop ___ the traffic lights.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We meet ___ the bus stop.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We meet ___ the bus stop.', '{"type": "multiple_choice", "options": ["at", "in", "on"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At home” es correcto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„At home“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“In the bus stop” es la forma normal.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„In the bus stop“ ist die normale Form.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At the door” habla de un punto concreto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„At the door“ spricht von einem genauen Punkt.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“On school” es correcto para el colegio.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„On school“ ist für die Schule korrekt.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At work” es una expresión común.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„At work“ ist ein üblicher Ausdruck.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At the entrance” puede ser correcto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„At the entrance“ kann korrekt sein.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'At se usa solo con horas y nunca con lugares.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'At wird nur mit Uhrzeiten und nie mit Orten benutzt.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I am at home now.', '{"type": "scramble", "chunks": ["I", "am", "at", "home", "now"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'I am at home now.', '{"type": "scramble", "chunks": ["I", "am", "at", "home", "now"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She is at school today.', '{"type": "scramble", "chunks": ["She", "is", "at", "school", "today"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'She is at school today.', '{"type": "scramble", "chunks": ["She", "is", "at", "school", "today"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He is at work now.', '{"type": "scramble", "chunks": ["He", "is", "at", "work", "now"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'He is at work now.', '{"type": "scramble", "chunks": ["He", "is", "at", "work", "now"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We are at the stop.', '{"type": "scramble", "chunks": ["We", "are", "at", "the", "stop"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'We are at the stop.', '{"type": "scramble", "chunks": ["We", "are", "at", "the", "stop"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Dog is at the door.', '{"type": "scramble", "chunks": ["Dog", "is", "at", "the", "door"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Dog is at the door.', '{"type": "scramble", "chunks": ["Dog", "is", "at", "the", "door"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Meet me at the station.', '{"type": "scramble", "chunks": ["Meet", "me", "at", "the", "station"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Meet me at the station.', '{"type": "scramble", "chunks": ["Meet", "me", "at", "the", "station"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'They are at the entrance.', '{"type": "scramble", "chunks": ["They", "are", "at", "the", "entrance"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'They are at the entrance.', '{"type": "scramble", "chunks": ["They", "are", "at", "the", "entrance"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO grammar_rule (grammar_uuid, source_language)
    VALUES (v_grammar_id, 'en')
    RETURNING uuid INTO v_current_rule_id;

    INSERT INTO grammar_rule_translation (grammar_rule_uuid, language, title, failure_feedback)
    VALUES
        (v_current_rule_id, 'es', 'Tiempo con in, on y at', 'Recuerda: in para partes del día o meses, on para días y fechas, at para horas y at night.'),
        (v_current_rule_id, 'de', 'Zeit mit in, on und at', 'Merke: in für Tageszeiten oder Monate, on für Tage und Daten, at für Uhrzeiten und at night.');

    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We study ___ the morning.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We study ___ the morning.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I have English ___ Monday.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'I have English ___ Monday.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The class starts ___ 3 oclock.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The class starts ___ 3 oclock.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She reads ___ night.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'She reads ___ night.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'My birthday is ___ July.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'My birthday is ___ July.', '{"type": "typing", "correct_answers": ["in"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We meet ___ Tuesday evening.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'We meet ___ Tuesday evening.', '{"type": "typing", "correct_answers": ["on"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The shop opens ___ 9 AM.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb),
        (v_ex_id, 'de', 'The shop opens ___ 9 AM.', '{"type": "typing", "correct_answers": ["at"], "case_sensitive": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The lesson is ___ the morning.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The lesson is ___ the morning.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We have class ___ Friday.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We have class ___ Friday.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The bus leaves ___ 8 PM.', '{"type": "multiple_choice", "options": ["at", "on", "in"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The bus leaves ___ 8 PM.', '{"type": "multiple_choice", "options": ["at", "on", "in"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'My exam is ___ May.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'My exam is ___ May.', '{"type": "multiple_choice", "options": ["in", "on", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I study ___ night.', '{"type": "multiple_choice", "options": ["at", "on", "in"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'I study ___ night.', '{"type": "multiple_choice", "options": ["at", "on", "in"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We visit grandma ___ Sunday.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'We visit grandma ___ Sunday.', '{"type": "multiple_choice", "options": ["on", "in", "at"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The meeting is ___ 10:30.', '{"type": "multiple_choice", "options": ["at", "on", "in"], "answer": 0}'::jsonb),
        (v_ex_id, 'de', 'The meeting is ___ 10:30.', '{"type": "multiple_choice", "options": ["at", "on", "in"], "answer": 0}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“In the morning” es correcto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„In the morning“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At Monday” es correcto.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„At Monday“ ist korrekt.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At 6 PM” es correcto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„At 6 PM“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“On July” es correcto para un mes.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', '„On July“ ist für einen Monat korrekt.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“On Thursday” es correcto.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„On Thursday“ ist korrekt.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', '“At night” es una expresión común.', '{"type": "true_false", "answer": true}'::jsonb),
        (v_ex_id, 'de', '„At night“ ist ein üblicher Ausdruck.', '{"type": "true_false", "answer": true}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Usamos in con horas exactas como 4 PM.', '{"type": "true_false", "answer": false}'::jsonb),
        (v_ex_id, 'de', 'Wir benutzen in mit genauen Uhrzeiten wie 4 PM.', '{"type": "true_false", "answer": false}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We study in the morning.', '{"type": "scramble", "chunks": ["We", "study", "in", "the", "morning"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'We study in the morning.', '{"type": "scramble", "chunks": ["We", "study", "in", "the", "morning"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'I work on Monday morning.', '{"type": "scramble", "chunks": ["I", "work", "on", "Monday", "morning"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'I work on Monday morning.', '{"type": "scramble", "chunks": ["I", "work", "on", "Monday", "morning"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'Class starts at 3 oclock.', '{"type": "scramble", "chunks": ["Class", "starts", "at", "3", "oclock"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'Class starts at 3 oclock.', '{"type": "scramble", "chunks": ["Class", "starts", "at", "3", "oclock"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'She often reads at night.', '{"type": "scramble", "chunks": ["She", "often", "reads", "at", "night"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'She often reads at night.', '{"type": "scramble", "chunks": ["She", "often", "reads", "at", "night"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'We always travel in July.', '{"type": "scramble", "chunks": ["We", "always", "travel", "in", "July"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'We always travel in July.', '{"type": "scramble", "chunks": ["We", "always", "travel", "in", "July"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'He plays football on Friday.', '{"type": "scramble", "chunks": ["He", "plays", "football", "on", "Friday"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'He plays football on Friday.', '{"type": "scramble", "chunks": ["He", "plays", "football", "on", "Friday"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
    INSERT INTO exercise (target_uuid, grammar_rule_uuid)
    VALUES (v_grammar_id, v_current_rule_id)
    RETURNING uuid INTO v_ex_id;

    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES
        (v_ex_id, 'es', 'The train leaves at nine.', '{"type": "scramble", "chunks": ["The", "train", "leaves", "at", "nine"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb),
        (v_ex_id, 'de', 'The train leaves at nine.', '{"type": "scramble", "chunks": ["The", "train", "leaves", "at", "nine"], "correct_order": [0, 1, 2, 3, 4]}'::jsonb);
END;
$seed$;
