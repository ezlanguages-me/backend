-- ============================================================
-- Seed: A0 English Path – STEP 180 – Listening – Host Family Welcome Tour (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- ============================================================




DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- TRUE / FALSE (8 exercises)
        '{"p":"Tom es el padre anfitrión.","p_de":"Tom ist der Gastvater.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"La familia tiene tres hijos adolescentes.","p_de":"Die Familie hat drei Teenager-Kinder.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"El perro de la familia se llama Max.","p_de":"Der Hund der Familie heißt Max.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Max es un caniche.","p_de":"Max ist ein Pudel.","s":{"type":"true_false","answer":false}}'::jsonb,
        '{"p":"Hay un medio baño para invitados en el primer piso.","p_de":"Es gibt im Erdgeschoss ein halbes Bad für Gäste.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"Alex puede coger un snack de la nevera si tiene hambre.","p_de":"Alex kann sich einen Snack aus dem Kühlschrank nehmen, wenn er Hunger hat.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El dormitorio de Alex está en el segundo piso.","p_de":"Alexs Schlafzimmer ist im zweiten Stock.","s":{"type":"true_false","answer":true}}'::jsonb,
        '{"p":"El cuarto de lavado está en el sótano.","p_de":"Der Waschraum ist im Keller.","s":{"type":"true_false","answer":true}}'::jsonb,

        -- MULTIPLE CHOICE (8 exercises)
        '{"p":"¿Cuántas personas forman la familia anfitriona sin contar a Alex?","p_de":"Wie viele Personen gehören zur Gastfamilie, ohne Alex mitzuzählen?","s":{"type":"multiple_choice","options":["Cuatro","Tres","Cinco"],"answer":0}}'::jsonb,
        '{"p":"¿Cómo se llama la esposa de Tom?","p_de":"Wie heißt Toms Frau?","s":{"type":"multiple_choice","options":["Linda","Emily","Sarah"],"answer":0}}'::jsonb,
        '{"p":"¿Dónde están Jake y Emily en este momento?","p_de":"Wo sind Jake und Emily im Moment?","s":{"type":"multiple_choice","options":["En el instituto","En el jardín","En la cocina"],"answer":0}}'::jsonb,
        '{"p":"¿Qué habitación enseña Tom en el primer piso?","p_de":"Welchen Raum zeigt Tom im Erdgeschoss?","s":{"type":"multiple_choice","options":["La sala de estar","El dormitorio de Alex","El baño completo"],"answer":0}}'::jsonb,
        '{"p":"¿Qué vista tiene Alex desde su dormitorio?","p_de":"Welche Aussicht hat Alex von seinem Schlafzimmer aus?","s":{"type":"multiple_choice","options":["El patio trasero","La calle principal","El garaje"],"answer":0}}'::jsonb,
        '{"p":"¿Con quién compartirá Alex el baño completo?","p_de":"Mit wem wird Alex das vollständige Bad teilen?","s":{"type":"multiple_choice","options":["Con Jake","Con Emily","Con Linda"],"answer":0}}'::jsonb,
        '{"p":"¿Cuándo suele hacer la colada la familia?","p_de":"Wann macht die Familie normalerweise Wäsche?","s":{"type":"multiple_choice","options":["Los domingos","Los viernes","Los lunes"],"answer":0}}'::jsonb,
        '{"p":"¿Qué debe hacer Alex si va a llegar tarde a cenar?","p_de":"Was soll Alex tun, wenn er zu spät zum Abendessen kommt?","s":{"type":"multiple_choice","options":["Mandar un mensaje","Ir directamente a dormir","Esperar fuera"],"answer":0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM listening WHERE step_order = 180 AND path_uuid = v_path_id
    );
    DELETE FROM listening WHERE step_order = 180 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 180, 'en', 'listening', 'social', $transcript$
# AUDIO PROFILE: Tom, host dad
## "The Welcome Tour"

## THE SCENE: The host family house
It is late afternoon in a warm family home, and the front door has just
opened. Tom is guiding Alex through the house with an easy smile, moving
from room to room while Max, the golden retriever, bounces around with
happy energy. Tom speaks in the calm, practical way of a host dad who
wants his guest to feel relaxed from the very first minute.

### DIRECTOR'S NOTES
Style:
* Warm and reassuring, like a real welcome on the first day.
* Clear and practical, so room names and routines are easy for beginner
  learners to follow.

Pace: Natural and steady, with short pauses as Tom points to each room.

Accent: Neutral accent.

### SAMPLE CONTEXT
This kind of audio helps learners understand a simple house tour and the
everyday information a host family gives to a new student.

#### TRANSCRIPT
[warmly] Hey Alex, welcome to our home! Come on in. Let me show you around so you know where everything is.
[pleasantly] We're a family of four. I'm Tom, your host dad, and my wife Linda is upstairs. You'll meet our two teenagers, Jake and Emily, when they get back from high school.
[lightly amused] Oh, and watch out for Max, our golden retriever. He loves to jump.
[clearly] Right now, we are on the first floor. This is the living room, where we usually watch TV after dinner. Over there is the kitchen. You can grab a snack from the fridge anytime you are hungry. Down the hallway is a half bath for guests.
[guiding] Let's head upstairs to the second floor. Your bedroom is the first door on the right. You have a nice view of the backyard.
[reassuringly] You will be sharing the full bathroom at the end of the hall with Jake. Don't worry, he keeps it pretty clean.
[helpfully] The laundry room is down in the basement. We usually do our laundry on Sundays. If you have dirty clothes, just put them in the basket.
[welcomingly] We have dinner around 7 PM every night. If you're going to be late, just text us. Make yourself at home!
    $transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Llegada a la familia anfitriona', '');

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Ankunft bei der Gastfamilie', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
