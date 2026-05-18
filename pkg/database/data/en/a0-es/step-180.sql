-- ============================================================
-- Seed: A0 English Path – STEP 180 – Listening – understand straightforward explanations of, for example, the members of the host family and the layout of the house (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE 
    v_path_id UUID; 
    v_listening_id UUID; 
    v_ex_id UUID;
    ex JSONB;
    i INT;
    v_prompts_de TEXT[] := ARRAY[
        -- TRUE/FALSE (16)
        'Tom ist der Gastvater (host dad).',
        'Die Familie hat drei Teenager-Kinder.',
        'Der Familienhund heißt Max.',
        'Max ist ein Pudel (poodle).',
        'Beim anfänglichen Gespräch befinden sie sich im ersten Stockwerk (second floor).',
        'Es gibt ein halbes Bad (half bath) im Erdgeschoss für Gäste.',
        'Carlos darf keine Snacks aus dem Kühlschrank nehmen.',
        'Carlos'' Schlafzimmer befindet sich im Erdgeschoss.',
        'Carlos wird ein vollständiges Bad mit Jake teilen.',
        'Der Waschraum (laundry room) befindet sich im Keller (basement).',
        'Die Familie macht normalerweise samstags die Wäsche.',
        'Sie essen normalerweise um 19:00 Uhr zu Abend.',
        'Die Küche befindet sich im ersten Stockwerk.',
        'Tom schlägt vor, dass Carlos sich etwas aus dem Kühlschrank nehmen kann, wenn er hungrig ist.',
        'Tom versichert, dass Jake das Bad ziemlich sauber hält.',
        'Das halbe Bad (half bath) ist ausschließlich für die Kinder.',
        -- MULTIPLE CHOICE (16)
        'Wie viele Personen gehören zur Gastfamilie (Carlos nicht mitgezählt)?',
        'Wie heißt Toms Frau?',
        'Wo sind Jake und Emily gerade?',
        'Was warnt Tom bezüglich des Hundes Max?',
        'Welches Zimmer befindet sich im Erdgeschoss (first floor)?',
        'Was für ein Bad gibt es im Erdgeschoss?',
        'Wo befindet sich Carlos'' Zimmer genau?',
        'Welchen Ausblick hat Carlos aus seinem Schlafzimmer?',
        'Mit wem wird er das vollständige Bad teilen?',
        'Wohin sollen die schmutzigen Kleidungsstücke (dirty clothes)?',
        'An welchem Tag macht die Familie ihre Wäsche (laundry)?',
        'Was soll Carlos tun, wenn er zum Abendessen zu spät kommt?',
        'Welche Rasse hat der Hund Max?',
        'Wo schaut die Familie normalerweise fern?',
        'Wo befindet sich der Waschraum (laundry room)?',
        'Was sagt Tom zu Carlos am Ende der Hausführung?'
    ];
    v_exercises JSONB[] := ARRAY[
        -- ==========================================
        -- TRUE / FALSE (16 Ejercicios)
        -- ==========================================
        '{"p":"Tom es el padre anfitrión (host dad).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La familia tiene tres hijos adolescentes.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El perro de la familia se llama Max.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Max es un perro de raza caniche (poodle).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Mientras hablan al principio, están en el segundo piso (second floor).", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hay un medio baño (half bath) en el primer piso para los invitados.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Carlos tiene prohibido comer snacks de la nevera.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El dormitorio de Carlos está en el primer piso.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Carlos compartirá un baño completo con Jake.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El cuarto de lavado (laundry room) está en el sótano (basement).", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La familia suele hacer la colada los sábados.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Cenan normalmente a las 7:00 PM.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La cocina está en el segundo piso.", "s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Tom sugiere que Carlos puede tomar algo de la nevera cuando tenga hambre.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Tom asegura que Jake mantiene el baño bastante limpio.", "s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El medio baño (half bath) es exclusivamente para los hijos.", "s":{"type":"true_false","answer":false}}'::jsonb,

        -- ==========================================
        -- MULTIPLE CHOICE (16 Ejercicios)
        -- ==========================================
        '{"p":"¿Cuántas personas forman la familia anfitriona (sin contar a Carlos)?", "s":{"type":"multiple_choice","options":["Cuatro","Tres","Cinco"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo se llama la esposa de Tom?", "s":{"type":"multiple_choice","options":["Emily","Linda","Sarah"],"answer":1}}'::jsonb,
        '{"p":"¿Dónde están Jake y Emily en este momento?", "s":{"type":"multiple_choice","options":["En el instituto (high school)","Durmiendo arriba","En el patio trasero"],"answer":0}}'::jsonb,
        '{"p":"¿Qué advierte Tom sobre el perro Max?", "s":{"type":"multiple_choice","options":["Que le encanta saltar","Que muerde a los extraños","Que está muy viejo"],"answer":0}}'::jsonb,
        '{"p":"¿Qué habitación está en el primer piso (first floor)?", "s":{"type":"multiple_choice","options":["La sala de estar (living room)","El cuarto de Carlos","El cuarto de lavado"],"answer":0}}'::jsonb,
        '{"p":"¿Qué tipo de baño hay en el primer piso?", "s":{"type":"multiple_choice","options":["Un medio baño (half bath)","Un baño completo (full bathroom)","No hay baño abajo"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde se encuentra exactamente la habitación de Carlos?", "s":{"type":"multiple_choice","options":["En el sótano","En el segundo piso, la primera puerta a la derecha","En el primer piso, junto a la cocina"],"answer":1}}'::jsonb,
        '{"p":"¿Qué vista tiene Carlos desde su dormitorio?", "s":{"type":"multiple_choice","options":["El patio trasero (backyard)","La calle principal","El garaje"],"answer":0}}'::jsonb,
        '{"p":"¿Con quién compartirá el baño completo?", "s":{"type":"multiple_choice","options":["Con Jake","Con Emily","Con Linda"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde deben ponerse las ropas sucias (dirty clothes)?", "s":{"type":"multiple_choice","options":["En la cesta (basket)","En el garaje","Encima de la cama"],"answer":0}}'::jsonb,
        '{"p":"¿Qué día hace la familia su colada (laundry)?", "s":{"type":"multiple_choice","options":["Los domingos (Sundays)","Los viernes (Fridays)","Los lunes (Mondays)"],"answer":0}}'::jsonb,
        '{"p":"¿Qué debe hacer Carlos si va a llegar tarde a cenar?", "s":{"type":"multiple_choice","options":["Mandar un mensaje de texto (text us)","Llamar por teléfono","Cenar fuera de casa"],"answer":0}}'::jsonb,
        '{"p":"¿De qué raza es el perro Max?", "s":{"type":"multiple_choice","options":["Golden retriever","Labrador","Pastor alemán"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde suele ver la familia la televisión?", "s":{"type":"multiple_choice","options":["En la sala de estar (living room)","En la cocina","En el dormitorio principal"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde está el cuarto de lavado (laundry room)?", "s":{"type":"multiple_choice","options":["Abajo en el sótano (basement)","En el primer piso","En el segundo piso"],"answer":0}}'::jsonb,
        '{"p":"¿Qué le dice Tom a Carlos al final del recorrido?", "s":{"type":"multiple_choice","options":["¡Siéntete como en casa! (Make yourself at home!)","¡Ve a dormir!","¡Paga el alquiler!"],"answer":0}}'::jsonb
    ];


BEGIN

-- 1. Obtener el path del idioma principal (Inglés)
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- 2. Insertar el Listening en el Step 180
INSERT INTO listening (path_uuid, step_order, source_language, type, category) 
VALUES (v_path_id, 180, 'en', 'listening', 'social') 
RETURNING uuid INTO v_listening_id;

-- 3. Insertar Traducción y la Transcripción (JSONB)
INSERT INTO listening_translation (listening_uuid, language, title, description, transcript) 
VALUES (
    v_listening_id, 
    'es', 
    'Llegando a tu Host Family', 
    '', 
    $transcript$
# AUDIO PROFILE: Tom, Host Dad
## "The Welcome Tour"

## THE SCENE: The Host Family House
It is late afternoon in a warm family home, and the front door has just opened.
Tom is guiding Alex through the house with an easy smile, pointing out each
room as they move from floor to floor. Max, the golden retriever, keeps nearby
with excited energy, while Tom speaks with the calm, practical confidence of a
host dad who wants his guest to feel comfortable from the very first minute.

### DIRECTOR'S NOTES
Style:
* Warm and empathetic: kind, reassuring, and immediately welcoming.
* Clear and practical: room names, family members, and house routines must be
easy to follow for a beginner listener.

Pace: Natural and steady, like a real house tour. Keep the delivery fluid and
friendly, with short pauses where Tom would naturally point to a room or move
upstairs.

Accent: Neutral accent.

### SAMPLE CONTEXT
Tom is ideal for homestay welcome audios, orientation walk-throughs, and simple
day-to-day explanations designed for beginner English learners.

#### TRANSCRIPT
[warmly] Hey Alex, welcome to our home! Come on in. Let me show you around so
you know where everything is.
[pleasantly] We're a family of four. I'm Tom, your host dad, and my wife Linda
is upstairs. You'll meet our two teenagers, Jake and Emily, when they get back
from high school.
[lightly amused] Oh, and watch out for Max, our golden retriever. He loves to
jump.
[clearly] Right now, we are on the first floor. This is the living room, where
we usually watch TV after dinner. Over there is the kitchen. You can grab a
snack from the fridge anytime you are hungry. Down the hallway is a half bath
for guests.
[guiding] Let's head upstairs to the second floor. Your bedroom is the first
door on the right. You have a nice view of the backyard.
[reassuringly] You will be sharing the full bathroom at the end of the hall
with Jake. Don't worry, he keeps it pretty clean.
[helpfully] The laundry room is down in the basement. We usually do our laundry
on Sundays. If you have dirty clothes, just put them in the basket.
[welcomingly] We have dinner around 7 PM every night. If you're going to be
late, just text us. Make yourself at home!
$transcript$
);

-- 3b. Insertar Traducción Alemana del Listening
INSERT INTO listening_translation (listening_uuid, language, title, description, transcript) 
VALUES (
    v_listening_id, 
    'de', 
    'Ankunft bei der Gastfamilie', 
    '', 
    $transcript2$
# AUDIO PROFILE: Tom, Host Dad
## "The Welcome Tour"

## THE SCENE: The Host Family House
It is late afternoon in a warm family home, and the front door has just opened.
Tom is guiding Alex through the house with an easy smile, pointing out each
room as they move from floor to floor. Max, the golden retriever, keeps nearby
with excited energy, while Tom speaks with the calm, practical confidence of a
host dad who wants his guest to feel comfortable from the very first minute.

### DIRECTOR'S NOTES
Style:
* Warm and empathetic: kind, reassuring, and immediately welcoming.
* Clear and practical: room names, family members, and house routines must be
easy to follow for a beginner listener.

Pace: Natural and steady, like a real house tour. Keep the delivery fluid and
friendly, with short pauses where Tom would naturally point to a room or move
upstairs.

Accent: Neutral accent.

### SAMPLE CONTEXT
Tom is ideal for homestay welcome audios, orientation walk-throughs, and simple
day-to-day explanations designed for beginner English learners.

#### TRANSCRIPT
[warmly] Hey Alex, welcome to our home! Come on in. Let me show you around so
you know where everything is.
[pleasantly] We're a family of four. I'm Tom, your host dad, and my wife Linda
is upstairs. You'll meet our two teenagers, Jake and Emily, when they get back
from high school.
[lightly amused] Oh, and watch out for Max, our golden retriever. He loves to
jump.
[clearly] Right now, we are on the first floor. This is the living room, where
we usually watch TV after dinner. Over there is the kitchen. You can grab a
snack from the fridge anytime you are hungry. Down the hallway is a half bath
for guests.
[guiding] Let's head upstairs to the second floor. Your bedroom is the first
door on the right. You have a nice view of the backyard.
[reassuringly] You will be sharing the full bathroom at the end of the hall
with Jake. Don't worry, he keeps it pretty clean.
[helpfully] The laundry room is down in the basement. We usually do our laundry
on Sundays. If you have dirty clothes, just put them in the basket.
[welcomingly] We have dinner around 7 PM every night. If you're going to be
late, just text us. Make yourself at home!
$transcript2$
);

-- 4. Bucle para insertar los ejercicios vinculados directamente al target_uuid (el Listening)
FOR i IN 1..array_length(v_exercises, 1)
LOOP
    ex := v_exercises[i];

    -- Insertar el ejercicio base vinculándolo directamente al Listening (grammar_rule_uuid queda como NULL)
    INSERT INTO exercise (target_uuid, grammar_rule_uuid) 
    VALUES (v_listening_id, NULL) 
    RETURNING uuid INTO v_ex_id;

    -- Insertar la traducción del ejercicio (español)
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

    -- Insertar la traducción del ejercicio (alemán)
    INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
    VALUES (v_ex_id, 'de', v_prompts_de[i], ex->'s');

END LOOP;
END;
$seed$;
