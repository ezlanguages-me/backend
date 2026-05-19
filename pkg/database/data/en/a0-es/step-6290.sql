-- ============================================================
-- Seed: A0 English Path – STEP 6290 – Listening – escucha una anécdota social (Convivencia)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Oliver tiene una historia divertida de ayer.","de": "Oliver has a funny story from yesterday.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Fue a una fiesta de cumpleaños después del trabajo.","de": "He went to a birthday party after work.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Conocía a toda la gente de la fiesta.","de": "He knew everyone at the party.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Se quedó junto a los aperitivos.","de": "He stayed near the snacks.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Ahora le han invitado a tomar té la semana que viene.","de": "Now he has been invited for tea next week.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Oliver fue a una fiesta después del trabajo.","de": "Oliver ging nach der Arbeit zu einer Party.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Conoció a un vecino de arriba.","de": "Er lernte einen Nachbarn von oben kennen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "Le invitaron a tomar té la semana siguiente.","de": "Er wurde für die folgende Woche zum Tee eingeladen.","s_es": {"type": "true_false","answer": true},"s_de": {"type": "true_false","answer": true}}'::jsonb,
        '{"es": "¿Cuándo fue Oliver a la fiesta?","de": "¿Cuándo fue Oliver a la fiesta?","s_es": {"type": "multiple_choice","options": ["Yesterday","Next year","This morning only"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Ayer","El año que viene","Solo esta mañana"],"answer": 0}}'::jsonb,
        '{"es": "¿Dónde se quedó al principio?","de": "¿Dónde se quedó al principio?","s_es": {"type": "multiple_choice","options": ["Near the snacks","On the roof","By the bus stop"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Cerca de los aperitivos","En el tejado","Junto a la parada del autobús"],"answer": 0}}'::jsonb,
        '{"es": "¿A cuántas personas saludó?","de": "¿A cuántas personas saludó?","s_es": {"type": "multiple_choice","options": ["Two people","Ten people","No one"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Dos personas","Diez personas","Nadie"],"answer": 0}}'::jsonb,
        '{"es": "¿Quién era una de esas personas?","de": "¿Quién era una de esas personas?","s_es": {"type": "multiple_choice","options": ["A new neighbour from upstairs","A police officer","A shop manager"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Un vecino de arriba","Un policía","Un encargado de tienda"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué temas comentaron?","de": "¿Qué temas comentaron?","s_es": {"type": "multiple_choice","options": ["The lift and the weather","The exam and the train","The bank and the keys"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["El ascensor y el tiempo","El examen y el tren","El banco y las llaves"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué invitación recibió después?","de": "¿Qué invitación recibió después?","s_es": {"type": "multiple_choice","options": ["Tea next week","A flight tomorrow","A lesson today"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Té la semana que viene","Un vuelo mañana","Una clase hoy"],"answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la idea principal del relato?","de": "¿Cuál es la idea principal del relato?","s_es": {"type": "multiple_choice","options": ["Meeting new people at a party","Buying groceries","Taking a test"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Conocer gente nueva en una fiesta","Comprar comida","Hacer un examen"],"answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de texto es?","de": "¿Qué tipo de texto es?","s_es": {"type": "multiple_choice","options": ["A social anecdote","A recipe","A notice"],"answer": 0},"s_de": {"type": "multiple_choice","options": ["Una anécdota social","Una receta","Un aviso"],"answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 6290 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 6290 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 6290, 'en', 'listening', 'Convivencia', $transcript$
# AUDIO PROFILE: Oliver, talking about a neighbour's birthday party
## "A Small Story About Meeting New People"

## THE SCENE: A short anecdote told to a friend in the kitchen
Oliver explains what happened at a party and how he met two neighbours.

### DIRECTOR''S NOTES
Style:
* Storytelling with a clear beginning, problem, and happy ending.
* Keep the details simple and relatable.

Pace: Medium, with a few natural pauses for effect.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear a short social anecdote with everyday vocabulary.
The audio focuses on people, places, and a simple sequence of events.

#### TRANSCRIPT
[opening] Oliver: I have a funny story from yesterday.
[setting] Friend: Oh? What happened?
[story] Oliver: I went to my neighbour's birthday party after work.
[event] Oliver: At first I did not know anyone there.
[detail] Oliver: I stood near the snacks and said hello to two people.
[development] Oliver: One of them was my new neighbour from upstairs.
[result] Oliver: We talked about the lift, the weather, and the new cafe.
[turn] Friend: That sounds easy enough.
[ending] Oliver: Yes, and now they have invited me for tea next week.
[closing] Friend: Nice. That is a good start.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES
        (v_listening_id, 'es', 'escucha una anécdota social', 'Escucha una breve historia social sobre una fiesta y cómo surge una nueva amistad.'),
        (v_listening_id, 'de', 'höre eine soziale Anekdote', 'Höre eine kurze soziale Geschichte über eine Party und wie eine neue Bekanntschaft entsteht.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_listening_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
